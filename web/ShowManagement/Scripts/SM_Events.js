var bKeyBoard='Y' 
var choices = [];
choices[0] = "All";
choices[1] = "PasoFino";
choices[2] = "Trocha";
choices[3] = "Trocha y galope";
choices[4] = "Trote y galope";

var CategoryChoice = [];
CategoryChoice[0] = "Select";
CategoryChoice[1] = "PasoFino";
CategoryChoice[2] = "Equitation";
CategoryChoice[3] = "Performance";
CategoryChoice[4] = "Pleasure";
CategoryChoice[5] = "Geldings";
CategoryChoice[6] = "Amateur Owner";
CategoryChoice[7] = "Bellas Formas";
CategoryChoice[8] = "Trocha";
CategoryChoice[9] = "Trocha y galope";
CategoryChoice[10] = "Trote y galope";

var OrdSplitValue = ["", "A", "B", "C", "D"];




$(function() {

    $(".datepick").datepicker(
            {changeYear: true,
                changeMonth: true,
            });
            
   $("#EventsTable").on("keyup", "input", function (e) {
    
    if(bKeyBoard==='Y'){
    switch (e.keyCode) {
        case 37:  
            // alert('left');    
            $(this).closest('td').prev().find('input').focus();  
            break;
        case 38:
          // alert('up');
             $(this).closest('tr').prev().find('td:eq(' + $(this).closest('td').index() + ')').find('input').focus();
            break;
        case 39:
           // alert('right');
            $(this).closest('td').next().find('input').focus();  
            break;
        //onClick="Copy_Current_RowNumber(txtOrderOfGo${(Cnt.index)+1})"case 13:
        case 40:
            $(this).closest('tr').next().find('td:eq(' + $(this).closest('td').index() + ')').find('input').focus();   
                
            break;
    } 
    }
 });

});




function SplitRow()
{
    $("#dialog-SplitClass").dialog("close");
    var table = document.getElementById("EventsTable");

    /* this value is set at the click of the split icon */
    var CurrentRow_Split = document.getElementById("hdnCurrentRowSelect_Split").value;




    for (var k = 1; k < 4; k++) // Split Size
    {

        var row = table.insertRow(parseInt(CurrentRow_Split, 10) + k);

        var varActOrder = table.rows[CurrentRow_Split].cells[0].children[1].value;
        var varOrder = varActOrder + OrdSplitValue[k];

        var varDate = table.rows[CurrentRow_Split].cells[1].children[0].value;
        var varName = table.rows[CurrentRow_Split].cells[2].children[0].value;
        var varCategory = table.rows[CurrentRow_Split].cells[3].children[0].value;
        var varAire = table.rows[CurrentRow_Split].cells[4].children[0].value;
        var varGender = table.rows[CurrentRow_Split].cells[5].children[0].value;
        var varAge = table.rows[CurrentRow_Split].cells[6].children[0].value;
        var varPointed = table.rows[CurrentRow_Split].cells[7].children[0].value;
        var varFee = table.rows[CurrentRow_Split].cells[8].children[0].value;



        var AireOption = "<select>";
        for (i = 0; i < choices.length; i = i + 1) {
            if (i == 1)
                AireOption = AireOption + "<option value='" + i + "' selected>" + choices[i] + "</option>";
            else
                AireOption = AireOption + "<option value='" + i + "' >" + choices[i] + "</option>";
        }
        AireOption = AireOption + "</select>";


        var CatOption = "<select>";
        for (i = 0; i < CategoryChoice.length; i = i + 1) {
            CatOption = CatOption + "<option value='" + i + "' >" + CategoryChoice[i] + "</option>";
        }
        CatOption = CatOption + "</select>";


        var radioGender = '<input type="radio" name="Gender' + i + '" value="O">O \n\
                                   <input name="Gender' + i + '"  type="radio" value="M">M \n\
                                   <input name="Gender' + i + '"  type="radio" value="F">F \n\
                                   <input name="Gender' + i + '"  type="radio" value="G">G';





        row.insertCell(0).innerHTML = '<input size=1 type="hidden"/><input size=1 type="text" value="' + varOrder + '" />';  // Order
        row.insertCell(1).innerHTML = '<input size=8 type="text" class="datepick"  value=' + varDate + ' />';  // Date
        row.insertCell(2).innerHTML = '<input type="text"  value="' + varName + '" />';   // Name
        row.insertCell(3).innerHTML = '<input type="text" size=8  />';   // Name
        //row.insertCell(3).innerHTML = CatOption; //Category
        row.insertCell(4).innerHTML = AireOption;  //Aire
        row.insertCell(5).innerHTML = radioGender;  //Gender
        row.insertCell(6).innerHTML = '<input type="text" size="1" /> <input type="text" size="1" />';//Age
        row.insertCell(7).innerHTML = '<input type="Checkbox" checked/>'; //Pointed
        row.insertCell(8).innerHTML = '<input type="text" size="2" value=' + varFee + ' />'; //Fee
        row.insertCell(9).innerHTML = ""; // buttons
    }

    $(".datepick").datepicker(
            {changeYear: true,
                changeMonth: true
            });

}


