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
            <script type="text/javascript" src="ui/jquery.ui.accordion.js"></script>
         <script type="text/javascript" src="ui/jquery.ui.datepicker.js"></script>

         <script type="text/javascript" src="js/jquery.js"></script>
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
        /*$('#dock').Fisheye(
				{
					maxWidth: 50,
					items: 'a',
					itemsText: 'span',
					container: '.dock-container',
					itemWidth: 40,
					proximity: 90,
					halign : 'center'
				}
			);*/

});

$(function() {
		$( "#accordion" ).accordion({
			collapsible: true,
                         autoHeight: false
		});
	});

</script>


</head>
<%
String strFrom="";
String strTo="";
String strYear="";
String strCategory="";
String strShowSeq="";
String strShowName="";
String strIncludePartiAlso="0";


String strReset="N";
strReset=request.getParameter("HdnReset");


if(request.getParameter("HdnReset")!=null && strReset.equals("N"))
{
    if(request.getParameter("Category")!=null)
        strCategory=request.getParameter("Category");
     if(request.getParameter("ShowSeq")!=null)
        strShowSeq=request.getParameter("ShowSeq");
    if(request.getParameter("Shows")!=null)
        strShowName=request.getParameter("Shows");
    
    if(request.getParameter("year")!=null)
        strYear=request.getParameter("year");
    if(request.getParameter("txtFrom")!=null)
        strFrom=request.getParameter("txtFrom");
    if(request.getParameter("txtTo")!=null)
        strTo=request.getParameter("txtTo");
	if(request.getParameter("ShowPartAlso")!=null)
        strIncludePartiAlso=request.getParameter("ShowPartAlso");

    
}
 String[] _strCategory=strCategory.split(";");
%>
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

      <div id="MenuHeader">
      <ul id="primary">
		<li><a href="frmYearlyPoints.jsp">YEARLY</a></li>
		<li><a href="frmShowPoints.jsp">SHOWS</a></li>
		<li><span>EQUITATION</span></li>

	</ul>
      </div>

 <fieldset>

<table width="655" >
  <tr>
    <td width="88"><font class="label" >YEAR</font></td>
    <td width="108">
      <input class="allcaps" size="16px" id='year' name="year" value="<%=strYear%>"/>
    </td>
    <td width="46"><font class="label" >DATE</font></td>
    <td width="46"><font class="label"><font class="dateStyleBody" align="center">&nbsp;FROM</font>
      <input type="text" name="txtFrom" size="10" id="txtFrom"
             placeholder="MM/DD/YYYY"  style="background-color:  #FFF8DC; border:  1px solid #000000;" value="<%=strFrom%>"/>
      </font></td>
    <td width="74"><font class="dateStyleBody" align="center">TO</font>
      <input type="text" name="txtTo" size="10" id="txtTo"
                  placeholder="MM/DD/YYYY"  style="background-color:  #FFF8DC; border:  1px solid #000000;" value="<%=strTo%>" />
      </td>
    <td colspan="5"><font class="label"></font></td>
  </tr>
  <tr>
    <td width="88"><font class="label">SHOWS</font></td>
    <td colspan="4">
      <input type="hidden" id="ShowSeq" name="ShowSeq"  value="<%=strShowSeq%>" />
      <input size="16px" id='Shows' name="Shows"  value="<%=strShowName%>" style=" background:
                     #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
            height: 16px;
            padding-left: 18px;
            width: 280px !important;" onBlur="EmptyKey(ShowSeq,Shows)"/>
      <img alt="" src="Images/Find.gif" onClick="Search_Shows('ShowSeq','Shows')"/>
    </td>
	<td width="88" colspan="2"><font class="label">Include Participants</font></td><td colspan="2">
	<input type="checkbox" id="ChkShowPartAlso" name="ChkShowPartAlso" onClick="CopyValue(ChkShowPartAlso,ShowPartAlso)"
	 <% if (strIncludePartiAlso.equals("1")) {%> checked <%}%> />
	 <input type="hidden" id="ShowPartAlso" name="ShowPartAlso" value=<%=strIncludePartiAlso%> ></td>
  </tr>
  <tr>
    <td width="88"><font class="label">CATEGORY</font> </td>
    <td colspan="5" >
      <input type="text" name="Category"  value="<%=strCategory%>" size="72" style="background-color:  #FFF8DC; border:  1px solid #000000;"/>
    </td>
    <td colspan="2" nowrap><img alt="" src="Images/Find.gif" onClick="SelCategories_Equi()"/></td>
  </tr>
  <tr>
    <td width="88">&nbsp;</td>
    <td colspan="5">&nbsp;</td>
    <td width="63" > <font class="label">
      <input class='button' type="button" name="Search" value="Search" onClick="fnSearch_Equi()"/>
      </font> </td>
    <td width="56" ><font class="label">
      <input class='button' type="Reset" name="Reset" value="Reset" onClick="fnReset_Equi()"/>
      <input size=1 type="hidden" name="HdnReset" value="N"/>
      </font></td>
    <td width="60">
      <input class='button' type="button" name="Report" value="Report" onClick="Points_Summary()"/>
      <input size=1 type="hidden" name="PageID" value="POINTS_EQUI"/>
    </td>
  </tr>
