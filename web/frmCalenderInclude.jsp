 <%--
 Project							:	Billing
 Purpose							:	To Pop Up a calender
 Version Information			:   1.1

 Author							Date				Changes
 CNTIT Team					03/04/2005		Created

 Copyright notice				:	CNT INFOTECH
	-------------------------------------------------------------------------------------------------------
--%>

<head>
	<meta http-equiv="content-type" content="text/html;charset=iso-8859-1">
	<title>Calendar</title>
<script language="JavaScript">
var dDate = new Date();
var dCurMonth = dDate.getMonth();
var dCurDayOfMonth = dDate.getDate();
var dCurYear = dDate.getFullYear();
var objPrevElement = new Object();

function fToggleColor(myElement) 
{
	var toggleColor = "#ff0000";
	if (myElement.id == "calDateText") 
	{
		if (myElement.color == toggleColor) 
		{
			myElement.color = "";
		} 
		else 
		{
			myElement.color = toggleColor;
   		}
	} 
	else if (myElement.id == "calCell") 
	{
		for (var i in myElement.children) 
		{
			if (myElement.children[i].id == "calDateText") 
			{
				if (myElement.children[i].color == toggleColor) 
				{
					myElement.children[i].color = "";
				} 
				else 
				{
					myElement.children[i].color = toggleColor;
            			}
         		}
      		}
   	}
}

function fSetSelectedDay(myElement)
{
	var selMonth = document.frmWeeklySchedule.tbSelMonth.options[document.frmWeeklySchedule.tbSelMonth.selectedIndex].value	
	var selYear = document.frmWeeklySchedule.tbSelYear.options[document.frmWeeklySchedule.tbSelYear.selectedIndex].value
	
	if (myElement.id == "calCell") 
	{
		if (!isNaN(parseInt(myElement.children["calDateText"].innerText))) 
		{
			myElement.bgColor = "#c0c0c0";
			objPrevElement.bgColor = "";
			document.all.calSelectedDate.value = parseInt(myElement.children["calDateText"].innerText);
			var selDate = parseInt(myElement.children["calDateText"].innerText);
			if(selDate >= 1 && selDate <= 9)
			{
				selDate = "0"+selDate;
			}
			
      	}
		objPrevElement = myElement;
   	}
	
	var	dt=selMonth+"/"+selDate+"/"+selYear;
	Location=document.forms[0].LocSeq.value;
	Resource=document.forms[0].Resource.value;
	document.forms[0].hdnDateFromCalen.value=dt;
	document.forms[0].target="iFrameView";
	document.forms[0].method="post";
	document.forms[0].action="frmSch_ScheduleView.jsp?Date="+dt+"&Rs="+Resource+"&LS="+Location;
	document.forms[0].submit();
	
}

function fGetDaysInMonth(iMonth, iYear) 
{
	var dPrevDate = new Date(iYear, iMonth, 0);
	//alert(dPrevDate.getDate());
	return dPrevDate.getDate();
}

function fBuildCal(iYear, iMonth, iDayStyle) 
{
	var aMonth = new Array();
	aMonth[0] = new Array(7);
	aMonth[1] = new Array(7);
	aMonth[2] = new Array(7);
	aMonth[3] = new Array(7);
	aMonth[4] = new Array(7);
	aMonth[5] = new Array(7);
	aMonth[6] = new Array(7);

	var dCalDate = new Date(iYear, iMonth-1, 1);
	var iDayOfFirst = dCalDate.getDay();
	var iDaysInMonth = fGetDaysInMonth(iMonth, iYear);

	var iVarDate = 01;
	var i, d, w;
	if (iDayStyle == 2) 
	{
		aMonth[0][0] = "Sunday";
		aMonth[0][1] = "Monday";
		aMonth[0][2] = "Tuesday";
		aMonth[0][3] = "Wednesday";
		aMonth[0][4] = "Thursday";
		aMonth[0][5] = "Friday";
		aMonth[0][6] = "Saturday";
	} 
	else if (iDayStyle == 1) 
	{
		aMonth[0][0] = "Sun";
		aMonth[0][1] = "Mon";
		aMonth[0][2] = "Tue";
		aMonth[0][3] = "Wed";
		aMonth[0][4] = "Thu";
		aMonth[0][5] = "Fri";
		aMonth[0][6] = "Sat";
	} 
	else 
	{
		aMonth[0][0] = "Su";
		aMonth[0][1] = "Mo";
		aMonth[0][2] = "Tu";
		aMonth[0][3] = "We";
		aMonth[0][4] = "Th";
		aMonth[0][5] = "Fr";
		aMonth[0][6] = "Sa";
	}
	for (d = iDayOfFirst; d < 7; d++) 
	{
		aMonth[1][d] = iVarDate;
		iVarDate++;
		//alert(iVarDate);
	}
	for (w = 2; w < 7; w++) 
	{
		for (d = 0; d < 7; d++) 
		{
			if (iVarDate <= iDaysInMonth) 
			{
				aMonth[w][d] = iVarDate;
				iVarDate++;
      		}
   		}
	}
	//alert(aMonth);
	return aMonth;
}

