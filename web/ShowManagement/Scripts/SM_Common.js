

    
function ShowEvents(ShwVal) { // Classes

    var randomVal = randomString();
    document.forms[0].method = "post";
    document.forms[0].action = "../SMReports?" + randomVal + "&PageID=RptCls&SIdent=" + ShwVal;
    document.forms[0].target = "_blank";
    document.forms[0].submit();
}

function Search_Shows(fromPage) { // Shows

    var randomVal = randomString();
    NewWindow("SM_SShows.jsp?" + randomVal + "&frmPage=" + fromPage, 'mywin', '800', '400', 'no', 'center')
}



function ShowParticipantsCnt(ShwVal) // Number of Entries per Each class
{
    var randomVal = randomString();
    document.forms[0].method = "post";
    document.forms[0].action = "../SMReports?" + randomVal + "&PageID=RptPartCnt&SIdent=" + ShwVal;
    document.forms[0].target = "_blank";
    document.forms[0].submit();
}
function printRepWithOptions_New(ShwEventOrderFromVal,ShwEventOrderToVal,ShwVal,varPageID,frmName)
{
  try {
    var randomVal = randomString();
    
    document.forms[3].method = "post";
    document.forms[3].action = "../SMReports?" + randomVal + "&PageID=" + varPageID + "&SIdent=" + ShwVal + "&EvnIdent1=" + ShwEventOrderFromVal + "&EvnIdent2=" + ShwEventOrderToVal;
    document.forms[3].target = "_blank";
    document.forms[3].submit();
    $('#'+varPageID).modal('hide');
 }
catch(err) {
    alert(err.message)
}
}

function PrintRepWithOptions() // Prepista report
{


    ShwVal = document.getElementById('dialogEventOrder').contentWindow.document.getElementById('ShowSeq').value;
    ShwEventOrderFromVal = document.getElementById('dialogEventOrder').contentWindow.document.getElementById('EventOrderFrom').value;
    ShwEventOrderToVal = document.getElementById('dialogEventOrder').contentWindow.document.getElementById('EventOrderTo').value;
    varPageID = document.getElementById('dialogEventOrder').contentWindow.document.getElementById('hdnPageID').value;
    var randomVal = randomString();

    document.forms[0].method = "post";
    document.forms[0].action = "../SMReports?" + randomVal + "&PageID=" + varPageID + "&SIdent=" + ShwVal + "&EvnIdent1=" + ShwEventOrderFromVal + "&EvnIdent2=" + ShwEventOrderToVal;

    document.forms[0].target = "_blank";
    document.forms[0].submit();
}



function PrintRepWithSortOptions() // Prepista report
{


    ShwVal = document.getElementById('dialogSortOrder').contentWindow.document.getElementById('ShowSeq').value;
    ShwEventOrderFromVal = document.getElementById('dialogSortOrder').contentWindow.document.getElementById('Numerical').selected;
    ShwEventOrderToVal = document.getElementById('dialogSortOrder').contentWindow.document.getElementById('Alphabetical').selected;
    alert(ShwEventOrderFromVal)
     alert(ShwEventOrderToVal)
    varPageID = document.getElementById('dialogSortOrder').contentWindow.document.getElementById('hdnPageID').value;
    var randomVal = randomString();

    document.forms[0].method = "post";
    document.forms[0].action = "../SMReports?" + randomVal + "&PageID=" + varPageID + "&SIdent=" + ShwVal + "&EvnIdent1=" + ShwEventOrderFromVal + "&EvnIdent2=" + ShwEventOrderToVal;

    document.forms[0].target = "_blank";
    document.forms[0].submit();
}


$(function() {

    $('a.prep').on('click', function(e) {

        e.preventDefault();
        //$('.dropdown_4columns').hide();
               
        $('<div/>', { 'class': 'myDlgPrep', 'id': 'link-' + ($(this).index() + 1)})

                .html($('<iframe/>', {
                    'src': $(this).attr('href'),
                    'style': 'width:100%; height:95%;border:none;',
                    'id': 'dialogEventOrder'
                })).appendTo('body')
                .dialog({
                    'title': "Please select Class#",
                    'width': 600,
                    'height': 200,
                     modal: true,
                     position: ['top', 100],
                    buttons: {
                        "Print": function() {
                            PrintRepWithOptions();
                             $(this).dialog("close");
                            $(this).dialog('destroy').remove();
                        },
                        Close: function() {
                            $(this).dialog("close");
                            $(this).dialog('destroy').remove();
                        }
                    }
                    

                });
                 $(".ui-dialog button").last().focus();
    });

});



