<%--
    Document   : frmPlaceOfBirthSearch
    Created on : July 12, 2011, 2:32:41 PM
    Author     : Veera
--%>
<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
        
<html>
    <head>
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
        <script type="text/javascript" src="jscRegistrationSearch.js"></script>
        <script src="js/jquery.autocomplete.js"></script>
        <script type="text/javascript" src="jscReg_AutoComplete.js"></script>
        
<script type="text/javascript">
   
    function returnPlaceValues(strCity,strState,strZip,strCountry)
{
     val = strCity+", "+strState;
     
    if(window.parent.document.forms[0].name="frmRegistrationSearch")
    {
            window.parent.document.getElementById("TxtPlaceName").value=val;
    }  

     window.parent.jQuery('#dialog-PlaceOfBirth_RegSrch').dialog('close')
}

function SearchPlacedd()
{
    document.forms[0].method="post";
    document.forms[0].action="frmPlaceOfBirthSearch.jsp?srch=1"
    document.forms[0].submit();
}
$(function() {
        $("#CITY").autocomplete('frmReg_CityList.jsp', {
		width: 300,
		matchContains: true,
		formatItem: formatItem_2,
		formatResult: formatResult_2
	});

         $("#CITY").result(function(event1, data1, formatted1) {
               var varState = $("#STATE");
               var varZip = $("#ZIP");
               var varCountry = $("#COUNTRY");
                var value1 = data1.toString().split('[COUNTRY:]');
                var value2 = value1[0].toString().split('[ZIP:]');
                //var value2_1 = value2[1].toString().split(',');
                var value3 = value2[0].toString().split('[ST:]');                
                             
                varCountry.val(trimRegister(value1[1]));
                varZip.val(trimRegister(value2[1]));
                varState.val(trimRegister(value3[1]));

           });
});
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


            List AllDetails = new ArrayList();

            try
            {
           // GetInterface GUI=new GetInterface();
            GeneralServlet gen = new GeneralServlet();
             RowSetFactory factory11 = RowSetProvider.newFactory();
   CachedRowSet crsGetDetails= factory11.createCachedRowSet();
           // CachedRowSetImpl crsGetDetails = new CachedRowSetImpl();

            if(strSearch.length()>0)
            crsGetDetails = gen.GET_CountryDetails(cityVal_Srch, stateVal_Srch, Zip_Srch, Country_Srch);
           
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
<form name="frmCommonRefdd">
    
<div id="framecontent">
<div class="innertube">

<table class="altRow" width="100%">

<TR>
    <td>CITY</td>
    <td>
        <input type="text" name="CITY" id="CITY"  size="15" value="<%=cityVal_Srch%>" style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
            height: 16px;text-transform:uppercase;
            padding-left: 18px;background-color:  #FFF8DC; border:  1px solid #000000;" />
    </td>
    <td>STATE</td>
    <td>
        <input type="text" name="STATE" id="STATE"  size="10" value="<%=stateVal_Srch%>" style="text-transform:uppercase; background-color:  #FFF8DC; border:  1px solid #000000;" />
    </td>
    <input type="hidden" name="ZIP" id="ZIP"  size="10" />
    <input type="hidden" name="COUNTRY" id="COUNTRY"  size="10" />
    <td>

<input class="button" type="button" name="SearchValsss" value="Search"  onclick="SearchPlacedd()"  />


</td></TR>
</table>
</div>
</div>


<div id="maincontent_Breeder">
<div class="innertube">
<%
 if(strSearch.length()>0 )
        {
%>
     <display:table  id="Details" name="requestScope.AllDetails"
                        pagesize="100" defaultsort="1" defaultorder="ascending"
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
