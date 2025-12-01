
$(function() {
    $("input[value='']:not([type='checkbox'], [type='button']):visible:first").focus();
    
    $("#texRespPartyMNanme").autocomplete({
         //change: function() {
         //OpenPersonPop(document.forms[0].txtExhibitorEntitySeq.value)
      //},
        source: function(request, response) {
            
            
            
            $.ajax({
                url: "SM_Json_Persons_Exhibitor.jsp",
                dataType: "json",
                data: {txtExhibitorName: request.term},
                success: function(data) {
                   
                    response($.map(data, function(item) {
                        return {
                            label: $.trim(item.Value), // Name
                            id: item.id, // EntitySeq
                            Num: item.Num, // Member#
                            ShowAssnNum: item.ShowAssnNum, // EB#
                            ShowAssnSeq: item.ShowAssnSeq, // EBSeq
                            SM_EXH_BILL_TO: item.SM_EXH_BILL_TO ,
                            SM_EXH_STABLE: item.SM_EXH_STABLE, 
                            SM_NOTES: item.SM_NOTES 
                        };
                    }));
                }
            });
        },
        minLength: 3,
        select: function(event, ui) {
            
         
            if (ui.item.ShowAssnNum == '99999') {
                $('#texRespPartyESeq').val(ui.item.id);
                $('#texRespPartyMNum').val(ui.item.Num);
                $('#texRespPartyMNanme').val(ui.item.value);
                $('#txtExhibitorAssngNum').val('');
                $('#txtEhibitorSeq').val('');
                $('#txtNotes').val('');
                $('#txtStableWith').val('');
                $('#txtBillTo').val('');
                
            }
            else {
                $('#texRespPartyESeq').val(ui.item.id);
                $('#texRespPartyMNum').val(ui.item.Num);
                $('#texRespPartyMNanme').val(ui.item.value);
                $('#txtExhibitorAssngNum').val(ui.item.ShowAssnNum);
                $('#txtEhibitorSeq').val(ui.item.ShowAssnSeq);
                
                $('#txtNotes').val(ui.item.SM_NOTES);
                $('#txtStableWith').val(ui.item.SM_EXH_STABLE);
                $('#txtBillTo').val(ui.item.SM_EXH_BILL_TO);
             }
             
             AutoSave_EntryDetails();
             document.getElementById("Resp_Change_Counter").value='0'
        }
    });
    
});

function GetEntryDetails(ObjBack) {

    var ObjValue = ObjBack.value;
    if(ObjValue=='')
        return false;
    document.forms[0].method = "post";
    document.forms[0].action = "SM_Add_Show_Entry.jsp?AsnNum=" + ObjValue;
    document.forms[0].target = "_self";
    document.forms[0].submit();
}

function ResetEntryDetails() {
 
    document.forms[0].method = "post";
    document.forms[0].action = "SM_Add_Show_Entry.jsp";
    document.forms[0].target = "_self";
    document.forms[0].submit();
}

function NewEntryDetails() {
 
    document.forms[0].method = "post";
    document.forms[0].action = "SM_Add_Show_Entry.jsp";
    document.forms[0].target = "_self";
    document.forms[0].submit();
}

function SaveEntryDetails() {
  
    var bcontinue = 0; //true
    if (document.forms[0].txtback.value == '') {
        
        if (document.forms[0].texRespPartyESeq.value == '') {
            alert('Please enter Responsible Party Member# or Back#')
             bcontinue = 0;
        }
        else
            bcontinue = 1;
    }
    else{
         bcontinue = 1;
     }
    
            
            
    if (bcontinue === 1) {
        document.forms[0].method = "post";
        document.forms[0].action = "../ShowController?PageID=ENTRY_BACK";
        document.forms[0].target = "_self";
        document.forms[0].submit();
    }
}



