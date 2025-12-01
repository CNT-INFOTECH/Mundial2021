<%--
    Document   : frmCheckSireDam
    Created on : Jun 14, 2011, 2:45:51 AM
    Author     : CNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">


<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Shows.css">
        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
         <link href="buttons.css" rel="stylesheet" type="text/css" />
         <link rel="stylesheet" href="windowfiles/dhtmlwindow.css" type="text/css" />
 <script type="text/javascript" src="windowfiles/dhtmlwindow.js">
/***********************************************
* DHTML Window Widget- © Dynamic Drive (www.dynamicdrive.com)
* This notice must stay intact for legal use.
* Visit http://www.dynamicdrive.com/ for full source code
***********************************************/

</script>
<link rel="stylesheet" href="modalfiles/modal.css" type="text/css" />
<script type="text/javascript" src="modalfiles/modal.js"></script>
<script type="text/javascript" src="scripts/SRegistraion.js"></script>
   <link rel="stylesheet" href="frmCommonSearch.css" type="text/css" />
    </head>
    <body>
        <form>



        <%
                String strHorseSire=request.getParameter("SireName");
                String strHorseDam=request.getParameter("DamName");
                List LiDamValues=new ArrayList();
                List LiSireValues=new ArrayList();

                GetInterface GUI=new GetInterface();
                if(strHorseSire.length()>0)
                    LiSireValues= GUI.GET_SHOWS_PASODETAILS(strHorseSire,"","","","","MALE","");
                if(strHorseDam.length()>0)
                   LiDamValues= GUI.GET_SHOWS_PASODETAILS(strHorseDam,"","","","","FEMALE","");
                 request.setAttribute("SireList", LiSireValues);
                 request.setAttribute("DamList", LiDamValues);



        %>
<div id="framecontent">
<div class="innertube">

<table   class="altRow">
  <tr>
    <td width="36"><font class="label">SIRE</font></td>
    <td width="410" >
      <input type="text" style="background-color:  #FFF8DC; border:  1px solid #000000;"
       name="sireName" id="sireName" size="80" value="<%=strHorseSire%>">
    </td>
    <td width="102" >&nbsp;</td>
  </tr>
  <tr>
    <td width="36"><font class="label">DAM</font></td>
    <td width="410" >
      <input type="text" style="background-color:  #FFF8DC; border:  1px solid #000000;"
       name="damName" id="damName" size="80"  value="<%=strHorseDam%>">
    </td>
    <td width="102" >
      <input class="button" type="button" name="Search" value="Search" onClick="chkSDSearch(sireName,damName)">
    </td>
    <td width="102" >
        <input class="button" type="button" name="Search" value="OK" onClick="chkSDContinue(sireName,damName)">
    </td>
  </tr>
</table>

 </div>
</div>
<div id="maincontent">
<div class="innertube">
<br>

         <% if(LiSireValues.size() > 0) { %>

<p>&nbsp; </p>
<p>MATCHING SIRE INFORMATION</p>
        <display:table  id="Details" name="requestScope.SireList"
                           class="grid"
                            style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">

            <display:column style="width:1%" headerClass="Grid_Header" >
                <input type="radio" name="chkSire" onClick="SireList('${Details.Reg}','${Details.Name}')">
            </display:column>

            <display:column style="width:25%" title="Horse Name" property="Name" sortable="true" headerClass="Grid_Header"/>
           
            <display:column style="width:10%" property="Reg"  sortable="true" headerClass="Grid_Header" />
            <display:column style="width:10%" property="DOB"  sortable="true" headerClass="Grid_Header" />
            <display:column style="width:5%" property="Age" headerClass="Grid_Header" />
            <display:column style="width:5%" property="Sex" headerClass="Grid_Header" />
            <display:column style="width:18%" property="Owner" headerClass="Grid_Header" />
            <display:column style="width:18%" property="Sire" headerClass="Grid_Header" />
            <display:column style="width:18%" property="Dam" headerClass="Grid_Header" />
        </display:table>
 <%}%>

            <br>
         <% if(LiDamValues.size() > 0) { %>
         <p> MATCHING DAM INFORMATION</p>
         <display:table  id="Details" name="requestScope.DamList"
                           class="grid"
                            style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">

            <display:column style="width:1%" headerClass="Grid_Header" >
                <input type="radio" name="chkDam" onClick="DamList('${Details.Reg}','${Details.Name}')">
            </display:column>

            <display:column style="width:25%" title="Horse Name" property="Name" sortable="true" headerClass="Grid_Header"/>
            
            <display:column style="width:10%" property="Reg"  sortable="true" headerClass="Grid_Header" />
            <display:column style="width:10%" property="DOB"  sortable="true" headerClass="Grid_Header" />
            <display:column style="width:5%" property="Age" headerClass="Grid_Header" />
            <display:column style="width:5%" property="Sex" headerClass="Grid_Header" />
            <display:column style="width:18%" property="Owner" headerClass="Grid_Header" />
            <display:column style="width:18%" property="Sire" headerClass="Grid_Header" />
            <display:column style="width:18%" property="Dam" headerClass="Grid_Header" />
        </display:table>
 <%}
   %>
<table width="30%" align="right">
    <tr>
    <td >
    


    </td>

    </tr>
    </table>

</div>
</div>
   </form>
    </body>
</html>