function AddBefore(tableRow)
{

    var table = document.getElementById("EventsTable");
    if (tableRow == -1)
        tableRow = table.rows.length;
    var row = table.insertRow(tableRow); // Current Row - 1 , it adds row before current row
tableRow=tableRow+1
    var AireOption = "<select>";
    for (i = 0; i < choices.length; i = i + 1) {
        if (i == 1)
            AireOption = AireOption + "<option value='" + i + "' selected>" + choices[i] + "</option>";
        else
            AireOption = AireOption + "<option value='" + i + "' >" + choices[i] + "</option>";
    }
    AireOption = AireOption + "</select>";


    var CatOption = "<select>";
    for (i = 0; i < CategoryChoice.length; i = i + 1) {
        CatOption = CatOption + "<option value='" + i + "' >" + CategoryChoice[i] + "</option>";
    }
    CatOption = CatOption + "</select>";

    var radioGender = '<input type="Checkbox" name="O_Gender' + tableRow + '" value="O">O \n\
                                   <input name="M_Gender' + tableRow + '"  type="Checkbox" value="M">M \n\
                                   <input name="F_Gender' + tableRow + '"  type="Checkbox" value="F">F \n\
                                   <input name="G_Gender' + tableRow + '"  type="Checkbox" value="G">G';

    //row.insertCell(0).innerHTML = ''; // EventSeq
    row.insertCell(0).innerHTML = '<input  class="SwapCls" type="Checkbox" name="CheckSwap" style="visibility:hidden">';  // Order
    row.insertCell(1).innerHTML = '<input size=1 type="text" name="txtEventOrder"'+tableRow+'/><input name="txtEventSeq"'+tableRow+' size=1 type="hidden"/>\n\
    <input type="hidden"  size="2" name="txtOrderOfGo'+tableRow+'" >';  // Order
    row.insertCell(2).innerHTML = '<input size=8 type="text" class="datepick" name="txtDate'+tableRow+'"/>';  // Date
    row.insertCell(3).innerHTML = '<input type="text" size=50 class="EventName" autocomplete="off" name="txtEventName'+tableRow+'" \n\
    onKeyPress="GetEventData(this,txtCategory'+tableRow+',O_Gender'+tableRow+',M_Gender'+tableRow+',F_Gender'+tableRow+',G_Gender'+tableRow+',from'+tableRow+',To'+tableRow+')" />';   // Name
     row.insertCell(4).innerHTML = '<input type="text" size=10 name="txtCategory'+tableRow+'"  />';   // Category
    //row.insertCell(3).innerHTML = CatOption; //Category
    //row.insertCell(4).innerHTML = AireOption;  //Aire
    row.insertCell(5).innerHTML = radioGender;  //Gender
    row.insertCell(6).innerHTML = '<input type="text" size="1" name="from'+tableRow+'" /> <input type="text" size="1" name="To'+tableRow+'" />';//Age
    row.insertCell(7).innerHTML = '<input type="checkbox" checked name="Pointed'+tableRow+'" />'; //Pointed
    row.insertCell(8).innerHTML = '<input type="text" size="2" name="Fee'+tableRow+'" />'; //Fee
    row.insertCell(9).innerHTML = ""; // buttons


    $(".datepick").datepicker(
            {changeYear: true,
                changeMonth: true
            });
    document.getElementById("hdnEventCount").value=tableRow;
}



