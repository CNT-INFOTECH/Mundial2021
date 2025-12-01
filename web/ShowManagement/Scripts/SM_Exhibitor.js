
$(function() {

    $("#txtExhibitorName").autocomplete({
         
         change: function() {
         OpenPersonPop(document.forms[0].txtExhibitorEntitySeq.value)
      },
        source: function(request, response) {
            $.ajax({
                url: "SM_Json_Persons_Exhibitor.jsp",
                dataType: "json",
                data: {txtExhibitorName: request.term},
                success: function(data) {
                    response($.map(data, function(item) {
                        return {
                            label: $.trim(item.Value),
                            id: item.id,
                            ShowAssnNum: item.ShowAssnNum
                        };
                    }));
                }
            });
        },
        minLength: 3,
        autoFocus: true,
        select: function(event, ui) {
            $('#txtExhibitorEntitySeq').val(ui.item.id);
         
            if (ui.item.ShowAssnNum == '99999') {
                //return false
            }
            else {
                $('#txtExhibitorAssngNum').val(ui.item.ShowAssnNum);
                document.forms[0].method = "post";
                document.forms[0].action = "SM_Add_Show_Exhibitor.jsp?hidden=" + ui.item.ShowAssnNum;
                document.forms[0].target = "_self";
                document.forms[0].submit();
            }
        }
    });
});


