<%-- 
    Document   : freReg_OwnerSearchPopupList
    Created on : Oct 14, 2011, 10:54:18 AM
    Author     : veera
--%>

<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
   
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SEARCH</title>

        <link rel="stylesheet" href="Style_Popup.css">
        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
        <link href="buttons.css" rel="stylesheet" type="text/css" />
        <link href="frmReg_CommonRef.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="themes/base/jquery.ui.all.css">
        <script src="jquery-1.5.1.js"></script>
        <script src="external/jquery.bgiframe-2.1.2.js"></script>
        <script src="ui/jquery.ui.core.js"></script>
        <script src="ui/jquery.ui.widget.js"></script>
        <script src="ui/jquery.ui.mouse.js"></script>
        <script src="ui/jquery.ui.button.js"></script>
        <script src="ui/jquery.ui.draggable.js"></script>
        <script src="ui/jquery.ui.position.js"></script>
        <script src="ui/jquery.ui.resizable.js"></script>
        <script src="ui/jquery.ui.dialog.js"></script>
        <script src="ui/jquery.effects.core.js"></script>
        <script src="ui/jquery.ui.datepicker.js"></script>
        
        <script src="jscRegistrationSearch.js"></script>
        
        <link href="buttons.css" rel="stylesheet" type="text/css" />
        <link href="frmReg_CommonRef.css" rel="stylesheet" type="text/css" />  
        
        

<style type="text/css">
.altRow
{

}

.altRow td
{
	border-bottom:1px dotted #ffffff;
	font-size:9pt;
	color:#000000;
	/*padding:5px 0 5px 5px;*/
	vertical-align:top;
	/*text-align:left;*/
}


.altRow  th
{
	background:#4e738f;
	color:#fff;
	font-weight:bold;
	font-size:9pt;
	/*text-align:center;*/
}

    
</style>
<script type="text/javascript">        
                                        
function SearchOwnerInformation()
{   
    document.forms[0].method="post";
    document.forms[0].action="frmReg_OwnerSearchPopup.jsp?Mode=1"
    document.forms[0].submit();       
}


  $(function() {     

    $("#view")
    .click(function(){

    
    document.forms[0].Org_Name.value="";
    document.forms[0].FName.value="";
    document.forms[0].LName.value="";
    document.forms[0].Phone.value="";

    document.forms[0].method="post";
    document.forms[0].action="frmReg_OwnerSearchPopup.jsp?Mode=2";
    document.forms[0].target="_self";
    document.forms[0].submit();

      });
  });
  
  function showAlert()
{  
    /*
        if(document.forms[0].ViewAll_Owner.checked==true)
        {            
            document.forms[0].HdnViewAll_Owner.value='Y';
	    document.forms[0].OwnerSearchbtn.click();
        }     */
}

</script>
<link href="frmReg_CommonRef.css" rel="stylesheet" type="text/css" />

<body>

        <%@ page import="java.util.*" %>
        <%@ page import="java.io.*" %>
        <%@ page import="java.sql.*" %>
        <%@ page import="javax.sql.rowset.*" %>
        <%@ page import="pasotracker.DBConnection" %>
        <%@ page import="pasotracker.GeneralServlet" %>
        
    <form name="frmReg_OwnerSearchPopupList" method="post" >        
    
    <input type="button" id="OwnerSearchResetbtn" class="button" value="Reset"/>
    <input type="button" id="OwnerSearchSelectbtn" class="button" value="OK"/>
    
        <%
          
            String strFName="";
            String strLName="";
            String strOrgName="";
            String strPhone="";
            String strEntitySeq="";
            String strOwnerNum="";
            String strMode="";
            String strOwnerNo="";
            int asgno=0;
            String strOwnerName="";
            String strType="";
            String strMName="";
            String strAddress="";
            String strAddress1="";
            String strAddress2="";     
            String city="";
            String state="";
            String zip="";
            String country="";  
            String strList="";
            String strOwnerType="";
            
            int Counter=0;
            String strViewAll="";
            //String strViewAll=request.getParameter("ViewAll");

            if(request.getParameter("Mode")!=null)
                 strMode=request.getParameter("Mode");        
        
            if(request.getParameter("Type")!=null)
             strType=request.getParameter("Type");
            
            if(request.getParameter("Name")!=null)
            {
                    strFName=request.getParameter("Name");
                   // strLName=request.getParameter("Name");
                    //strOrgName=request.getParameter("Name");                   
            }
          