function getHorseDetails_Entry_Back(HorseRegNumValue, RegSeq, HorseName, HAge, HGender, HModality, HOwner,HOwnerID) {
    
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
                try{
                    HorseRegNumValue.value = HorseRegNum;
                    document.getElementById(RegSeq).value = result_[0];
                    document.getElementById(HorseName).value = result_[1];
                    if(document.getElementById(HOwner).value.trim()=='')
                    {
                        document.getElementById(HOwner).value = result_[5];
                        document.getElementById(HOwnerID).value = result_[6];
                    }
                }
                catch(err){
                    eModal.alert(err.message,'Alert');
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


function fnCalculateServiceFee(amtPaid, ModeOfPay, objPercent, ObjTotalPaid) {

    var amtPaidVal = amtPaid.value;
    var PercentVal = 0.00

    if (objPercent.value == '' || objPercent.value == '0.00')
        PercentVal = document.getElementById("ShCCCharge").value
    else
        PercentVal = objPercent.value

    if (amtPaidVal != null && amtPaidVal != '' && ModeOfPay.value == '1') {
        //amtPaidVal=Number(amtPaidVal)*2.5;
        var Tax = (Number(amtPaidVal) / 100) * PercentVal;

        var Total = Number(Tax) + Number(amtPaidVal);
        objPercent.value = PercentVal; //Number(Tax).toFixed(2);
        ObjTotalPaid.value = Number(Total).toFixed(2);
    }
    else {
        objPercent.value = '0.00';
        ObjTotalPaid.value = amtPaidVal;

    }
 AutoSave();
}

function getResponsibleDetails(varValue,varSeqObj,VarNumObj,VarNameObj,varShAsgnSeq,varShAsgnNum){
 

 
 if(document.getElementById("txtback").value===''){
     var vCnf=confirm("There is no Back# entered.Do you want to Continue");
      if(!vCnf)
        return false
 }
 

 
 if(varValue.trim().length===0)
     return false
  var request = $.ajax({
  url: "SM_Json_Persons_Exhibitor.jsp?src=GetPFHA_Person_Details&txtMemNum="+varValue,
  method: "POST",
  dataType: 'json'
});
 
request.done(function( msg ) {

 if(msg!=''){
    varSeqObj.value=msg[0].id;
    VarNumObj.value=msg[0].Num;
    VarNameObj.value=msg[0].Value;
    varShAsgnSeq.value=msg[0].ShowAssnSeq;
    varShAsgnNum.value=msg[0].ShowAssnNum;
    
    document.getElementById("txtBillTo").value=msg[0].SM_EXH_BILL_TO;
    document.getElementById("txtStableWith").value=msg[0].SM_EXH_STABLE;
    document.getElementById("txtNotes").value=msg[0].SM_NOTES;
    
   
   
     if(msg[0].ShowAssnNum==='99999'){
         varShAsgnNum.value=''
         varShAsgnSeq.value=''
     }
//     else{
//         varShAsgnSeq.value=msg[0].ShowAssnSeq;
//          varShAsgnNum.value=msg[0].ShowAssnNum;
//      }

    AutoSave_EntryDetails();
    document.getElementById("Resp_Change_Counter").value='0'

} 
else
{
    varSeqObj.value=''
    VarNumObj.value='';
    VarNameObj.value='';
    varShAsgnSeq.value='';
    varShAsgnNum.value='';
    
    document.getElementById("txtBillTo").value="";
    document.getElementById("txtStableWith").value="";
    document.getElementById("txtNotes").value="";
}
 
});
 
request.fail(function( jqXHR, textStatus ) {
  alert( "Request failed: " + textStatus );
});
}

function Search_Person_EntryBack()
{
        var seq = "txtTrnESeq" ;
        var Num = "txtTrnMNum";
        var Name = "txtTrnMName";

        var randomVal = randomString();
        NewWindow("SM_SearchPerson.jsp?" + randomVal + "&ESQ=" + seq + "&ENUM=" + Num + "&EN=" + Name, 'mywin', '800', '400', 'no', 'center')
    }


function getPersonInfoByMemberNum(varSeqObj,VarNumObj,VarNameObj){

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

        } 
        
        if(formName==='frmAddShowEntry'){
          
            AutoSave_EntryDetails()
        }
    else
    {
        varSeqObj.value=''
        VarNumObj.value='';
        VarNameObj.value='';

    }
 
});

}

function fnDynamicFldAutoComplete_Horse_Entity(NameFld, IdNum, seqNum, url) {
//$(function() {

    var formName_Hrs_Entity=document.forms[0].name
    $("#" + NameFld).autocomplete({
         
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
            
             if(formName_Hrs_Entity==='frmAddShowEntry')
                AutoSave_EntryDetails()
          
        }

    });
    
}