function submitForm(theForm, AutoYN) {

//var MandatoryElement = "";
//var Mandates = [theForm.ShowName, theForm.showPlace, theForm.fromDate, theForm.toDate, theForm.showSecretary,theForm.ShowType];
//var Mandates_Desc = ["Show Name", "Show Place", "Date From ","Date To", "Show Secretary","Show Type"];
//
//for(var i=0; i < Mandates.length;i++)
//{
//     MandatoryElement = validateField(Mandates[i], "Please enter "+Mandates_Desc[i]);
//    if (MandatoryElement != "") {
//        alert(MandatoryElement);
//        return false;
//    }
// }

  if(AutoYN==='Y'){
    var form = $('#SM_Add_Show_Exhibitor');
   
    $.ajax({
        type: "POST",
        url: "../ShowController?PageID=EXHIBIT&Auto=Y",
        data: form.serialize(),
        success: function(data, text) {
   
           var Success_Data= data.split('Horse_Details');
           var DataLength=Success_Data.length;
        
                     
            document.getElementById("txtEhibitorSeq").value=Success_Data[0].trim();
            for(var i=1;i<DataLength-3;i++){
             
                var ClassDetails=Success_Data[i];
                    ClassDetails_spl=ClassDetails.split("Class_Details")
                     document.getElementById("txt_EXH_MST_HRS_SEQ"+i).value=ClassDetails_spl[0].trim();
                     ClassDetails_spl_Details=ClassDetails[1].trim().split("#@#");
            }
            
            var Items=Success_Data[DataLength-3]
            
           
            var Items_spl=Items.split("Item_Details_All")
            
             for(var i=1;i<Items_spl.length;i++){
                 
                   var Items_spl_eachRow=Items_spl[i].split("Item_Details_pk")
                 
                   
                     //for(var iR=0;iR<Items_spl_eachRow.length;iR++){
                        
                        document.getElementById("ItemTableSeq" + (i)).value = Items_spl_eachRow[0].trim();
                        document.getElementById("ItemSeq" + (i)).value=Items_spl_eachRow[1].trim()+','+Items_spl_eachRow[8].trim(); 
                        document.getElementById("ItemSeq" + (i)).options[document.getElementById("ItemSeq" + (i)).selectedIndex].text=Items_spl_eachRow[2].trim();
                        document.getElementById("Quantity" + (i)).value = Items_spl_eachRow[3].trim();
                        document.getElementById("Price" + (i)).value = Items_spl_eachRow[4].trim();
                        document.getElementById("Total" + (i)).value = Items_spl_eachRow[5].trim();
                        document.getElementById("ItemStatus" + (i)).value = Items_spl_eachRow[6].trim();
                        document.getElementById("ItemNotes" + (i)).value = Items_spl_eachRow[7].trim();
                    //}
             }
             
            var Items_Payments=Success_Data[DataLength-2]
           
            var Items_Payments_spl=Items_Payments.split("#@#")
             for(var i=1;i<Items_Payments_spl.length;i++){
         
                 document.getElementById("PaymentSeq"+(i)).value=Items_Payments_spl[i].trim();
             }
             
        
        var Total_Fee_Details=Success_Data[DataLength-1]
        
        var Total_Fee_Details_spl=Total_Fee_Details.split("#@#")
       
        document.getElementById("Total_Cls_Fee").innerHTML = Total_Fee_Details_spl[0].trim();
        document.getElementById("Total_Item_Fee").innerHTML =  Total_Fee_Details_spl[1].trim();
        document.getElementById("Total_Paid").innerHTML =  Total_Fee_Details_spl[2].trim();
        document.getElementById("Total_Balance").innerHTML =  Total_Fee_Details_spl[3].trim();
            
        }
    });
       
 }
 else{

    document.forms[0].method = "post";
    document.forms[0].action = "../ShowController?PageID=EXHIBIT&Auto=N";
    document.forms[0].target = "_self";
    document.forms[0].submit();
}

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

// Assign the Class Details row to the Horse Details
function AddSelectedClassDetails(varSave) {
    

    var table = document.getElementById("HrsDetails");

    if (typeof table !== "undefined" && table !== null) {
     
    HorseRowCnt = table.rows.length;
    

        for (var i = 1; i < HorseRowCnt; i++) {
            var SelectedRow = "radHorseSelected" + i;
            if (document.getElementById(SelectedRow).checked)
            {

                var ClassDetailsRow = "HrsClassDetails" + i;
                var ClassDetailsDBRow = "HrsClassDetailsDB" + i;
                document.getElementById(ClassDetailsDBRow).value = GetDBClassValues();
                document.getElementById(ClassDetailsRow).value = GetClassValues();


            }
        }
    
    
        if(typeof(varSave) != 'undefined' && varSave=='Y'){
           AutoSave();
               
        }
    }
}


// This function is used to get All the values of the Class Row
function GetClassValues()
{

    var table = document.getElementById("ClassDetails");
    // --Row-- Each Row
    // --Column-- Each Column
    var TableValues = "";
   
    
   
    
    for (var i = 1; i < table.rows.length; i++) {
        
         var ChargeEntry="N";
         
        if(table.rows[i].cells[0].children[1].value.trim()!=''){
            
            if(table.rows[i].cells[4].children[0].checked)
                ChargeEntry="Y";
        
            TableValues = TableValues +
                    table.rows[i].cells[0].children[0].value.trim() + "--Column--" + //EventSeq
                    table.rows[i].cells[0].children[1].value.trim() + "--Column--" + //EventNum

                    table.rows[i].cells[1].children[0].value.trim() + "--Column--" + //EventName
                    table.rows[i].cells[1].children[1].value.trim() + "--Column--" +// PFHA ClassCode
                     
                     
                    table.rows[i].cells[2].children[0].value.trim() + "--Column--" + //RiderEntity
                    table.rows[i].cells[2].children[1].value.trim() + "--Column--" + //Riderseq

                    table.rows[i].cells[3].children[0].value.trim() + "--Column--" + //RiderName
                    
                    ChargeEntry + "--Column--" + // Assign to the Cell --Charge Checkbox
                   
                             
                    table.rows[i].cells[5].children[0].value.trim() + "--Column--" +// Assign to the Cell -- Place
                   
                   
                    
                    table.rows[i].cells[6].children[0].value.trim() + "--Column--"+//HrsStatus 
                     table.rows[i].cells[4].children[1].value.trim() + "--Row--" ; //Amateur Relation
                }

       
    }
    
    return TableValues;
}



function GetDBClassValues() // When ever a new Column is added in the Class Details , we need to modify this
{

    var table = document.getElementById("ClassDetails");
    // --Row-- Each Row
    // --Column-- Each Column
    var TableDBValues = "";
    for (var i = 1; i < table.rows.length; i++) {

        var ChargeEntry="N";
        
          
        if(table.rows[i].cells[0].children[1].value.trim()!=''){

            if(table.rows[i].cells[4].children[0].checked)
            ChargeEntry="Y"
        
            TableDBValues = TableDBValues +
                    table.rows[i].cells[0].children[0].value.trim() + "--Column--" + //EventSeq
                    table.rows[i].cells[1].children[1].value.trim() + "--Column--" + //PFHA_Class_Code
                    table.rows[i].cells[2].children[1].value.trim() + "--Column--" + //Riderseq
                    
                    ChargeEntry + "--Column--" + //Include_Entry_Charge
                    table.rows[i].cells[6].children[0].value.trim() + "--Column--"+ //HrsStatus 
                    table.rows[i].cells[4].children[1].value.trim() + "--Row--"; //Amateur Relation 
                }

       
    }
 
    return TableDBValues;
}



/*
 *  This function is used when we click on the Radio button to fill the Class Details table from the hidden values
 * 
 */

function AssignClassValues(CurrentRow)
{
   
  try{
    radiobtn ="radHorseSelected"+ CurrentRow;
    document.getElementById(radiobtn).checked = true;
    
    document.getElementById("hdnSlc").value=document.getElementById("HorseAssignedNum"+CurrentRow).value
    
    var ClassDetailsRow = "HrsClassDetails" + CurrentRow; // Get ID of the current Horse Details row Selected
    var CurrentHorseRow_ClassDetails = document.getElementById(ClassDetailsRow).value; // Get Value of the current Horse Details row Selected
    var tableID_ClassDetails = document.getElementById("ClassDetails"); // Get table ID of the Class Details

    var ClassDetails_RowEach = CurrentHorseRow_ClassDetails.split("--Row--");// Split the current Selected Row Value into Rows


    /* First we need to Empty all the Class Details Rows, that were assigned previously */

    for (var i = 1; i < tableID_ClassDetails.rows.length; i++) {
     
        tableID_ClassDetails.rows[i].cells[0].children[0].value = ""; // Assign to the Cell
        tableID_ClassDetails.rows[i].cells[0].children[1].value = ""; // Assign to the Cell
        
        tableID_ClassDetails.rows[i].cells[1].children[0].value = ""; // Assign to the Cell
        tableID_ClassDetails.rows[i].cells[1].children[1].value = ""; // Assign to the Cell -- PFHA ClassCode
        
        tableID_ClassDetails.rows[i].cells[2].children[0].value = ""; // Assign to the Cell
        tableID_ClassDetails.rows[i].cells[2].children[1].value = ""; // Assign to the Cell

        tableID_ClassDetails.rows[i].cells[3].children[0].value = ""; // Assign to the Cell
        
        tableID_ClassDetails.rows[i].cells[4].children[0].checked=false; // Assign to the Cell --Charge Checkbox
        tableID_ClassDetails.rows[i].cells[4].children[1].value = ""; // Assign to the Cell--Amateur_Relation
        
        tableID_ClassDetails.rows[i].cells[5].children[0].value = ""; // Assign to the Cell -- Place
       
        document.getElementById("LblAmtRelation"+i).innerHTML="";
        
        tableID_ClassDetails.rows[i].cells[6].children[0].value = ""; // Assign to the Cell -- Status
    }
    /* End of First we need to Empty all the Class Details Rows, that were assigned previously */


    for (var j = 0; j < ClassDetails_RowEach.length - 1; j++) // Loop thru the Rows
    {
         
        var ClassDetails_ColEach = ClassDetails_RowEach[j].split("--Column--");  // Split the current Row Value into Columns

        tableID_ClassDetails.rows[j + 1].cells[0].children[0].value = ClassDetails_ColEach[0]; // EventSeq
        tableID_ClassDetails.rows[j + 1].cells[0].children[1].value = ClassDetails_ColEach[1]; // Class#
        
        tableID_ClassDetails.rows[j + 1].cells[1].children[0].value = ClassDetails_ColEach[2]; //Class Name
        tableID_ClassDetails.rows[j + 1].cells[1].children[1].value = ClassDetails_ColEach[3]; //  PFHA ClassCode
        
        tableID_ClassDetails.rows[j + 1].cells[2].children[0].value = ClassDetails_ColEach[4]; //Rider#
        tableID_ClassDetails.rows[j + 1].cells[2].children[1].value = ClassDetails_ColEach[5]; // Rider Sequence
        
        tableID_ClassDetails.rows[j + 1].cells[3].children[0].value = ClassDetails_ColEach[6]; //Rider Name
   
        if(ClassDetails_ColEach[7]=='Y')
            tableID_ClassDetails.rows[j + 1].cells[4].children[0].checked=true; // No Charge
        else
            tableID_ClassDetails.rows[j + 1].cells[4].children[0].checked=false; //No Charge
        
        tableID_ClassDetails.rows[j + 1].cells[4].children[1].value = ClassDetails_ColEach[10]; //Amateur_Relation
        
        
        document.getElementById("LblAmtRelation"+(j + 1)).innerHTML=ClassDetails_ColEach[10];
            
        
        tableID_ClassDetails.rows[j + 1].cells[5].children[0].value = ClassDetails_ColEach[8]; //Plcmnt
        tableID_ClassDetails.rows[j + 1].cells[6].children[0].value = ClassDetails_ColEach[9]; //Status
        
        
    }
  }
  catch (err) {
        alert(err.Description);
    }


}

function fnMakeRowSelected_Class(CurrentRow)
{
  
    radiobtn_ClsSelected ="ClsSelected"+ CurrentRow;
    document.getElementById(radiobtn_ClsSelected).checked = true;
   
}
function fnCheckHorseSelected()
{
    
    var table = document.getElementById("HrsDetails");
    HorseRowCnt = table.rows.length;
    var bAtleastOneRowSelected = false;

    for (var i = 1; i < HorseRowCnt; i++) {
        var SelectedRow = "radHorseSelected" + i;
        if (document.getElementById(SelectedRow).checked)
        {
            bAtleastOneRowSelected = true;
            break;

        }
    }
    if (!bAtleastOneRowSelected)
    {
        alert("Please select Horse name")
        return false;
    }
    return true;
}

function EmptyKey(hdnKey, ActualValue)
{

    if (document.getElementById(ActualValue).value == '')
    {
        document.getElementById(ActualValue).value = '';
        document.getElementById(hdnKey).value = '';
    }
   
}

function getHorseDetails(HorseRegNumValue, RegSeq, HorseName, HAge, HGender, HModality, HOwner,HOwnerID) {
    
    var xmlhttp;
    var HorseRegNum = HorseRegNumValue.value;
    if (HorseRegNum == "")
    {
        return;
    }
    
    HorseRegNum = Right(HorseRegNum, 8);
    

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
            var result = xmlhttp.responseText;
            result_ = result.split('--HName--');
          
            if (result_.length > 1)
            {

               if(result_[7].trim()==='' || result_[7].trim()==='0'){
                    HorseRegNumValue.value = HorseRegNum;
                    document.getElementById(RegSeq).value = result_[0];
                    document.getElementById(HorseName).value = result_[1];

                    if(document.getElementById(HOwner).value.trim()==='')
                    {
                        document.getElementById(HOwner).value = result_[5];
                        document.getElementById(HOwnerID).value = result_[6];
                    }

                     AutoSave();
                }
                else{
                     //HorseRegNumValue.value = "";
                     alert("This Horse was already registered with back# "+result_[7])
                     HorseRegNumValue.focus();
                }
            }
            else
            {
                HorseRegNumValue.value = "";
                document.getElementById(RegSeq).value = "";
                document.getElementById(HorseName).value = "";
                document.getElementById(HOwner).value = "";
                document.getElementById(HOwnerID).value ="";
            }
        }
    }
    xmlhttp.open("GET", "SM_AjaxInformation.jsp?src=HDetails&q=" + HorseRegNum, true);
    xmlhttp.send();
}


