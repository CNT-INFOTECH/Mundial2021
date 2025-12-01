


function fnSubmit(deleteFlag)
{



        var vDelete=true;
        var  vConfirm=true;
        if(deleteFlag=='I')
        {
           vDelete=confirm('Are you sure want to delete the show?')
        }

/*
       if(document.forms[0].Template.value!='0')
       {
           if(document.forms[0].showSeq.value!='0')
               {
                 vConfirm=confirm('You have selected the template to create events, This will delete any existing events for this show')
               }
       }
*/
        if (vDelete==true)
        {
             document.forms[0].hdnDeleteYN.value=deleteFlag
            document.forms[0].method="post";
            document.forms[0].action="servlet/Shows"
            document.forms[0].submit();
        }

}

function fnReset()
{

                 document.forms[0].method="post";
		  document.forms[0].action="Shows_Reset.jsp"
		  document.forms[0].submit();
}

function AddEvent(varShowSeq,varEventSeq,mode)

{
  
	$('#dialog-modal').dialog({ autoOpen: false,height: 330,width: 900, modal: true });
	$('#dialog-modal').dialog('open');
        $("#modalIFrame").attr('src','frmAddEvent.jsp?ShowSeq='+varShowSeq+'&EventSeq='+varEventSeq+'&mode='+mode);

	//$('#dialog-modal').parent().appendTo($("form:first"));
	//
	return false;
}

function AddJudges(varShowSeq,NumJudges)
{

	$('#dialog_Judges').dialog({ autoOpen: false,height: 600,width: 800, modal: true });
	$('#dialog_Judges').dialog('open');
        $("#modalIFrame_Judges").attr('src','frmAddJudges_Show.jsp?ShowSeq='+varShowSeq+'&Judges='+NumJudges);
	return false;
}

function OpenShowSearch()
{

    $('#dialog-Show').dialog({ autoOpen: false,height: 400,width: 800, modal: true });
    $('#dialog-Show').dialog('open');
    return false;

}
function OpenCommonRef(DgTitle,RetnID,RetnSeqID)
{

    $('#dialog-CmmnRef').dialog({ autoOpen: false,height: 400,width: 400, modal: true,title:DgTitle});
    $('#dialog-CmmnRef').dialog('open');
    $("#modalIFrame_CmmnRef").attr('src','frmCommonRef.jsp?RefType='+DgTitle+'&ReturnID='+RetnID+'&ReturnVal='+RetnSeqID);

    return false;

}

function removeRow(src,EventSeq)
   {
    /* src refers to the input button that was clicked.
       to get a reference to the containing <tr> element,
       get the parent of the parent (in this case <tr>)
    */
    
    var oRow = src.parentElement.parentElement;
    document.all("grid").deleteRow(oRow.rowIndex);
    DeleteEvent(EventSeq);

   }



    $(function() {
    $( "#datepicker" ).datepicker({
        changeMonth: true,
        changeYear: true
        });
    });

    $(document).ready(
    function() {
    $( "#datepickerTo" ).datepicker({
        changeMonth: true,
        changeYear: true
        });
    });

 function DeleteEvent(EventSeq)
{
     
    var CheckVal=EventSeq
    
    if(CheckVal=='')
        return false;

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
                alert(xmlhttp.responseText)
        }


    }
  }
xmlhttp.open("GET","Ajax?PageID=EVENT_DELETE&ChkValue="+CheckVal,true);
xmlhttp.send();
}




function watermark(inputId,text){
	var inputBox = document.getElementById(inputId);
	if (inputBox.value.length > 0){
           if (inputBox.value == text)
			inputBox.value = '';
	}
	else
		inputBox.value = text;
}

function fnCheckShowType(shwTypeId)
{
var shwTypeSelectedTxt = shwTypeId.options[shwTypeId.selectedIndex].text

if(shwTypeSelectedTxt=='World Cup'){
alert("You cannot create world cup show.\nPlease contact CNTInfotech Administrator for further details.")
	shwTypeId.value='';
	return false;
}
}
function randomString() {
    var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";
    var string_length = 100;
    var randomVal = '';
    for (var i = 0; i < string_length; i++) {
        var rnum = Math.floor(Math.random() * chars.length);
        randomVal += chars.substring(rnum, rnum + 1);
    }
    return randomVal;
}
function PrintEntries(){
	var randomVal = randomString();

    document.forms[0].method = "post";
    document.forms[0].action = "./SMReports?" + randomVal + "&PageID=RptPartCnt&SIdent=10&EvnIdent1=&EvnIdent2="
    document.forms[0].target = "_blank";
    document.forms[0].submit();
}