<%--
    Document   : Breeder Search Popup
    Created on : July 13, 2011, 3:22:48 PM
    Author     : Veera
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
        
    </head>


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
        <script>

$(function() {
$( "#view" )
  .click(function(){

        document.forms[0].breederfname.value="";
        document.forms[0].breederlname.value="";
        document.forms[0].phone.value="";

        document.forms[0].method="post";
        document.forms[0].action="frmBreederSearchPopup.jsp?Mode=2";
        document.forms[0].target="_self";
        document.forms[0].submit();
      });
  });

function showAlert()
{  
        if(document.forms[0].ViewAll_Breeder.checked==true)
        {            
            document.forms[0].HdnViewAll_Breeder.value='Y';
	    document.forms[0].BreederSearchbtn.click();
        }     
}
        </script>

    <body>

            <%@ page import="java.util.*" %>
            <%@ page import="java.io.*" %>
            <%@ page import="java.sql.*" %>
            <%@ page import="javax.sql.rowset.*" %>
            <%@ page import="pasotracker.DBConnection" %>
            <%@ page import="pasotracker.GeneralServlet" %>
        
        <form name="frmBreederSearchPopupList">
            
        <input type="button" id="BreederSearchResetbtn" class="button" value="Reset"/>
        <input type="button" id="BreederSearchSelectbtn" class="button" value="OK"/>
            
<%
    String strBreederName="";
    String strBreederLName="";
    String strFirstName="";
    String strLastName="";
    String strAddress="";
    String strAddress1="";
    String strAddress2="";
    String strPhone="";
    String strMiddleName="";
    String city="";
    String state="";
    String zip="";
    String country="";
    String strEntitySeq="";
    String strBreederNum="";
    String strOrgName="";
    String strBreederNo="";
    int Counter=0;
    int asgno=0;
    String strType="";
    String strList="";
        
        //String strViewAll=request.getParameter("ViewAll");
        
    String strViewAll="";

     String strMode="";

    if(request.getParameter("Mode")!=null)
         strMode=request.getParameter("Mode");
     
     if(request.getParameter("Type")!=null)
         strType=request.getParameter("Type");
     
     if(request.getParameter("Name")!=null)
            {
                    strBreederName=request.getParameter("Name");
                   // strLName=request.getParameter("Name");
                    //strOrgName=request.getParameter("Name");                   
            }
     