function getEventDetails(ShowSeq, ObjEventNum, EventSeq, EventName, RowNum,ObjRiderNum,varSrcCallled) {
// Parameter are ShowSeqValue -- This is used to Get the EventSeq using ShowSeq and EventNumber, 
// EventNum Textbox Object -- This is used to Get the EventSeq using ShowSeq and EventNumber, 
//  EventSeq Textbox Object -- This is used to set the EventSeq from the resultSet, 
//  EventName Textbox Object -- This is used to set the EventName from the resultSet, 
//  Current Row Nuber -- This is used to set the Status of the Each row to 'A' by default



    var d = new Date();
    var rand = d.getMilliseconds();
    var xmlhttp;

//  get EventNum value, if the value is empty, return false;

    var EventNumVal = ObjEventNum.value;
    var bCurrentEvent=false;
    var bDuplicateClass=false;
    
    $(':input.DuplEventNum').each(function() {
       
       if(this.id === ObjEventNum.id)
           bCurrentEvent=true;
          
      if(!bCurrentEvent && (document.getElementById(this.id).value === EventNumVal)) {
       
          bCurrentEvent=false;
          bDuplicateClass=true;
           return false; //break
                  
      }
      
    });
  
   if(bDuplicateClass){
         alert('Horse already registered in this class')
          ObjEventNum.focus();
          ObjEventNum.value=""
          return false;
   }

    if (EventNumVal == "")
    {
        document.getElementById(EventSeq).value = "";
        document.getElementById(EventName).value = "";
        DefaultInactivateStatus('ClsStatus' + RowNum);
        return;
    }
    
    if (typeof varSrcCallled === "undefined" && varSrcCallled === null) {
      
        varSrcCallled='AvEntries';
    }

   
    var RegSeq = "";
    var RegNum = "";
    var rtnEligible = "";

    //  get SelRegSeq Value and Registration name of the selected Row, if the value is empty, return false;
  
 
    if(varSrcCallled==='AvEntries'){
        var table = document.getElementById("HrsDetails");
        var HorseRowCnt = table.rows.length;
        for (var i = 1; i < HorseRowCnt; i++) {
            var SelectedRow = "radHorseSelected" + i;
            var SelRegSeq = "HorseRegSeq" + i;
            var SelRegNum = "HorseName" + i;
            if (document.getElementById(SelectedRow).checked)
            {
                RegSeq = document.getElementById(SelRegSeq).value;
                RegNum = document.getElementById(SelRegNum).value;
                
                break;
            }
        }
    }
    else if(varSrcCallled==='Entry_Back'){
        RegSeq = document.getElementById('HorseRegSeq').value;
    }


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
            var result = xmlhttp.responseText.trim();
            result_ = result.split('--EN--');
          
            if (result_.length > 1)
            {
               if (result_.length > 2)
                {
                    rtnEligible = result_[2];
                }
              
                if(rtnEligible.trim() == 'Combine'){
                   
                    var options = {
                    url: "SM_CombineAlert.jsp?Seq="+result_[0]+"&RegSeq="+RegSeq,
                    title:'This is a Combine Class',
                    size: eModal.size.md,
                        buttons: [
                        {id:'CA_OK',text: 'OK', style: 'info', close: true,  click: function(){
                            if($('input[name=OptPfha_Cls_Cd]:checked').length==0)
                            {
                                eModal.alert('Please select atleast One Code','Alert')
                                return false;
                               
                            }
                                var optSelectedClassCode = $('input[name=OptPfha_Cls_Cd]:checked', '#frmCombine').val()
                                
                                document.getElementById("ClsCode"+RowNum).value=optSelectedClassCode;
                                document.getElementById(EventSeq).value = result_[0];
                                document.getElementById(EventName).value = result_[1];
                          
                                
                                
                                ObjRiderNum.focus();
                                DefaultActiveStatus(EventNumVal, 'ClsStatus' + RowNum);
                                if(varSrcCallled==='AvEntries')
                                    AddSelectedClassDetails();

                                
                        } },
                        {text: 'Cancel', style: 'danger', close: true}
                        ]
                    };

                    eModal.ajax(options);
                    
                    
                    
                }

                else if (rtnEligible.trim() == 'Eligible')
                {
                    document.getElementById(EventSeq).value = result_[0];
                    document.getElementById(EventName).value = result_[1];
                    document.getElementById("ClsCode"+RowNum).value = result_[10];
                    DefaultActiveStatus(EventNumVal, 'ClsStatus' + RowNum);
                    if(varSrcCallled==='AvEntries')
                        AddSelectedClassDetails("Y");
                    if(ObjRiderNum.value==='')
                        ObjRiderNum.focus();
                }
                else {
                    $(function() {

                        var strReason = '<b>' + RegNum + '</b> does not meet the class (<b>' + result_[1] + '</b>) criteria ';
                        strReason += "<br> Horse Details are " + result_[4] + " " + result_[5] + " year " + result_[3]
                        strReason += "<br> Class Details are " + result_[7] + " " + result_[8] + "-" + result_[9] + " year " + result_[6]
                        $('#dialog-confirm').html(strReason);
                        $("#dialog-confirm").dialog({
                            resizable: false,
                            height: 240,
                            position: ['top',40],
                            width: 640,
                            modal: true,
                            buttons: {
                                "Continue": function() {
                                    document.getElementById(EventSeq).value = result_[0];
                                    document.getElementById(EventName).value = result_[1];
                                    document.getElementById("ClsCode"+RowNum).value = result_[10];
                                    DefaultActiveStatus(EventNumVal, 'ClsStatus' + RowNum);
                                    if(varSrcCallled==='AvEntries')
                                        AddSelectedClassDetails();
                                    
                                    $(this).dialog("close");
                                     if(ObjRiderNum.value==='')
                                        ObjRiderNum.focus();
                                },
                                Cancel: function() {
                                    ObjEventNum.value = "";
                                    
                                    document.getElementById(EventSeq).value = "";
                                    document.getElementById(EventName).value = "";
                                    document.getElementById("ClsCode"+RowNum).value = "";
                                    $(this).dialog("close");
                                     if(ObjRiderNum.value==='')
                                        ObjEventNum.focus();
                                },
                                "Horse Details": function() {
                                    var randomVal = randomString();
                                    NewWindow("SM_Registration.jsp?" + randomVal + "&mode=1&paramRegSeq=" + RegSeq, 'mywin', '800', '400', 'no', 'center')
                                }
                            }
                        });
                    });
                }


            }
            else
            {
                ObjEventNum.value = "";
                
                document.getElementById(EventSeq).value = "";
                document.getElementById(EventName).value = "";
                document.getElementById("ClsCode"+RowNum).value = "";
                
                eModal.alert('Please enter the correct Class Number','Alert');
                $('.modal-dialog').on('hide.bs.modal', function (e) {
                   ObjEventNum.focus();
                });

               
                 
            }
        }
    }

    xmlhttp.open("GET", "SM_AjaxInformation.jsp?" + rand + "&src=EvnDetails&shSeq=" + ShowSeq + "&q=" + EventNumVal + "&HIdentSeq=" + RegSeq, true);
    xmlhttp.send();


}
function getEventDetails_HotKey(ShowSeq, ObjEventNum, EventSeq, EventName, RowNum,ObjRiderNum,varSrcCallled,e){
    
    var code = (e.keyCode ? e.keyCode : e.which);
     
    if(code === 13) { //Enter keycode
       
        getEventDetails(ShowSeq, ObjEventNum, EventSeq, EventName, RowNum,ObjRiderNum,varSrcCallled)
    }
}

