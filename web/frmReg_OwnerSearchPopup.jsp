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
        <link rel="stylesheet" type="text/css" href="AutoComplete/jquery.autocomplete.css" />
        
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
      
      
      /*
      function formatItem(row) {
		 finalVal_formatItem=row[0].split('#@#')
		 return finalVal_formatItem[0] ;
	}
	function formatResult(row) {
		 finalVal_formatResult=row[0].split('#@#')
		return finalVal_formatResult[0].replace(/(<.+?>)/gi, '');
	}
        $("#Org_Name").autocomplete("frmAutoOwnerBreederNameList.jsp", {
		width: 200,
		matchContains: true,
		formatItem: formatItem,
		formatResult: formatResult
	});
         $("#Org_Name").result(function(event, data, formatted) {
            //var hiddenRegSeq = $("#HdnRegSeq");
            var value = data.toString().split('#@#');
            // hiddenRegSeq.val(value[1]);
             });
      */

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
             
            var hiddenSeq = $("#Owner_Num");
            var value = data.toString().split('[ID:]');            
            var seq= value[1].split('#@#');
            hiddenSeq.val(trimRegister(seq[0]));
        });
  });
  
  function showAlert()
{  
        if(document.forms[0].ViewAll_Owner.checked==true)
        {            
            document.forms[0].HdnViewAll_Owner.value='Y';
	    document.forms[0].OwnerSearchbtn.click();
        }     
}

</script>
<link href="frmReg_CommonRef.css" rel="stylesheet" type="text/css" />

<body>

        <%@ page import="java.util.*" %>
        <%@ page import="java.io.*" %>
        <%@ page import="java.sql.*" %>
        <%@ page import="javax.sql.rowset.*" %>
        <%--@ page import="pasotracker.DBConnection" --%>
        <%@ page import="pasotracker.GeneralServlet" %>
        
    <form name="frmReg_OwnerSearchPopup" method="post" >        
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
			String strOwn_Type="";
            
            int Counter=0;
        
            String strViewAll=request.getParameter("ViewAll");

            if(request.getParameter("Mode")!=null)
                 strMode=request.getParameter("Mode");        
        
            if(request.getParameter("Type")!=null)
             strType=request.getParameter("Type");
            
            if(request.getParameter("FName")!=null)
                strFName=request.getParameter("FName");            
            
            if(request.getParameter("LName")!=null)
                strLName=request.getParameter("LName");
            
            if(request.getParameter("Org_Name")!=null)
                strOrgName=request.getParameter("Org_Name");
            
            if(request.getParameter("Phone")!=null)
                strPhone=request.getParameter("Phone");
            
            if(request.getParameter("Owner_Num")!=null)
                strOwnerNum=request.getParameter("Owner_Num");         
            
            
            
        %>

        <div id="framecontent">

        <div class="innertube">
        <%--<table class="altRow">
            <tr>
                <td nowrap>OWNER#</td>
                <td colspan="">
                    <input type="text" name="Owner_Num" id="Owner_Num"   size="15" value="<%=strOwnerNum%>" style=" background-color:  #FFF8DC; border:  1px solid #000000; text-transform: uppercase;">
                </td>
                
                <td nowrap>ORG NAME</td>
                <td colspan="3">
                    <input type="text" name="Org_Name" id="Org_Name"   size="50" value="<%=strOrgName%>" style=" background-color:  #FFF8DC; border:  1px solid #000000; text-transform: uppercase;">
                </td>
            </tr>
            <tr>
                <td>F.NAME</td>
                <td>
                    <input type="text" name="FName" id="FName"  value="<%=strFName%>" size="18" style=" background-color:  #FFF8DC; border:  1px solid #000000; text-transform: uppercase; ">
                </td>
                <td>L.NAME</td>
                <td>
                    <input type="text" name="LName" id="LName"  value="<%=strLName%>" size="18" style=" background-color:  #FFF8DC; border:  1px solid #000000; text-transform: uppercase;">
                </td>
                <td>PHONE</td>
                <td>
                    <input type="text" name="Phone" id="Phone"  value="<%=strPhone%>" size="12" style=" background-color:  #FFF8DC; border:  1px solid #000000; text-transform: uppercase;">
                </td>                
            </tr>           
            <tr>
                <td colspan="6" align="center">
                    <input type="button" value="Search" name ="OwnerSearchbtn" id="OwnerSearchbtn" class="button"/>
               
                    <input type="button" id="OwnerSearchResetbtn" class="button" value="Reset"/>
                
                    <input type="button" id="OwnerSearchSelectbtn" class="button" value="OK"/>
                </td>
            </tr>
        </table>--%>
        
            <table class="altRow">
            <tr>
                <td nowrap>ID#</td>
                <td colspan="">
                    <input type="text" name="Owner_Num" id="Owner_Num"   size="10" value="<%=strOwnerNum%>" style=" background-color:  #FFF8DC; border:  1px solid #000000; text-transform: uppercase;">
                </td>
                
                <td nowrap>NAME</td>
                <td colspan="">
                    <input type="text" name="Org_Name" id="Org_Name"   size="40" value="<%=strOrgName%>" style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
            height: 16px;
            padding-left: 18px;
            width: 270px !important;text-transform: uppercase;">
                </td>
            
                <td>PHONE</td>
                <td>
                    <input type="text" name="Phone" id="Phone"  value="<%=strPhone%>" size="12" style=" background-color:  #FFF8DC; border:  1px solid #000000; text-transform: uppercase;">
                </td>
                <td width="4%">&nbsp;</td>
            </tr>           
            <tr>
                <td colspan="7" align="right">
                    <input type="button" value="Search" name ="OwnerSearchbtn" id="OwnerSearchbtn" class="button"/>
               
                    <input type="button" id="OwnerSearchResetbtn" class="button" value="Reset"/>
                
                    <input type="button" id="OwnerSearchSelectbtn" class="button" value="OK"/>
                </td>
            </tr>
        </table>

                </div>
  </div>

