function ProcessResults()
{
    document.forms[0].method = "post";
    document.forms[0].action = "../Scoring_Results?PAGEID=F2";
    document.forms[0].submit();
}
function Process_WorkOff()
{
    document.forms[0].method = "post";
    document.forms[0].action = "../Scoring_Results?PAGEID=F2_WorkOff";
    document.forms[0].submit();
}

function SaveResults()
{
    document.forms[0].method = "post";
    document.forms[0].action = "../Scoring_Results?PAGEID=Save_F2";
    document.forms[0].submit();
}

var reloading;

function checkReloading() {
        reloading=setTimeout("window.location.reload();", 5000);
 }

function toggleAutoRefresh(cb) {
    if (cb.checked) {
        reloading=setTimeout("window.location.reload();", 5000);
    } else {
        clearTimeout(reloading);
    }
}
window.onload=checkReloading;

function ResetResults() {

    var varhdnEventSeq = document.forms[0].hdnEventSeq.value
               
    document.forms[0].method = "post";
    document.forms[0].action = "SM_Score_Olympic.jsp?R&7a8225d145bb1136c894b1f5dbcd7a8225d145bb1136c894b1f5dbcd&EIdent="+varhdnEventSeq;
    document.forms[0].submit();
}

function  Delete_F2_Results(){
    var r = confirm("This will delete the Processed F2 Results");
    if (r == true) {
        var varhdnEventSeq = document.forms[0].hdnEventSeq.value
        document.forms[0].method = "post";
        document.forms[0].action = "SM_Score_Olympic_F1_Clear.jsp?EIdent=" + varhdnEventSeq + "&mode=F2";
        document.forms[0].submit();

    }
}

function ProcessTie() {

    document.forms[0].method = "post";
    document.forms[0].action = "../Scoring_Results?PAGEID=F2_Tie";
    document.forms[0].submit();
}
function CheckBoxSelect(objCheckBox,RowNum,objSelected) {

 var AllVals = objSelected.value;
 var AllVals_split = AllVals.split(",");
 
 if(objCheckBox.checked)
    AllVals_split[RowNum] = RowNum
else
    AllVals_split[RowNum]='';

 objSelected.value = AllVals_split;
    
}



function CheckValue(varCurCol, varCurrentObj, varCurRowAllValsObj) {



    /************************************************Check for Valid Back#***********************************************/


    // if (varCurrentObj.value != '')
    //{
    var bEditCheck = 0; // False
    var varAssignedNums = document.forms[0].AssignedNums.value
    var varAssignedNums_split = varAssignedNums.split(",");
    for (var i = 0; i < varAssignedNums_split.length; i++)
    {
        if (varCurrentObj.value == varAssignedNums_split[i])
            bEditCheck = 1;
    }
    if (bEditCheck == 0)
    {
        alert('Please enter a valid back Number')
        varCurrentObj.focus();
        varCurrentObj.value = '';
    }

    //}

    /************************************************Check for Duplicate Entry***********************************************/

    var AllVals = varCurRowAllValsObj.value;
    var AllVals_split = AllVals.split(",");

    /* 
     * If the current value is empty, replace this values in the All Values Text box and do nothing
     */

    if (varCurrentObj.value == '')
    {
        AllVals_split[varCurCol] = varCurrentObj.value
        varCurRowAllValsObj.value = AllVals_split;
        return false
    }
    /* 
     * End Replcaing the Empty Value
     */

    var chkDupl = AllVals_split.indexOf(varCurrentObj.value)

    if (chkDupl >= 0)
    {
        alert('The back# is already used by the judge')
        varCurrentObj.focus();
        varCurrentObj.value = '';
        return false;
    }


    AllVals_split[varCurCol] = varCurrentObj.value
    varCurRowAllValsObj.value = AllVals_split;

}

function LoadTB(){
   
    var varhdnEventSeq = document.forms[0].hdnEventSeq.value
    var e = document.getElementById("TBreak");
    var varIdentTB = e.options[e.selectedIndex].value;
 
    document.forms[0].method = "post";
    document.forms[0].action = "SM_Score_Olympic.jsp?7a8225d145bb1136c894b1f5dbcd7a8225d145bb1136c894b1f5dbcd&EIdent=" + varhdnEventSeq+"&Stb="+varIdentTB;
    document.forms[0].submit();
 }



