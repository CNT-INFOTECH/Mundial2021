$(function() {


    if(localStorage.getItem('ShowFee')!=null)
    {
        if($("#Sh_Std_Fee" ).length)
            document.getElementById('Sh_Std_Fee').value=localStorage.getItem('ShowFee');
    }
    
    if(document.getElementById('Asc_ShowNumber').value==='')
        document.getElementById('Asc_ShowNumber').focus()
    
    //else if($( "#Page_mode" ).length && document.getElementById('Page_mode').value!='')
        //$("input.EventName:visible:enabled[value='']").not(".nofocus").slice(0, 1).focus();
    
    $("#fromDate").datepicker({
        changeMonth: true,
        changeYear: true
    });

    $("#toDate").datepicker({
        changeMonth: true,
        changeYear: true
    });
    
    
   
       $('a.StandardList').on('click', function(e){
         e.preventDefault();
        $('<div/>', {'class':'myDlgClass', 'id':'link-'+($(this).index()+1)})
        .html($('<iframe/>', {
            'src' : $(this).attr('href'),
            'style' :'width:100%; height:95%;border:none;'
        })).appendTo('body')
        .dialog({
            'title' : $(this).text(),
            'width' : 800,
            'height' :400,
             'modal' :true,
            position: ['top', 100]
             
        });
    });
    
});


function SaveInfo() {
      alert('Successfully Saved');
    }
    

function submitShowForm(theForm) {


    var MandatoryElement = "";


    var Mandates = [theForm.ShowName, theForm.showPlace, theForm.fromDate, theForm.toDate, theForm.showSecretary, theForm.ShowType];
    var Mandates_Desc = ["Show Name", "Show Place", "Date From ", "Date To", "Show Secretary", "Show Type"];

    for (var i = 0; i < Mandates.length; i++)
    {
        MandatoryElement = validateField(Mandates[i], "Please enter " + Mandates_Desc[i]);
        if (MandatoryElement != "") {
            alert(MandatoryElement);
            return false;
        }
    }


    document.forms[0].method = "post";
    document.forms[0].action = "../ShowController?PageID=SHOWS";
    document.forms[0].target = "_self";
    document.forms[0].submit();
}
function NavigateMenu(NavigatePage)
{
    document.forms[0].method = "post";
    document.forms[0].action = NavigatePage;
    document.forms[0].target = "_self";
    document.forms[0].submit();

}

function CreateNewShow(NavigatePage)
{

    document.forms[0].method = "post";
    document.forms[0].action = NavigatePage;
    document.forms[0].target = "_self";
    document.forms[0].submit();

}

function ClearShow(NavigatePage)
{
    document.forms[0].method = "post";
    document.forms[0].action = NavigatePage;
    document.forms[0].target = "_self";
    document.forms[0].submit();

}

function validateField(fld, msg) {
    var error = "";
    if (fld.value == "") {
        fld.style.background = 'lightblue';
        fld.focus();
        error = msg;
    } else {
        fld.style.background = 'White';
    }
    return error;
}



function ApprovalDialog(ShowSeq) {
    var xmlhttp;
    
     if (ShowSeq == "")
    {
       return;
    }
    
    $("#Appove").dialog({width: 300, height: 150});
    
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function()
    {
       
      
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
        {
             var result=xmlhttp.responseText;
            
            if(result!="0")
            {
               sleep(10000)
               jQuery('#Appove').dialog('close');
               alert("Successfully submitted for PFHA's Approval")
            }
        }
        
    }
    xmlhttp.open("GET", "../SendShowRequest?Seq=" + ShowSeq, true);
    xmlhttp.send();
}


function CheckStatus(ShowSeq)
{

    $("#Check4Status").dialog({width: 300,height: 150});
}

function sleep(milliseconds) {
  var start = new Date().getTime();
  for (var i = 0; i < 1e7; i++) {
    if ((new Date().getTime() - start) > milliseconds){
      break;
    }
  }
}

