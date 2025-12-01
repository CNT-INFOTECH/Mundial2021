<%--
    Document   : frmCommonRef
    Created on : May 19, 2011, 2:32:41 PM
    Author     : raju
--%>
<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

        <link rel="stylesheet" href="Shows_Pop.css">
        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
        <link href="buttons.css" rel="stylesheet" type="text/css" />

<%@ page import = "java.util.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="buttons.css" rel="stylesheet" type="text/css" />
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

    <link rel="stylesheet" href="frmReg_CommonRef.css" type="text/css" />
    <link rel="stylesheet" href="windowfiles/dhtmlwindow.css" type="text/css" />
    <script type="text/javascript" src="jscReg_Common.js"></script>
    <script type="text/javascript" src="windowfiles/dhtmlwindow.js">
/***********************************************
* DHTML Window Widget- © Dynamic Drive (www.dynamicdrive.com)
* This notice must stay intact for legal use.
* Visit http://www.dynamicdrive.com/ for full source code
***********************************************/
    </script>
<link rel="stylesheet" href="modalfiles/modal.css" type="text/css" />
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="modalfiles/modal.js"></script>
<link rel="stylesheet" href="Style_Popup.css">
<script src="js/jquery.autocomplete.js"></script>
<script type="text/javascript" src="jscReg_AutoComplete.js"></script>
<script type="text/javascript">
function returnPlaceValues(strCity,strState,strZip,strCountry)
{

     val = strCity+", "+strState;

    if(window.parent.document.forms[0].name=="frmRegistrationSearch")
    {
    window.parent.document.getElementById("TxtPlaceName").value=val;
    }
    else if(window.parent.document.forms[0].name=="Registrationform")
    {
     window.parent.document.getElementById("place").value=val;
     window.parent.document.getElementById("place_Lbl").innerHTML=val;
     window.parent.document.getElementById("SavedYN").value='N';
    }
	else if(window.parent.document.forms[0].name=="Reg_Pedigree_NewRegistration")
    {

     window.parent.document.getElementById("place").value=val;
     window.parent.document.getElementById("place_Lbl").innerHTML=val;
     window.parent.document.getElementById("SavedYN").value='N';
    }
     window.parent.jQuery('#dialog-PlaceOfBirth').dialog('close')
}
function SearchPlace(frm)
{
    document.forms[0].method="post";
    document.forms[0].action="frmReg_CommonRef_Place.jsp?srch=1&Type=1&page="+frm
    document.forms[0].submit();
}
function ViewAll_PlaceOfBirth()
{
    var Pfrm=document.getElementById("frmPage").value;
    document.forms[0].method="post";
    document.forms[0].action="frmReg_CommonRef_Place.jsp?srch=1&Type=2&page="+Pfrm;
    document.forms[0].target="_self";
    document.forms[0].submit();
}

function ResetPlace(frm)
{
	document.getElementById("CITY").value='';
	document.getElementById("STATE").value='';
	document.getElementById("ZIP").value='';
	document.getElementById("COUNTRY").value='';

    document.forms[0].method="post";
    document.forms[0].action="frmReg_CommonRef_Place.jsp?page="+frm;
    document.forms[0].target="_self";
    document.forms[0].submit();
}
</script>
<style type="text/css">

.altRow
{

}

.altRow td
{
	/*border-bottom:1px dotted #ffffff;*/
	font-size:9pt;
	color:#000000;
	padding:5px 0 5px 5px;
	vertical-align:top;
	text-align:left;
}


.altRow  th
{
	background:#4e738f;
	color:#fff;
	font-weight:bold;
	font-size:9pt;
	text-align:center;
}

</style>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.GeneralServlet" %>
    </head>