function fDrawCal(iYear, iMonth, iCellWidth, iCellHeight, sDateTextSize, sDateTextWeight, iDayStyle) 
{
	var myMonth;
	myMonth = fBuildCal(iYear, iMonth, iDayStyle);
	
	document.write("<table width=190 class='tableWTBorder' bordercolor='#FFFFFF'>")
	document.write("<tr>");
	document.write("<td align='center' style='FONT-FAMILY:Arial;FONT-SIZE:12px;FONT-WEIGHT: bold'>" + myMonth[0][0] + "</td>");
	document.write("<td align='center' style='FONT-FAMILY:Arial;FONT-SIZE:12px;FONT-WEIGHT: bold'>" + myMonth[0][1] + "</td>");
	document.write("<td align='center' style='FONT-FAMILY:Arial;FONT-SIZE:12px;FONT-WEIGHT: bold'>" + myMonth[0][2] + "</td>");
	document.write("<td align='center' style='FONT-FAMILY:Arial;FONT-SIZE:12px;FONT-WEIGHT: bold'>" + myMonth[0][3] + "</td>");
	document.write("<td align='center' style='FONT-FAMILY:Arial;FONT-SIZE:12px;FONT-WEIGHT: bold'>" + myMonth[0][4] + "</td>");
	document.write("<td align='center' style='FONT-FAMILY:Arial;FONT-SIZE:12px;FONT-WEIGHT: bold'>" + myMonth[0][5] + "</td>");
	document.write("<td align='center' style='FONT-FAMILY:Arial;FONT-SIZE:12px;FONT-WEIGHT: bold'>" + myMonth[0][6] + "</td>");
	document.write("</tr>");
	for (w = 1; w < 7; w++) 
	{
		document.write("<tr>")
		for (d = 0; d < 7; d++) 
		{
			document.write("<td align='left' valign='top' width='" + iCellWidth + "' height='" + iCellHeight + "' id=calCell style='CURSOR:Hand' onMouseOver='fToggleColor(this)' onMouseOut='fToggleColor(this)' onclick=fSetSelectedDay(this)>");
			if (!isNaN(myMonth[w][d])) 
			{
				document.write("<font id=calDateText onMouseOver='fToggleColor(this)' style='CURSOR:Hand;FONT-FAMILY:Arial;FONT-SIZE:" + sDateTextSize + ";FONT-WEIGHT:" + sDateTextWeight + "' onMouseOut='fToggleColor(this)' onclick=fSetSelectedDay(this)>" + myMonth[w][d] + "</font>");
			} 
			else 
			{
				document.write("<font id=calDateText onMouseOver='fToggleColor(this)' style='CURSOR:Hand;FONT-FAMILY:Arial;FONT-SIZE:" + sDateTextSize + ";FONT-WEIGHT:" + sDateTextWeight + "' onMouseOut='fToggleColor(this)' onclick=fSetSelectedDay(this)></font>");
			}
			document.write("</td>")
		}
		document.write("</tr>");
	}
	document.write("</table>")
}