function AddBefore_fromPop(tableRow, SelectedRowValues)
{
    var table = window.parent.document.getElementById("EventsTable");
    if (tableRow == -1)
        tableRow = table.rows.length;
    var row = table.insertRow(tableRow); // Current Row - 1 , it adds row before current row
    var SelectedRowValues_split = SelectedRowValues.split(",")

    var AireOption = "<select>";
    for (i = 0; i < choices.length; i = i + 1) {
        if (i == 1)
            AireOption = AireOption + "<option value='" + i + "' selected>" + choices[i] + "</option>";
        else
            AireOption = AireOption + "<option value='" + i + "' >" + choices[i] + "</option>";
    }
    AireOption = AireOption + "</select>";


    var CatOption = "<select>";
    for (i = 0; i < CategoryChoice.length; i = i + 1) {
        CatOption = CatOption + "<option value='" + i + "' >" + CategoryChoice[i] + "</option>";
    }
    CatOption = CatOption + "</select>";

    var radioGender = '<input type="radio" name="Gender' + i + '" value="O">O \n\
                                   <input name="Gender' + i + '"  type="radio" value="M">S \n\
                                   <input name="Gender' + i + '"  type="radio" value="F">M \n\
                                   <input name="Gender' + i + '"  type="radio" value="G">G';

    //row.insertCell(0).innerHTML = ''; // EventSeq
    row.insertCell(0).innerHTML = '<input size=1 type="text"/><input size=2 type="text"/>';  // Order
    row.insertCell(1).innerHTML = '<input size=8 type="text" class="datepick" />';  // Date
    row.insertCell(2).innerHTML = '<input type="text" value="' + SelectedRowValues_split[0] + '"/>';   // Name
    row.insertCell(3).innerHTML = '<input type="text" />';   // Category
    //row.insertCell(3).innerHTML = CatOption; //Category
    row.insertCell(4).innerHTML = AireOption;  //Aire
    row.insertCell(5).innerHTML = radioGender;  //Gender
    row.insertCell(6).innerHTML = '<input type="text" size="1" value="' + SelectedRowValues_split[3] + '"/> <input type="text" size="1" value=' + SelectedRowValues_split[4] + '/>';//Age
    row.insertCell(7).innerHTML = '<input type="checkbox" checked/>'; //Pointed
    row.insertCell(8).innerHTML = '<input type="text" size="2"/>'; //Fee
    row.insertCell(9).innerHTML = ""; // buttons


    window.parent.jQuery(".datepick").datepicker(
            {changeYear: true,
                changeMonth: true
            });
    UpdateRows_fromPop();
}

function UpdateRows_fromPop()
{

    var table = window.parent.document.getElementById("EventsTable");
    var cellValue = '\
                <img style="cursor:pointer" title="Insert new class" src="images/tab_new_r.png" onclick="AddBefore(this.parentNode.parentNode.rowIndex)"/>\n\
                <img style="cursor:pointer" title="Delete class" src="images/erase.png" onclick="DeleteCurrent(this.parentNode.parentNode.rowIndex)">\n\
                <img style="cursor:pointer" title="Move class up" src="images/move_up.png" onclick="move(this.parentNode.parentNode.rowIndex,-1)"/>\
                <img style="cursor:pointer" title="Move class down" src="images/move_down.png" onclick="move(this.parentNode.parentNode.rowIndex,1)"/>';
    // <img style="cursor:pointer" title="Split class" src="images/arrow_split_left.png" onclick="DeleteCurrent(this.parentNode.parentNode.rowIndex)"/>

    for (var i = 1; i < table.rows.length; i++) {

        table.rows[i].cells[0].children[0].name = 'txtEventSeq' + i;
        table.rows[i].cells[0].children[0].type = 'hidden';

        table.rows[i].cells[0].children[1].name = 'txtEventOrder' + i;
        table.rows[i].cells[0].children[1].value = i;

        table.rows[i].cells[1].children[0].name = 'txtDate' + i;
        table.rows[i].cells[2].children[0].name = 'txtEventName' + i;
        table.rows[i].cells[3].children[0].name = 'txtCategory' + i;
        table.rows[i].cells[4].children[0].name = 'Air' + i;

        table.rows[i].cells[5].children[0].name = 'Gender' + i;
        table.rows[i].cells[5].children[1].name = 'Gender' + i;
        table.rows[i].cells[5].children[2].name = 'Gender' + i;
        table.rows[i].cells[5].children[3].name = 'Gender' + i;

        table.rows[i].cells[6].children[0].name = 'from' + i;
        table.rows[i].cells[6].children[1].name = 'To' + i;

        table.rows[i].cells[7].children[0].name = 'Pointed' + i;
        table.rows[i].cells[8].children[0].name = 'Fee' + i;

        table.rows[i].cells[9].innerHTML = cellValue;
    }

    window.parent.document.forms[0].hdnEventCount.value = table.rows.length - 1;


}

function UpdateRows()
{

    var table = document.getElementById("EventsTable");

    try {
        for (var i = 1; i < table.rows.length; i++) {

            table.rows[i].cells[1].children[2].value = i; // hidden txtOrderOfGo$
        }
    }
    catch (err) {
        alert(err.message)
    }
}





function GetNum(num) {
   num = num.replace(/[^0-9]+/g,"");
   return num;
}