<%
CachedRowSetImpl crsGetOwnerDetails = new CachedRowSetImpl();
if(strMode.equals("1"))
{

         List OwnerList = new ArrayList();
    try {
        GeneralServlet gen = new GeneralServlet();

        

        crsGetOwnerDetails = gen.GET_OwnerInformation(strFName.trim(), strLName.trim(), strOrgName.trim(), strPhone.trim(), strOwnerNum.trim());
        
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
			 strOwn_Type="";
     
             if(crsGetOwnerDetails.getString("OWNER_TYPE")!=null)                  
                strOwn_Type=crsGetOwnerDetails.getString("OWNER_TYPE").trim();

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

            /*if(!strOrgName.equals(""))
                strOwnerName=strOrgName;
             else*/
                strOwnerName = strFName+" "+ strLName;

            strAddress = strAddress1 + " " + strAddress2 + " " + city + " " + state + " " + zip + " " + country;

             
             //strOwnerName=strFName+" "+strMName+" "+strLName;
             /*
             if(strType.equals("PER"))
             {
                   //String strList=strFName+"@#@"+strLName+"@#@"+strOrgName+"@#@"+strPhone+"@#@"+strEntitySeq;
                 strList=strOwnerName+"@#@"+strPhone+"@#@"+strEntitySeq;
                }
             else
             {
                   strList=strOrgName+"@#@"+strPhone+"@#@"+strEntitySeq;
             }
            * */
            
                    strList=strOwnerName+"@#@"+strPhone+"@#@"+strEntitySeq;
            
                    MpOwnerDetails = new TreeMap();
                    MpOwnerDetails.put("FNAME",strFName);
                    MpOwnerDetails.put("LNAME",strLName);
					 if(strOwn_Type.equalsIgnoreCase("INDIVIDUAL") || strOwn_Type.equalsIgnoreCase("YOUTH RIDER") ||(strOwn_Type.equals("") && strOrgName.equals("") ))
                MpOwnerDetails.put("OWNERNAME",strOwnerName);  /* FULL NAME */
            else
                MpOwnerDetails.put("OWNERNAME",strOrgName);
			//MpOwnerDetails.put("ORGNAME",strOrgName);
                    MpOwnerDetails.put("PHONE",strPhone);
                    MpOwnerDetails.put("ENTITYSEQ",strEntitySeq);
					
					if(asgno!=0)
                        MpOwnerDetails.put("OWNERNO",asgno);
                    else
                        MpOwnerDetails.put("OWNERNO",null);


                    if(strAddress.trim().equals("NULL"))
                        strAddress="";
                    
					MpOwnerDetails.put("ADDRESS",strAddress);   
                    MpOwnerDetails.put("Check",strList);
                    
                    String steCheckBox="ChkSelected";

                    //if(!strFName.equals("")|| !strLName.equals("")|| !strOrgName.equals("") ||!strPhone.equals(""))
                    //if(!strFName.equals("")|| !strLName.equals("")|| !strPhone.equals(""))
                    //{
                        OwnerList.add(MpOwnerDetails);
                        Counter=Counter+1;
                    //}
                    

                }
            
                request.setAttribute("OwnerList", OwnerList);
                
                    //OwnerList.add(strList);

            //if(HorseList.size()>0)
                          
           if (strViewAll.equals("Y"))
            {           
               %>
               <div id="maincontent">
                   <%            out.println(Counter +" Owner founds,displaying 1 to "+ Counter);
     %>
         <display:table  id="Details" name="requestScope.OwnerList"
						class="grid"
                        style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">
                            
        <display:column style="width:1%" headerClass="Grid_Header">
        <input type="Checkbox" name="ChkSelected" value='${Details.Check}' /></display:column>
        <display:column style="width:5%;Height:30px;"   title="ID#" property="OWNERNO"       sortable="true" headerClass="Grid_Header" />       
        <display:column style="width:15%" property="OWNERNAME" title="NAME" sortable="true"      headerClass="Grid_Header"/> 
        <display:column style="width:10%"  property="ADDRESS" sortable="true"      headerClass="Grid_Header" />
        <display:column style="width:10%" property="PHONE"  sortable="true"         headerClass="Grid_Header" />        
        </display:table>        
</div>

    <%    }else
        {   
                 %>
        <div id="maincontent">
          
            <display:table  id="Details" name="requestScope.OwnerList"
                            pagesize="100" 
                            class="grid"  
                            style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;overflow-x:scroll;">
                
                <display:setProperty name="paging.banner.item_name"  value="Owner" />
                <display:setProperty name="paging.banner.items_name"  value="Owners" />
                <display:setProperty name="paging.banner.some_items_found">
                
                    <span class="pagebanner">{0} {1} founds,displaying {2} to {3}</span>
                    <span ><input type="checkbox" name="ViewAll_Owner" onClick="showAlert()"> 
                    <font style="font-weight:bold;">View All&nbsp;&nbsp;&nbsp;</font></span>
                </display:setProperty>
                
                <display:column  style="width:1%" headerClass="Grid_Header">
                <input type="Checkbox" name="ChkSelected" value='${Details.Check}'  /></display:column>                
                <display:column  style="width:5%;Height:30px;"   title="ID#" property="OWNERNO"         sortable="true"  headerClass="Grid_Header" />       
                <display:column  style="width:15%"  property="OWNERNAME" title="NAME" sortable="true"        headerClass="Grid_Header"/> 
                <display:column  style="width:10%"    property="ADDRESS" sortable="true"                  headerClass="Grid_Header" />
                <display:column  style="width:10%"  property="PHONE"  sortable="true"                    headerClass="Grid_Header" />                 
            </display:table>
            
        </div>
        
    <%  }
	

        }
          
        catch(Exception ex)
        {
                ex.printStackTrace();

        }
    
         }
		 
		 
		 %>
   
    <input type="hidden" name="HdnViewAll_Owner" id="HdnViewAll_Owner" value='N' />

    </form>        
</body>
</html>