if(strMode.equals("1"))
{

         List OwnerList = new ArrayList();
    try {
        GeneralServlet gen = new GeneralServlet();

        CachedRowSetImpl crsGetOwnerDetails = new CachedRowSetImpl();

        crsGetOwnerDetails = gen.Get_OwnerName(strFName);

        Map MpOwnerDetails = new TreeMap();
        
        while (crsGetOwnerDetails.next()) {
            strFName = "";
            strLName = "";
            strOrgName = "";
            strPhone = "";
            strEntitySeq = "";
            strOwnerNo = "";
            asgno = 0;
            strOwnerName = "";
            strMName = "";
            strAddress="";
             strAddress1="";
             strAddress2="";     
             city="";
             state="";
             zip="";
             country="";
             strList="";
             strOwnerType="";

            if (crsGetOwnerDetails.getString("FIRSTNAME") != null) {
                strFName = crsGetOwnerDetails.getString("FIRSTNAME").trim();
            }

            if (crsGetOwnerDetails.getString("LASTNAME") != null) {
                strLName = crsGetOwnerDetails.getString("LASTNAME").trim();
            }

            if (crsGetOwnerDetails.getString("SUFFIX") != null) {
                strMName = crsGetOwnerDetails.getString("SUFFIX").trim();
            }

            if (crsGetOwnerDetails.getString("ORGANIZATION_NAME") != null) {
                strOrgName = crsGetOwnerDetails.getString("ORGANIZATION_NAME").trim();
            }

            if (crsGetOwnerDetails.getString("PHONE") != null) {
                strPhone = crsGetOwnerDetails.getString("PHONE").trim();
            }

            if (crsGetOwnerDetails.getString("ENTITYSEQ") != null) {
                strEntitySeq = crsGetOwnerDetails.getString("ENTITYSEQ").trim();
            }

            if (crsGetOwnerDetails.getString("ASSIGNEDNUM") != null) {
                strOwnerNo = crsGetOwnerDetails.getString("ASSIGNEDNUM").trim();
                asgno = Integer.parseInt(strOwnerNo);
            }

            if (crsGetOwnerDetails.getString("ADDRESS1") != null) {
                strAddress1 = crsGetOwnerDetails.getString("ADDRESS1").trim();
            } else {
                strAddress1 = "";
            }

            if (crsGetOwnerDetails.getString("ADDRESS2") != null) {
                strAddress2 = crsGetOwnerDetails.getString("ADDRESS2").trim();
            } else {
                strAddress2 = "";
            }

            if (crsGetOwnerDetails.getString("CITY") != null) {
                city = crsGetOwnerDetails.getString("CITY").trim();
            }

            if (crsGetOwnerDetails.getString("STATE") != null) {
                state = crsGetOwnerDetails.getString("STATE").trim();
            }

            if (crsGetOwnerDetails.getString("ZIP") != null) {
                zip = crsGetOwnerDetails.getString("ZIP").trim();
            }

            if (crsGetOwnerDetails.getString("COUNTRY") != null) {
                country = crsGetOwnerDetails.getString("COUNTRY").trim();
            }
             
             if (crsGetOwnerDetails.getString("Owner_Type") != null) {
                strOwnerType = crsGetOwnerDetails.getString("Owner_Type").trim();
            }


            strOwnerName = strFName + " " + strMName + " " + strLName;
            strAddress = strAddress1 + " " + strAddress2 + " " + city + " " + state + " " + zip + " " + country;

             
             //strOwnerName=strFName+" "+strMName+" "+strLName;
             
             if(!strOrgName.equals(""))
             {
                   //String strList=strFName+"@#@"+strLName+"@#@"+strOrgName+"@#@"+strPhone+"@#@"+strEntitySeq;
                 strList=strOrgName+"@#@"+strPhone+"@#@"+strEntitySeq;
             }
             else
             {
                    strList=strOwnerName+"@#@"+strPhone+"@#@"+strEntitySeq;
                   
             }
            
             
                    MpOwnerDetails = new TreeMap();
                    MpOwnerDetails.put("FNAME",strFName);
                    MpOwnerDetails.put("LNAME",strLName);
                    
                     if(!strOrgName.equals(""))
                     {
                         MpOwnerDetails.put("OWNERNAME",strOrgName);
                     }
                    else
                    {
                        MpOwnerDetails.put("OWNERNAME",strOwnerName);  /* FULL NAME */
                    }
                    
                    MpOwnerDetails.put("PHONE",strPhone);
                    MpOwnerDetails.put("ENTITYSEQ",strEntitySeq);
                    MpOwnerDetails.put("OWNERNO",asgno);        
                    MpOwnerDetails.put("ADDRESS",strAddress);   
                    MpOwnerDetails.put("Check",strList);
                    
                    String steCheckBox="ChkSelected";

                    if(!strFName.equals("")|| !strLName.equals("")|| !strOrgName.equals("") ||!strPhone.equals(""))
                    {
                        OwnerList.add(MpOwnerDetails);
                        Counter=Counter+1;
                    }                    
                }
            
                request.setAttribute("OwnerList", OwnerList);
                
                    //OwnerList.add(strList);

            //if(HorseList.size()>0)
                
            //if(strType.equals("PER"))
              //   {    
                
           if (strViewAll.equals("Y"))
            {           
               %>
               
                   <%            out.println(Counter +" Owner founds,displaying 1 to "+ Counter);
     %>
         <display:table  id="Details" name="requestScope.OwnerList"
                        defaultsort="1" defaultorder="ascending" class="grid"
                        style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">
                            
        <display:column style="width:1%" headerClass="Grid_Header">
        <input type="Checkbox" name="ChkSelected" value='${Details.Check}' /></display:column>
        <display:column style="width:5%;Height:30px;"   title="ASSG#" property="OWNERNO" sortable="true" headerClass="Grid_Header" />       
        <display:column style="width:15%" property="OWNERNAME" title="NAME" sortable="true" headerClass="Grid_Header"/> 
        <display:column style="width:25%"  property="ADDRESS" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:10%" property="PHONE"  sortable="true" headerClass="Grid_Header" />        
        </display:table>        


    <%    }else
        {   
                 %>
       
            <display:table  id="Details" name="requestScope.OwnerList"
                            pagesize="10" defaultsort="1" defaultorder="ascending"
                            class="grid"
                            style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;overflow-x:scroll;">
                
                <display:setProperty name="paging.banner.item_name" value="Owner" />
                <display:setProperty name="paging.banner.items_name" value="Owners" />
                <display:setProperty name="paging.banner.some_items_found">
                
                    <span class="pagebanner">{0} {1} founds,displaying {2} to {3}</span>
                    <span ><input type="checkbox" name="ViewAll_Owner" onClick="showAlert()"> 
                    <font style="font-weight:bold;">View All&nbsp;&nbsp;&nbsp;</font></span>
                </display:setProperty>
                
                <display:column style="width:1%" headerClass="Grid_Header">
                <input type="Checkbox" name="ChkSelected" value='${Details.Check}' /></display:column>                
                <display:column style="width:5%;Height:30px;"   title="ASSG#" property="OWNERNO" sortable="true" headerClass="Grid_Header" />       
                <display:column style="width:15%" property="OWNERNAME" title="NAME" sortable="true" headerClass="Grid_Header"/> 
                <display:column style="width:25%"  property="ADDRESS" sortable="true" headerClass="Grid_Header" />
                <display:column style="width:10%" property="PHONE"  sortable="true" headerClass="Grid_Header" />                 
            </display:table>
            
        
    <%  } 
           
        }           
        
        catch(Exception ex)
        {
                ex.printStackTrace();

        }
         
         }%>
   
    <input type="hidden" name="HdnViewAll_Owner" id="HdnViewAll_Owner" value='N' />

    </form>        
</body>
</html>
