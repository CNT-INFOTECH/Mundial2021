/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
$.fx.speeds._default = 1000;
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

                 extraParams: {
                    ShowSeq: function() {return $('#ShowsSeq').val()}},
		width: 400,
		matchContains: true,
		formatItem: formatItem,
                noCache: true,
		formatResult: formatResult


	} );

         $("#Events").result(function(event, data, formatted) {
            var hiddenEventSeq = $("#EventSeq");
            var value = data.toString().split('#@#');
            hiddenEventSeq.val(value[1]);

            });



});



function trim_P (str) {
	str = str.replace(/^\s+/, '');
	for (var i = str.length - 1; i >= 0; i--) {
		if (/\S/.test(str.charAt(i))) {
			str = str.substring(0, i + 1);
			break;
		}
	}
	return str;
}



function fnSearch(objEvent)
{
    
    ShowSeq=document.forms[0].ShowsSeq.value;
    EventSeq=document.forms[0].EventSeq.value;
   

  if(EventSeq=="")
    {
         alert('Please Select an Event')
         return false
    }

   

    var myFrame = document.getElementById('iFrame_Shows_Placement_List');
    myFrame.src = "Shows_Placement_List.jsp?mode=0&ShowSeq="+ShowSeq+"&EventSeq="+EventSeq;
   
}


function getHorseAge(varDate) {


    FinalDate=varDate.split('/')
    Getmonth=FinalDate[0];
    Getdate=FinalDate[1];
    Getyear=FinalDate[2];

    getFinalYear=''
    getFinalMonth=''
    getFinalDate=''

    month = (Getmonth - 1);
    date = Getdate;
    year = Getyear;

 if (month != parseInt(month)) { alert('Type Month of birth in digits only!'); return false; }
 if (date != parseInt(date)) { alert('Type Date of birth in digits only!'); return false; }
 if (year != parseInt(year)) { alert('Type Year of birth in digits only!'); return false; }
 if (year.length < 4) { alert('Type Year of birth in full!'); return false; }

 today = new Date();
 dateStr = today.getDate();
 monthStr = today.getMonth();
 yearStr = today.getFullYear();

 theYear = yearStr - year;
 theMonth = monthStr - month;
 theDate = dateStr - date;

 var days = "";
 if (monthStr == 0 || monthStr == 2 || monthStr == 4 || monthStr == 6 || monthStr == 7 || monthStr == 9 || monthStr == 11) days = 31;
 if (monthStr == 3 || monthStr == 5 || monthStr == 8 || monthStr == 10) days = 30;
 if (monthStr == 1) days = 28;

 getFinalYear = theYear;

 if (month < monthStr && date > dateStr) { getFinalYear = parseInt(getFinalYear) + 1;
                                           getFinalMonth = theMonth - 1; }
 if (month < monthStr && date <= dateStr) { getFinalMonth = theMonth; }
 else if (month == monthStr && (date < dateStr || date == dateStr)) { getFinalMonth = 0; }
 else if (month == monthStr && date > dateStr) { getFinalMonth = 11; }
 else if (month > monthStr && date <= dateStr) { getFinalYear = getFinalYear - 1;
                                                 getFinalMonth = ((12 - -(theMonth)) + 1); }
 else if (month > monthStr && date > dateStr) { getFinalMonth = ((12 - -(theMonth))); }

 if (date < dateStr) { getFinalDate = theDate; }
 else if (date == dateStr) { getFinalDate = 0; }
 else { getFinalYear = getFinalYear - 1; getFinalDate = days - (-(theDate)); }


 alert(getFinalYear +' Years '+ getFinalMonth + ' Months '+getFinalDate+ ' Days')
  }

function JudgeF1F2(varEventSeq,varEventName,varShowSeq)
{
    $( "#dialog" ).dialog({autoOpen: false,height: 620, width: 800,hide: "explode"});
     $( "#dialog" ).dialog( "open" );
      $("#F1F2").attr('src','frmF1_F2.jsp?EventSeq='+varEventSeq+'&EvnName='+varEventName+'&ShowSeq='+varShowSeq);

     return false;
}


