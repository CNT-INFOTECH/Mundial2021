function fnSearch_Yrly()
{
    document.forms[0].target="_self";
    document.forms[0].method="post";
    document.forms[0].action="frmYearlyPoints.jsp"
    document.forms[0].submit();
}

function fnReset_Yrly()
{
    
    document.forms[0].HdnReset.value='Y';
    document.forms[0].target="_self";
    document.forms[0].method="post";
    document.forms[0].action="frmYearlyPoints.jsp"
    document.forms[0].submit();
}

function fnSearch_Shows()
{
    document.forms[0].target="_self";
    document.forms[0].method="post";
    document.forms[0].action="frmShowPoints.jsp"
    document.forms[0].submit();
}

function fnReset_Shows()
{

    document.forms[0].HdnReset.value='Y';
    document.forms[0].target="_self";
    document.forms[0].method="post";
    document.forms[0].action="frmShowPoints.jsp"
    document.forms[0].submit();
}


function fnSearch_Equi()
{

    document.forms[0].target="_self";
    document.forms[0].method="post";
    document.forms[0].action="frmEquiPoints.jsp"
    document.forms[0].submit();
}

function fnReset_Equi()
{

    document.forms[0].HdnReset.value='Y';
    document.forms[0].target="_self";
    document.forms[0].method="post";
    document.forms[0].action="frmEquiPoints.jsp"
    document.forms[0].submit();
}




$(function() {
        $( "#txtFrom" ).datepicker({
		changeMonth: true,
        changeYear: true
        });
});
       
$(function() {
        $( "#txtTo" ).datepicker({
		changeMonth: true,
        changeYear: true
        });
});


function SelCategories()
{

	$('#dialog_Categories').dialog({ autoOpen: false,height: 600,width: 600, modal: true });
	$('#dialog_Categories').dialog('open');
        $("#modalIFrame_Categories").attr('src','frmAwardsList.jsp');
	return false;
}

function SelCategories_Equi()
{

	$('#dialog_Categories').dialog({ autoOpen: false,height: 600,width: 600, modal: true });
	$('#dialog_Categories').dialog('open');
        $("#modalIFrame_Categories").attr('src','frmAwardsList_Equi.jsp');
	return false;
}

function Accept_Multiple_Awards()
{

        var myIFrame = document.getElementById('modalIFrame_Categories');
        var values="";
       
               for (i=0; i< myIFrame.contentWindow.document.forms[0].ChkAwards.length; i++){
                if ( myIFrame.contentWindow.document.forms[0].ChkAwards[i].checked==true)
                    values+=myIFrame.contentWindow.document.forms[0].ChkAwards[i].value + ";"
                }
                
            document.forms[0].Category.value=values
            window.parent.jQuery('#dialog_Categories').dialog('close');


}

function Close_Multiple_Awards()
{
    window.parent.jQuery('#dialog_Categories').dialog('close');

}

function Points_Details(myname,w,h,scroll,Seq,varType)
{

    

     var winPop = null;

    LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
    TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
    Details ='height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable'
    winPop = window.open('frmPoints_Details.jsp?Seq='+Seq+'&Type='+varType,myname,Details)



}

function getPoints(IdName,Year,frmDate,ToDate,ShowSeq,AwardName)
{


    var xmlhttp;

if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }



  xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {

  
 var vrResult='<table  class="grid"  style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">'
 vrResult+=xmlhttp.responseText;
 vrResult+='</table>'
 
            document.getElementById(IdName).innerHTML=vrResult

    }
  }
xmlhttp.open("GET","frmAjax_GetPoints.jsp?AwardType="+IdName+"&Year="+Year+"&frmDate="+frmDate+"&ToDate="+ToDate+"&ShowSeq="+ShowSeq+"&AwName="+AwardName,false);

xmlhttp.send();

}

function getEquiPoints(IdName,Year,frmDate,ToDate,ShowSeq,AwardName)
{


IncludeFlag=document.forms[0].ShowPartAlso.value

    var xmlhttp;
	var dateT=datetimestamp();

if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }



  xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {

  
 var vrResult='<table  class="grid"  style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">'
 vrResult+=xmlhttp.responseText;
 vrResult+='</table>'
 
            document.getElementById(IdName).innerHTML=vrResult

    }
  }
xmlhttp.open("GET","frmAjax_GetPoints_Equi.jsp?"+dateT+"&AwardType="+IdName+"&Year="+Year+"&frmDate="+frmDate+"&ToDate="+ToDate+"&ShowSeq="+ShowSeq+"&AwName="+AwardName+"&IncludeFlg="+IncludeFlag,false);

xmlhttp.send();

}

function ShowPoints(Seq,varType,w,h,varShowSeq,varAwardName,varPerson_HrsName,varYear,varFrmDate,varToDate)
{
       // window.open('frmPoints_Details.jsp?Seq='+Seq+'&Type='+varType+'&ShowSeq='+varShowSeq,"Ratting","width=900,height=330,left=150,top=200,toolbar=0,status=0,")
          
		//  alert(varType)
        $('#dialog_Points').dialog({ autoOpen: false,height: 330,width: 900, modal: true,title:varAwardName+'--'+varPerson_HrsName});
        $('#dialog_Points').dialog('open');
		
        $("#modalIFrame_Points").attr('src','frmPoints_Details.jsp?Seq='+Seq+'&Type='+varType+'&ShowSeq='+varShowSeq+'&Year='+varYear+'&frmDate='+varFrmDate+'&ToDate='+varToDate);
         return false;
         
}

function Search_Shows(fieldName,DescElement)
{

    $('#dialog-Show').dialog({ autoOpen: false,height: 400,width: 800, modal: true,title:"Search Shows" });
    $('#dialog-Show').dialog('open');
    $("#modalIFrame_ShowList").attr('src','frmShows_Serach_Common.jsp?mode=0&selval='+fieldName+'&DescEl='+DescElement);

    return false;

}

function Points_Summary()
{

            document.forms[0].target="_blank";
            document.forms[0].method="post";
            document.forms[0].action="Participants";
            document.forms[0].submit();
}

function datetimestamp()
{
var today = new Date();
var sToday = (today.getMonth()+1).toString();
sToday += today.getDate().toString();
sToday += today.getYear().toString();
sToday += today.getHours().toString();
sToday += today.getMinutes().toString();
sToday += today.getSeconds().toString();
return sToday;
}



function CopyValue(chekBxValue,hdnObj)
{
	
if(chekBxValue.checked)
	hdnObj.value="1"
else
	hdnObj.value="0"
}