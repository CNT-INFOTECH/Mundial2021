function Person_OwnerSearch(state,type,objVal,srchtype){

if(state!='')
        return false;
        
    var details = 'titlebar=no,status=no,menubar=no,resizable=no,width=685,height=500,scrollbars=no,left=230,top=150';

    if(type=='pop')
    {
        //if(document.forms[0].name=="Person_Search")
            childWindow=open("frmReg_PersonSearchPopup.jsp?frmType=SEARCH&tpe="+srchtype,"Cal",details);
    }
    if (childWindow.opener == null)
        childWindow.opener = self;
    childWindow.focus();    
}

$(function(){	
       
    $( "#dateFrom_DOB" ).datepicker({
        changeMonth: true,
        changeYear: true
    });
    $( "#dateTo_DOB" ).datepicker({
        changeMonth: true,
        changeYear: true
    });
    
    $( "#dateFrom_Best" ).datepicker({
        changeMonth: true,
        changeYear: true
    });
    $( "#dateTo_Best" ).datepicker({
        changeMonth: true,
        changeYear: true
    });
    $( "#dateFrom_JOINING" ).datepicker({
        changeMonth: true,
        changeYear: true
    });
    $( "#dateTo_JOINING" ).datepicker({
        changeMonth: true,
        changeYear: true
    });
    $( "#dateFrom_MemPart" ).datepicker({
        changeMonth: true,
        changeYear: true
    });
    $( "#dateTo_MemPart" ).datepicker({
        changeMonth: true,
        changeYear: true
    }); 
    function formatItem(row) {
        finalVal_formatItem=row[0].split('#@#')
        return finalVal_formatItem[0] ;
    }
    function formatResult(row) {
        finalVal_formatResult=row[0].split('#@#')
        return finalVal_formatResult[0].replace(/(<.+?>)/gi, '');
    }


    $("#ShowName").autocomplete('Auto_ShowsList.jsp', {
        width: 200,
        matchContains: true,
        formatItem: formatItem,
        formatResult: formatResult
    });

    $("#ShowName").result(function(event, data, formatted) {
        var hiddenShowSeq = $("#ShowSeq");
        var value = data.toString().split('#@#');
        hiddenShowSeq.val(value[1]);
    });
    
    $("#BestShowName").autocomplete('Auto_ShowsList.jsp', {
        width: 200,
        matchContains: true,
        formatItem: formatItem,
        formatResult: formatResult
    });

    $("#BestShowName").result(function(event, data, formatted) {
        var hiddenShowSeq = $("#BestShowSeq");
        var value = data.toString().split('#@#');
        hiddenShowSeq.val(value[1]);
    });
    
});

function Populate_PersonSearch()
{    
    var Jd=document.getElementById("JoiningStatus").value;
    var Best=document.getElementById("BestStatus").value;
    var MemberPart=document.getElementById("MemPartStatus").value;
    var MemStatus=document.getElementById("Mem_State").value;
    //alert(Jd);
    document.forms[0].target="_self";
    document.forms[0].method="post";
    document.forms[0].action="Person_Search.jsp?srch=1&JD="+Jd+"&B="+Best+"&M="+MemberPart+"&MS="+MemStatus;       
    document.forms[0].submit();     
    
    //alert(Jd);
    //document.getElementById("JoiningStatus").value=Jd;
    //CheckFields(Jd);
    //ConvertRangeList('Range','RangeType_JD','ListType_JD','JoinPeriod','LblJoinFrom','dateFrom_JOINING','LblJoinTo','dateTo_JOINING','Rang_JD_Space');
}