function ValidateAge_Horse_Class_CallDB(VarEvnNumber, VarRegSeq, VarRegNum, VarShowSeq)
{
    var xmlhttp;

    if (VarRegSeq == "")
    {
        return;
    }

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
            var result = xmlhttp.responseText;
            result_ = result.split('--Column--');

            if (result_.length > 1)
            {

                if (result_[0].trim() == "NotEligible")
                {
                    alert('This Horse is Not Eligible in this class')

                }

            }

        }
    }
    xmlhttp.open("GET", "SM_AjaxInformation.jsp?src=ValidateClass_Hrs&q=" + VarEvnNumber + "&HIdentSeq=" + VarRegSeq + "&ShowIdentSeq=" + VarShowSeq, true);
    xmlhttp.send();


}
function num(x, y) {
    if (x !== y) {
        return false;
    }
    if (x < 5) {
        return 5;
    }
    return x;
}
function getRiderDetails(ObjRiderNum, RiderSeq, RiderName,EventSeq,PFHAClassCode,varSrcCallled) {
   

    var xmlhttp;

    var RiderNumVal = ObjRiderNum.value;
    if (RiderNumVal == "")
    {
        return;
    }
    
    if (typeof varSrcCallled === "undefined" && varSrcCallled === null) {
        varSrcCallled='AvEntries';
    }
    
 
    var RegSeq = "";
    var RegNum = "";
    var rtnEligible = "";

    if (varSrcCallled === 'AvEntries') {
        var table = document.getElementById("HrsDetails");
        var HorseRowCnt = table.rows.length;
        for (var i = 1; i < HorseRowCnt; i++) {
            var SelectedRow = "radHorseSelected" + i;
            var SelRegSeq = "HorseRegSeq" + i;
            var SelRegNum = "HorseName" + i;
            if (document.getElementById(SelectedRow).checked)
            {
                RegSeq = document.getElementById(SelRegSeq).value;
                RegNum = document.getElementById(SelRegNum).value;
                break;
            }
        }
    }
    var CurrentEvent=document.getElementById(EventSeq).value
    var CurrentPFHAClassCode=document.getElementById(PFHAClassCode).value
    
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
            var result = xmlhttp.responseText.trim();
           
          
            result_ = result.split('--EName--');
           
                         
             if(result_[0].trim()=='NotEligible'){
                var errors=result_[1].trim();
                var errors_desc=result_[2].trim();
                errors_=errors.split(';');
                errors_desc_=errors_desc.split(';');
             
     
                 var Amtoptions = {
                    message: errors_desc_[0],
                    title: 'Amateur Class - Eligibility Check',
                    size: 'md',
                    useBin: true,
                    buttons: [
                        {text: 'OverRide Flag', style: 'danger', close: true, click: function(){
                                if(errors_.length>1 && errors_[1]=='2')
                                    eModal.alert(YtAgeoptions);
                                else{
                                    if(result_[9]!='')
                                    {
                                         var Rwnumb = RiderName.match(/\d/g);    
                                        document.getElementById("AmtRelation"+Rwnumb).value=result_[9].trim() 
                                        document.getElementById("LblAmtRelation"+Rwnumb).innerHTML= result_[9].trim() 
                                    }
                                   else
                                       AddRelationship(RiderName,'');
                                }
                                
                                    document.getElementById(RiderSeq).value = result_[5];
                                    ObjRiderNum.value = result_[6];
                                    document.getElementById(RiderName).value = result_[7];
                                   
                                    if(varSrcCallled==='AvEntries')
                                        AddSelectedClassDetails("Y"); 
                            } 
                         },
                        {text: 'Cancel', style: 'info', close: true,click:function(){
                                if(errors_.length>1 && errors_[1]=='2')
                                    eModal.alert(YtAgeoptions);
                               
                                
                                ObjRiderNum.value = "";
                                ObjRiderNum.focus();
                                document.getElementById(RiderSeq).value = "";
                                document.getElementById(RiderName).value = "";
                                if(varSrcCallled==='AvEntries')
                                    AddSelectedClassDetails(); 
                            }
                        }
                        ]
                         
                };
                
                var YtAgeoptions = {
                    message: errors_desc_[1],
                    title: 'Youth Class - Age Eligibility Check',
                    size: 'md',
                    useBin: true,
                    buttons: [
                        {text: 'OverRide Flag', style: 'danger', close: true, click: function(){
                               if(errors_.length>2 && errors_[2]=='3')
                                eModal.alert(Yt_Stallion_options);
                               else
                                    AddRelationship(RiderName,'');
                                
                                    document.getElementById(RiderSeq).value = result_[5];
                                    ObjRiderNum.value = result_[6];
                                    document.getElementById(RiderName).value = result_[7];
                                    if(varSrcCallled==='AvEntries'){
                                     AddSelectedClassDetails(); 
                                     AutoSave();
                                 }
                                    else if(varSrcCallled==='Entry_Back'){
                                        AutoSave_EntryDetails();
                                    }
                             } 
                         },
                         {text: 'Cancel', style: 'info', close: true,click:function(){
                                ObjRiderNum.value = "";
                                ObjRiderNum.focus();
                                document.getElementById(RiderSeq).value = "";
                                document.getElementById(RiderName).value = "";
                                if(varSrcCallled==='AvEntries')
                                    AddSelectedClassDetails();
                            }
                        }
                        ]
                         
                };
                
                var Yt_Stallion_options = {
                    message:errors_desc_[2],
                    title: 'Stallion Eligibility Check ',
                    size: 'md',
                    useBin: true,
                    buttons: [
                        {text: 'OverRide Flag', style: 'danger', close: true, click: function(){
                                document.getElementById(RiderSeq).value = result_[5];
                                ObjRiderNum.value = result_[6];
                                document.getElementById(RiderName).value = result_[7];
                                if(varSrcCallled==='AvEntries'){
                                    AddSelectedClassDetails();    
                                    AutoSave();
                                }
                                else if(varSrcCallled==='Entry_Back'){
                                    AutoSave_EntryDetails();
                                }
                            } 
                         },
                         {text: 'Cancel', style: 'info', close: true,click:function(){
                                ObjRiderNum.value = "";
                                ObjRiderNum.focus();
                                document.getElementById(RiderSeq).value = "";
                                document.getElementById(RiderName).value = "";
                                if(varSrcCallled==='AvEntries')
                                    AddSelectedClassDetails();
                            }
                        }
                        ]
                         
                };
                
                
                if(errors_[0]=='1'){
                  eModal.alert(Amtoptions);
                }
                else if(errors_[1]=='2')
                     eModal.alert(YtAgeoptions);
                else if(errors_[2]=='3')
                     eModal.alert(Yt_Stallion_options);
                
             }
            else{
                if (result_[1].trim().length > 1)
                {

                    document.getElementById(RiderSeq).value = result_[1];
                    ObjRiderNum.value = result_[2];
                    document.getElementById(RiderName).value = result_[3];
                   
                    if(result_[4].trim().length >=1 && result_[4].trim()==='Y'){
                        if(result_[5].trim().length >=1)
                        {
                             var Rwnumb = RiderName.match(/\d/g);    
                            document.getElementById("AmtRelation"+Rwnumb).value=result_[5].trim() 
                            document.getElementById("LblAmtRelation"+Rwnumb).innerHTML= result_[5].trim() 
                        }
                        else
                            AddRelationship(RiderName,'');
                        
                    }
                    if(varSrcCallled==='AvEntries'){
                        AddSelectedClassDetails("Y");
                        AutoSave();
                    }
                    else if(varSrcCallled==='Entry_Back'){
                        AutoSave_EntryDetails();
                    }
                }
                else
                {
                    ObjRiderNum.value = "";
                    ObjRiderNum.focus();
                    document.getElementById(RiderSeq).value = "";
                    document.getElementById(RiderName).value = "";
                      eModal.alert('Please enter the correct Rider Number');

                }
            }
        }
    }
    xmlhttp.open("GET", "SM_AjaxInformation.jsp?src=PersonDetails&q=" + RiderNumVal+"&EvnSeq="+CurrentEvent+"&PFHAC="+CurrentPFHAClassCode+"&RegSeq="+RegSeq, true);
    xmlhttp.send();
 