<%
    String cityVal="";
    String stateVal="";
    String zipVal="";
    String countryVal="";

    String cityVal_Srch="";
    String stateVal_Srch="";
    String Country_Srch="";
    String Zip_Srch="";
    String strSearch="";
    String strType="";
    int crsSize_All=0;

    String frmPage="";

    if(request.getParameter("page")!=null)
    frmPage = request.getParameter("page").trim();
    else
    frmPage="";


    if(request.getParameter("CITY")!=null)
    cityVal_Srch = request.getParameter("CITY").trim();
    else
    cityVal_Srch="";
    
    if(request.getParameter("STATE")!=null)
    stateVal_Srch = request.getParameter("STATE").trim();
    else
    stateVal_Srch="";

    if(request.getParameter("ZIP")!=null)
    Zip_Srch = request.getParameter("ZIP").trim();
    else
    Zip_Srch="";

    if(request.getParameter("COUNTRY")!=null)
    Country_Srch = request.getParameter("COUNTRY").trim();
    else
    Country_Srch="";

    if(request.getParameter("srch")!=null)
    strSearch = request.getParameter("srch").trim();
    else
    strSearch="";

    if(request.getParameter("Type")!=null)
    strType = request.getParameter("Type").trim();
    else
    strType="";

    List AllDetails = new ArrayList();

    try
    {
    // GetInterface GUI=new GetInterface();
    GeneralServlet gen = new GeneralServlet();
    
 RowSetFactory factory = RowSetProvider.newFactory();
   CachedRowSet crsGetDetails= factory.createCachedRowSet();
   // CachedRowSetImpl crsGetDetails = new CachedRowSetImpl();

    if(strSearch.length()>0)
    crsGetDetails = gen.GET_CountryDetails(cityVal_Srch, stateVal_Srch, Zip_Srch, Country_Srch);
    crsSize_All = crsGetDetails.size();
    Map MpAllDetails = new TreeMap();


    while (crsGetDetails.next())
    {

    cityVal="";
    stateVal="";
    zipVal="";
    countryVal="";


    if(crsGetDetails.getString("CITY")!=null)
        cityVal= crsGetDetails.getString("CITY").trim();

    if(crsGetDetails.getString("STATE")!=null)
        stateVal= crsGetDetails.getString("STATE").trim();

    if(crsGetDetails.getString("ZIP")!=null)
        zipVal= crsGetDetails.getString("ZIP").trim();

    if(crsGetDetails.getString("COUNTRY")!=null)
        countryVal= crsGetDetails.getString("COUNTRY").trim();



        MpAllDetails = new TreeMap();
        MpAllDetails.put("CITY",cityVal);
        MpAllDetails.put("STATE",stateVal);
        MpAllDetails.put("ZIP",zipVal);
        MpAllDetails.put("COUNTRY",countryVal);


        AllDetails.add(MpAllDetails);

    }
    }
    catch(Exception ex)
    {
    ex.printStackTrace();

    }
    request.setAttribute("AllDetails", AllDetails);

%>
    <body>
<form name="frmCommonRef">
<div id="framecontent_addPlace">
<div class="innertube">

<table class="altRow" width="100%">

<tr>
    <td>CITY</td>
    <td>
        <input type="text" class="input_city" name="CITY" id="CITY"  size="15" value="<%=cityVal_Srch%>" style="text-transform: uppercase; background-color:  #FFF8DC; border:  1px solid #000000;">
    </td>
    <td>STATE</td>
    <td>
        <input type="text" name="STATE" id="STATE"  size="10" value="<%=stateVal_Srch%>" style="text-transform: uppercase; background-color:  #FFF8DC; border:  1px solid #000000;">
    </td>
    <input type="hidden" name="ZIP" id="ZIP"  size="10" />
    <input type="hidden" name="COUNTRY" id="COUNTRY"  size="10" />
    <input type="hidden" name="frmPage" id="frmPage"  value="<%=frmPage%>" size="10" />
    <td><div align="right" >
<%--
<input class="button" type="button" name="SelectedVal" Value="Select"
       onclick="ReturnPlaceVal('<%=strRefType%>',Desc.value,RefSeq.value,'<%=strReturnID%>','<%=strReturnVal%>')">


<input class="button" type="button" name="ModifyVal" Value="Edit"
       onClick="OpenPop('<%=strRefType%>','Modify',Desc.value,RefSeq.value)">


<input class="button" type="button" name="DelVal" Value="Delete"
       onClick="Delete('<%=strRefType%>','Delete',Desc.value,RefSeq.value)">
--%>


    <input class="button" type="button" name="SearchVal" Value="Search"
           onClick="SearchPlace('<%=frmPage%>')">

    <input class="button" type="button" name="ResetVal" Value="Reset"
           onClick="ResetPlace('<%=frmPage%>')">

    <%if(!frmPage.equals("RegSrch")) {%>
    <input class="button" type="button" name="AddVal" Value="New"
           onclick="OpenPop_Place('ADD','Add','','')">
    <%}%>

