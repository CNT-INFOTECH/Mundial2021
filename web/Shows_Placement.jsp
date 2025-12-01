<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
 <%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>

<html>
<head>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    
	
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

         <!--<script type="text/javascript" src="js/jquery.js"></script> -->
         <script type="text/javascript" src="js/interface.js"></script>
        <script type="text/javascript" src="scripts/Shows_Placement.js"></script>
        <script type="text/javascript" src="scripts/jscCommon.js"></script>



<!-- <script type="text/javascript" src="AutoComplete/jquery.js"></script> -->
<script type='text/javascript' src='AutoComplete/jquery.autocomplete.js'></script>
<link rel="stylesheet" type="text/css" href="AutoComplete/jquery.autocomplete.css" />
<script>
function sizeIFrame() {
var helpFrame = jQuery("#iFrame_Shows_Placement_List");
var innerDoc = (helpFrame.get(0).contentDocument) ? helpFrame.get(0).contentDocument : helpFrame.get(0).contentWindow.document;
helpFrame.height(innerDoc.body.scrollHeight + 35);
}
jQuery(function() {
sizeIFrame();
jQuery("#iFrame_Shows_Placement_List").load(sizeIFrame);
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

            String strShowSeq_Head="";
            String strShowName_Head="";

        if (session.getAttribute("CommonShowSeq")!=null)
            strShowSeq_Head=(String)session.getAttribute("CommonShowSeq");
        if (session.getAttribute("CommonShowName")!=null)
            strShowName_Head=(String)session.getAttribute("CommonShowName");

           
    %>


        <div id="content">
            <fieldset>



            <table width="100%">
            <tr>
            <td width=50"><font class="label">Show</font></td>
            <td width=100">
            <input size="16px" id='Shows' name="Shows"  value="<%=strShowName_Head%>" style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
            height: 16px;
            padding-left: 18px;
            width: 130px !important;"/>
                <input type="hidden" id="ShowsSeq" name="ShowsSeq" value="<%=strShowSeq_Head%>" />
                <img alt="" src="Images/Find.gif" onClick="Search_Shows('ShowsSeq','Shows')"/>
            </td>
           
            <td width="50"><font class="label">Event</font></td>
            <td width="100">
             <input type="text" size="2" id="EventOrder" name="EventOrder" 
                    style="background-color:  #FFF8DC; border:  1px solid #000000;"
                     onBlur="getEventName(ShowsSeq,Shows,this,EventSeq,Events)"/>
             <input size="30px" id='Events' name="Events" style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
            height: 16px;
            padding-left: 18px;
            width: 400px !important;"/>
                <input type="hidden" id="EventSeq" Name="EventSeq"/>
            </td>
            </tr>
            <tr>
            <td  colspan="5"><font class="label">

                    
            <input class='button' type="button" name="Reset" value="Judges' Card" 
                   onClick="fnBannerScreen('Shows_ResultBanner',ShowsSeq.value,EventSeq.value,'_blank')"/>  
            <input class='button' type="button" name="Reset" value="Final Placements" 
                   onClick="fnBannerScreen('Shows_FinalResultBanner',ShowsSeq.value,EventSeq.value,'_blank')"/>  

            <input class='button' type="button" name="Search" value="Search" onClick="fnSearch(EventSeq)" <% if(Shw_ScrnStatus_Ins.equals("N") && Shw_ScrnPlacementStatus_View.equals("N"))  {%> style="visibility:hidden;" <%}%> />
            <input class='button' type="Reset" name="Reset" value="Reset" onClick="fnReset_Place()"/>
            <input class='button' type="button" value="Print list" onClick="PrintParticipant_List()" <% if(Shw_ScrnPlacementStatus_Ins.equals("N") && Shw_ScrnPlacementStatus_View.equals("N"))  {%> style="visibility:hidden;" <%}%> />
            <input class='button' type="button" value="F1/F2" onClick="JudgeF1F2(EventSeq.value,Events.value,ShowsSeq.value)" <% if(Shw_ScrnPlacementStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> />
             <input type="hidden" name="PageID" value="PARTICIPANTS"/>

            </font>
            </td>
                </tr>
            
            </table>



            </fieldset>


            <div id="Shows_Placement_List">
            
            <iframe onload="insertIt();"  src="frmBottom_Registration.jsp"  id="iFrame_Shows_Placement_List"
            width="100%" height="100%" 
            marginwidth="0" marginheight="0" frameborder="0">
            </iframe>
        </div> 




        </div>


        <div id="sidebar">
        <%@ include file="Shows_Placement_Side.jsp"%>

        </div>


</div>

 <div id="dialog" title="F1-F2" style="display:none; background:url('Images/trans-wood-1.png')">
<iframe   src="blank.jsp"  id="F1F2" width="100%" height="550"
marginwidth="0" marginheight="0" frameborder="0" >
</iframe>
</div>


<div id="dialog-Show"  style="display:none; background:url('Images/trans-wood-1.png')">
<iframe  src="blank.jsp"  id="modalIFrame_ShowList" width="100%" height="100%" marginwidth="0" marginheight="0"
         frameborder="0"  >
</iframe>
</div>

<div id="Participant_Details"  title="Participant Details "style="display:none; background:url('Images/trans-wood-1.png')">
<iframe  src="blank.jsp"  id="IFrame_Participant_Details" width="100%" height="100%" marginwidth="0" marginheight="0"
         frameborder="0"  >
</iframe>
</div>

<div id="dialog-Notes"  style="display:none; background:url('Images/trans-wood-1.png')">
<iframe  src="blank.jsp"  id="modalIFrame_Notes" width="100%" height="100%" marginwidth="0" marginheight="0"
         frameborder="0"  >
</iframe>
</div>







</form>



</body>
</html>