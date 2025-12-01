<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 
 <%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>

<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PASO TRACKER</title>


 <link href="Shows.css" rel="stylesheet" type="text/css" />
 <link href="Tables_style.css" rel="stylesheet" type="text/css" />
 <link href="buttons.css" rel="stylesheet" type="text/css" />
 <link rel="stylesheet" href="themes/base/jquery.ui.all.css"/>
 <link href="style.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript" src="jquery-1.5.1.js"></script>
	<script type="text/javascript" src="external/jquery.bgiframe-2.1.2.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.core.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.widget.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.mouse.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.button.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.draggable.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.position.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.resizable.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.dialog.js"></script>
	<script type="text/javascript" src="ui/jquery.effects.core.js"></script>
         <script type="text/javascript" src="ui/jquery.ui.autocomplete.js"></script>
         <script type="text/javascript" src="ui/jquery.ui.datepicker.js"></script>

       <!--  <script type="text/javascript" src="js/jquery.js"></script> -->
         <script type="text/javascript" src="js/interface.js"></script>





          <script type="text/javascript" src="scripts/Shows_Register.js"></script>
           <script type="text/javascript" src="scripts/jscCommon.js"></script>



<!-- <script type="text/javascript" src="AutoComplete/jquery.js"></script> -->
<script type='text/javascript' src='AutoComplete/jquery.autocomplete.js'></script>
<link rel="stylesheet" type="text/css" href="AutoComplete/jquery.autocomplete.css" />
<script>
function sizeIFrame() {
var helpFrame = jQuery("#iFrame_Shows_Register_List");
var innerDoc = (helpFrame.get(0).contentDocument) ? helpFrame.get(0).contentDocument : helpFrame.get(0).contentWindow.document;
helpFrame.height(innerDoc.body.scrollHeight );
}
jQuery(function() {
sizeIFrame();
jQuery("#iFrame_Shows_Register_List").load(sizeIFrame);
});

function SummaryExcel(){

	if(document.getElementById('ShowSeq').value=='')
		return false;

    document.forms[0].target="_blank";
    document.forms[0].method = "post";
    document.forms[0].action = "frmCommonExcel.jsp?PAGEID=ShowSummary";                            
    document.forms[0].submit();
}
</script>
</head>
<body>
 <form name="Shows_Register">
<div id="container">

    <div id="header">
    <%@ include file="frmHeader.jsp"%>
    </div>
