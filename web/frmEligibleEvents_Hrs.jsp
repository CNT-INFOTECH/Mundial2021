<%--
    Document   : frmRegister
    Created on : May 26, 2011, 11:11:45 PM
    Author     : CNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
        <head>
        <link href="Shows_Pop.css" rel="stylesheet" type="text/css" />
        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
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


 <script type="text/javascript" src="AutoComplete/jquery.js"></script>
<script type='text/javascript' src='AutoComplete/jquery.autocomplete.js'></script>
<link rel="stylesheet" type="text/css" href="AutoComplete/jquery.autocomplete.css" />

<script type="text/javascript">
$().ready(function() {


	function formatItem(row) {
        	return row[0] ;
	}
	function formatResult(row) {
                finalVal=row[0].split('[REG:]')
                return finalVal[0].replace(/(<.+?>)/gi, '');
	}


	$("#ShowHorses").autocomplete('Auto_HorseNames.jsp', {
		width: 500,
		matchContains: true,
		formatItem: formatItem,
		formatResult: formatResult
	});

            $("#ShowHorses").result(function(event, data, formatted) {
            var hiddenSeq = $("#RegSeq");
            var RegNum = $("#RegNum");
            var value = data.toString().split('[REG:]');

            hiddenSeq.val(value[1]);
            RegNum.val(value[1]);

            });

      });



function Register_Event_horse(varEventSeq)
{

/*
       var myFrame = document.getElementById('IFRegister_Horse_Shows');
       var RegNum =  document.forms[0].RegSeq.value

        if(RegNum=='')
        {
            alert('Please select a horse to Register')
            return false
        }

        if(varEventSeq=='')
        {
            alert('Please select an event to Register')
            return false
        }

       myFrame.src = "frmRegister_Horse_Shows_Action.jsp?eventSeq="+varEventSeq+"&RegNum="+RegNum;
*/
}


function ListHorses()
{

            document.forms[0].method="post";
            document.forms[0].action="frmRegister_Horse_Shows.jsp?mode=1"
            document.forms[0].submit();
    /*
    var myFrame = document.getElementById('IFRegister_Horse_Shows');
    var RegNum =  document.forms[0].RegSeq.value
    myFrame.src = "frmRegister_Horse_Shows_HSearch.jsp";
    */

}





</script>

    </head>

    <%
        String strEventSeq=request.getParameter("EventSeq");

%>
    <body>
        <form>


  <table width="100%">
    <tr>
      <td width="79"><font class="label">Horse&nbsp;Name</font></td>
      <td nowrap colspan="7" >
        <input type="hidden" name="RegSeq" id="RegSeq">
        <input id="ShowHorses" type="text"  name="HorseName" size="100"
    style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
    height: 16px;
    padding-left: 18px;
    ">
      </td>
    </tr>
    <tr>
      <td width="79"><font class="label">Registration#</font></td>
      <td width="139">
        <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;" name="RegNum" id="RegNum" size="15"
    >
      </td>
      <td width="48"><font class="label">DOB </font></td>
      <td width="60"><font class="label">
        <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;"
    name="HDOB" size="10"   id="datepicker">
        </font></td>
      <td width="56">Owner </td>
      <td width="135">
        <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;" name="RegNum2" id="RegNum" size="25"
    >
      </td>
      <td width="79">Mchip#</td>
      <td width="711">
        <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;" name="RegNum3" id="RegNum" size="15"
    >
      </td>
    </tr>
  </table>
    <br>
    <table width="30%" align="right">
    <tr>
    <td >
    <input class="button" type="button" name="Search" value="Search" onClick="ListHorses()">
    </td>
    <td><input class="button" type="button" name="Search" value="Register" onClick="Register_Event_horse('<%=strEventSeq%>')"></td>
    <td>
    <input class="button" type="button" name="Search" value="List Events">
    </td>
    </tr>
    </table>
     <br>
     <table width="100%">
         <tr> <td>
                  <%@ include file="frmRegister_Horse_Shows_HSearch.jsp"%>
             </td>

         </tr>
     </table>

<%
            for(int i=0;i<10;i++)
            {
                out.println("Events Listed<br>");
            }
        %>

        </form>
    </body>
</html>