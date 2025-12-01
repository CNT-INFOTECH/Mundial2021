<%--
    Document   : frmCommonRef
    Created on : May 19, 2011, 2:32:41 PM
    Author     : raju
--%>

<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

        <link rel="stylesheet" href="Shows.css">
        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
        <link href="buttons.css" rel="stylesheet" type="text/css" />
<%@ page import="pasotracker.GeneralServlet" %>    
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "model.GetInterface" %>

<html>
    <head>
        <title>PASO TRACKER </title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

     <link rel="stylesheet" href="frmCommonRef.css" type="text/css" />

  <link rel="stylesheet" href="windowfiles/dhtmlwindow.css" type="text/css" />

 <script type="text/javascript" src="windowfiles/dhtmlwindow.js">
  
/***********************************************
* DHTML Window Widget- © Dynamic Drive (www.dynamicdrive.com)
* This notice must stay intact for legal use.
* Visit http://www.dynamicdrive.com/ for full source code
***********************************************/

</script>
<!--<script type="text/javascript" >
function retnCSZCDetails(strCity,strState,strZip,strCountry)
{
    parent.opener.document.getElementById("City").value=strCity;             
    parent.opener.document.getElementById("State").value=strState;             
    parent.opener.document.getElementById("Zip").value=strZip;
    parent.opener.document.getElementById("Country").value=strCountry;

    parent.opener.document.getElementById("Phone").focus();   
    window.close();
}
</script> -->
<link rel="stylesheet" href="modalfiles/modal.css" type="text/css" />
<script type="text/javascript" src="modalfiles/modal.js"></script>
 <script type="text/javascript" src="scripts/SRegistraion.js"></script>


    </head>

    <%
          String strcity=request.getParameter("City");
          String strState=request.getParameter("State");
          String strZip=request.getParameter("Zip");
          String strCountry="";



            GetInterface GUI=new GetInterface();
            List LiValues= GUI.GetCityStateZip(strcity,strState,strZip,"");
         // GeneralServlet gen=new GeneralServlet();
        //  List LiValues = new ArrayList();
        //  CachedRowSetImpl crsDetails = new CachedRowSetImpl();
        //  if(strcity!=null || strState!=null || strZip!=null)
        //    crsDetails = gen.GET_CountryDetails(strcity,strState,strZip,"");
            
          //  Map MpAllDetails = new TreeMap();
        /*try
        {   
          */  
        /*    String cityVal="";
            String stateVal="";
            String zipVal="";
            String countryVal="";
            ArrayList ArrRow=new ArrayList();
            while (crsDetails.next())
            {
                
                 ArrRow=new ArrayList();
                if(crsDetails.getString("CITY")!=null)
                {  
                    ArrRow.add(cityVal= crsDetails.getString("CITY").trim());
                }
                else 
                    ArrRow.add("");
                 
                 if(crsDetails.getString("STATE")!=null)
                {  
                    ArrRow.add(cityVal= crsDetails.getString("STATE").trim());
                }
                else 
                    ArrRow.add("");
                 
                 if(crsDetails.getString("ZIP")!=null)
                {  
                    ArrRow.add(cityVal= crsDetails.getString("ZIP").trim());
                }
                else 
                    ArrRow.add("");
                 
                 if(crsDetails.getString("COUNTRY")!=null)
                {  
                    ArrRow.add(cityVal= crsDetails.getString("COUNTRY").trim());
                }
                else 
                    ArrRow.add("");
                 
                
                
                    MpAllDetails = new TreeMap();
                    MpAllDetails.put("CITY",cityVal);
                    MpAllDetails.put("STATE",stateVal);
                    MpAllDetails.put("ZIP",zipVal);
                    MpAllDetails.put("COUNTRY",countryVal);
               

                    LiValues.add(ArrRow);
                    
                   

            }
             */
    %>
    <body>
<form name="frmCommonRef">
<div id="framecontent">
<div class="innertube">
    
<!--
<table width="100%">

<TR><td><div align="right" >
<input class="button" type="button" name="SelectedVal" Value="Select"
       onclick="ReturnVal()">

<input class="button" type="button" name="AddVal" Value="New"
       onclick="OpenPop()">

<input class="button" type="button" name="ModifyVal" Value="Edit"
       onClick="OpenPop()">

<input class="button" type="button" name="DelVal" Value="Delete"
       onClick="Delete()"></div>


</td></TR>
                </table>
-->
</div>
</div>


<div id="maincontent">
<div class="innertube">

<table class="grid" width="100%" style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">
  <tbody>
  <th width="10%"class="Grid_Header">&nbsp;</th>
  <th class="Grid_Header">CITY</th>
  <th class="Grid_Header">STATE</th>
  <th class="Grid_Header">ZIP</th>
  <th class="Grid_Header">COUNTRY</th>
  <%
            for (int i=0;i < LiValues.size(); i++)
            {
                ArrayList ArRow=new ArrayList();
                ArRow=(ArrayList)LiValues.get(i);
                String strClass="";
                    strcity=ArRow.get(0).toString().toString().toUpperCase();
                    strState=ArRow.get(1).toString().toString().toUpperCase();
                    strZip=ArRow.get(2).toString().toString().toUpperCase();
                    strCountry=ArRow.get(3).toString().toString().toUpperCase();
                if( i%2 ==0 )
                strClass="even";
                else
                strClass="odd"; // 0 -- Seq and 2--Description
            %>
            <tr id="<%=i%>"class="<%=strClass%>">
            <td ><input type="radio" Name="chkRadio" onClick="retnCSZCDetails('<%=strcity%>','<%=strState%>','<%=strZip%>','<%=strCountry%>')"></td>
            <td ><%=strcity%></td>
            <td ><%=strState%></td>
            <td ><%=strZip%></td>
            <td ><%=strCountry%></td>
            </tr>

            <%} %>
            </tbody>
                <input type="hidden" name="RefType" value="" />
                <input type="hidden" name="Status" value="A" />
                <input type="hidden" name="RefSeq" />
                <input type="hidden" name="Desc" />
                <input type="hidden" name="PageID" value="COMMON_CITY_STATE" />

            </table>


</div>
</div>

   </form>
    </body>
</html>