if(varSrcCallled==='AvEntries'){
     AddSelectedClassDetails();
    // AutoSave();
}


}
function AddRelationship(RiderName,Rln_Selected_Obj){

   Rln_Selected_Value='';
   if(Rln_Selected_Obj!=''){
        Rln_Selected_Value=document.getElementById(Rln_Selected_Obj).value
}
   
    var options_Amateur_Relation = {
      
        url: "SM_Add_Show_Exhibitor_AM_Relation.jsp?Rd="+RiderName+'&SelVal='+Rln_Selected_Value,
        title: 'Relationship',
        size: eModal.size.md,
        buttons: [
            {text: 'OK', style: 'info', close: true},
            {text: 'Cancel', style: 'info', close: true}
        ]
    };
    eModal.ajax(options_Amateur_Relation);
  
}
function DisplayAmt(CurrentRowNum)
{

    var ItemSeqRow = "ItemSeq" + CurrentRowNum;
    var QuantityRow = "Quantity" + CurrentRowNum;
    var PriceRow = "Price" + CurrentRowNum;
    var TotalRow = "Total" + CurrentRowNum;
    var ItemStatusRow = "ItemStatus" + CurrentRowNum;

    var GetVal = document.getElementById(ItemSeqRow).value;

    var GetVal_S = GetVal.split(',');

    document.getElementById(QuantityRow).value = "1";
    document.getElementById(PriceRow).value = GetVal_S[1];
    document.getElementById(TotalRow).value = GetVal_S[1];
    document.getElementById(ItemStatusRow).value = "A";
    
    AutoSave();


}