function fUpdateCal(iYear, iMonth) 
{
	myMonth = fBuildCal(iYear, iMonth);
	objPrevElement.bgColor = "";
	document.all.calSelectedDate.value = "";
	for (w = 1; w < 7; w++) 
	{
		for (d = 0; d < 7; d++) 
		{
			if (!isNaN(myMonth[w][d])) 
			{
				calDateText[((7*w)+d)-7].innerText = myMonth[w][d];
			} 
			else 
			{
				calDateText[((7*w)+d)-7].innerText = " ";
         	}
      	}
   	}
}

// -->

</script>
</head>

<body >
<!-- TWO STEPS TO INSTALL DYNAMIC CALENDAR:

  	1.  Copy the coding into the HEAD of your HTML document
  	2.  Add the last code into the BODY of your HTML document  -->
<!-- STEP ONE: Paste this code into the HEAD of your HTML document  -->
<!-- STEP TWO: Copy this code into the BODY of your HTML document  -->


<% if(strFromPage.equals("ApptReserv"))
	{

String strKeyValue=(String)session.getAttribute("NavUrl");


StringTokenizer st = new StringTokenizer(strKeyValue, "&"); 
String strToken1=st.nextToken();
 int intMonth=0;
 int intSelectedYear=0;
 if(strToken1.trim().equals("Date="))
	{
		Calendar cal = Calendar.getInstance();
        intMonth = cal.get(Calendar.MONTH)+1;
        intSelectedYear = cal.get(Calendar.YEAR);

	}
  else
	  { //}
	int intStartString=strKeyValue.indexOf("Date=");
	String strSelectedMonth=strKeyValue.substring(intStartString+5,intStartString+7);
	String strSelectedYear=strKeyValue.substring(intStartString+11,intStartString+15);
	intMonth = Integer.valueOf(strSelectedMonth).intValue();
	intSelectedYear=Integer.valueOf(strSelectedYear).intValue();
	}
%>
<script language="JavaScript" for="window" event="onload">
	frmWeeklySchedule.tbSelMonth.options[ <%= intMonth-1 %>].selected = true;
	for (i = 0; i < frmWeeklySchedule.tbSelYear.length; i++)
	if (frmWeeklySchedule.tbSelYear.options[i].value == <%= intSelectedYear %>)
	frmWeeklySchedule.tbSelYear.options[i].selected = true;
// -->}
</script>
<% }
else {
	%>
	<script language="JavaScript" for="window" event="onload"><!--
	var dCurDate = new Date();
	frmWeeklySchedule.tbSelMonth.options[dCurDate.getMonth()].selected = true;
	for (i = 0; i < frmWeeklySchedule.tbSelYear.length; i++)
	if (frmWeeklySchedule.tbSelYear.options[i].value == dCurDate.getFullYear())
	frmWeeklySchedule.tbSelYear.options[i].selected = true;
// -->
</script>
<%
}
	String Val = request.getParameter("val");
	//out.println(Val);
%>		
	<input type="hidden" name="calVal" value="<%=Val%>">
	<input type="hidden" name="calSelectedDate" value="">
	<table width=190 cellspacing=1 cellpadding=0  bordercolor="#D1EFFF" class="tableWTBorder">
		<tr>
			<td>
				<select name="tbSelMonth" size="1" onchange="fUpdateCal(frmWeeklySchedule.tbSelYear.value, frmWeeklySchedule.tbSelMonth.value)">
					<option value="01">January
					<option value="02">February
					<option value="03">March
					<option value="04">April
					<option value="05">May
					<option value="06">June
					<option value="07">July
					<option value="08">August
					<option value="09">September
					<option value="10">October
					<option value="11">November
					<option value="12">December
				</select> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select name="tbSelYear" size="1" onchange="fUpdateCal(frmWeeklySchedule.tbSelYear.value, frmWeeklySchedule.tbSelMonth.value)">
<%   				
   				for(int Ti_lnk=1931; Ti_lnk<2051; Ti_lnk++)
   				{
%>   									
					<option value="<%=Ti_lnk%>"><%=Ti_lnk%>
<%				
				}
%>				
				</select></td>
		</tr>
		<tr>
			<td>
				<script language="JavaScript">
				<!--
					var dCurDate = new Date();
					//alert(dCurDate);
					fDrawCal(dCurDate.getFullYear(), dCurDate.getMonth()+1, 15, 15, "10px", "bold", 1);
				// -->
				</script>
			</td>
		</tr>
	</table>
</body>