$(function() {

    $('a.Sort').on('click', function(e) {

        e.preventDefault();
        $('<div/>', {'class': 'myDlgPrep', 'id': 'link-' + ($(this).index() + 1)})

                .html($('<iframe/>', {
                    'src': $(this).attr('href'),
                    'style': 'width:100%; height:95%;border:none;',
                    'id': 'dialogSortOrder'
                })).appendTo('body')
                .dialog({
                    'title': "Please select Sort Order",
                    'width': 600,
                    'height': 200,
                    position: ['top', 100],
                    buttons: {
                        "Print": function() {
                            PrintRepWithSortOptions();
                            $(this).dialog("close");
                            $(this).dialog('destroy').remove();
                        },
                        Close: function() {
                            $(this).dialog("close");
                            $(this).dialog('destroy').remove();
                        }
                    }

                });
    });

});




$(function() {

    $('a.PopPayments').on('click', function(e) {

        e.preventDefault();
        $('<div/>', {'class': 'myDlgPopPayments', 'id': 'link-' + ($(this).index() + 1)})

                .html($('<iframe/>', {
                    'src': $(this).attr('href'),
                    'style': 'width:100%; height:95%;border:none;',
                    'id': 'dialogEventOrder'
                })).appendTo('body')
                .dialog({
                    'title': "Please select Class#",
                    'width': 600,
                    'height': 200,
                    position: ['top', 100],
                    buttons: {
                        "Print": function() {
                            PrintRepWithOptions();
                        },
                        Close: function() {
                            $(this).dialog("close");
                            $(this).dialog('destroy').remove();
                        }
                    }

                });
    });

});


$(function() {

    $('a.PopItems').on('click', function(e) {

        e.preventDefault();
        $('<div/>', {'class': 'myDlgPopItems', 'id': 'link-' + ($(this).index() + 1)})

                .html($('<iframe/>', {
                    'src': $(this).attr('href'),
                    'style': 'width:100%; height:95%;border:none;',
                    'id': 'dialogEventOrder'
                })).appendTo('body')
                .dialog({
                    'title': "Items",
                    'width': 600,
                    'height': 200,
                    position: ['top', 100],
                    buttons: {
                        "Print": function() {
                            PrintRepWithOptions();
                        },
                        Close: function() {
                            $(this).dialog("close");
                            $(this).dialog('destroy').remove();
                        }
                    }

                });
    });

});




function ShowParticipantsSummary(ShwVal) { //Registrations and Placement Summary

    var randomVal = randomString();
    document.forms[0].method = "post";
    document.forms[0].action = "../SMReports?" + randomVal + "&PageID=SHOWS_REGISTER&SIdent=" + ShwVal;
    document.forms[0].target = "_blank";
    document.forms[0].submit();
}

function ShowItemSummary(ShwVal) { // Financial Items summary
    var randomVal = randomString();
    document.forms[0].method = "post";
    document.forms[0].action = "../SMReports?" + randomVal + "&PageID=Rpt_Items&SIdent=" + ShwVal;
    document.forms[0].target = "_blank";
    document.forms[0].submit();
}

function ShowItemReport(ShwVal) { // Financial Items summary
    var randomVal = randomString();
    document.forms[0].method = "post";
    document.forms[0].action = "../SMReports?" + randomVal + "&PageID=Rpt_Items_Ind&SIdent=" + ShwVal;
    document.forms[0].target = "_blank";
    document.forms[0].submit();
}

function ShowExbSummary(RepNumFromVal,RespNumToVal, ShwVal,varPageID) { // Financial Exhibitor summary

    
    var randomVal = randomString();
    document.forms[3].method = "post";
    document.forms[3].action = "../SMReports?" + randomVal + "&PageID=" + varPageID + "&SIdent=" + ShwVal + "&ExbIdent=" + RepNumFromVal + "&ExbIdent1=" + RespNumToVal;
    document.forms[3].target = "_blank";
    document.forms[3].submit();
    $('#'+varPageID).modal('hide');
  
}