</table>



  </fieldset>


<%

   HashMap HmDetails=new HashMap();
	HmDetails.put("Amazonas 4-5 Años","501");
	HmDetails.put("Jinetes 4-5 Años","502");

	HmDetails.put("Amazonas 6-8 Años","503");
	HmDetails.put("Jinetes 6-8 Años","504");

	HmDetails.put("Amazonas 9-11 Años","505");
	HmDetails.put("Jinetes 9-11 Años","506");

	HmDetails.put("Amazonas 12-14 Años","507");
	HmDetails.put("Jinetes 12-14 Años","508");

	HmDetails.put("Amazonas 15-17 Años","509");
	HmDetails.put("Jinetes 15-17 Años","510");

	HmDetails.put("Amazonas 18-20 Años","511");
	HmDetails.put("Jinetes 18-20 Años","512");

	HmDetails.put("Amazonas 21-24 Años","513");
	HmDetails.put("Jinetes 21-24 Años","514");




     ArrayList AlList = new ArrayList();

     if (request.getParameter("Category")!=null && strCategory.length() >0)
      {
             for(int i=0; i<_strCategory.length;i++)
             {
                 AlList.add(_strCategory[i]);
             }
      }
    else
        {
    AlList.add("Amazonas 4-5 Años");
    AlList.add("Jinetes 4-5 Años");

    AlList.add("Amazonas 6-8 Años");
    AlList.add("Jinetes 6-8 Años");

    AlList.add("Amazonas 9-11 Años");
    AlList.add("Jinetes 9-11 Años");

    AlList.add("Amazonas 12-14 Años");
    AlList.add("Jinetes 12-14 Años");

    AlList.add("Amazonas 15-17 Años");
    AlList.add("Jinetes 15-17 Años");

    AlList.add("Amazonas 18-20 Años");
    AlList.add("Jinetes 18-20 Años");

    AlList.add("Amazonas 21-24 Años");
    AlList.add("Jinetes 21-24 Años");
    }

%>
     <div id="accordion" >
  <%

  for (int i=0; i< AlList.size(); i++)
     {

      int intAwardNum=Integer.parseInt(""+HmDetails.get(""+AlList.get(i)));
      intAwardNum =(intAwardNum-500); %>

     <h3 ><a href="#"  onClick="getEquiPoints('<%=HmDetails.get(""+AlList.get(i))%>',year.value,txtFrom.value,txtTo.value,ShowSeq.value,'<%=AlList.get(i)%>') " ><b><%=intAwardNum%></b>  &nbsp;<%=AlList.get(i)%></a></h3>

<div style="background:url('Images/trans-wood-1.png')" >

    <div id="<%=HmDetails.get(""+AlList.get(i))%>" >

    </div>
</div>



 <%}%>

 </div> <!-- accordion End -->


				</div> <!-- Content End -->


<div id="sidebar">
<%@ include file="Shows_ListHorses_Side.jsp"%>

</div>



</div>

<div id="dialog_Categories" title="Awards" style="display:none; background:url('Images/trans-wood-1.png')">
<iframe  id="modalIFrame_Categories" width="100%" height="520"
          marginwidth="0" marginheight="0" frameborder="0" >
</iframe>


<input class='button' type="button" name="Search" value="Accept" onClick="Accept_Multiple_Awards()"/>
<input class='button' type="button" name="PopClose" value="Close" onClick="Close_Multiple_Awards()"/>

</div>

<div id="dialog-Show" style="display:none; background:url('Images/trans-wood-1.png')">
<iframe  src="blank.jsp"  id="modalIFrame_ShowList" width="100%" height="100%" marginwidth="0" marginheight="0"
         frameborder="0"  >
</iframe>
</div>

 <div id="dialog_Points" title="Awards"    style="display:none; background:url('Images/trans-wood-1.png');">
<iframe   src="blank.jsp" id="modalIFrame_Points" width="100%"  height="100%"
          marginwidth="0" marginheight="0" frameborder="0" >
</iframe>
</div>


</form>



</body>
</html>