function Display_MemStatusRange(StatusObj)
{   
        
    if(StatusObj=='MEM_STATUS')    
        MemValue=document.getElementById("MEM_STATUS").value;
    else if(StatusObj=='Mem_State')    
        MemValue=document.getElementById("Mem_State").value;
    
    //operator
    document.getElementById("Mem_StatusOperator").style.width='0px';
    document.getElementById("Mem_StatusOperator").style.border='0px';    
    document.getElementById("Mem_StatusOperator").style.visibility='hidden';
    //value
    document.getElementById("Mem_StatusVal").style.width='0px';
    document.getElementById("Mem_StatusVal").style.border='0px';    
    document.getElementById("Mem_StatusVal").style.visibility='hidden';
    //value
    document.getElementById("Mem_StatusType").style.width='0px';
    document.getElementById("Mem_StatusType").style.border='0px';    
    document.getElementById("Mem_StatusType").style.visibility='hidden';
    
    if(MemValue!='')
    {    
    //operator
    document.getElementById("Mem_StatusOperator").style.visibility='visible';
    document.getElementById("Mem_StatusOperator").style.width='70px';
    document.getElementById("Mem_StatusOperator").style.border='1px  solid #000000';
    //value
    document.getElementById("Mem_StatusVal").style.visibility='visible';
    document.getElementById("Mem_StatusVal").style.width='80px';
    document.getElementById("Mem_StatusVal").style.border='1px  solid #000000';
    //value
    document.getElementById("Mem_StatusType").style.visibility='visible';
    document.getElementById("Mem_StatusType").style.width='108px';
    document.getElementById("Mem_StatusType").style.border='1px  solid #000000';
    
    document.getElementById("Mem_State").value="L";
    }

}
function ConvertRangeList(RangeListType,LblRange,LblList,ListDropdown,LblFrom,TxtFromDate,LblTo,TxtToDate,SPACElbl)
{  
    //document.getElementById("td_1stRow_1").style.width='42px';
    //document.getElementById("td_1stRow_2").style.width='115px';
    //document.getElementById("td_1stRow_3").style.width='84px';
    if(RangeListType=="Range")
    {   //alert(document.getElementById("JoiningStatus").value);
        /*if(LblRange=="RangeType_MemPart")
        document.getElementById("ShowName").style.width='193px';
        */
        /*if(ListDropdown!="ShowName")
        {*/
        //Drop down box
        document.getElementById(ListDropdown).style.width='0px';
        document.getElementById(ListDropdown).style.border='0px';    
        document.getElementById(ListDropdown).style.visibility='hidden';   
      
        //}
        //RANGE          
        if(LblRange=="RangeType_Best")
        {
            document.getElementById(LblRange).style.visibility='hidden';           
            document.getElementById(LblRange).style.paddingLeft='0px';          
            document.getElementById(LblList).style.paddingLeft="230px";
            document.getElementById("BestStatus").value="R";
        }
        else        
        {
            //document.getElementById(LblRange).style.visibility='hidden';   
            //var LblType="List";
            if(LblRange=="RangeType_MemPart")
            {
            document.getElementById(LblList).style.width="0px";
            document.getElementById(LblRange).style.visibility='hidden';       
            document.getElementById(LblRange).style.paddingLeft="0px";
            document.getElementById(LblList).style.padding="200px";
            document.getElementById("MemPartStatus").value="R";
            
            }
            else
            {    
            document.getElementById(LblRange).style.paddingLeft="0px";
            document.getElementById(LblList).style.width="0px";
            document.getElementById(LblRange).style.visibility='hidden';               
            document.getElementById(LblList).style.paddingLeft="210px";
            }
        }
    
        //FromDate
        document.getElementById(TxtFromDate).type='text';
        document.getElementById(TxtFromDate).style.visibility='visible';        
        document.getElementById(TxtFromDate).style.width='105px';
        document.getElementById(TxtFromDate).style.border='1px  solid #000000';        
        //ToDate
        document.getElementById(TxtToDate).style.visibility='visible';
        document.getElementById(TxtToDate).style.width='105px';
        document.getElementById(TxtToDate).style.border='1px  solid #000000';
        
        //List       
        document.getElementById(LblList).style.visibility='visible';
        
        //Label From     
        document.getElementById(LblFrom).style.visibility='visible';
        document.getElementById(LblFrom).style.paddingLeft='0px';
        //Label To
        document.getElementById(LblTo).style.visibility='visible';
        //search image in members participated
        if(LblRange=="RangeType_MemPart")
        {
        document.getElementById("MemPart_Search").style.visibility='hidden';
        document.getElementById("MemPart_Search").style.width='0px';
        document.getElementById("MemPartStatus").value="R";
        }
        else if(LblRange=="RangeType_JD")
        { 
            document.getElementById("JoiningStatus").value="R";
            }
        //for bottom space  
        document.getElementById(SPACElbl).style.visibility='hidden';

    }    
    else 
    {
    //    document.getElementById("ShowName").style.width='199px';
        
        //show name partial search textbox or dropdown list
        if(ListDropdown=="BestShowName")
        {
            document.getElementById(ListDropdown).style.width='339px';
            //RANGE
            document.getElementById(LblRange).style.visibility='visible';           
            document.getElementById(LblRange).style.paddingLeft='320px';
            document.getElementById("BestStatus").value="L";
        }
        else        
        {
            if(ListDropdown=="ShowName")        
            {
            document.getElementById(LblRange).style.paddingLeft="288px";    
            document.getElementById(ListDropdown).style.width='339px';   
            document.getElementById("MemPartStatus").value="L";
            }            
            else
            {
                document.getElementById(ListDropdown).style.width='270px';   
                //document.getElementById("MemPartStatus").value="R";
            }
        
            //RANGE          
            document.getElementById(LblRange).style.visibility='visible';
            if(ListDropdown=="JoinPeriod")   
            {
            document.getElementById(LblRange).style.paddingLeft='231px';
            //This is for setting the field status in joining date
            document.getElementById("JoiningStatus").value="L";
            }
        }
        document.getElementById(ListDropdown).style.border='1px  solid #000000';    
        document.getElementById(ListDropdown).style.visibility='visible';
        
        
        //FromDate
        document.getElementById(TxtFromDate).type='hidden';
        document.getElementById(TxtFromDate).style.visibility='hidden';
        //document.getElementById(TxtFromDate).style.width='105px';
        //document.getElementById(TxtFromDate).style.border='0px';
        //ToDate
        document.getElementById(TxtToDate).style.visibility='hidden';
        //document.getElementById(TxtToDate).style.width='105px';
        //document.getElementById(TxtToDate).style.border='0px';
        //List       
        document.getElementById(LblList).style.visibility='hidden';  
        document.getElementById(LblList).style.paddingLeft='0px';
        
        //Label From     
        document.getElementById(LblFrom).style.visibility='hidden';
        //Label To
        document.getElementById(LblTo).style.visibility='hidden';    
        
        if(LblRange=="RangeType_MemPart")
        {
        document.getElementById("MemPart_Search").style.visibility='visible';
        document.getElementById("MemPart_Search").style.width='19px';
        }
    }
    
}
function Search_Shows(fieldName,DescElement)
{
    var details = 'titlebar=no,status=no,menubar=no,resizable=0,width=750,height=400,scrollbars=no,addressbar=0,left=230,top=150';
    childWindow=open("frmShows_Search_Common1.jsp?mode=0&selval="+fieldName+"&DescEl="+DescElement,"mm",details);
    childWindow.opener = self;
    childWindow.focus();
}
function ResetPersonSearch()
{
    document.forms[0].target="_self";
    document.forms[0].method="post";
    document.forms[0].action="Person_Search.jsp?srch=0";       
    document.forms[0].submit();         
}
function return_OwnerHorseDetails(EntySeq)
{
    $('#dialog-HorseDetails').dialog({ autoOpen: false,height: 400,width: 680, modal: true });
    $('#dialog-HorseDetails').dialog('open');         
    $("#modalIFrame_OwnerHorseDetails").attr('src','Person_HorseDetails.jsp?Enty='+EntySeq);
}
function showViewAll()
{
    document.forms[0].target="_self";
    document.forms[0].method="post";
    document.forms[0].action="Person_Search.jsp?srch=1&view=Y";       
    document.forms[0].submit();   
}
function CheckFields()
{
    //alert(document.getElementById("JoiningStatus").value);
    var JD_Status=document.getElementById("JoiningStatus").value;
    var Best=document.getElementById("BestStatus").value;
    var MemberPart=document.getElementById("MemPartStatus").value;
    
    if(JD_Status=="L")
    {
    document.getElementById("JoinPeriod").style.width='270px';           
    //RANGE          
    document.getElementById("RangeType_JD").style.visibility='visible';
    document.getElementById("RangeType_JD").style.paddingLeft='231px';
    //This is for setting the field status in joining date
    document.getElementById("JoiningStatus").value="L";
    document.getElementById("JoinPeriod").style.border='1px  solid #000000';    
    document.getElementById("JoinPeriod").style.visibility='visible';
    //FromDate
    document.getElementById('dateFrom_JOINING').type='hidden';
    document.getElementById('dateFrom_JOINING').style.visibility='hidden';
    //ToDate
    document.getElementById('dateTo_JOINING').style.visibility='hidden';
    //List       
    document.getElementById('ListType_JD').style.visibility='hidden';  
    document.getElementById('ListType_JD').style.paddingLeft='0px';
    //Label From     
    document.getElementById('LblJoinFrom').style.visibility='hidden';
    //Label To
    document.getElementById('LblJoinTo').style.visibility='hidden';            
    }
    else if(JD_Status=="R")
    {
    document.getElementById("JoinPeriod").style.width='0px';
    document.getElementById("JoinPeriod").style.border='0px';    
    document.getElementById("JoinPeriod").style.visibility='hidden';
    
    document.getElementById("RangeType_JD").style.paddingLeft="0px";    
    document.getElementById("RangeType_JD").style.visibility='hidden';               
    document.getElementById('ListType_JD').style.width="0px";
    document.getElementById('ListType_JD').style.paddingLeft="210px";

    //FromDate
    document.getElementById('dateFrom_JOINING').type='text';
    document.getElementById('dateFrom_JOINING').style.visibility='visible';        
    document.getElementById('dateFrom_JOINING').style.width='105px';
    document.getElementById('dateFrom_JOINING').style.border='1px  solid #000000';        
    //ToDate
    document.getElementById('dateTo_JOINING').style.visibility='visible';
    document.getElementById('dateTo_JOINING').style.width='105px';
    document.getElementById('dateTo_JOINING').style.border='1px  solid #000000';        
    //List       
    document.getElementById('ListType_JD').style.visibility='visible';        
    //Label From     
    document.getElementById('LblJoinFrom').style.visibility='visible';
    document.getElementById('LblJoinFrom').style.paddingLeft='0px';
    //Label To
    document.getElementById('LblJoinTo').style.visibility='visible';        
    document.getElementById("JoiningStatus").value="R";
        //for bottom space  
        //document.getElementById(SPACElbl).style.visibility='hidden';
    }
    if(Best=="L")
    {
        document.getElementById("BestStatus").value="L";
    }
    else if(Best=="R")
    {
    document.getElementById("BestShowName").style.width='0px';
    document.getElementById("BestShowName").style.border='0px';    
    document.getElementById("BestShowName").style.visibility='hidden';
    
    document.getElementById("RangeType_Best").style.visibility='hidden';           
    document.getElementById("RangeType_Best").style.paddingLeft='0px';   
    document.getElementById("BestStatus").value="R";
    
    document.getElementById("dateFrom_Best").type='text';
    document.getElementById("dateFrom_Best").style.visibility='visible';        
    document.getElementById("dateFrom_Best").style.width='105px';
    document.getElementById("dateFrom_Best").style.border='1px  solid #000000';        
    //ToDate
    document.getElementById("dateTo_Best").style.visibility='visible';
    document.getElementById("dateTo_Best").style.width='105px';
    document.getElementById("dateTo_Best").style.border='1px  solid #000000';

    //List       
    document.getElementById("ListType_Best").style.visibility='visible';
    document.getElementById("ListType_Best").style.paddingLeft="230px";

    //Label From     
    document.getElementById("LblBestFrom").style.visibility='visible';
    document.getElementById("LblBestFrom").style.paddingLeft='0px';
    //Label To
    document.getElementById("LblBestTo").style.visibility='visible';
    }

    if(MemberPart=="L")
    {
    document.getElementById("MemPartStatus").value="L";    
    }
    else if(MemberPart=="R")
    {
    document.getElementById("ShowName").style.width='0px';
    document.getElementById("ShowName").style.border='0px';    
    document.getElementById("ShowName").style.visibility='hidden';   
    
    document.getElementById("RangeType_MemPart").style.visibility='hidden';           
    document.getElementById("RangeType_MemPart").style.paddingLeft='0px';  
    document.getElementById("MemPartStatus").value="R";
    
    document.getElementById("dateFrom_MemPart").type='text';
    document.getElementById("dateFrom_MemPart").style.visibility='visible';        
    document.getElementById("dateFrom_MemPart").style.width='105px';
    document.getElementById("dateFrom_MemPart").style.border='1px  solid #000000';        
    //ToDate
    document.getElementById("dateTo_MemPart").style.visibility='visible';
    document.getElementById("dateTo_MemPart").style.width='105px';
    document.getElementById("dateTo_MemPart").style.border='1px  solid #000000';

    //List       
    document.getElementById("ListType_MemPart").style.visibility='visible';            
    document.getElementById("ListType_MemPart").style.paddingLeft="200px";

    //Label From     
    document.getElementById("LblMemPartFrom").style.visibility='visible';
    document.getElementById("LblMemPartFrom").style.paddingLeft='0px';
    //Label To
    document.getElementById("LblMemPartTo").style.visibility='visible';
    
    document.getElementById("MemPart_Search").style.visibility='hidden';
    document.getElementById("MemPart_Search").style.width='0px';
    }
}
function Print_PersonSearch()
{
document.forms[0].method="post";
document.forms[0].target="_Blank"
document.forms[0].action="PDFServlet";
document.forms[0].submit();
}