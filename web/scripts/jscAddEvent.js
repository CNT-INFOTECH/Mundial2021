function checkIt(evt) {
    evt = (evt) ? evt : window.event
    var charCode = (evt.which) ? evt.which : evt.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        status = "This field accepts numbers only."
        return false
    }
    status = ""
    return true
}



function fnSubmit_Events()
{

                 document.forms[0].method="post";
		  document.forms[0].action="servlet/Shows"
		  document.forms[0].submit();
}


  function CopyShow()
  {
     document.forms[0].ShowSeqNo.value=parent.document.forms[0].showSeq.value
      document.forms[0].ShowType.value=parent.document.forms[0].ShowType.value
 }


     function JQueryClose(SelValue)
    {

        window.parent.jQuery('#dialog-modal').dialog('close');
        window.parent.location.href = "Shows_Selected.jsp?Seq="+SelValue;

    }
    function InsertEvent()
    {

       if(document.forms[0].EventOrder.value=='')
        {
            alert("Please enter the order of the event")
             document.forms[0].EventOrder.focus();
            return false
        }

        if(document.forms[0].Date.value=='')
        {
            alert("Please enter the Date of the event")
            document.forms[0].Date.focus();
            return false
        }

         if(document.forms[0].Category.value=='')
        {
            alert("Please select the Category")
            document.forms[0].Category.focus();
            return false
        }

         if(document.forms[0].Air.value=='')
        {
            alert("Please select the Aire")
            return false
        }
        
         if(document.forms[0].Gender.value=='')
        {
            alert("Please select the Gender")
            return false
        }

         if(document.forms[0].AgeFrom.value=='')
        {
            alert("Please enter the AgeFrom")
            return false
        }

         if(document.forms[0].AgeTo.value=='')
        {
            alert("Please enter the AgeTo")
            return false
        }
        if(document.forms[0].Rider.value=='')
        {
            alert("Please enter the Rider Type")
            return false
        }

        if(document.forms[0].EventType.value=='')
        {
            alert("Please enter the Event Type")
            return false
        }

         if(document.forms[0].EventName.value=='')
        {
            alert("Please enter the Event Name")
            return false
        }

        

    fnSubmit_Events();



    var SeqNo= document.forms[0].SeqNo.value;

    if (SeqNo!=0)
        return false


   var selObj_Category = document.forms[0].Category;
    var selIndex_Category = selObj_Category.selectedIndex;

    var selObj_Gender = document.forms[0].Gender;
    var selIndex_Gender = selObj_Category.selectedIndex;

    var selObj_Rider = document.forms[0].Rider;
    var selIndex_Rider = selObj_Rider.selectedIndex;



    var newRow = parent.document.getElementById("grid").insertRow(-1);

/*
    oCell = newRow.insertCell();
    oCell.innerHTML = selObj_Category.options[selIndex_Category].text;

     oCell = newRow.insertCell();
    oCell.innerHTML = selObj_Gender.options[selIndex_Gender].text;

     oCell = newRow.insertCell();
    oCell.innerHTML = selObj_Rider.options[selIndex_Rider].text;

*/
  
 
    
    var oCell = newRow.insertCell(-1);
    oCell.innerHTML = document.forms[0].EventOrder.value;

     oCell = newRow.insertCell(-1);
    oCell.innerHTML = document.forms[0].Date.value;

     oCell = newRow.insertCell(-1);
    oCell.innerHTML = document.forms[0].EventName.value;

     oCell = newRow.insertCell(-1);
    oCell.innerHTML = '<img src="Images/pencil_icon.gif">&nbsp;&nbsp;<img src="Images/delete.png" onclick="removeRow(this)";>';






    parent.document.getElementById("Events").innerHTML=document.forms[0].Date.value

    }

 function eventName()
 {
  
if(document.forms[0].DontChange.value=='N')
    {

          Air=document.forms[0].Air.value
        Category=document.forms[0].Category.value
        Gender=document.forms[0].Gender.value
        AgeFrom=document.forms[0].AgeFrom.value
        AgeTo=document.forms[0].AgeTo.value
        Rider=document.forms[0].Rider.value

        document.forms[0].EventName.value=Category+' '+Gender+' '+AgeFrom+' '+AgeTo+' '+Rider
   }

 }

 function GetAire(ObjValue)
 {

 }

 function ListEventsTemplate(myname,w,h,scroll,varShowType)
 {

if(varShowType.value=='')
    {
        alert('Please Select Show Type')
        return false
    }
var win = null;

LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
settings ='height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable'

win = window.open("frmStandardEvents.jsp?ShowType="+varShowType.value,myname,settings)


return false;
}

$(document).ready(
function() {
        $( "#datepicker" ).datepicker();
});