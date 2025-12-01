/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
$(function() {


$('#searchHorseDetails').click(function()
    {
        
        var horName = document.getElementById("hor_name").value;
        var regNo = document.getElementById("regno").value;
        
        if(horName==''  && regNo=='')
        return false;

        document.forms[0].method="post";
        document.forms[0].action="frmReg_SearchHorseDetails.jsp?sch=y"
        document.forms[0].target="_self";
        document.forms[0].submit();
    });

$('#resetHorseSearch').click(function()
    {
     
        document.getElementById("regno").value="";
        document.getElementById("hor_name").value="";
        document.getElementById("RegSeqHidden").value="";
        
       
        document.forms[0].method="post";
        document.forms[0].action="frmReg_SearchHorseDetails.jsp"
        document.forms[0].target="_self";
        document.forms[0].submit();
    });

$('#viewCertificate').click(function()
    {        
        var regSeq = document.getElementById("HdnRegSeq").value;
        if(regSeq=='')
        return false;

        document.forms[0].method="post";
        document.forms[0].target="_Blank"
        document.forms[0].action="PDFServlet?PAGEID=SEARCH_HORSEDETAILS&Value=CERTIFICATEONE";
        document.forms[0].submit();
    });
/*$('#searchOwnerHistory').click(function()
    {
        var regSeq = document.getElementById("HdnRegSeq").value;
        var entySeq = document.getElementById("HdnRegSeq").value;
        if(regSeq=='')
        return false;
*/
 

});

function fnSearchHorseDetails(seq)
{
    var horName = document.forms[0].hor_name.value;
    var regNo = document.forms[0].regno.value;
    if(horName==''  && regNo=='')
    return false;


    document.forms[0].method="post";
    document.forms[0].action="frmReg_SearchHorseDetails.jsp?sch=y"
    document.forms[0].target="_self";
    document.forms[0].submit();

}
function fnDisplayShowHistory(shwYr,Seq)
{
	shwYr1=shwYr.value
    document.forms[0].target="iFrame_ShowResults";
	document.forms[0].method="post";
    document.forms[0].action="frmReg_SearchHorseDetails_ShowHistory.jsp?showYear="+shwYr1+"&sch=y&rseq="+Seq
    document.forms[0].submit();
}
function fnOwnerHistory(entySeq)
{
    if(entySeq=='')
        return false;
    /*
    var details = 'titlebar=no,status=no,menubar=no,resizable=no,width=600,height=500,scrollbars=no,left=230,top=150';

    childWindow=open("frmHorsesOwnedPopup.jsp?ENTITYSEQ="+EntitySeq,"Cal",details);
    if (childWindow.opener == null)
        childWindow.opener = self;
        childWindow.focus();*/
    $('#dialog-OwnerHistory').dialog({ autoOpen: false,height: 500,width: 770, modal: true });
    $('#dialog-OwnerHistory').dialog('open');
    $("#modalIFrame_OwnerHistory").attr('src','frmReg_SearchHorseDetails_OwnerHistory.jsp?seq='+entySeq);

    return false;
}//);
function fnClearSeq()
{
    document.getElementById("RegSeqHidden").value='';
}

 function getAgePopup()
 {
	
     $('#dialog-Age').dialog({ autoOpen: false,height: 80,width: 242, modal: true });
    $('#dialog-Age').dialog('open');
    
     $("#modalIFrame_Age").attr('src','frmAgeCalculator.jsp');
    
    return false;
 }
 