function AutoSave_EntryDetails() {
    try {


   var bcontinue = 0; //true
    if (document.forms[0].txtback.value === '') {
        
        if (document.forms[0].texRespPartyESeq.value === '') {
             bcontinue = 0;
        }
        else
            bcontinue = 1;
    }
    else{
         bcontinue = 1;
     }
    
    
    if(bcontinue===0)
        return false;
    
        var form = $('#frmAddShowEntry');
        $status.attr('class', 'pending').text('changes pending');

        

        $.ajax({
            url: '../ShowController?PageID=ENTRY_BACK_AUTO',
            type: "POST",
            data: form.serialize(),
            error: function(jqXHR, textStatus, errorThrown) {
                console.log("FAIL: " + errorThrown);
            },
            success: function(data, textStatus, jqXHR) {


                var Success_Data = data.split('Horse_Details');
                var DataLength = Success_Data.length;


                document.getElementById("txtEhibitorSeq").value = Success_Data[0].trim();
                for (var i = 1; i < DataLength - 3; i++) {

                    var ClassDetails = Success_Data[i];
                    ClassDetails_spl = ClassDetails.split("Class_Details")
                    document.getElementById("txt_EXH_MST_HRS_SEQ").value = ClassDetails_spl[0].trim();
                    ClassDetails_spl_Details = ClassDetails[1].trim().split("#@#");
                }

                var Items = Success_Data[DataLength - 3]


                var Items_spl = Items.split("Item_Details_All")

                for (var i = 1; i < Items_spl.length; i++) {

                    var Items_spl_eachRow = Items_spl[i].split("Item_Details_pk")


                    //for(var iR=0;iR<Items_spl_eachRow.length;iR++){

                    document.getElementById("ItemTableSeq" + (i)).value = Items_spl_eachRow[0].trim();
                    document.getElementById("ItemSeq" + (i)).value = Items_spl_eachRow[1].trim() + ',' + Items_spl_eachRow[8].trim();
                    document.getElementById("ItemSeq" + (i)).options[document.getElementById("ItemSeq" + (i)).selectedIndex].text = Items_spl_eachRow[2].trim();
                    document.getElementById("Quantity" + (i)).value = Items_spl_eachRow[3].trim();
                    document.getElementById("Price" + (i)).value = Items_spl_eachRow[4].trim();
                    document.getElementById("Total" + (i)).value = Items_spl_eachRow[5].trim();
                    document.getElementById("ItemStatus" + (i)).value = Items_spl_eachRow[6].trim();
                    document.getElementById("ItemNotes" + (i)).value = Items_spl_eachRow[7].trim();
                    //}
                }

                var Items_Payments = Success_Data[DataLength - 2]

                var Items_Payments_spl = Items_Payments.split("#@#")
                for (var i = 1; i < Items_Payments_spl.length; i++) {

                    document.getElementById("PaymentSeq" + (i)).value = Items_Payments_spl[i].trim();
                }


                var Total_Fee_Details = Success_Data[DataLength - 1]

                var Total_Fee_Details_spl = Total_Fee_Details.split("#@#")

                document.getElementById("Total_Cls_Fee").innerHTML = Total_Fee_Details_spl[0].trim();
                document.getElementById("Total_Item_Fee").innerHTML = Total_Fee_Details_spl[1].trim();
                document.getElementById("Total_Paid").innerHTML = Total_Fee_Details_spl[2].trim();
                document.getElementById("Total_Balance").innerHTML = Total_Fee_Details_spl[3].trim();


                $('#status').attr('class', 'pending').text('changes saved');
            }
        });
    }
    catch (err) {
        alert(err);
    }


}
function fnCheckHorseSelected_BackEntry(){
    
    var HrsDetails=document.getElementById("HorseRegNum").value
   
    if((HrsDetails).trim()===''){
     alert("Please select Horse name")
     document.getElementById("HorseRegNum").focus()
     return false;
 }
}

function fnCheckRespChange(){
      
 vCnf_Update_Person =true
 if(document.getElementById("Resp_Change_Counter").value==='0'){
    if(document.getElementById("txtEhibitorSeq").value!==''){
        vCnf_Update_Person=confirm("You are trying to update the Responsible Person. Do you want to continue");

           if(!vCnf_Update_Person){
               
              return false;
        }
        document.getElementById("Resp_Change_Counter").value=1;
    }
 }
 
 return true;
 
}