function getEventName(ShowSeqValObj,ShowNameValObj,EventOrdValObj,EventSeqID,EventValID)
{

ShowSeqVal=ShowSeqValObj.value
EventOrdVal=EventOrdValObj.value




if(trim_P(EventOrdVal)=='')
 {
    return false;
 }

 
 if(trim_P(ShowSeqVal)=='')
 {
     alert('Please select the Show')
     EventOrdValObj.value='';
     ShowNameValObj.focus();
     return false;
 }

 

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

              var Items=xmlhttp.responseText.split('#@#');


              EventSeqID.value=trim_P(Items[0])

              EventValID.value=trim_P(Items[1])

    }
  }
xmlhttp.open("GET","frmAjax_GetEventName.jsp?ShowSeq="+ShowSeqVal+"&EventOrder="+EventOrdVal,true);

xmlhttp.send();

}


function startstop(varType,objTxt,varEventSeq)
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
              
              document.getElementById(objTxt).innerHTML=xmlhttp.responseText
             
    }
  }
xmlhttp.open("GET","frmAjaxGetCurrentTime.jsp?Type="+varType+"&EventSeq="+varEventSeq,true);
xmlhttp.send();

}


function PrintParticipant_List()
{

        ShowSeq=document.forms[0].ShowsSeq.value;
        EventSeq=document.forms[0].EventSeq.value;


        if(EventSeq=="")
        {
            alert('Please Select an Event')
            return false
        }

            document.forms[0].target="_Blank";
            document.forms[0].method="post";
            document.forms[0].action="Participants";
            document.forms[0].submit();
}

function Edit_Participants(EventSeq,RegSeq,Reg_Num,Rider,Type,GroupSeq)
{

        window.parent.jQuery('#Participant_Details').dialog({ autoOpen: false,height: 550,width: 800, modal: true });
        window.parent.jQuery('#Participant_Details').dialog('open');
        window.parent.jQuery('#IFrame_Participant_Details').attr('src','Shows_Placement_Edit_Participants.jsp?EventSeq='+EventSeq+'&RegSeq='+RegSeq+'&RegNum='+Reg_Num+'&Rider='+Rider+'&Type='+Type+'&GroupSeq='+GroupSeq);
}



function Delete_Participants(GroupSeq)
{

    
    var CheckVal=GroupSeq
    var bOK=false

    if(CheckVal=='')
        return false;
    
     bOK= confirm('Are you sure want to delete')



if(bOK)
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
        if(xmlhttp.responseText.length >0)
        {
                ShowSeq=parent.document.forms[0].ShowsSeq.value;
                EventSeq=parent.document.forms[0].EventSeq.value;
                var myFrame =parent.document.getElementById('iFrame_Shows_Placement_List');
                myFrame.src = "Shows_Placement_List.jsp?mode=0&ShowSeq="+ShowSeq+"&EventSeq="+EventSeq;

                alert(xmlhttp.responseText)
               
        }


    }
  }
xmlhttp.open("GET","Ajax?PageID=EVENT_PARTICIPANT_DELETE&ChkValue="+CheckVal,true);
xmlhttp.send();
}
}

function fnReset_Place()
{
            document.forms[0].target="_self";
            document.forms[0].method="post";
            document.forms[0].action="Shows_Placement.jsp";
            document.forms[0].submit();
}

function updPublish(pubVal,shwSeq,EventSeq)
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
      if(xmlhttp.responseText == 0)
           return false;
      else
      {
        alert(xmlhttp.responseText);
      }
    }
    }
    xmlhttp.open("GET","Ajax?PageID=EVENT_PUBLISH&ShwSq="+shwSeq+"&EvntSq="+EventSeq+"&Pub="+pubVal,true);
    xmlhttp.send();
}

function Open_Notes(RegSeq,GroupSeq)
{

        window.parent.jQuery('#dialog-Notes').dialog({ autoOpen: false,height: 200,width: 500, modal: true });
        window.parent.jQuery('#dialog-Notes').dialog('open');
        window.parent.jQuery('#modalIFrame_Notes').attr('src','Shows_Placement_Notes.jsp?RegSeq='+RegSeq+'&GroupSeq='+GroupSeq);
}