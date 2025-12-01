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
        
        <script type='text/javascript' src='AutoComplete/jquery.autocomplete.js'></script>
        
        <%--<link rel="stylesheet" type="text/css" href="AutoComplete/jquery.autocomplete.css" />--%>
        
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

<script type="text/javascript">        

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
      
      function formatItem_O(row_1) {
		 finalVal_formatItem=row_1[0].split('#@#')
		 return finalVal_formatItem[0] ;                 
	}
	function formatResult_O(row_1) {
		 finalVal_formatResult=row_1[0].split('[ID:]')
		return finalVal_formatResult[0].replace(/(<.+?>)/gi, '');
	}
         
        
        
        $("#Org_Name").autocomplete("frmAutoOwnerBreederNameList.jsp", {
		width: 250,
		matchContains: true,
		formatItem: formatItem_O,
		formatResult: formatResult_O
	});
         
        $("#Org_Name").result(function(event, data, formatted) {
            /*var hiddenRegSeq = $("#Owner");
            var value = data.toString().split('#@#');
             hiddenRegSeq.val(value[1]+"; ");*/
             
            var hiddenSeq = $("#Breeder_Num");
            var value = data.toString().split('[ID:]');            
            var seq= value[1].split('#@#');
            hiddenSeq.val(trimRegister(seq[0]));
            
            
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
        
        <form name="frmBreederSearchPopup">
            
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
        
    String strViewAll=request.getParameter("ViewAll");


     String strMode="";

    if(request.getParameter("Mode")!=null)
         strMode=request.getParameter("Mode");
     
     if(request.getParameter("Type")!=null)
         strType=request.getParameter("Type");
     

    if(request.getParameter("breederfname")!=null)
        strBreederName=request.getParameter("breederfname");
    else
        strBreederName="";

    if(request.getParameter("breederlname")!=null)
        strBreederLName=request.getParameter("breederlname");
    else
        strBreederLName="";

    if(request.getParameter("phone")!=null)
        strPhone=request.getParameter("phone");
    else
        strPhone="";
     
    if(request.getParameter("Breeder_Num")!=null)
        strBreederNum=request.getParameter("Breeder_Num");
    else
        strBreederNum=""; 
     
    if(request.getParameter("Org_Name")!=null)
        strOrgName=request.getParameter("Org_Name");
    else
        strOrgName="";  
     
     
%>

<div id="framecontent">
    <div class="innertube">
        <%--
        <table class="altRow" width="100%">
            <tr>
                <td >BREEDER#</td>
                <td >
                    <input type="text" name="Breeder_Num" id="Breeder_Num" value="<%=strBreederNum%>" style="background-color:  #FFF8DC; border:  1px solid #000000; text-transform: uppercase;" >
                </td>
                <td nowrap>ORG NAME</td>
                <td colspan="3">
                    <input type="text" name="Org_Name" id="Org_Name"  size="58" value="<%=strOrgName%>" style=" background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;">
                </td>
            </tr>
            <tr>
                <td >BREEDER&nbsp;NAME(F,L)</td>
                <td  nowrap >
                    <input type="text" name="breederfname" id="breederfname"  value="<%=strBreederName%>"   style="background-color:  #FFF8DC; border:  1px solid #000000; text-transform: uppercase;" >
                </td>
                <td>
                    <input type="text" name="breederlname" id="breederlname" value="<%=strBreederLName%>"   style="background-color:  #FFF8DC; border:  1px solid #000000; text-transform: uppercase;" name="breederlname">
                </td>
                
                <td >PHONE</td>
                <td >
                    <input type="text" name="phone" id="phone" value="<%=strPhone%>" style="background-color:  #FFF8DC; border:  1px solid #000000; text-transform: uppercase;" >
                </td>
            </tr>
            
            <tr align="center" valign="center" class="altRow_button">      
                <td colspan=5" align="center">
                    <input class="button" type="button" name="BreederSearchbtn" id="BreederSearchbtn" value="Search" >
                    
                    <input type="button" id="BreederSearchResetbtn" class="button" value="Reset"/>
                    
                    <input type="button" id="BreederSearchSelectbtn" class="button" value="OK"/>
                </td>
            </tr>
        </table>--%>
        
            <table class="altRow" width="100%">
            <tr>
                <td >ID#</td>
                <td >
                    <input type="text" name="Breeder_Num" id="Breeder_Num" size="10" value="<%=strBreederNum%>" style="background-color:  #FFF8DC; border:  1px solid #000000; text-transform: uppercase;" >
                </td>
                <td nowrap>NAME</td>
                <td colspan="">
                    <input type="text" name="Org_Name" id="Org_Name"  size="58" value="<%=strOrgName%>" style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
            height: 16px;
            padding-left: 18px;
            width: 265px !important;text-transform: uppercase;">
                </td>
                <td >PHONE</td>
                <td >
                    <input type="text" name="phone" id="phone" size="12" value="<%=strPhone%>" style="background-color:  #FFF8DC; border:  1px solid #000000; text-transform: uppercase;" >
                </td>
            </tr>
            
            <tr align="center" valign="center" class="altRow_button">      
                <td colspan="6" align="right">
                    <input class="button" type="button" name="BreederSearchbtn" id="BreederSearchbtn" value="Search" >
                    
                    <input type="button" id="BreederSearchResetbtn" class="button" value="Reset"/>
                    
                    <input type="button" id="BreederSearchSelectbtn" class="button" value="OK"/>
                </td>
            </tr>
        </table>


</div>
 </div>

<%
if(strMode.equals("1"))
{
    List BreederList = new ArrayList();
     try
        {

            GeneralServlet gen=new GeneralServlet();
 RowSetFactory factory73= RowSetProvider.newFactory();
   CachedRowSet crs= factory73.createCachedRowSet();
            //CachedRowSetImpl crs = new CachedRowSetImpl();

            crs = gen.GET_OwnerInformation(strBreederName, strBreederLName, strOrgName, strPhone,strBreederNum);

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

               /* strBreederName=strFirstName+" "+strMiddleName+" "+strLastName;
                strAddress =strAddress1+" "+strAddress2+" "+city+" "+state+" "+zip+" "+country;
                */

                    MpHorseDetails = new TreeMap();
                    
                    
                 if(!strOrgName.equals(""))
                    strBreederName=strOrgName;
                 else
                    strBreederName = strFirstName + " " + strLastName;

                    strAddress =strAddress1+" "+strAddress2+" "+city+" "+state+" "+zip+" "+country;
                    
                    /*if(strType.equals("PER"))
                    {
                        strList=strBreederName+"@#@"+strAddress+"@#@"+strPhone+"@#@"+strEntitySeq;
                    }
                    else
                    {
                        strList=strOrgName+"@#@"+strAddress+"@#@"+strPhone+"@#@"+strEntitySeq;
                    }*/
                    
                    strList=strBreederName+"@#@"+strAddress+"@#@"+strPhone+"@#@"+strEntitySeq;
                    
                    MpHorseDetails.put("BREEDERNAME",strBreederName);

					if(asgno!=0)
						MpHorseDetails.put("BREEDERNO",asgno);
                    else
                        MpHorseDetails.put("OWNERNO",null);


                    if(strAddress.trim().equals("NULL"))
                        strAddress="";

                    MpHorseDetails.put("ADDRESS",strAddress);
                    MpHorseDetails.put("PHONE",strPhone);
                    MpHorseDetails.put("ENTITYSEQ",strEntitySeq);

                    //MpHorseDetails.put("ORGNAME",strOrgName);
                    MpHorseDetails.put("Check",strList);

                   

                    String steCheckBox="ChkSelected";
                    
                    if(!strBreederName.trim().equals("") ||!strAddress.trim().equals("") || !strPhone.trim().equals("") )
                    {
                        BreederList.add(MpHorseDetails);
                        Counter=Counter+1;
                   }

                    //BreederList.add(strList);
            }
            
             request.setAttribute("BreederList", BreederList);
           
         
           if (strViewAll.equals("Y") )
            {           
               %>
               <div id="maincontent">
                   <%            out.println(Counter +" Breeders founds,displaying 1 to "+ Counter);
     %>
         <display:table  id="Details" name="requestScope.BreederList"
						class="grid"
                        style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">
                            
        <display:column style="width:1%" headerClass="Grid_Header">
        <input type="Checkbox" name="ChkSelected" value='${Details.Check}' /></display:column>
        <display:column style="width:5%;Height:30px;"   title="ID#" property="BREEDERNO" sortable="true" headerClass="Grid_Header" /> 
        <display:column style="width:15%"   title="BREEDER NAME" property="BREEDERNAME" sortable="true" headerClass="Grid_Header"/>
        <display:column style="width:25%"  property="ADDRESS" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:10%" property="PHONE"  sortable="true" headerClass="Grid_Header" />        
        </display:table>        
</div>

    <%    }else
        {   
                 %>
        <div id="maincontent">
          
            <display:table  id="Details" name="requestScope.BreederList"
                            pagesize="100" 
                            class="grid"
                            style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;overflow-x:scroll;">
                
                <display:setProperty name="paging.banner.item_name" value="Breeder" />
                <display:setProperty name="paging.banner.items_name" value="Breeders" />
                <display:setProperty name="paging.banner.some_items_found">
                
                    <span class="pagebanner">{0} {1} founds,displaying {2} to {3}</span>
                    <span ><input type="checkbox" name="ViewAll_Breeder" onClick="showAlert()"> 
                    <font style="font-weight:bold;">View All&nbsp;&nbsp;&nbsp;</font></span>
                </display:setProperty>
                
                <display:column style="width:1%" headerClass="Grid_Header">
                <input type="Checkbox" name="ChkSelected" value='${Details.Check}' /></display:column>  
                <display:column style="width:5%;Height:30px;"   title="ID#" property="BREEDERNO" sortable="true" headerClass="Grid_Header" /> 
                <display:column style="width:15%"   title="BREEDER NAME" property="BREEDERNAME" sortable="true" headerClass="Grid_Header"/>
                <display:column style="width:25%"  property="ADDRESS" sortable="true" headerClass="Grid_Header" />
                <display:column style="width:10%" property="PHONE"  sortable="true" headerClass="Grid_Header" />                
            </display:table>
            
        </div>
        
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
