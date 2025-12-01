function AddNewStandardClass(vSize) {

    document.getElementById("Actions").style.display = "none";
    document.getElementById("Actions_Commit").style.display = "table";

    var table = document.getElementById("StandardClassTable");
    document.forms[0].hdnNewValuesSize.value = vSize;
    var sortOrder=document.getElementById("LastSortOrder").value;
    sortOrder=Number(sortOrder)+1

    var row = table.insertRow(1);
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    var cell4 = row.insertCell(3);
    var cell5 = row.insertCell(4);
    var cell6 = row.insertCell(5);
    cell1.innerHTML = "&nbsp;";
    cell2.innerHTML = "<input type='text' name='txtSortSeq' size='2' autocomplete='off' value="+sortOrder+">";
    cell3.innerHTML = "<input type='text' name='txtClassName' size='35' autocomplete='off' autofocus>";
    cell4.innerHTML = "<input type='text' name='txtPfhaCode' size='15' autocomplete='off'>";
    cell5.innerHTML = "&nbsp;";
    cell6.innerHTML = "&nbsp;";
}

function SaveNewClass() {


    document.forms[0].method = "post";
    document.forms[0].action = "SM_StandardEvents_Save.jsp?mode=0";
    document.forms[0].target = "_self";
    document.forms[0].submit();
}

function CancelNew_AddClass() {

    document.getElementById("Actions").style.display = "table";
    document.getElementById("Actions_Commit").style.display = "none";


    if (document.forms[0].hdnNewValuesSize.value == '0')
        document.getElementById("StandardClassTable").deleteRow(1);
    else{
        CurrentRow=document.forms[0].hdnNewValuesSize.value
        
    document.getElementById("Lbl_Name" + CurrentRow).style.display = "";
    document.getElementById("Lbl_Code" + CurrentRow).style.display = "";
    document.getElementById("Lbl_Sort" + CurrentRow).style.display = "";
    
    document.getElementById("Inp_Name" + CurrentRow).style.display = "none";
    document.getElementById("Inp_Code" + CurrentRow).style.display = "none";
    document.getElementById("Inp_Sort" + CurrentRow).style.display = "none";
    }
}

function DeleteClassRow(CurrentRow) {

    document.forms[0].hdnNewValuesSize.value = CurrentRow;
    document.forms[0].method = "post";
    document.forms[0].action = "SM_StandardEvents_Save.jsp?mode=1"
    document.forms[0].target = "_self";
    document.forms[0].submit();
}

function EditClassRow(CurrentRow) {

    document.getElementById("Lbl_Name" + CurrentRow).style.display = "none";
    document.getElementById("Lbl_Code" + CurrentRow).style.display = "none";
    document.getElementById("Lbl_Sort" + CurrentRow).style.display = "none";
    
    document.getElementById("Inp_Name" + CurrentRow).style.display = "";
    document.getElementById("Inp_Code" + CurrentRow).style.display = "";
     document.getElementById("Inp_Sort" + CurrentRow).style.display = "";

    



    document.getElementById("Actions").style.display = "none";
    document.getElementById("Actions_Commit").style.display = "table";


    document.getElementById("Inp_Name" + CurrentRow).setAttribute("name", "txtClassName");
    document.getElementById("Inp_Code" + CurrentRow).setAttribute("name", "txtPfhaCode");
    document.getElementById("Inp_Sort" + CurrentRow).setAttribute("name", "txtSortSeq");

    document.forms[0].hdnNewValuesSize.value = CurrentRow;

    /* document.forms[0].method = "post";
     document.forms[0].action = "SM_Judges_List_Save.jsp?mode=2";
     document.forms[0].target = "_self";
     document.forms[0].submit();
     */
}
function SelectAllItems() {

    checkboxes = document.getElementsByName('chkSelectedItem');
    var UsrSelect = document.getElementById('SelectOpt');
    for (var i = 0, n = checkboxes.length; i < n; i++) {
        if (UsrSelect.checked)
            checkboxes[i].checked = true;
        else
            checkboxes[i].checked = false;
    }
}


function AddStandardClassValues_ToTable() {

    var parentTable = window.parent.document.getElementById('EventsTable'); // Get the opener window
    var ValuesRowSize = document.forms[0].hdnValuesSize.value; // Total Rows in the StandardList of Pop up
   
    for (var i = 1; i <= ValuesRowSize; i++)  // for all the selected rows in the pop up
    {
        var vRow = "chkSelected" + i;    // get the name of the check box
        if (document.getElementById(vRow).checked)  // if the check box is selected 
        {
        
            var currentRow=document.getElementById(vRow).value
            var ClassName=document.getElementById("Inp_Name"+currentRow).value;
            var PFHA_Code=document.getElementById("Inp_Code"+currentRow).value;
                
            for (var j = 1; j < parentTable.rows.length; j++) // loop through the parent table
            {
               if (ClassName == parentTable.rows[j].cells[2].children[0].value) {
                    var bconfirm = confirm(ClassName + " already exists in the list in row " + j + ", \nPress OK to add CANCEL to skip")
                    if (bconfirm == false) {
                        break;
                    }
                }
                if (parentTable.rows[j].cells[2].children[0].value == "") // if the parent table cell is empty
                {
                    alert('1')
                    // Assign the selected Check box value to the main table
                    parentTable.rows[j].cells[3].children[0].value = ClassName
                    parentTable.rows[j].cells[4].children[0].value = PFHA_Code
                   
                    break; // break the loop
                }

            }

        }
    }
    window.parent.jQuery('#link-1').remove(); // this is the ID assigned to the Pop up when it is opened

}


function Dbl_AddStandardClassValues_ToTable(SelectedRow) {

    var parentTable = window.parent.document.getElementById('EventsTable'); // Get the opener window
     
        var vRow = "chkSelected" + SelectedRow;    // get the name of the check box
        document.getElementById(vRow).checked=true;
        
        if (document.getElementById(vRow).checked)  // if the check box is selected 
        {
        
            var currentRow=document.getElementById(vRow).value
            var ClassName=document.getElementById("Inp_Name"+currentRow).value;
            var PFHA_Code=document.getElementById("Inp_Code"+currentRow).value;
                
            for (var j = 1; j < parentTable.rows.length; j++) // loop through the parent table
            {
               if (ClassName == parentTable.rows[j].cells[2].children[0].value) {
                    var bconfirm = confirm(ClassName + " already exists in the list in row " + j + ", \nPress OK to add CANCEL to skip")
                    if (bconfirm == false) {
                        break;
                    }
                }
                if (parentTable.rows[j].cells[2].children[0].value == "") // if the parent table cell is empty
                {
                    // Assign the selected Check box value to the main table
                    parentTable.rows[j].cells[2].children[0].value = ClassName
                    parentTable.rows[j].cells[3].children[0].value = PFHA_Code
                   
                    break; // break the loop
                }

            }

        }
    
    window.parent.jQuery('#link-1').remove(); // this is the ID assigned to the Pop up when it is opened

}


function validate(evt) {
  var theEvent = evt || window.event;
  var key = theEvent.keyCode || theEvent.which;
  key = String.fromCharCode( key );
  var regex = /[0-9]|\./;
  if( !regex.test(key) ) {
    theEvent.returnValue = false;
    if(theEvent.preventDefault) theEvent.preventDefault();
  }
}
