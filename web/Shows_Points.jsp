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

        <!-- <script type="text/javascript" src="js/jquery.js"></script> -->
         <script type="text/javascript" src="js/interface.js"></script>
        <script type="text/javascript" src="scripts/jscShows_Points.js"></script>



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
            var hiddenShowSeq = $("#ShowSeq");
            var value = data.toString().split('#@#');
             hiddenShowSeq.val(value[1]);
             });



        $("#Events").autocomplete('Auto_EventList.jsp', {

		width: 350,
		matchContains: true,
		formatItem: formatItem,
		formatResult: formatResult


	} );

        $("#Events").result(function(event, data, formatted) {
            var hiddenShowSeq = $("#EventSeq");
            var value = data.toString().split('#@#');
            hiddenShowSeq.val(value[1]);

            });

});
</script>


</head>

<body>
 <form name="frmShow">
<div id="container">

            <div id="header">
            <%@ include file="frmHeader.jsp"%>
            </div>

 <div id="content">
 
      <div id="MenuHeader">
      <ul id="primary">
		<li><a href="frmYearlyPoints.jsp">YEARLY</a></li>
		<li><a href="frmShowPoints.jsp">SHOWS</a></li>
		<li><a href="frmEquiPoints.jsp">EQUITATION</a></li>
		
	</ul>
      </div>

 <fieldset>
      <table width="655" >
        <tr>
          <td width="88"><font class="label">SHOWS</font></td>
          <div>
            <td width="150">
              <input type="hidden" id="ShowSeq" name="ShowSeq">
              <input size="16px" id='Shows' name="Shows" style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
            height: 16px;
            padding-left: 18px;
            width: 140px !important;" onBlur="EmptyKey(ShowSeq,Shows)">
            </td>
            <td width="32" nowrap><img src="Images/Find.gif" onClick="Search_Shows('ShowSeq','Shows')"></td>
          </div>
          <td width="59"><font class="label">EVENTS</font></td>
          <div>
            <td colspan="11" >
              <input type="hidden" id="EventSeq" name="EventSeq">
              <input size="80" id='Events' name="Events" style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
            height: 16px;
            padding-left: 18px;
            width: 350px !important;">
            </td>
          </div>
        </tr>
        <tr>
          <td width="88"><font class="label">CATEGORY</font> </td>
          <td colspan="2">
            <select  style="background-color:  #FFF8DC; border:  1px solid #000000; width: 150px">
              <option>Select</option>
              <option>Horse</option>
              <option>Rider</option>
              <option>Owner</option>
              <option>Breeder</option>
            </select>
            </td>
          <td width="59">DATE</td>
          <td width="106"><font class="label">
                  <font class="dateStyleBody" align="center">&nbsp;&nbsp;&nbsp;&nbsp;FROM</font>
            <input type="text" name="txtFrom" size="10" id="datepicker"
             style="background-color:  #FFF8DC; border:  1px solid #000000;"/>
            </font></td>
          <td width="41"><font class="label">
                   <font class="dateStyleBody" align="center">&nbsp;&nbsp;&nbsp;&nbsp;TO</font>
            <input type="text" name="txtTo" size="10" id="datepickerTo"
                   style="background-color:  #FFF8DC; border:  1px solid #000000;"/>
            </font></td>
          <td width="90"><font class="label"> </font></td>
          <td width="63"><font class="label">
            <input class='button' type="button" name="Search" value="Search" onClick="fnSearch()"/>
            </font></td>
          <td width="56"><font class="label">
            <input class='button' type="Reset" name="Reset" value="Reset" onClick="fnReset()"/>
            </font>
              </td>
          
        </tr>
      </table>

  </fieldset>

<div id="Shows_ListHorses_List" >
<iframe  src="Shows_Points_Results.jsp"  id="iFrame_Shows_Points"
            width="100%" height="350"
            marginwidth="0" marginheight="0" frameborder="0">
</iframe>
    
</div>
				</div> <!-- Content End -->


<div id="sidebar">
<%@ include file="Shows_ListHorses_Side.jsp"%>

</div>



</div>



<input type="hidden" name="PageID" value="SHOWS_POINTS"/>
</form>



</body>
</html>