<%
		if(!bShows)
		response.sendRedirect("login.jsp");

            String strShowSeq_Head="";
            String strShowName_Head="";

           
        if (session.getAttribute("CommonShowSeq")!=null)
            strShowSeq_Head=(String)session.getAttribute("CommonShowSeq");
        if (session.getAttribute("CommonShowName")!=null)
            strShowName_Head=(String)session.getAttribute("CommonShowName");

           
    %>


    <div id="content">
    <fieldset>



      <table class="altRow">
        <tr>
          <td width="66"><font class="label">SHOWS</font></td>
          <div>
            <td width="140">
              <input type="hidden" id="ShowSeq" name="ShowSeq" value="<%=strShowSeq_Head%>">
              <input size="16px" id='Shows' name="Shows"  value="<%=strShowName_Head%>" style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
            height: 16px;
            padding-left: 18px;
            width: 140px !important;" onBlur="EmptyKey(ShowSeq,Shows)">
            </td>
            <td width="32" nowrap><img src="Images/Find.gif" onClick="Search_Shows('ShowSeq','Shows')"></td>
          </div>
          <td width="87"><font class="label">EVENTS</font></td>
          <div>
            <td colspan="7" >
              <input type="hidden" id="EventSeq" name="EventSeq">
             <input type="text" size="2" id="EventOrder" 
                    name="EventOrder" style="background-color:  #FFF8DC; border:  1px solid #000000;"
                    onBlur="getEventName(ShowSeq,Shows,this,EventSeq,Events)">
              <input size="80" id='Events' name="Events" style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
            height: 16px;
            padding-left: 18px;
            width: 350px !important;">
             
            </td>
          </div>
        </tr>
        <tr>
          <td width="66"><font class="label">CATEGORY</font></td>
          <td colspan="2" >
            <select name="Category" style="background-color:  #FFF8DC; border:  1px solid #000000; width: 150px">
             <option value="">Select</option>
        <option >PasoFino</option>
        <option>Equitation</option>
        <option>Performance</option>
        <option>Pleasure</option>
        <option>Amateur Owner</option>
        <option>Trocha</option>
        <option>Trocha y galope</option>
        <option>Trote y galope</option>
        <option>Bellas Formas</option>
        <option>Cuerda</option>
        <option>GRUPO DE YEGUAS CON CRIA</option>
        <option>GRUPO DE YEGUAS PARA CRIA</option>
		<option>MEJOR DESCENDENCIA DE UNA YEGUA</option>
        <option>JEFE DE RAZA</option>
        <option>Geldings</option>
		<option>Paso Trail</option>
		<option>Paso Western Pleasure</option>
		<option>Paso Versatility</option>
		<option>Paso Country Pleasure</option>
		<option>Amateur Owner Performance</option>
		<option>Amateur Owner Pleasure</option>
            </select>
          </td>
          <td width="87"><font class="label">GENDER</font></td>
          <td >
            <select name="Gender" style="background-color:  #FFF8DC; border:  1px solid #000000;width: 150px">
              <option Value="">All</option>
              <option>Male</option>
              <option>Female</option>
              <option>Gelding</option>
            </select>
          </td>
          <td width="35"><font class="label">AGE</font> <font class="dateStyleBody" align="center"></font></td>
          <td width="61"><font class="dateStyleBody" align="center">&nbsp;&nbsp;&nbsp;&nbsp;FROM</font>
          </td>
          <td width="25">
            <input type="text" name="Agefrom" size="3" style="background-color:  #FFF8DC; border:  1px solid #000000;">
          </td>
          <td width="37"><font class="dateStyleBody" align="center">&nbsp;&nbsp;&nbsp;&nbsp;TO</font>
          </td>
          <td width="277">
            <input type="text" name="AgeTo" size="3" style="background-color:  #FFF8DC; border:  1px solid #000000;">
            <font class="dateStyleBody" align="center">MONTHS</font> </td>
        </tr>
        <tr>
          <td width="66"><font class="label">RIDER</font> </td>
          <td colspan="2">
            <select name="Rider" style="background-color:  #FFF8DC; border:  1px solid #000000;width: 150px">
              <option value="">All</option>
              <option>Open/Professional</option>
              <option>Amaeture Owner</option>
              <option>N/A</option>
            </select>
          </td>
          <td width="87"><font class="label">&nbsp;</font> <font class="label">DATE</font></td>
          <td>
            <input size="16px" id='datepicker' name="ShowDate" style="background-color:  #FFF8DC; border:  1px solid #000000;">
          </td>
          <td colspan="5" align="right">&nbsp;</td>
          </tr>
      </table>
           <table width="100%" >
        <tr>
          <td>
            <div align="right">
              <input class='button' type="button" name="Search" value="Search" onClick="fnSearch('<%=Shw_ScrnRegShwStatus_Ins%>','<%=Shw_ScrnRegShwStatus_View%>')" <% if(Shw_ScrnRegShwStatus_Ins.equals("N") && Shw_ScrnRegShwStatus_View.equals("N"))  {%> style="visibility:hidden;" <%}%> >
              <input type="hidden" name="FlgViewAll" value="N" >
              <input class='button' type="Reset" name="Reset" value="Reset" onClick="fnReset()" >
              <input class='button' type="button" name="Register" value="Register" onClick="Register_Pop()" <% if(Shw_ScrnRegShwStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> >
              <input class='button' type="button" name="Payments" value="Payments" onClick="fnPayments()" <% if(Shw_ScrnRegShwStatus_Ins.equals("N") && Shw_ScrnRegShwStatus_View.equals("N"))  {%> style="visibility:hidden;" <%}%> >
              <input class='button' type="button" name="Summary" value="Summary" onClick="Events_Summary()" <% if(Shw_ScrnRegShwStatus_Ins.equals("N") && Shw_ScrnRegShwStatus_View.equals("N"))  {%> style="visibility:hidden;" <%}%> >
                  <input class='button' type="button" name="SummaryXl" value="Summary Excel" onClick="SummaryExcel()" <% if(Shw_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> >
            </div>
          </td>
        </tr>
      </table>



 </fieldset>

<div >
<iframe  src="frmBottom_Registration.jsp"  name="Frame_Shows_Register_List"
         id="iFrame_Shows_Register_List" width="100%" height="0" marginwidth="0" marginheight="0"
         frameborder="0" >
</iframe>
    
</div>
         <!-- Shows_Register_List-->

				</div>


            <div id="sidebar">
                    <%@ include file="Shows_Register_Side.jsp"%>
            </div>



</div>
<!----- This is for the Registration Pop Up -->

<div id="dialog-Register" name="dialog-Register" title="REGISTER" style="display:none; background:url('Images/trans-wood-1.png')">
<iframe  src="blank.jsp"  id="IFRegister" width="100%" height="580" marginwidth="0" marginheight="0"
         frameborder="0"  dialog="Register" >
</iframe>

</div>
<!----- This is for the Show Pop Up -->
<div id="dialog-Show" name="dialog-Show"  style="display:none; background:url('Images/trans-wood-1.png')">
<iframe  src="blank.jsp"  id="modalIFrame_ShowList" width="100%" height="100%" marginwidth="0" marginheight="0"
         frameborder="0"  >
</iframe>
</div>

<input type="hidden" name="PageID" value="SHOWS_REGISTER">

</form>



</body>
</html>