function alphaOnly(str) {
    str = str.replace(/[^a-zA-Z]+/g,"");
    return str;
}


function DeleteCurrent(tableRow1,varShowSeq,varEventSeq,varUser)
{
   
  
  
   
    var table = document.getElementById("EventsTable");
    if (tableRow1 == -1)
        tableRow = table.rows.length;
    
    
    if (confirm("Are you sure want to delete the class!") == true) 
    {
      if(varEventSeq.length>0){
       $.ajax({
        type: "POST",
        url: "SM_AjaxInformation.jsp?src=DeleteClass&ShowSeq="+varShowSeq+"&EventSeq="+varEventSeq+"&User="+varUser,
        cache: false,
        dataType: "text",
        error: onError,
        success: function(data){
            
            if (data.trim() !='Success'){
               return false;
           }
           
           table.deleteRow(tableRow1); // Current Row - 1 , it adds row before current row
        }
       });
     }
     else
         table.deleteRow(tableRow1); // Current Row - 1 , it adds row before current row
    
    
 }

   // UpdateRows();
}
      

function onError(request)
{

     alert('Alert',"An error has occurred:  HTTP Code: " + request.status)
}
function move(Selected_row_toMove, direction) {

    try {
        var tbl = document.getElementById('EventsTable');
        
        var DestinationIndex=Number(document.getElementById('hdnCurrentRowSelect_Move').value)

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
        document.getElementById('hdnCurrentRowSelect_Move').value='';
        $('input[name=CheckSwap]').attr('checked', false);
        UpdateRows();
    }
    catch (err) {
        alert(err.message)
    }
}

function SplitClassDialog(CurrentRow)
{
    /* this checkbox is used to get the row selected on the split icon */

    document.getElementById("hdnCurrentRowSelect_Split").value = CurrentRow
    $("#dialog-SplitClass").dialog({
        width: 300,
        height: 150,
        position: ['top', 100]
    });
}



function AddStandardValues_ToTable() {

    var parentTable = window.parent.document.getElementById('EventsTable'); // Get the opener window
    var ValuesRowSize = document.forms[0].hdnValuesSize.value; // Total Rows in the StandardList of Pop up

    for (var i = 1; i <= ValuesRowSize; i++)  // for all the selected rows in the pop up
    {
        var vRow = "chkSelected" + i;    // get the name of the check box
        if (document.getElementById(vRow).checked)  // if the check box is selected 
        {

            var bInserted = false;
            for (var j = 1; j < parentTable.rows.length; j++) // loop through the parent table
            {
                var SelectedRowValues_split = document.getElementById(vRow).value.split(",")

                if (SelectedRowValues_split[0] == parentTable.rows[j].cells[2].children[0].value) {
                    var bconfirm = confirm("Item " + SelectedRowValues_split[0] + " already exists in the list in row " + j + ", \nPress OK to add CANCEL to skip")
                    if (bconfirm == false) {
                        bInserted = true;
                        break;
                    }

                }

                if (parentTable.rows[j].cells[2].children[0].value == "") // if the parent table cell is empty
                {
                    // Assign the selected Check box value to the main table
                    parentTable.rows[j].cells[0].children[0].value = j
                    parentTable.rows[j].cells[1].children[0].value = "09/16/2014"
                    parentTable.rows[j].cells[2].children[0].value = SelectedRowValues_split[0];
                    parentTable.rows[j].cells[6].children[0].value = SelectedRowValues_split[3];
                    parentTable.rows[j].cells[6].children[1].value = SelectedRowValues_split[4];
                    parentTable.rows[j].cells[7].children[0].checked = true;
                    bInserted = true;
                    break; // break the loop
                }

            }
            if (!bInserted) // if there are no rows to update the values
            {

                AddBefore_fromPop(-1, document.getElementById(vRow).value)
            }

        }
    }
    window.parent.jQuery('#link-0').remove(); // this is the ID assigned to the Pop up when it is opened
    window.parent.jQuery('#link-1').remove(); // this is the ID assigned to the Pop up when it is opened
    window.parent.jQuery('#link-2').remove(); // this is the ID assigned to the Pop up when it is opened
    window.parent.jQuery('#link-3').remove(); // this is the ID assigned to the Pop up when it is opened

}

function Copy_Current_RowNumber(CurrentRow){
    
    
    document.getElementById('hdnCurrentRowSelect_Move').value=CurrentRow.value
   // $('input[name=CheckSwap]').attr('checked', false);
    // $('input[name=CheckSwap]').attr('checked', true);
    
    var $unique = $('input.SwapCls');
    $unique.click(function() {
        $unique.filter(':checked').not(this).removeAttr('checked');
});
    
}
