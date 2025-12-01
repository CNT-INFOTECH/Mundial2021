/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function fnSearch(varSS,varES)
{

    var myFrame = document.getElementById('iFrame_Shows_ListHorses_List');
    myFrame.src = "Shows_ListHorses_List.jsp?mode=0&ShowSeq="+varSS+"&EventSeq="+varES;

}
function PrintParticipant_List()
{
            document.forms[0].target="_blank";
            document.forms[0].method="post";
            document.forms[0].action="Participants";
            document.forms[0].submit();
}
// This is for deviation Screen

function fnDevReport(varSS,varES,varJudgeSeq)
{
 

    var myFrame = document.getElementById('iFrame_Deviation_List');
    myFrame.src = "Shows_Deviation_List.jsp?mode=0&ShowSeq="+varSS+"&EventSeq="+varES+"&JudgeSeq="+varJudgeSeq;

}

function OpenCommonRef(DgTitle,RetnID,RetnSeqID)
{

    $('#dialog-CmmnRef').dialog({ autoOpen: false,height: 400,width: 400, modal: true,title:DgTitle});
    $('#dialog-CmmnRef').dialog('open');
    $("#modalIFrame_CmmnRef").attr('src','frmCommonRef.jsp?RefType='+DgTitle+'&ReturnID='+RetnID+'&ReturnVal='+RetnSeqID);

    return false;

}


// End is for deviation Screen

function fnDeReset()
{
            document.forms[0].method="post";
            document.forms[0].action="RepDeviation.jsp";
            document.forms[0].submit();

}

function Search_Shows(fieldName,DescElement)
{

    $('#dialog-Show').dialog({ autoOpen: false,height: 400,width: 800, modal: true,title:"Search Shows" });
    $('#dialog-Show').dialog('open');
    $("#modalIFrame_ShowList").attr('src','frmShows_Serach_Common.jsp?mode=0&selval='+fieldName+'&DescEl='+DescElement);

    return false;

}