<%--
<input class="button" type="button" name="ModifyVal" Value="Edit"
       onclick="OpenPop_Place('MODIFY','Modify','','')">
    --%>
</div>


</td>
</tr>
</table>
</div>
</div>

<div id="maincontent_Breeder">
<div class="innertube">
<%--
<table class="grid" width="100%" style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">
  <tbody>
  <th width="10%"class="Grid_Header">&nbsp;</th>
  <th class="Grid_Header">Name</th>
  <%

            for (int i=0;i < LiValues.size(); i++)
            {
                ArRow=new ArrayList();
                ArRow=(ArrayList)LiValues.get(i);
                String strClass="";
                if( i%2 ==0 )
                strClass="even";
                else
                strClass="odd"; // 0 -- Seq and 2--Description
            %>
            <tr id="<%=i%>"class="<%=strClass%>"
            onclick="SelectRow(this,'<%=ArRow.get(1)%>','<%=ArRow.get(0)%>')"
            ondblclick="ReturnVal('<%=strRefType%>','<%=ArRow.get(1)%>','<%=ArRow.get(0)%>','<%=strReturnID%>','<%=strReturnVal%>')">
            <td ><%=i+1%></td>
            <td ><%=ArRow.get(1)%></td>
            </tr>


            <%} %>
            </tbody>
                <input type="hidden" name="RefType" value="<%=strRefType%>" />
                <input type="hidden" name="Status" value="A" />
                <input type="hidden" name="RefSeq" />
                <input type="hidden" name="Desc" />

                <input type="hidden" name="PageID" value="COMMON_REF" />

            </table>
--%><%
 if(strSearch.length()>0 && strType.equals("1"))
        {
%>
        <display:table  id="Details" name="requestScope.AllDetails"
                        pagesize="100" defaultsort="1" defaultorder="ascending"
                        class="grid"
                        style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;text-transform: uppercase;">
        <display:setProperty name="paging.banner.item_name" value="Place" />
        <display:setProperty name="paging.banner.items_name" value="Places" />
        <display:setProperty name="paging.banner.some_items_found">

            <span class="pagebanner" >{0} {1} founds,displaying {2} to {3}</span>
            <span ><input type="checkbox" onClick="ViewAll_PlaceOfBirth()"> <font style="font-weight:bold;">View All&nbsp;&nbsp;&nbsp;</font></span>

        </display:setProperty>
        <display:setProperty name="basic.msg.empty_list" value="No Place found with the Search Critera "/>
        <display:column style="width:25%"   title="CITY" sortable="true" headerClass="Grid_Header">
            <a href="javaScript:void(0)" onclick="returnPlaceValues('${Details.CITY}','${Details.STATE}','${Details.ZIP}','${Details.COUNTRY}')">${Details.CITY}</a> </display:column>
        <display:column style="width:15%" property="STATE" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:10%" property="ZIP"  sortable="true" headerClass="Grid_Header" />
        <display:column style="width:10%" property="COUNTRY" headerClass="Grid_Header" />

        </display:table>
<%}
 else if(strSearch.length()>0 && strType.equals("2"))
        {out.println(crsSize_All +" Places founds,displaying 1 to "+ crsSize_All);
%>
        <display:table  id="Details" name="requestScope.AllDetails"
                         defaultsort="1" defaultorder="ascending"
                        class="grid"
                        style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">

        <display:setProperty name="basic.msg.empty_list" value="No Place found with the Search Critera "/>
        <display:column style="width:25%"   title="CITY" sortable="true" headerClass="Grid_Header">
            <a href="javaScript:void(0)" onclick="returnPlaceValues('${Details.CITY}','${Details.STATE}','${Details.ZIP}','${Details.COUNTRY}')">${Details.CITY}</a> </display:column>
        <display:column style="width:15%" property="STATE" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:10%" property="ZIP"  sortable="true" headerClass="Grid_Header" />
        <display:column style="width:10%" property="COUNTRY" headerClass="Grid_Header" />

        </display:table>
<%}%>
</div>
</div>

   </form>
    </body>
</html>