function popupwindow(url, title, w, h) {
    wLeft = window.screenLeft ? window.screenLeft : window.screenX;
    wTop = window.screenTop ? window.screenTop : window.screenY;

    var left = wLeft + (window.innerWidth / 2) - (w / 2);
    var top = wTop + (window.innerHeight / 2) - (h / 2);
    return window.open(url, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
}



$(document).ready(function(){
$(".flip").click(function(){
$(".panel").toggle();
});
});


function ShowJudgesList(CurrRow,CurJudgType) {
 
     if (document.getElementById(CurJudgType+CurrRow).value == 2)
       document.getElementById("CnfJudgeList"+CurrRow).innerHTML='';
    else
        document.getElementById("CnfJudgeList"+CurrRow).innerHTML='Conferring List';
    
}


function DeleteShow(){
    
     var r = confirm("This action will delete the show. Are you sure you want to proceed?");
    if (r == true) {
       document.forms[0].method = "post";
        document.forms[0].action = "SM_NewShow_Delete.jsp";
        document.forms[0].target = "_self";
        document.forms[0].submit();
    } 
    
}

function Save_fee_localStorage(varFeeValue){
     
     localStorage.setItem('ShowFee',varFeeValue);
   
}

function dateCheck(Objfrom,Objto,Objcheck) {

    from= Objfrom.value
    to= Objto.value
    check=Objcheck.value
    var fDate,lDate,cDate;
    fDate = Date.parse(from);
    lDate = Date.parse(to);
    cDate = Date.parse(check);

    if((cDate <= lDate && cDate >= fDate)) {
           return true;
    }
     
    BootstrapDialog.show({
            title: 'Alert',
            type: BootstrapDialog.TYPE_DEFAULT,
            message: "The Class Date should be between " +from+ " and "+to+"<br><br><br>",
            onhide: function(){
                document.getElementById(Objcheck.id).value='';
                document.getElementById(Objcheck.id).focus();
                
            }
        });
    return false;
}



function MovePoint(objCheckBox,objMovePoint,currentRow){
    
    if(objCheckBox.checked)
        document.getElementById(objMovePoint).value=currentRow
    
   var $unique = $('input.SwapCls');
    $unique.click(function() {
        $unique.filter(':checked').not(this).removeAttr('checked');
});
}

function move_Item(Selected_row_toMove, direction) {

    try {
        var tbl = document.getElementById('StandardList');
        var DestinationIndex=Number(document.getElementById('txtMovePoint').value)
          var aRow_Destination = Selected_row_toMove + direction;
        
        
        
        
        if (aRow_Destination === 0) // Row 0 is header
            return false
        
         if(DestinationIndex!==0 && direction === -1)
           aRow_Destination = Selected_row_toMove + (direction * (Number(Selected_row_toMove) - (DestinationIndex+1)));
         if(DestinationIndex!==0 && direction === 1)
           aRow_Destination = (direction * ((DestinationIndex)));
       
        
        var curr = tbl.rows[Selected_row_toMove];
        var othr = tbl.rows[aRow_Destination];

        if (direction === -1) {
          
            othr.parentNode.insertBefore(curr, othr);
            
        }
        if (direction === 1) {
            othr.parentNode.insertBefore(curr, othr.nextSibling);
        }
        document.getElementById('txtMovePoint').value='';
        var $unique = $('input.SwapCls');
            $unique.click(function() {
             $unique.filter(':checked').not(this).removeAttr('checked');
            });
         UpdateSortOrder();
    }
    catch (err) {
        alert(err.message)
    }
}

function UpdateSortOrder(){
      
     var table = document.getElementById("StandardList");

    try {
        for (var i = 1; i < table.rows.length; i++) {
            table.rows[i].cells[0].children[3].value=i
        }
    }
    catch (err) {
        alert(err.message)
    }
}

function Show_AutoSave(obj){
     var $form = $(obj).closest('form'); // OR var form = obj.from;
        var dataString = $form.serialize();
        
      $.ajax({
            type: "POST",
            url: "SM_NewShow_AutoSave.jsp",
            data: dataString, // serializes the form's elements.
             success: function (data) {
                 document.getElementById("ShowSeq").value=data.trim();
              },
            error: function (data) {
               // alert('An error occurred.');
                //alertlog(data);
            }
        });
    }