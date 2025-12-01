function AddStandardValues_ToTable() {

    var parentTable = window.parent.document.getElementById('StandardList'); // Get the opener window
    var ValuesRowSize = document.forms[0].hdnValuesSize.value; // Total Rows in the StandardList of Pop up
    for (var i = 1; i <= ValuesRowSize; i++)  // for all the selected rows in the pop up
    {
        var vRow = "chkSelected" + i;    // get the name of the check box
        if (document.getElementById(vRow).checked)  // if the check box is selected 
        {
            for (var j = 1; j < parentTable.rows.length; j++) // loop through the parent table
            {
                if (document.getElementById(vRow).value == parentTable.rows[j].cells[0].children[1].value) {
                    var bconfirm = confirm("Item " + document.getElementById(vRow).value + " already exists in the list in row " + j + ", \nPress OK to add CANCEL to skip")
                    if (bconfirm == false) {
                        break;
                    }
                }
                if (parentTable.rows[j].cells[1].children[1].value == "") // if the parent table cell is empty
                {
                    // Assign the selected Check box value to the main table
                    alert(document.getElementById(vRow).value)
                    parentTable.rows[j].cells[1].children[1].value = document.getElementById(vRow).value;
                    parentTable.rows[j].cells[3].children[0].checked = false;
                    parentTable.rows[j].cells[4].children[0].value = "A";
                    break; // break the loop
                }

            }

        }
    }
    window.parent.jQuery('#link-1').remove(); // this is the ID assigned to the Pop up when it is opened

}


function Confirm(message, title, buttonText) {

    buttonText = (buttonText == undefined) ? "Ok" : buttonText;
    title = (title == undefined) ? "The page says:" : title;

    var div = $('<div>');
    div.html(message);
    div.attr('title', title);
    div.dialog({
        autoOpen: true,
        modal: true,
        draggable: false,
        resizable: false,
        buttons: [
            {
                text: "example1"
            },
            {
                text: buttonText,
                click: function() {
                    $(this).dialog("close");
                    div.remove();
                }
            }]
    });
}

function AddNew(vSize) {

    document.getElementById("Actions").style.display = "none";
    document.getElementById("Actions_Commit").style.display = "table";

    var table = document.getElementById("StandardItemsTable");
    document.forms[0].hdnNewValuesSize.value = vSize;

    var row = table.insertRow(1);
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    var cell4 = row.insertCell(3);
    cell1.innerHTML = "&nbsp;";
    cell2.innerHTML = "<input type='text' name='txtItemDescription' size='35' autocomplete='off'>";
    cell3.innerHTML = "&nbsp;";
    cell4.innerHTML = "&nbsp;";
}

function SaveNewItem() {


    document.forms[0].method = "post";
    document.forms[0].action = "SM_Items_StandardList_Save.jsp?mode=0";
    document.forms[0].target = "_self";
    document.forms[0].submit();
}

function CancelNew() {

    document.getElementById("Actions").style.display = "table";
    document.getElementById("Actions_Commit").style.display = "none";

    if (document.forms[0].hdnNewValuesSize.value == '0')
        document.getElementById("StandardItemsTable").deleteRow(1);
}

function DeleteRow(CurrentRow) {

    document.forms[0].hdnNewValuesSize.value = CurrentRow;
    document.forms[0].method = "post";
    document.forms[0].action = "SM_Items_StandardList_Save.jsp?mode=1"
    document.forms[0].target = "_self";
    document.forms[0].submit();
}

function EditRow(CurrentRow) {

    document.getElementById("ID" + CurrentRow).style.display = "";

    document.getElementById("LID" + CurrentRow).style.display = "none";



    document.getElementById("Actions").style.display = "none";
    document.getElementById("Actions_Commit").style.display = "table";


    document.getElementById("ID" + CurrentRow).setAttribute("name", "txtItemDescription");

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
