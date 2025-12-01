function trimRegister (str) {
	str = str.replace(/^\s+/, '');
	for (var i = str.length - 1; i >= 0; i--) {
		if (/\S/.test(str.charAt(i))) {
			str = str.substring(0, i + 1);
			break;
		}
	}
	return str;
}

$().ready(function() {


	function formatItem(row) {
        	return row[0] ;
	}
	function formatResult(row) {
                finalVal=row[0].split('[REG:]')
                return finalVal[0].replace(/(<.+?>)/gi, '');
	}


	$("#YouthRider_Top").autocomplete('Auto_YouthRiders.jsp', {
		width: 350,
		matchContains: true,
		formatItem: formatItem,
		formatResult: formatResult
	});

            $("#YouthRider_Top").result(function(event, data, formatted) {
            var hiddenSeq = $("#YouthRider_Seq_Top");
            var RegNum = $("#Assigned_Top");
            var value = data.toString().split('[REG:]');

            hiddenSeq.val(trimRegister(value[1]));
            RegNum.val(trimRegister(value[1]));

            });

      });




function Register_Search_Icon_Rider_Event(varEventSeq,varSeq)
{

            document.forms[0].method="post";
            document.forms[0].action="frmRegister_Rider_Shows.jsp?mode=6&EntitySeq="+varSeq+"&EventSeq="+varEventSeq
            document.forms[0].submit();
}



function ListYouthRiders()
{
            document.forms[0].FlgViewAll.value='N'
            document.forms[0].method="post";
            document.forms[0].action="frmRegister_Rider_Shows.jsp?mode=1"
            document.forms[0].submit();

}



function AddNewYouthRider(varEventSeq)
{

            document.forms[0].method="post";
            document.forms[0].action="frmRegister_Rider_Shows.jsp?mode=2"
            document.forms[0].submit();

}

function GetHorseName_ByNum(RegNum,Seq,RegSeq,Label,evntSeq)
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

                var Items=xmlhttp.responseText.split('#@#')
                if(Items[0]=='')
                    alert("Registration number does not exist")

                document.getElementById(Seq).value=trimRegister(Items[0])
                document.getElementById(RegSeq).value=trimRegister(Items[1])
                document.getElementById(Label).innerHTML=trimRegister(Items[2])

        }


    }
  }

xmlhttp.open("GET","Ajax?PageID=GETHORSE_NAME&ChkValue="+CheckVal,true);
xmlhttp.send();
}

function ResetSearch(strEventSeqeunce)
{
    
    document.forms[0].YouthRider_Seq_Top.value='';
    document.forms[0].YouthRider_Top.value='';
    document.forms[0].Assigned_Top.value='';
    document.forms[0].YouthRider_DOB_Top.value='';
    document.forms[0].Gender_Top.value='';
   
   
            document.forms[0].method="post";
            document.forms[0].action="frmRegister_Rider_Shows.jsp??EventSeq="+strEventSeqeunce
            document.forms[0].submit();
 
}

function YouthRider_Reset(ObjEventSeq,ObjEventName)
{
varEventSeq=ObjEventSeq
varEventName=ObjEventName

document.forms[0].method="post";
document.forms[0].action="frmRegister_Rider_Shows.jsp?EventSeq="+varEventSeq+"&EventName="+varEventName
document.forms[0].submit();

}

function JQueryClose_YouthRiders()
{
    window.parent.jQuery('#dialog-Register').dialog('close');
}

function OverRide(varEventSeq,varEntitySeq)
{
    document.forms[0].method="post";
    document.forms[0].action="frmRegister_Rider_Shows.jsp?mode=2&EventSeq="+varEventSeq+"&EntitySeq="+varEntitySeq
    document.forms[0].submit();
}