function ShowAllExbSummary(ShwVal) { // All Financial Exhibitor summary

    var randomVal = randomString();
    document.forms[0].method = "post";
    document.forms[0].action = "../SMReports?" + randomVal + "&PageID=RptExbInd&SIdent=" + ShwVal;
    document.forms[0].target = "_blank";
    document.forms[0].submit();
}

function ShowAllExbPaymentSummary(ShwVal) { // Financial Payments Summary by All Exhibitors

    var randomVal = randomString();
    document.forms[0].method = "post";
    document.forms[0].action = "../SMReports?" + randomVal + "&PageID=RptExbPaySum&SIdent=" + ShwVal
    document.forms[0].target = "_blank";
    document.forms[0].submit();
}

function ShowStableReport(ShwVal){

    var randomVal = randomString();
    document.forms[0].method = "post";
    document.forms[0].action = "../SMReports?" + randomVal + "&PageID=StableRep&SIdent=" + ShwVal
    document.forms[0].target = "_blank";
    document.forms[0].submit();
}

function ShowHorseSummary(ShwVal) { // Financial Payments Summary by All Exhibitors

    var randomVal = randomString();
    document.forms[0].method = "post";
    document.forms[0].action = "../SMReports?" + randomVal + "&PageID=RptHorses&SIdent=" + ShwVal
    document.forms[0].target = "_blank";
    document.forms[0].submit();
}

function ShowHorseListingSummary(ShwVal,SortType) { // Financial Payments Summary by All Exhibitors

    var randomVal = randomString();
    document.forms[0].method = "post";
    document.forms[0].action = "../SMReports?" + randomVal + "&PageID=RptHorses_Numerical&SIdent=" + ShwVal+"&SortType=" + SortType
    document.forms[0].target = "_blank";
    document.forms[0].submit();
}




function ShowEhxibitorSummary(ShwVal,sortM) { // Financial Payments Summary by All Exhibitors

    var randomVal = randomString();
    document.forms[0].method = "post";
    document.forms[0].action = "../SMReports?" + randomVal + "&PageID=RptExhibitors&Exbmode="+sortM+"&SIdent=" + ShwVal
    document.forms[0].target = "_blank";
    document.forms[0].submit();
}

function ShowRiderSummary(ShwVal) { // Financial Payments Summary by All Exhibitors

    var randomVal = randomString();
    document.forms[0].method = "post";
    document.forms[0].action = "../SMReports?" + randomVal + "&PageID=RptRiders&SIdent=" + ShwVal
    document.forms[0].target = "_blank";
    document.forms[0].submit();
}

function ShowTrainerSummary(ShwVal) { // Financial Payments Summary by All Exhibitors

    var randomVal = randomString();
    document.forms[0].method = "post";
    document.forms[0].action = "../SMReports?" + randomVal + "&PageID=RptTrainers&SIdent=" + ShwVal
    document.forms[0].target = "_blank";
    document.forms[0].submit();
}



function PrintEntryInformation(ShwVal) { // Financial Payments Summary by All Exhibitors
   
    var randomVal = randomString();
    document.forms[1].method = "post";
    document.forms[1].action = "../SMReports?" + randomVal + "&PageID=RptEntries&SIdent="+ShwVal
    document.forms[1].target = "_blank";
    document.forms[1].submit();
}