function DisplayPayDefaults(CurrentRowNum)
{

    var AmtRow = "txtAmtStatus" + CurrentRowNum;

    if (document.getElementById(AmtRow).value == "")
        document.getElementById(AmtRow).value = "A";


}

function AddNewExhibitor() {


    localStorage.setItem('lastTab','');
    var NewExhibitVal = parseInt(1, 10) + parseInt(document.getElementById('txtExhibitorCount').value, 10);
    document.forms[0].hidden.value = NewExhibitVal
    document.forms[0].Total.value = NewExhibitVal
   

    document.forms[0].method = "post";
    document.forms[0].action = "SM_Add_Show_Exhibitor.jsp?isNew=Y&exbSeq=" + NewExhibitVal;
    document.forms[0].target = "_self";
    document.forms[0].submit();
     

}


function moveFirst() {

    document.forms[0].hidden.value = 1;
    document.forms[0].method = "post";
    document.forms[0].action = "SM_Add_Show_Exhibitor.jsp?isNew=N";
    document.forms[0].target = "_self";
    document.forms[0].submit();
}

function moveLast() {
    var counter = 0;
    counter = parseInt(document.forms[0].DBTotal.value, 10);
    document.forms[0].hidden.value = counter;
    document.forms[0].method = "post";
    document.forms[0].action = "SM_Add_Show_Exhibitor.jsp?isNew=N";
    document.forms[0].target = "_self";
    document.forms[0].submit();
}
function movePrevious() {
    var counter = 0;
    counter = parseInt(document.forms[0].hidden.value, 10) - parseInt(1, 10);
    document.forms[0].hidden.value = counter;
    document.forms[0].method = "post";
    document.forms[0].action = "SM_Add_Show_Exhibitor.jsp?isNew=N";
    document.forms[0].target = "_self";
    document.forms[0].submit();
}

function moveNext() {
    var counter = 0;
    counter = parseInt(document.forms[0].hidden.value, 10) + parseInt(1, 10);
    document.forms[0].hidden.value = counter;
    document.forms[0].method = "post";
    document.forms[0].action = "SM_Add_Show_Exhibitor.jsp?isNew=N";
    document.forms[0].target = "_self";
    document.forms[0].submit();
}


function Add_Rider() {
    var randomVal = randomString();

    NewWindow("SM_Person.jsp?" + randomVal, 'mywin', '920', '380', 'no', 'center')
}

function JumpToPage() {
    var counter = 0;

    // This is to Check if we are entering a value that is greater than the total Number of rows
    // if the entered value is greater than the total number of rows default it to total number of row

    var CheckNum = isNaN(document.forms[0].hidden.value)
    if (CheckNum)
        return false;

    if (parseInt(document.forms[0].hidden.value, 10) > parseInt(document.forms[0].DBTotal.value, 10))
        document.forms[0].hidden.value = parseInt(document.forms[0].DBTotal.value, 10)

    counter = parseInt(document.forms[0].hidden.value);
    document.forms[0].hidden.value = counter;
    document.forms[0].method = "post";
    document.forms[0].action = "SM_Add_Show_Exhibitor.jsp?isNew=N";
    document.forms[0].target = "_self";
    document.forms[0].submit();

}
function onlyNos(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else {
            return true;
        }
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            return false;
        }
        return true;
    }
    catch (err) {
        alert(err.Description);
    }
}


function DefaultActiveStatus(CurrentObjVal, ObjID)
{

    if (CurrentObjVal == ''){
        document.getElementById(ObjID).value = '';
         //document.getElementById(objChargeEntry).checked=false;
    }
    else{
        document.getElementById(ObjID).value = 'A';
        //document.getElementById(objChargeEntry).checked=true;
    }


}


function DefaultActiveStatus_Hrs(CurrentObj, ObjID,ShowSeq)
{

    ValidateBackNum(CurrentObj,ShowSeq)

    if (CurrentObj.value == '')
        document.getElementById(ObjID).value = '';
    else
        document.getElementById(ObjID).value = 'A';


}

