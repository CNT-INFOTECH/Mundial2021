function AddStandardValues_ToTable(){
    
     var parentTable = window.parent.document.getElementById('JudgeStandardList'); // Get the opener window
     var ValuesRowSize=document.forms[0].hdnValuesSize.value; // Total Rows in the StandardList of Pop up
    for(var i=1;i <= ValuesRowSize; i++)  // for all the selected rows in the pop up
    {
        var vRow="chkSelected"+i;    // get the name of the check box
        if(document.getElementById(vRow).checked)  // if the check box is selected 
        {
           
           for(var j=1; j < parentTable.rows.length; j++) // loop through the parent table
           {
              if(document.getElementById(vRow).value==parentTable.rows[j].cells[1].children[1].value){
                  var bconfirm=confirm("Item "+document.getElementById(vRow).value +" already exists in the list in row "+ j+", \nPress OK to add CANCEL to skip")
                  if (bconfirm == false) {
                    break;
                  }
              }
              
              if(parentTable.rows[j].cells[0].children[0].value=="") // if the parent table cell is empty
              {
                // Assign the selected Check box value to the main table
                parentTable.rows[j].cells[0].children[0].value = j
                parentTable.rows[j].cells[1].children[1].value = document.getElementById(vRow).value; 
                parentTable.rows[j].cells[3].children[0].value = "A"; 
                 break; // break the loop
              }
              
           }
          
       }
    }
        window.parent.jQuery('#link-1').remove(); // this is the ID assigned to the Pop up when it is opened
    
}

function Save_ConfJudge(){
    document.forms[0].method = "post";
    document.forms[0].action = "SM_Judges_Conferring_Submit.jsp";
    document.forms[0].target = "_self";
    document.forms[0].submit();
}

function Close_ConfJudge(){
      window.parent.jQuery('#link-1').remove(); // this is the ID assigned to the Pop up when it is opened
}


function fnDynamicFldAutoComplete_Judges(NameFld, IDStatus, seqNum, url) {
//$(function() {

    $("#" + NameFld).autocomplete({
        
        source: function(request, response) {
            $.ajax({
                url: url,
                dataType: "json",
                data: {txtJudgeName: request.term},
               
                success: function(data) {
                  if(!data.length){
                     var result = [{label: 'No matches found', id: '0'}];
                      response(result);
                 }else{
                     response($.map(data, function(item) {
                        return {
                        label: $.trim(item.label),
                        id: item.id
                        };
                    }));
                 }
                }
            });
        },
        autoFocus: true,
        select: function(event, ui) {
            if(ui.item.id >0){
                $('#' + seqNum).val(ui.item.id);
               $('#' + IDStatus).val("A");
            }
            else{
              return false;
            }
          }
         
//    });
    });
    
}



