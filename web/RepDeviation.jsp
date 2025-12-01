<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>

<html>
<head>
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

         <script type="text/javascript" src="js/jquery.js"></script>
         <script type="text/javascript" src="js/interface.js"></script>
        <script type="text/javascript" src="scripts/Shows_ListHorses.js"></script>



<!-- <script type="text/javascript" src="AutoComplete/jquery.js"></script> -->
<script type='text/javascript' src='AutoComplete/jquery.autocomplete.js'></script>
<link rel="stylesheet" type="text/css" href="AutoComplete/jquery.autocomplete.css" />



<script type="text/javascript">
$().ready(function() {



	function formatItem(row) {
                 finalVal_formatItem=row[0].split('#@#')
		 return finalVal_formatItem[0] ;
	}
	function formatResult(row) {
                finalVal_formatResult=row[0].split('#@#')
		return finalVal_formatResult[0].replace(/(<.+?>)/gi, '');
	}


	$("#Shows").autocomplete('Auto_ShowsList.jsp', {
		width: 200,
		matchContains: true,
		formatItem: formatItem,
		formatResult: formatResult
	});

         $("#Shows").result(function(event, data, formatted) {
            var hiddenShowSeq = $("#ShowsSeq");
            var value = data.toString().split('#@#');
            hiddenShowSeq.val(value[1]);

            });


        $("#Events").autocomplete('Auto_EventList.jsp', {

		width: 400,
		matchContains: true,
		formatItem: formatItem,
		formatResult: formatResult


	} );

         $("#Events").result(function(event, data, formatted) {
            var hiddenEventSeq = $("#EventSeq");
            var value = data.toString().split('#@#');
            hiddenEventSeq.val(value[1]);

            });


});

function sizeIFrame() {
var helpFrame = jQuery("#iFrame_Deviation_List");
var innerDoc = (helpFrame.get(0).contentDocument) ? helpFrame.get(0).contentDocument : helpFrame.get(0).contentWindow.document;
helpFrame.height(innerDoc.body.scrollHeight );
}
jQuery(function() {
sizeIFrame();
jQuery("#iFrame_Deviation_List").load(sizeIFrame);
});
</script>

</head>

<body>
 <form name="frmShow">
<div id="container">

            <div id="header">
            <%@ include file="frmHeader.jsp"%>
            </div>
			<%
			if(!bShows)
			response.sendRedirect("login.jsp");

			%>
 <div id="content">
  <fieldset>



      <table >
        <tr>
          <td width="63"><font class="label">SHOW </font> </td>
          <td width="202">
            <input size="16px" id='Shows' name="Shows" style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
            height: 16px;
            padding-left: 18px;
            width: 130px !important;"/>
             <img alt="" src="Images/Find.gif" onClick="Search_Shows('ShowsSeq','Shows')"/>
            <input type="hidden" id="ShowsSeq" name="ShowsSeq"/>
          </td>
          <td width="44"><font class="label">JUDGE</font> </td>
          <td width="567">
            <input size="25px" name="JudgeName"  id="JudgeName" style="background-color:  #FFF8DC; border:  1px solid #000000;"/>
            <input type="hidden" id="JudgeSeq" name="JudgeSeq"/>
            <img src="Images/dropdown_icon4.gif"  onClick="OpenCommonRef('Judge','JudgeSeq','JudgeName')"/>
          </td>
        </tr>
        <tr>
          <td width="63"><font class="label">EVENT </font> </td>
          <td colspan="3">
            <input size="16px" id='Events'
                   name="Events"
                   style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
            height: 16px;
            padding-left: 18px;
            width: 430px !important;"/>
            <input type="hidden" id="EventSeq" Name="EventSeq"/>
          </td>
        </tr>
        <tr>
          <td colspan="4"><font class="label">
            <input class='button' type="button" name="Search" value="View Report"
                   onClick="fnDevReport(ShowsSeq.value,EventSeq.value,JudgeSeq.value)"/>
            <input class='button' type="Reset" name="Reset" value="Reset" onClick="fnDeReset()"/>
            </font> </td>
        </tr>
      </table>

  </fieldset>

<div id="Deviation_List">
<iframe src="frmBottom_Registration.jsp"  id="iFrame_Deviation_List" width="100%"
         height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes">
</iframe>
</div> <!-- Shows_Register_List-->

<div id="dialog-CmmnRef" style="display:none; background:url('Images/trans-wood-1.png')" >
<iframe id="modalIFrame_CmmnRef" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" >
</iframe>
</div>
<div id="dialog-Show"  style="display:none; background:url('Images/trans-wood-1.png')">
<iframe  src="blank.jsp"  id="modalIFrame_ShowList" width="100%" height="100%" marginwidth="0" marginheight="0"
         frameborder="0"  >
</iframe>
</div>

				</div>


<div id="sidebar">
<%@ include file="Shows_Deviation_Side.jsp"%>

</div>
</div>
</form>

</body>
</html>