function PrintItemInformation(ShwVal) { // Financial Payments Summary by All Exhibitors
    
    document.forms[2].Selected_Items.value='';
    var chk_arr =  document.getElementsByName("ex3");
    var chklength = chk_arr.length; 

    for(k=0;k< chklength;k++)
    {
        if(chk_arr[k].checked){
            if(k >0 && document.forms[2].Selected_Items.value.length>0)
                document.forms[2].Selected_Items.value +=","
            document.forms[2].Selected_Items.value +=chk_arr[k].value
                          
        }
    }
    var randomVal = randomString();

    document.forms[2].method = "post";
    document.forms[2].action = "../SMReports?" + randomVal + "&PageID=Rpt_Items_Ind&SIdent="+ShwVal
    document.forms[2].target = "_blank";
    document.forms[2].submit();
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

function Search_Exhibitor()
{

    var randomVal = randomString();
    NewWindow("SM_SearchPerson.jsp?" + randomVal, 'mywin', '800', '420', 'no', 'center')
}


function Search_Exhibitor_Class()
{
    var tableID_ClassDetails = document.getElementById("ClassDetails"); // Get table ID of the Class Details


    var CurrentRow = '';
    var bClassSelected = false;
    for (var i = 1; i < tableID_ClassDetails.rows.length; i++) {
        if (tableID_ClassDetails.rows[i].cells[7].children[0].checked) {
            CurrentRow = i;
            bClassSelected = true;
            break;
        }
    }
    if (bClassSelected) {
        var Riderseq = "Riderseq" + CurrentRow;
        var RiderEntseq = "RiderEntseq" + CurrentRow;
        var RiderName = "RiderName" + CurrentRow;

        var randomVal = randomString();
        NewWindow("SM_SearchPerson.jsp?" + randomVal + "&ESQ=" + Riderseq + "&ENUM=" + RiderEntseq + "&EN=" + RiderName, 'mywin', '800', '400', 'no', 'center')
    }
    else {
        alert('Please enter the class details')
        for (var i = 1; i < tableID_ClassDetails.rows.length; i++) {
            if (tableID_ClassDetails.rows[i].cells[0].children[1].value == '') {
                tableID_ClassDetails.rows[i].cells[0].children[1].focus();
                break;
            }
        }
    }

}


function Search_Show_Exhibitor(ShowVal,varCallType)

{
    if(varCallType === undefined)
        varCallType='1';
    
    var randomVal = randomString();
    NewWindow("SM_SearchSExhibitor.jsp?" + randomVal + "&SIdent=" + ShowVal+ "&radSearchType=" + varCallType, 'mywin', '800', '400', 'no', 'center')
}

function Search_HRegistry(fieldType)
{
    var randomVal = randomString();
    NewWindow("SM_HrsSearchPopup.jsp?field="+fieldType+"&" + randomVal, 'mywin', '800', '400', 'no', 'center')
}

var win = null;
function NewWindow(mypage, myname, w, h, scroll, pos) {
    if (pos == "random") {
        LeftPosition = (screen.width) ? Math.floor(Math.random() * (screen.width - w)) : 100;
        TopPosition = (screen.height) ? Math.floor(Math.random() * ((screen.height - h) - 75)) : 100;
    }
    if (pos == "center") {
        LeftPosition = (screen.width) ? (screen.width - w) / 2 : 100;
        TopPosition = (screen.height) ? (screen.height - h) / 2 : 100;
    }
    else if ((pos != "center" && pos != "random") || pos == null) {
        LeftPosition = 0;
        TopPosition = 20
    }
    settings = 'width=' + w + ',height=' + h + ',top=' + TopPosition + ',left=' + LeftPosition + ',scrollbars=' + scroll + ',location=no,directories=no,status=no,menubar=no,toolbar=no,resizable=no';
    winName = window.open(mypage, myname, settings);
    if (winName)
    {
        winName.focus();
    }
}


function Cmm_isNumeric(ChkInputText) {
    var numexp = /^[0-9]+$/;
    if (document.getElementById(ChkInputText).value.match(numexp)) {
        return true;
    } else {
        alert("Entry must be a number");
        elem.focus();
        return false;
    }
}



function Left(str, n) {
    if (n <= 0)
        return "";
    else if (n > String(str).length)
        return str;
    else
        return String(str).substring(0, n);
}
function Right(str, n) {
    var Prefix = '';
    strLen = String(str).length;
    for (var i = strLen; i < n; i++)
    {
        Prefix += '0';
    }

    return Prefix + str;
}
function DefaultActiveItemStatus(CurrentObjVal, ObjStatusID, ObjMandID)
{
    //alert(CurrentObjVal)

    if (CurrentObjVal == '')
    {
        document.getElementById(ObjStatusID).value = '';
        document.getElementById(ObjMandID).value = '';
    }
    else
    {
        document.getElementById(ObjStatusID).value = 'A';
        document.getElementById(ObjMandID).value = 'N';
    }

}


   function ShowMoneyOwe(ShwVal) { // ShowMoneyOwe/Pay
    var randomVal = randomString();
    document.forms[0].method = "post";
    document.forms[0].action = "../SMReports?" + randomVal + "&PageID=RptMoneyOwe&SIdent=" + ShwVal
    document.forms[0].target = "_blank";
    document.forms[0].submit();
}

function ShowSettlementList(ShwVal){
    
    var randomVal = randomString();
    document.forms[0].method = "post";
    document.forms[0].action = "../SMReports?" + randomVal + "&PageID=Rpt_Settlement&SIdent=" + ShwVal
    document.forms[0].target = "_blank";
    document.forms[0].submit();
}

function EntriesByStatus(ShwVal){
    
    var randomVal = randomString();
    document.forms[0].method = "post";
    document.forms[0].action = "../SMReports?" + randomVal + "&PageID=Rpt_Ent_Status&SIdent=" + ShwVal
    document.forms[0].target = "_blank";
    document.forms[0].submit();
}




function DefaultSponsorStatus(CurrentObjVal, ObjStatusID)
{
    if (CurrentObjVal == '')
    {
        document.getElementById(ObjStatusID).value = '';
    }
    else
    { 
        document.getElementById(ObjStatusID).value = 'A';
     }

}


function ShowExcelRport(varSIdent,varExpType){
    var randomVal = randomString();
    document.forms[0].method = "post";
    document.forms[0].action = "SM_Show_Excel_Reports.jsp?" + randomVal + "&ExpType="+varExpType+"&ShowSeq=" + varSIdent;
    document.forms[0].target = "_blank";
    document.forms[0].submit();
}

function ShowClassEntries(varSIdent,varExpType){
     var randomVal = randomString();
    document.forms[0].method = "post";
    document.forms[0].action = "../SMReports?" + randomVal + "&PageID=ClassEntries&SIdent=" + varSIdent
    document.forms[0].target = "_blank";
    document.forms[0].submit();
}
function OpenPersonPop(varEntitySeq){
    try{
        
      var bCheked=true;
      if(window.opener!=null)  
          bCheked=window.opener.document.forms[0].chkOpen.checked
      else
          bCheked=document.forms[0].chkOpen.checked
      
      
     if(localStorage.getItem("E"+varEntitySeq)==='Y')
             bCheked=false;
         
      if(varEntitySeq!='' && bCheked ){
          
          localStorage.setItem("E"+varEntitySeq,"Y");
          
        var randomVal = randomString();
        NewWindow("SM_Person.jsp?"+randomVal+"&EntityIdent="+varEntitySeq , 'mywin_MemSearch', '900', '400', 'no', 'center')
    }
    }
    catch (err) {
        alert(err.message)
    }
   }
 
function OpenPersonPop_HotKey(varEntitySeq,e){
    var code = (e.keyCode ? e.keyCode : e.which);
      if(code === 13) { //Enter keycode
        localStorage.setItem("E"+varEntitySeq,'N');
        OpenPersonPop(varEntitySeq)
    }
    
}
   function OpenRiderPop_Classes(ObjRiderNum, varEntitySeq, RiderName,EventSeq,PFHAClassCode,varSrcCallled){
    try{

       
        var RiderNumVal = ObjRiderNum.value;
       
       if(RiderNumVal==='')
           return false
               
        var bCheked = true;
        if (window.opener != null)
            bCheked = window.opener.document.forms[0].chkOpen.checked
        else
            bCheked = document.forms[0].chkOpen.checked
        
       
         if(localStorage.getItem(RiderNumVal)==='Y')
             bCheked=false;
           
        

        if (RiderNumVal != '' && bCheked) {
            var randomVal = randomString();
                 
               localStorage.setItem(RiderNumVal,"Y");
                 
                 var url= "SM_Person.jsp?" + randomVal + "&MemIdent=" + RiderNumVal
                 
                  $('#myModal_Rider').on('show.bs.modal', function () {
                       $('iframe').attr("src", url);
                });
                    $('#myModal_Rider').modal('show');
                    $('#myModal_Rider').on('hide.bs.modal', function () {
                         $("#myModal_Rider").off(); // This is added otherwise the getRiderDetails is called multiple times
                         getRiderDetails(ObjRiderNum, varEntitySeq, RiderName, EventSeq, PFHAClassCode, varSrcCallled)
                     
                });
        }
        else
        {
            getRiderDetails(ObjRiderNum, varEntitySeq, RiderName, EventSeq, PFHAClassCode, varSrcCallled)
        }
    }
    catch (err) {
        alert(err.message)
    }
    //winName.onunload = function(){ getRiderDetails(ObjRiderNum, varEntitySeq, RiderName, EventSeq, PFHAClassCode, varSrcCallled) }


}


function OpenRiderPop_Classes_HotKey(ObjRiderNum, varEntitySeq, RiderName,EventSeq,PFHAClassCode,varSrcCallled,e){
   

       var code = (e.keyCode ? e.keyCode : e.which);
     
    if(code == 13) { //Enter keycode
         localStorage.setItem(ObjRiderNum.value,'N');
         OpenRiderPop_Classes(ObjRiderNum, varEntitySeq, RiderName,EventSeq,PFHAClassCode,varSrcCallled)
    }
}
   
   
   function ShowOwnerSummary(ShwVal){
    var randomVal = randomString();
    document.forms[0].method = "post";
    document.forms[0].action = "../SMReports?" + randomVal + "&PageID=RptOwners_AsnNum&SIdent=" + ShwVal
    document.forms[0].target = "_blank";
    document.forms[0].submit();
}

function PrintLabels(ShwVal,PgID){
    var randomVal = randomString();
    document.forms[0].method = "post";
    document.forms[0].action = "../SMLabels?" + randomVal + "&PageID="+PgID+"&SIdent=" + ShwVal
    document.forms[0].target = "_blank";
    document.forms[0].submit();
}


function printRepWithOptions_Label(FromVal,ToVal,ShwVal,varPageID,frmName)
{
  try {
    var randomVal = randomString();
    frmName.method = "post";
    frmName.action = "../SMLabels?" + randomVal + "&PageID=" + varPageID + "&SIdent=" + ShwVal + "&Ident1=" + FromVal + "&Ident2=" + ToVal;
    frmName.target = "_blank";
    frmName.submit();
      $('#'+varPageID).modal('hide');
 }
catch(err) {
    alert(err.message)
}
}


function NavigateToScreen(NavigatePage)
    {
    document.getElementById("yourIframe").src = NavigatePage + ".jsp";

    }
    
 function OpenGroupEmail(){
   
      var options_PayBack = {
        url: "SM_Pop_Bill_SendMail.jsp",
        title: 'Email Acknowledgements',
        size: eModal.size.lg,
        buttons: [{text: 'OK', style: 'display:none',   close: true}]
    };


    eModal.ajax(options_PayBack);
 }
 
  function Call_USEF_WS(objUsefNum,formName){
   
   
   
    try {
        if (objUsefNum.value === '') {
            alert('Please enter USEF#')
            objUsefNum.focus();
            return false;
        }
        var d = new Date();
        var strDate = (d.getMonth()+1) + "/" + d.getDate()+ "/" +d.getFullYear() ;

       $('.modal').show();
        var jqxhr = $.getJSON("http://pasotracker.com/PasoKey/UsefWebserviceCall.jsp?id="+objUsefNum.value+"&ws=Member&date="+strDate, function(data) {
            
            if(data.Active==='Yes' || data.Active==='No')
            document.getElementById("usefStatus").value=data.Active;
            document.getElementById("usefMemType").value=data.Amateur;
            document.getElementById("usefLastChecked").value=strDate;
        })
                
        .fail(function() {
            alert("Problem Access USEF Information");
            $('.modal').hide();
        })
        
        jqxhr.complete(function() {
                submitPersonForm(SM_Person_Master)
               $('.modal').hide();
        });



    }
    catch (err) {
        alert(err.message)
    }
 }
 
   /** allowing only numbers and - **/
function validateDecimals(key){
   
    var keycode=(key.which) ? key.which : key.keycode;
    
    
    if(keycode>31 && (keycode < 48 || keycode > 57) && keycode!=45 && keycode!=46 && keycode!=110)        
        return false;    

    return true;
}   