function DefaultInactivateStatus(ObjID)
{
    document.getElementById(ObjID).value = '';

}

function fnDynamicFldAutoComplete(NameFld, IdNum, seqNum, url) {
//$(function() {

    $("#" + NameFld).autocomplete({
         change: function() {
        if(NameFld.indexOf("Horse") > -1)
            return false;
       
           AddSelectedClassDetails("Y")
            if(NameFld.indexOf("RiderName") === -1)
               OpenPersonPop($( "#" +seqNum).val());
       },
        source: function(request, response) {
            $.ajax({
                url: url,
                dataType: "json",
                data: {txtExhibitorName: request.term},
                success: function(data) {
                    response($.map(data, function(item) {
                        return {
                            label: $.trim(item.Value),
                            id: item.id,
                            Num: item.Num
                        };
                    }));
                }
            });
        },
        minLength: 3,
        select: function(event, ui) {
            $('#' + seqNum).val(ui.item.id);
            $('#' + IdNum).val(ui.item.Num);
            
            if(NameFld.indexOf("Horse") > -1)
                $('#' + IdNum).focus();
          
        }
         
//    });
    });
    
}


function ValidateBackNum(VarAssgnNum, VarShowSeq)
{
    var xmlhttp;
   
   var VarAssgnNumVal=VarAssgnNum.value;
   
    if (VarAssgnNumVal == "")
    {
        return;
    }

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
            var result = xmlhttp.responseText;
           
            result_ = result.split('--Column--');
            if (result_.length > 1)
            {               
                    alert('Back Number '+VarAssgnNumVal+' was already assigned for '+result_[2])
                    VarAssgnNum.value='';
                    VarAssgnNum.focus();
                    
            }

        }
    }
    xmlhttp.open("GET", "SM_AjaxInformation.jsp?src=ValidateBackNum&q=" + VarAssgnNumVal +"&ShowIdentSeq=" + VarShowSeq, true);
    xmlhttp.send();


}

function RecalculateItems(VarEntAssgnNum,VarShowSeq){
    
    var xmlhttp;
     
    if (VarEntAssgnNum == "")
    {
        return;
    }

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
            var result = xmlhttp.responseText;
           
            if (result.length > 1)
            {               
                    alert("Recalculated Successfull")
            }

        }
    }
    xmlhttp.open("GET", "SM_AjaxInformation.jsp?src=ReCalc&q=" + VarEntAssgnNum +"&ShowIdentSeq=" + VarShowSeq, true);
    xmlhttp.send();

}

function SetEmailAddress(DestInptTxtObj,objChk) {

    try {

        var values = [];
        var group = document.getElementsByName(objChk);

        for (var i = 0; i < group.length; i++) {
            if (group[i].checked)
                values.push(group[i].value);
        }
        DestInptTxtObj.value = values.join(";");
    }
    catch (err) {
        alert(err.message)
    }
}


$(function(){
    $('#send_btn_email').click(function(e){
      e.preventDefault();
          
      $.post('SM_Send_Email.jsp', 
         $('#Emailform').serialize(), 
         function(data, status, xhr){
           if(status="success")
               alert("Email sent successfully")
         });
    
    });
});

function NavigateToClassDetails(){
   document.forms[0].EventNum1.focus()
}


function DefaultFocus(varLastWorkedField){
   
   //$("input[value='']:not([type='checkbox'], [type='button']):visible:first").focus();
}

function setCookie(cname, Objcvalue) {
   
    if(Objcvalue.checked)
        cvalue='true';
    else
        cvalue='false';
        document.cookie = cname + "=" + cvalue 
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
    }
    return "";
}

function checkCookie() {
    var ChkDetails = getCookie("ChkOpenPerDtl");
    if (ChkDetails === "true") {
       document.getElementById("chkOpen").checked=true;
    } else {
         document.getElementById("chkOpen").checked=false;
    }
}


          
function CopyRiderDetails(RiderName,RiderEntseq,Riderseq,varSrcCallled){
       
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
        var Riderseq_CuRow = "Riderseq" + CurrentRow;
        var RiderEntseq_CuRow = "RiderEntseq" + CurrentRow;
        var RiderName_CuRow= "RiderName" + CurrentRow;
        var EventSeq_CuRow= "EventSeq" + CurrentRow;
        var PFHAClassCode_CuRow= "ClsCode" + CurrentRow;
        
        document.getElementById(Riderseq_CuRow).value=document.getElementById(Riderseq).value
        document.getElementById(RiderEntseq_CuRow).value=document.getElementById(RiderEntseq).value
        document.getElementById(RiderName_CuRow).value=document.getElementById(RiderName).value
        document.getElementById(RiderEntseq_CuRow).focus();
      
        getRiderDetails(document.getElementById(RiderEntseq_CuRow), Riderseq_CuRow, RiderName_CuRow, EventSeq_CuRow, PFHAClassCode_CuRow, varSrcCallled)
    }
}

function CopyTrainerDetails(TrainerEntitySeq,TrainerMemberNum,TrainerName){
    
    var table = document.getElementById("HrsDetails");
    var HorseRowCnt = table.rows.length;
    for (var i = 1; i < HorseRowCnt; i++) {
        var SelectedRow = "radHorseSelected" + i;
        
        if (document.getElementById(SelectedRow).checked)
        {
            var TrainerEntitySeq_CuRow = "TrainerEntitySeq" + i;
            var TrainerMemberNum_CuRow = "TrainerMemberNum" + i;
            var TrainerName_CuRow= "TrainerName" + i;
            
            document.getElementById(TrainerEntitySeq_CuRow).value=document.getElementById(TrainerEntitySeq).value
            document.getElementById(TrainerMemberNum_CuRow).value=document.getElementById(TrainerMemberNum).value
            document.getElementById(TrainerName_CuRow).value=document.getElementById(TrainerName).value
            break;
        }
    }
    AutoSave();
    
}

