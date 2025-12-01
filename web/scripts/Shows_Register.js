/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function trim_R (str) {
	str = str.replace(/^\s+/, '');
	for (var i = str.length - 1; i >= 0; i--) {
		if (/\S/.test(str.charAt(i))) {
			str = str.substring(0, i + 1);
			break;
		}
	}
	return str;
}

function fnSearch(insAccess,vwAccess)
{
    
    bViewAll=document.forms[0].FlgViewAll.value

    document.forms[0].FlgViewAll.value='N'
    ShowSeq=document.forms[0].ShowSeq.value;
    ShowName=document.forms[0].Shows.value;
    EventSeq=document.forms[0].EventSeq.value;
    ShowDate=document.forms[0].ShowDate.value;
    Category=document.forms[0].Category.value;
    Gender=document.forms[0].Gender.value;
    Agefrom=document.forms[0].Agefrom.value;
    AgeTo=document.forms[0].AgeTo.value;
    Rider=document.forms[0].Rider.value;


    if(trim_R(ShowSeq)=='')
    {
           alert('Please select a show')
           return false;
    }

    var myFrame = document.getElementById('iFrame_Shows_Register_List');
    myFrame.src = "Shows_Register_List.jsp?mode=0&ShowSeq="+ShowSeq+"&Shows="+ShowName+"&EventSeq="+EventSeq+"&ShowDate="+ShowDate+"&Category="+Category+"&Gender="+Gender+"&Agefrom="+Agefrom+"&AgeTo="+AgeTo+"&Rider="+Rider+"&ViewAll="+bViewAll+"&ins="+insAccess+"&vw="+vwAccess;
}


function fnReset()
{
            document.forms[0].target="_self";
            document.forms[0].method="post";
            document.forms[0].action="Shows_Register.jsp"
            document.forms[0].submit();
}

function EmptyKey(objKey,objValue)
{
    if(objValue.value=='')
        objKey.value=''

}

$(function() {
        $( "#datepicker" ).datepicker();
});




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

                 extraParams: {
                    ShowSeq: function() {return $('#ShowSeq').val()}},
		width: 400,
		matchContains: true,
		formatItem: formatItem,
                noCache: true,
		formatResult: formatResult


	} );

        $("#Events").result(function(event, data, formatted) {
            var hiddenShowSeq = $("#EventSeq");
            var value = data.toString().split('#@#');
            hiddenShowSeq.val(value[1]);

            });

});

  function Register_Pop()
  {
     var ShowSeq=document.forms[0].ShowSeq.value
     var EventSeq=document.forms[0].EventSeq.value
     var EventName=document.forms[0].Events.value

    


    if(trim_R(document.forms[0].ShowSeq.value)=='')
    {
           alert('Please select a show')
           return false;
    }


        if(EventSeq!='')
        {
            $('#dialog-Register').dialog({ autoOpen: false,height: 650,width: 850, modal: true });
            $('#dialog-Register').dialog('open');
            $("#IFRegister").attr('src','frmRegister_Events_Information.jsp?EventSeq='+EventSeq+'&EventName='+EventName+'&ShowSeq='+ShowSeq);
            return false;
        }
        else{
            
            $('#dialog-Register').dialog({ autoOpen: false,height: 650,width: 850, modal: true });
            $('#dialog-Register').dialog('open');
            $("#IFRegister").attr('src','frmShow_List_EventTypes.jsp?EventSeq='+EventSeq+'&ShowSeq='+ShowSeq);
             return false;
        }




  }

  function Continue_Register()
  {
         var myIFrame = document.getElementById('IFRegister')
         var content = myIFrame.contentWindow.document.forms[0].group1.length

            for (i = 0; i <content; i++) {
                if (myIFrame.contentWindow.document.forms[0].group1[i].checked) {
                   chosen = myIFrame.contentWindow.document.forms[0].group1[i].value
                   myIFrame.src="frmRegister_Horse_Shows.jsp";

                }
            }

  }


function fnPayments()
{
            document.forms[0].target="_blank";
            document.forms[0].method="post";
            document.forms[0].action="Payments";
            document.forms[0].submit();
}
function getEventName(ShowSeqValObj,ShowNameValObj,EventOrdValObj,EventSeqID,EventValID)
{

ShowSeqVal=ShowSeqValObj.value
EventOrdVal=EventOrdValObj.value

if(trim_R(EventOrdVal)=='')
 {
    return false;
 }

 
 if(trim_R(ShowSeqVal)=='')
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
          
              
              EventSeqID.value=trim_R(Items[0])
             
              EventValID.value=trim_R(Items[1])

    }
  }
xmlhttp.open("GET","frmAjax_GetEventName.jsp?ShowSeq="+ShowSeqVal+"&EventOrder="+EventOrdVal,true);

xmlhttp.send();

}
function Events_Summary()
{
   
            document.forms[0].target="_Blank";
            document.forms[0].method="post";
            document.forms[0].action="Participants";
            document.forms[0].submit();

  }

  function Events_Summary_Placement(ObjName,ObjValue)
{

            document.forms[0].EventSeq.value=ObjName
//return false
             var randomnumber = (Math.floor(Math.random()*123456)) + 123456;
            document.forms[0].target="_Blank";
            document.forms[0].method="post";
            document.forms[0].action="Participants?tid="+randomnumber;
            document.forms[0].submit();

  }
