
<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>

<html>
<head></head>
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

</script>

    <%@ page import="java.util.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.rowset.*" %>
    <%@ page import="pasotracker.GeneralServlet" %>
<body>    
    <form name="BreederPopup_RegList">        
    <%
    List BreederList = new ArrayList();
    int crsSize_All=0;
    int asgno=0;
    String strOwn_Type="";
    
    try
    {      
        GeneralServlet gen=new GeneralServlet(); 
		
 RowSetFactory factory24 = RowSetProvider.newFactory();
   CachedRowSet crs= factory24.createCachedRowSet();
      //  CachedRowSetImpl crs = new CachedRowSetImpl();                        

        if(strSrch.length()>0)
        crs = gen.GET_OwnerInformation(strBreederName, strBreederLName, strOrgName, strPhone, strBreederNo);
        crsSize_All = crs.size();  
        Map MpHorseDetails = new TreeMap();

        while (crs.next())
        {
            strBreederName="";
            strFirstName="";
            strLastName=""; 
            strMiddleName="";
            strAddress="";
            strAddress1="";
            strAddress2="";
            strPhone="";
            city="";
            state="";
            asgno=0;
            zip="";
            country="";
            strEntitySeq="";
            strBreederNo="";
            strOrgName="";
            strOwn_Type="";
     
             if(crs.getString("OWNER_TYPE")!=null)                  
                strOwn_Type=crs.getString("OWNER_TYPE").trim();
            
            if(crs.getString("FIRSTNAME")!=null)                  
                strFirstName= crs.getString("FIRSTNAME").trim();   
            else
                strFirstName="";

            if(crs.getString("LASTNAME")!=null)                  
                strLastName= crs.getString("LASTNAME").trim();   
            else
                strLastName="";

            if(crs.getString("ORGANIZATION_NAME")!=null)                     
                strOrgName= crs.getString("ORGANIZATION_NAME").trim(); 

            if(crs.getString("SUFFIX")!=null)                  
                strMiddleName= crs.getString("SUFFIX").trim();   
            else
                strMiddleName="";

            if(crs.getString("ADDRESS1")!=null)                  
                strAddress1= crs.getString("ADDRESS1").trim();
            else
                strAddress1="";

            if(crs.getString("ADDRESS2")!=null)                  
                strAddress2= crs.getString("ADDRESS2").trim();
            else
                strAddress2="";

            if(crs.getString("CITY")!=null)                  
                city= crs.getString("CITY").trim();
            else
                city="";

            if(crs.getString("STATE")!=null)                  
                state= crs.getString("STATE").trim();
            else
                state="";

            if(crs.getString("ZIP")!=null)                  
                zip= crs.getString("ZIP").trim();
            else
                zip="";

            if(crs.getString("COUNTRY")!=null)                  
                country= crs.getString("COUNTRY").trim();
            else
                country="";

            if(crs.getString("PHONE")!=null)                  
                strPhone= crs.getString("PHONE").trim();
            else
                strPhone="";

            if(crs.getString("ENTITYSEQ")!=null)
                strEntitySeq= crs.getString("ENTITYSEQ").trim();

            if(crs.getString("ASSIGNEDNUM")!=null)
             {
                  strBreederNo= crs.getString("ASSIGNEDNUM").trim();
                  asgno=Integer.parseInt(strBreederNo);  
            }

            strBreederName=strFirstName+" "+strLastName;
            strAddress =strAddress1+" "+strAddress2+" "+city+" "+state+" "+zip+" "+country;            

            MpHorseDetails = new TreeMap();
            if(strOwn_Type.equalsIgnoreCase("INDIVIDUAL") || strOwn_Type.equalsIgnoreCase("YOUTH RIDER") ||(strOwn_Type.equals("") && strOrgName.equals("") ))
                MpHorseDetails.put("BREEDERNAME",strBreederName);  /* FULL NAME */
            else
                MpHorseDetails.put("BREEDERNAME",strOrgName);

			if(strOwn_Type.equalsIgnoreCase("INDIVIDUAL") || strOwn_Type.equalsIgnoreCase("YOUTH RIDER") ||(strOwn_Type.equals("") && strOrgName.equals("") ))
                MpHorseDetails.put("BREEDERNAMES",strBreederName.replace("\"","%22"));  /* FULL NAME */
            else
                MpHorseDetails.put("BREEDERNAMES",strOrgName.replace("\"","%22"));


             if(strAddress.trim().equals("NULL"))
                 strAddress="";

            MpHorseDetails.put("ADDRESS",strAddress);                    
            MpHorseDetails.put("PHONE",strPhone);
            MpHorseDetails.put("ENTITYSEQ",strEntitySeq);
            if(asgno!=0)
                MpHorseDetails.put("BREEDERNO",asgno);
            else
                MpHorseDetails.put("BREEDERNO",null);
            
            BreederList.add(MpHorseDetails);               
        }           
    }
    catch(Exception ex)
    {
            ex.printStackTrace();	
    }
    request.setAttribute("BreederList", BreederList);
   if(strSrch.length()>0 & strType.equals("1"))
   {
%>
    <display:table  id="Details" name="requestScope.BreederList" 
                    pagesize="100"
                    class="grid" 
                    style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;text-transform:uppercase;">
    <display:setProperty name="paging.banner.item_name" value="Breeder" />
    <display:setProperty name="paging.banner.items_name" value="Breeders" />
    <display:setProperty name="paging.banner.some_items_found">

        <span class="pagebanner" >{0} {1} founds,displaying {2} to {3}</span>
        <span ><input type="checkbox" name="brname" value="brname"  onclick="viewAll_Breeder(this)"> <font style="font-weight:bold;">View All&nbsp;&nbsp;&nbsp;</font></span>

    </display:setProperty>
    <display:column style="width:1%" headerClass="Grid_Header">
    <input type="radio" name="checkedVal" onclick="returnBreederValue('${Details.BREEDERNAMES}','${Details.ENTITYSEQ}')" /></display:column>
    <display:column style="width:5%;Height:30px;"   title="ID#" property="BREEDERNO" sortable="true" headerClass="Grid_Header" />       
    <display:column style="width:25%;Height:30px;"   title="NAME" property="BREEDERNAME" sortable="true" headerClass="Grid_Header" />       
    <display:column style="width:25%"  property="ADDRESS" sortable="true" headerClass="Grid_Header" />                
    <display:column style="width:10%" property="PHONE"  sortable="true" headerClass="Grid_Header" />
    <display:column style="width:2%"   headerClass="Grid_Header" ><img src="Images/pencil_icon.gif" onclick="BreederAddPopUp('','','${Details.PHONE}','Modify','${Details.ENTITYSEQ}')"/></display:column>
    </display:table>
<%}else if(strSrch.length()>0 & strType.equals("2"))
    { out.println(crsSize_All +" Breeders founds,displaying 1 to "+ crsSize_All);
%>
    <display:table  id="Details" name="requestScope.BreederList"
                        class="grid"
                        style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;text-transform:uppercase;">

    <display:column style="width:1%" headerClass="Grid_Header">
    <input type="radio" name="checkedVal" onclick="returnBreederValue('${Details.BREEDERNAMES}','${Details.ENTITYSEQ}')" /></display:column>
    <display:column style="width:5%;Height:30px;"   title="ID#" property="BREEDERNO" sortable="true" headerClass="Grid_Header" />       
    <display:column style="width:25%;Height:30px;"   title="NAME" property="BREEDERNAME" sortable="true" headerClass="Grid_Header" />
    <display:column style="width:25%"  property="ADDRESS" sortable="true" headerClass="Grid_Header" />
    <display:column style="width:10%" property="PHONE"  sortable="true" headerClass="Grid_Header" />
    <display:column style="width:2%"   headerClass="Grid_Header" ><img src="Images/pencil_icon.gif" onclick="BreederAddPopUp('','','${Details.PHONE}','Modify','${Details.ENTITYSEQ}')"/></display:column>
    </display:table>
<%}%>   
    </form>
</body>
</html>
    