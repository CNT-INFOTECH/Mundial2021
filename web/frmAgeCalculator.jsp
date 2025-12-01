<html>
<head>
<!-- AGE CALCULATOR -->
<script language="JavaScript" type="text/javascript">

/*
function getAge_1() {
    
    var textb = parent.document.getElementById("datepicker_DOB");
    var month1=textb.value.split("/")[0]
    var date=textb.value.split("/")[1]
    var year=textb.value.split("/")[2]
    var month=Number(month1)-1;
    


var deathdate = parent.document.getElementById("Deathdate_datepicker");

if(deathdate.value == '' )
{    
 today = new Date();
 dateStr = today.getDate();
 monthStr = today.getMonth();
 yearStr = today.getFullYear();
}
else
{
 monthStr1 = deathdate.value.split("/")[0]
 dateStr  = deathdate.value.split("/")[1]
 yearStr = deathdate.value.split("/")[2]
 monthStr = Number(monthStr1)-1;
}

 theYear = yearStr - year;
 theMonth = monthStr - month;
 theDate = dateStr - date;

 var days = "";
 if (monthStr == 0 || monthStr == 2 || monthStr == 4 || monthStr == 6 || monthStr == 7 || monthStr == 9 || monthStr == 11) days = 31;
 if (monthStr == 3 || monthStr == 5 || monthStr == 8 || monthStr == 10) days = 30;
 if (monthStr == 1) days = 28;

 //document = theYear;
document.getElementById("inYears").innerHTML=theYear;

 if (month < monthStr && date > dateStr) { 
     document.getElementById("inYears").innerHTML = parseInt(document.getElementById("inYears").innerHTML) + 1;
   document.getElementById("inMonths").innerHTML = theMonth - 1; }
 if (month < monthStr && date <= dateStr) { document.getElementById("inMonths").innerHTML = theMonth; }
 else if (month == monthStr && (date < dateStr || date == dateStr)) { document.getElementById("inMonths").innerHTML = 0; }
 else if (month == monthStr && date > dateStr) { document.getElementById("inMonths").innerHTML = 11; }
 else if (month > monthStr && date <= dateStr) { document.getElementById("inYears").innerHTML = document.getElementById("inYears").innerHTML - 1;
                                                 document.getElementById("inMonths").innerHTML = ((12 - -(theMonth)) + 1); }
 else if (month > monthStr && date > dateStr) { document.getElementById("inMonths").innerHTML = ((12 - -(theMonth))); }

 if (date < dateStr) { document.getElementById("inDays").innerHTML = theDate; }
 else if (date == dateStr) { document.getElementById("inDays").innerHTML = 0; }
 else { document.getElementById("inYears").innerHTML = document.getElementById("inYears").innerHTML - 1; document.getElementById("inDays").innerHTML = days - (-(theDate)); }
 
 
 
  //document.form1.YearValue_AllScreen.value = document.form1.inYears.value;
 // document.form1.MonthValue_AllScreen.value = document.getElementById("inMonths").innerHTML;
 
  }
*/
function checkleapyear(datea)
{
	if(datea.getYear()%4 == 0)
	{
		if(datea.getYear()% 10 != 0)
		{
			return true;
		}
		else
		{
			if(datea.getYear()% 400 == 0)
				return true;
			else
				return false;
		}
	}
  return false;
}
function DaysInMonth(Y, M) {
    with (new Date(Y, M, 1, 12)) {
        setDate(0);
        return getDate();
    }
}
function datediff(date1, date2) {
    var y1 = date1.getFullYear(), m1 = date1.getMonth(), d1 = date1.getDate(),
	 y2 = date2.getFullYear(), m2 = date2.getMonth(), d2 = date2.getDate();
    if (d1 < d2) {
        m1--;
        d1 += DaysInMonth(y2, m2);
    }
    if (m1 < m2) {
        y1--;
        m1 += 12;
    }
    return [y1 - y2, m1 - m2, d1 - d2];
}
function ageCal()
{   
    var dString   = parent.document.getElementById("datepicker_DOB").value;      
    var deathdate = parent.document.getElementById("Deathdate_datepicker").value;//deathdate Or dategelded
    
    var calmon=dString.split("/")[0]
    var calday=dString.split("/")[1]
    var calyear=dString.split("/")[2]   
    
    var currentdate = new Date();
    
    if(deathdate=="" && dString!="")
    {
    var curday  = currentdate.getDate();
    var curmon  = currentdate.getMonth()+1;
    var curyear = currentdate.getFullYear();        
    }
    else if(deathdate!="" && dString!="")
    {
    var d2 = new Date(deathdate);
    var curday  = d2.getDate();
    var curmon  = d2.getMonth()+1;
    var curyear = d2.getFullYear();        
    }
    
    var curd = new Date(curyear,curmon-1,curday);
    var cald = new Date(calyear,calmon-1,calday);
    var diff =  Date.UTC(curyear,curmon,curday,0,0,0) - Date.UTC(calyear,calmon,calday,0,0,0);
    var dife = datediff(curd,cald);
    //document.birthday.age.value=dife[0]+" years, "+dife[1]+" months, and "+dife[2]+" days";
    
    document.getElementById("inYears").innerHTML  = dife[0];
    document.getElementById("inMonths").innerHTML = dife[1];
    document.getElementById("inDays").innerHTML   = dife[2];
}
</script>

</head>
<body onload="ageCal()">
<form name="formAgeCalculator">
<table align="center" width="380" border="0" cellpadding="0" cellspacing="0"> 
 <tr>
  <td align="">
   <table border="0" cellpadding="0" cellspacing="0" width="120">
    <tr>
        <td  width="100px" >            
            <label  id="inYears"   style="color: #000000;  font-size: 14px; padding-right:5px;"> </label>       
        </td>
        <td align="left" >
            <label  id="year"   style="color: #000000;  font-size: 14px; padding-right:5px;">YEARS</label>     
        </td>        
        <td >           
            <label  id="inMonths"   style="color: #000000;  font-size: 14px;padding-right:5px;"> </label>
        </td>
        <td align="left">
            <label  id="month"   style="color: #000000;  font-size: 14px; padding-right:5px;">MONTHS</label>     
        </td>
        <td >
            <label  id="inDays"   style="color: #000000;  font-size: 14px;padding-right:5px;"> </label>            
        </td>
        <td align="left">
            <label  id="day"   style="color: #000000;  font-size: 14px; padding-right:5px;">DAYS</label>     
        </td>
    </tr>
   </table>
  </td>
   
 </tr>
 
</table>
</form>

</body>
</html>