if(strMode.equals("1"))
{
    List BreederList = new ArrayList();
     try
        {

            GeneralServlet gen=new GeneralServlet();
 RowSetFactory factortycrs= RowSetProvider.newFactory();
   CachedRowSet crs= factorycrs.createCachedRowSet();
           /// CachedRowSetImpl crs = new CachedRowSetImpl();

            //crs = gen.GET_OwnerInformation(strBreederName, strBreederLName, strOrgName, strPhone,strBreederNum);
            
            crs = gen.Get_OwnerName(strBreederName);

            Map MpOwnerDetails = new TreeMap();

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
                zip="";
                country="";
                strEntitySeq="";
                strOrgName="";
                strBreederNo="";
                asgno=0;
                strList="";
                

                if(crs.getString("FIRSTNAME")!=null)
                    strFirstName= crs.getString("FIRSTNAME").trim();
                else
                    strFirstName="";

                if(crs.getString("LASTNAME")!=null)
                    strLastName= crs.getString("LASTNAME").trim();
                else
                    strLastName="";

                if(crs.getString("SUFFIX")!=null)
                    strMiddleName= crs.getString("SUFFIX").trim();
                else
                    strMiddleName="";
                
                if(crs.getString("ORGANIZATION_NAME")!=null)                     
                    strOrgName= crs.getString("ORGANIZATION_NAME").trim(); 
                else
                    strOrgName="";

                if(crs.getString("ADDRESS1")!=null)
                    strAddress1= crs.getString("ADDRESS1").trim();
               else
                    strAddress2="";

                if(crs.getString("ADDRESS2")!=null)
                    strAddress2= crs.getString("ADDRESS2").trim();
                else
                    strAddress2="";

                if(crs.getString("CITY")!=null)
                    city= crs.getString("CITY").trim();

                if(crs.getString("STATE")!=null)
                    state= crs.getString("STATE").trim();

                if(crs.getString("ZIP")!=null)
                    zip= crs.getString("ZIP").trim();

                if(crs.getString("COUNTRY")!=null)
                    country= crs.getString("COUNTRY").trim();

                if(crs.getString("PHONE")!=null)
                    strPhone= crs.getString("PHONE").trim();

                if(crs.getString("ENTITYSEQ")!=null)
                    strEntitySeq= crs.getString("ENTITYSEQ").trim();
                
                
                if(crs.getString("ASSIGNEDNUM")!=null)
                 {
                      strBreederNo= crs.getString("ASSIGNEDNUM").trim();
                      asgno=Integer.parseInt(strBreederNo);  
                }

                strBreederName=strFirstName+" "+strMiddleName+" "+strLastName;
                
                strAddress =strAddress1+" "+strAddress2+" "+city+" "+state+" "+zip+" "+country;


                    MpOwnerDetails = new TreeMap();
                    
                    if(!strOrgName.equals(""))
                    {
                           strList=strOrgName+"@#@"+strAddress+"@#@"+strPhone+"@#@"+strEntitySeq;
                    }
                    else
                    {
                        strList=strBreederName+"@#@"+strAddress+"@#@"+strPhone+"@#@"+strEntitySeq;                     
                    }
                    
                    
                    if(!strOrgName.equals(""))
                     {
                         MpOwnerDetails.put("BREEDERNAME",strOrgName);
                     }
                    else
                    {
                        MpOwnerDetails.put("BREEDERNAME",strBreederName);  /* FULL NAME */
                    }
                    
                    MpOwnerDetails.put("ADDRESS",strAddress);
                    MpOwnerDetails.put("PHONE",strPhone);
                    MpOwnerDetails.put("ENTITYSEQ",strEntitySeq);
                    MpOwnerDetails.put("BREEDERNO",asgno);
                    MpOwnerDetails.put("ORGNAME",strOrgName);
                    MpOwnerDetails.put("Check",strList);

                   

                    String steCheckBox="ChkSelected";
                    
                    if(!strBreederName.trim().equals("") ||!strAddress.trim().equals("") || !strPhone.trim().equals("") )
                    {
                        BreederList.add(MpOwnerDetails);
                        Counter=Counter+1;
                   }

                    //BreederList.add(strList);
            }
            
             request.setAttribute("BreederList", BreederList);
           
            
        //if(HorseList.size()>0)
             //if(strType.equals("PER"))
             //    {
           if (strViewAll.equals("Y") )
            {           
                          out.println(Counter +" Breeders founds,displaying 1 to "+ Counter);
     %>
         <display:table  id="Details" name="requestScope.BreederList"
                        defaultsort="1" defaultorder="ascending" class="grid"
                        style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">
                            
        <display:column style="width:1%"headerClass="Grid_Header">
        <input type="Checkbox" name="ChkSelected" value='${Details.Check}' /></display:column>
        <display:column style="width:5%;Height:30px;"   title="ASSG#" property="BREEDERNO" sortable="true" headerClass="Grid_Header" /> 
        <display:column style="width:15%"   title="BREEDER NAME" property="BREEDERNAME" sortable="true" headerClass="Grid_Header"/>
        <display:column style="width:25%"  property="ADDRESS" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:10%" property="PHONE"  sortable="true" headerClass="Grid_Header" />        
        </display:table>        

    <%    }else
        {   
                 %>
        
          
            <display:table  id="Details" name="requestScope.BreederList"
                            pagesize="10" defaultsort="1" defaultorder="ascending"
                            class="grid"
                            style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;overflow-x:scroll;">
                
                <display:setProperty name="paging.banner.item_name" value="Breeder" />
                <display:setProperty name="paging.banner.items_name" value="Breeders" />
                <display:setProperty name="paging.banner.some_items_found">
                
                    <span class="pagebanner">{0} {1} founds,displaying {2} to {3}</span>
                    <span ><input type="checkbox" name="ViewAll_Breeder" onClick="showAlert()"> 
                    <font style="font-weight:bold;">View All&nbsp;&nbsp;&nbsp;</font></span>
                </display:setProperty>
                
                <display:column style="width:1%"headerClass="Grid_Header">
                <input type="Checkbox" name="ChkSelected" value='${Details.Check}' /></display:column>  
                <display:column style="width:5%;Height:30px;"   title="ASSG#" property="BREEDERNO" sortable="true" headerClass="Grid_Header" /> 
                <display:column style="width:15%"   title="BREEDER NAME" property="BREEDERNAME" sortable="true" headerClass="Grid_Header"/>
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
   
    <input type="hidden" name="HdnViewAll_Breeder" id="HdnViewAll_Breeder" value='N' />
        </form>
    </body>
</html>
