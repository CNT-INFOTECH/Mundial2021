
function fnSubmit()
{
 var showSeq=document.forms[0].hdnShowSeq.value;

 if(showSeq=='0')
 {
     alert('Please select the show')
  //NoShowWindow=dhtmlmodal.open('NoShow', 'iframe', 'modalfiles/agreement.htm', 'ALERT', 'width=350px,height=50px,center=1,resize=0,scrolling=1')
  return false
 }
    document.forms[0].method="post";
    document.forms[0].action="servlet/Shows"
    document.forms[0].submit();
}






function opennewsletter(SpanID,RownIndex,RowID){
	emailwindow=dhtmlmodal.open('EmailBox', 'iframe', 'frmJudgesList.jsp', 'Judges', 'width=350px,height=200px,center=1,resize=0,scrolling=1')

emailwindow.onclose=function(){ //Define custom code to run when window is closed
    var theform=this.contentDoc.forms[0] //Access first form inside iframe just for your reference
    var theemail=this.contentDoc.getElementById("emailfield") //Access form field with id="emailfield" inside iframe
    //else if this is a valid email
    addCell(theemail.value,RownIndex,RowID);
    //var PreviousVal=document.getElementById(SpanID).innerHTML
    //document.getElementById(SpanID).innerHTML=PreviousVal +';'+ theemail.value //Assign the email to a span on the page
    return true //allow closing of window

}
} //End "opennewsletter" function


function deleteRow(r,TableID_Delete)
{


    var i=r.parentNode.parentNode.rowIndex;
	document.getElementById(TableID_Delete).deleteRow(i);


}

noRows=0;
function addPlan(src)
{

    FILE_TableID_PLAN=src.name
    noRows = noRows + 1;
    var tbody = document.getElementById(FILE_TableID_PLAN)

    PlanSize=document.forms[0].hdnRowSize.value

	var iteration=parseInt(PlanSize)+1;
	Category='category'+iteration;
	JudgeNames='youremail'+iteration;

    var newRowID='Row'+iteration;
    var newRow = tbody.insertRow(-1);
    newRow.setAttribute('id', newRowID);



    var elSel = document.getElementById("Category1");
    var Options='';

    for(var i=1;i < elSel.length; i++)
    {
         text=elSel.options[i].text;
		 /*value=elSel.options[i].value;*/
		 Options+="<option>"+text+"</option>"
    }


        var Cell = newRow.insertCell(-1);

	Cell.innerHTML = '<img src=Images/delete.png  name="PlanTab"  onClick=deleteRow(this,FILE_TableID_PLAN)>'
        Cell = newRow.insertCell(-1);
        Cell.innerHTML = '<font class="label">Category</font>';
        Cell = newRow.insertCell(-1);
        Cell.innerHTML = '<SELECT NAME="'+Category+'" style="background-color:  #FFF8DC; border:  1px solid #000000;width:163px"><option value="">Select</option>'+Options+' </SELECT>'

        Cell = newRow.insertCell(-1);
        Cell.innerHTML = '&nbsp;'





	Cell = newRow.insertCell(-1);
	Cell.innerHTML = '<font class="label">Judges</font>'
        for(var Jlen=1; Jlen<4;Jlen++)
        {

        var SeqID='Seq_'+iteration+'_'+Jlen;
        var ValID='Val_'+iteration+'_'+Jlen;

        Cell = newRow.insertCell(-1);
	Cell.innerHTML = '<img src="Images/dropdown_icon4.gif" onClick=OpenCommonRef("Judge","'+SeqID+'","'+ValID+'")>'

        Cell = newRow.insertCell(-1);
        Cell.innerHTML = '<input type="hidden"  size="2" id="'+SeqID+'" name="'+SeqID+'" >\n\
                          <LABEL id="'+ValID+'" name="'+ValID+'"></LABEL>'
                          
        }


        document.forms[0].hdnRowSize.value=iteration
}


function addCell(CellValue,rowIndex,RowID){
    CellSize=document.getElementById("Hdn_Row_Cell_"+rowIndex).value
    var NumofCells=parseInt(CellSize)+1;
    var x=document.getElementById('PlanTab').rows[rowIndex]
    var y=x.insertCell(-1)
    y.innerHTML='<input type="text" class="label" name="Row_Cell_'+rowIndex+'_'+NumofCells+'"  value="'+CellValue+'"><img  name="Cell1" src=Images/delete.png onclick="deleteCell(this.name,\''+RowID+'\') ">'
    document.getElementById("Hdn_Row_Cell_"+rowIndex).value=NumofCells
}
function deleteCell(cellObj,RowID) {
     document.getElementById(RowID).deleteCell(6)
    }



function OpenCommonRef(DgTitle,RetnID,RetnSeqID)
{
    $('#dialog-CmmnRef').dialog({ autoOpen: false,height: 400,width: 400, modal: true,title:DgTitle});
    $('#dialog-CmmnRef').dialog('open');
    $("#IFrame_CmnRef").attr('src','frmCommonRef.jsp?RefType='+DgTitle+'&ReturnID='+RetnID+'&ReturnVal='+RetnSeqID);

    return false;

}