function OpenOtherRidersbyRP(ObjRiderNum, RespPartyNum, ShowNumber, CurrentRow,varSrcCallled) {


    if (typeof varSrcCallled === "undefined" && varSrcCallled === null) {
        varSrcCallled='AvEntries';
    }
    
    var Riderseq_CuRow = "Riderseq" + CurrentRow;
    var RiderEntseq_CuRow = "RiderEntseq" + CurrentRow;
    var RiderName_CuRow = "RiderName" + CurrentRow;
    
   
    var options_Riders = {
        url: "SM_RidersByRP.jsp?Seq=" + RespPartyNum + "&ShowSeq=" + ShowNumber,
        title: 'Riders List',
        size: eModal.size.md,
        buttons: [
            {text: 'OK', style: 'info', close: true, click: function() {


                    var optRiderDetails = $('input[name=OptRidersByRp]:checked', '#frmRidersByRp').val()
                    optRiderDetails_=optRiderDetails.split('#@#')
                     document.getElementById(Riderseq_CuRow).value=optRiderDetails_[0]
                    document.getElementById(RiderEntseq_CuRow).value=optRiderDetails_[1]
                    document.getElementById(RiderName_CuRow).value=optRiderDetails_[2]
                    

                    if(varSrcCallled=='AvEntries')
                        AddSelectedClassDetails();
                }},
            {text: 'Cancel', style: 'danger', close: true}
        ]
    };

    eModal.ajax(options_Riders);
    
   
    


}

function UpdatePrice_Total(Units,Price,objTotalPrice)
{
   
    lvTotalPrice=0.00;
    lvTotalPrice=Number(Units)*Number(Price);
    objTotalPrice.value=Number(lvTotalPrice).toFixed(2);
    
    AutoSave();
}
function fnMoreHorseInfo(e,varRegValue){
    var code = (e.keyCode ? e.keyCode : e.which);
    if(code == 13) { //Enter keycode
        
        var randomVal = randomString();
        NewWindow("SM_Registration.jsp?mode=SR&paramRegNum="+varRegValue, 'mywin_HrsSearch', '750', '200', 'no', 'center')
       
    };

    
}

function Check_If_Results_Entered(currentRow,evn){
    
    evn = (evn) ? evn : window.event;
    var charCode = (evn.which) ? evn.which : evn.keyCode;
    if (charCode !== 09) {
        if (document.getElementById("ClsResults" + currentRow).value !== '') {
            alert('This entry has a placement in the Class.This cannot be deleted/Scratched')
            evn.preventDefault();
        }
    }
    
}

function Check_If_Results_Entered_Horse(currentRow,evn){
    
   
    evn = (evn) ? evn : window.event;
    var charCode = (evn.which) ? evn.which : evn.keyCode;
  
    if (charCode > 31 && !(charCode ===65 || charCode ===73 || charCode ===97 || charCode ===105)) {
         evn.preventDefault(); 
    }
  
    var ClassDetails=document.getElementById("HrsClassDetails"+currentRow).value
     var ClassDetails_RowEach1 = ClassDetails.split("--Row--");// Split the current Selected Row Value into Rows
     
     for(var i=0;i<ClassDetails_RowEach1.length-1;i++) // the Last one is giving undefined, so checking for -1
       {  
           var ClassDetails_ColEach1 = ClassDetails_RowEach1[i].split("--Column--");// Split the current Selected Row Value into Rows
           if(ClassDetails_ColEach1[8]!==''){
                alert('This entry has a placement in the Class.This cannot be deleted')
                evn.preventDefault();  
                return false;
                
            }
    }
       
     
   return true;
    
}

function OpenResultsVerification(ShowSeq) {

    var options_PayBack = {
        url: "SM_Results_Verification.jsp",
        title: 'Results Verification',
        size: eModal.size.lg,
        buttons: [
            {text: 'Close', style: 'info', close: true},
            {text: 'Publish All Results Entered', style: 'info', close: true, click: function() {
                    var jqxhr = $.post("SM_Results_Verification_Submit.jsp", function(data) {
                })

                    .fail(function() {
                        alert("Problem publishing results");
                   })
                    
                }
            }
        ]
    };

    eModal.ajax(options_PayBack);
}

function DynamicBSModal(varID,varPageID,ShwVal,FromVal,ToVal){
     var randomVal = randomString();
      var options_PayBack = {
        url: "SM_label_Resp_Settings.jsp",
        title: 'Print Labels',
        size: eModal.size.md,
        buttons: [
            {text: 'Close', style: 'info', close: true},
            {text: 'Print', style: 'info', close: true, click: function() {
                    document.forms["frmDlgLabels"].method = "post";
                    document.forms["frmDlgLabels"].action = "../SMLabels?" + randomVal + "&PageID=" + varPageID + "&SIdent=" + ShwVal + "&Ident1=" + FromVal + "&Ident2=" + ToVal;
                    document.forms["frmDlgLabels"].target = "_blank";
                    document.forms["frmDlgLabels"].submit();
                    $('#'+varPageID).modal('hide');
                                    
                }
            }
        ]
    };

    eModal.ajax(options_PayBack);  
}

function getPersonInfoByMemberNum_Resp(varSeqObj,VarNumObj,VarNameObj){

 var VarNumVal=VarNumObj.value.trim();
 var formName=document.forms[0].name
 
 if(VarNumVal.length===0)
     return false
    var request = $.ajax({
    url: "SM_Json_Persons.jsp?txtMember_Num="+VarNumVal,
    method: "POST",
    dataType: 'json'
  });

    request.done(function( msg ) {

        if(msg!=''){
           varSeqObj.value=msg[0].id;
           VarNumObj.value=msg[0].Num;
           VarNameObj.value=msg[0].Value;
           OpenPersonPop(varSeqObj.value)
            AutoSave()
        } 
       
    else
    {
        varSeqObj.value=''
        VarNumObj.value='';
        VarNameObj.value='';
        VarNumObj.focus();
      

    }
 
});
}


function DeleteHorseEntry(varHrsStatusObj,RowNum,evn) {


    var bcontinue= Check_If_Results_Entered_Horse(RowNum,evn);
  
   if(bcontinue){
        var title = "Confirm";
        var Message = "Are you Sure want to Delete";

        eModal.confirm(Message, title)
                .then(function()
                {
                    document.getElementById(varHrsStatusObj).value = 'I'
                    submitForm(document.forms[0].name, "N")
                },
                        function() {
                        }
                );
}


}
function SetFocus(varObjFieldID){
    if(document.getElementById(varObjFieldID))
        document.getElementById(varObjFieldID).focus()
}