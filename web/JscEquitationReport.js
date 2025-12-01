function trimRegister (str) {
	str = str.replace(/^\s+/, '');
	for (var i = str.length - 1; i >= 0; i--) {
		if (/\S/.test(str.charAt(i))) {
			str = str.substring(0, i + 1);
			break;
		}
	}
	return str;
}
$(function() {
    
    
    $( "#Event_dateFrom" ).datepicker({
    changeMonth: true,
    changeYear: true
    });
    $( "#Event_dateTo" ).datepicker({
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
    
    $("#Events").autocomplete('Auto_EventList.jsp', {
    width: 350,
    matchContains: true,
    formatItem: formatItem,
    formatResult: formatResult
    } );

    $("#Events").result(function(event, data, formatted) {
    var hiddenShowSeq = $("#EventSeq");
    var value = data.toString().split('#@#');
    hiddenShowSeq.val(value[1]);
    });
       
});
function fnSearch()
{
    /*if( document.forms[0].Country.checked==false &&   document.forms[0].School.checked==false)
    {
        alert("Please select a check box");
        return false;
    }*/
    
    document.forms[0].target="_self";
    document.forms[0].method="post";
    document.forms[0].action="Shows_EquitationReport.jsp?Srch=1";       
    document.forms[0].submit();     
}
function fnReset()
{
    document.forms[0].target="_self";
    document.forms[0].method="post";
    document.forms[0].action="Shows_EquitationReport.jsp";       
    document.forms[0].submit();     
}
var whosChanged=null;
function fn_ShowPointDetails(el,Elem1,Elem2,Elem3,Elem4,Elem5,Elem6)
{    

    var SrchBy = document.getElementById("HdnSrch").value;

    el.style.backgroundColor = "#4e738f";
    el.style.color = "#000000";
    if (whosChanged != null)
    {
        whosChanged.style.backgroundColor = ""
        whosChanged.style.color = ""
    }
    whosChanged = el;

    $('#dialog-PointDetails').dialog({ autoOpen: false,height: 330,width: 800, modal: true,title:Elem2 });
    $('#dialog-PointDetails').dialog('open');
    
    $("#modalIFrame_PointDetails").attr('src','Shows_EquitationCountryDetails.jsp?Cntry='+Elem2+'&Srch='+SrchBy+'&ShwSeq='+Elem3+'&EvSeq='+Elem4+'&EvFrm='+Elem5+'&EvTo='+Elem6);
    return false;

}
function fn_ShowViewAll(Elem1)
{    
    document.forms[0].target="_self";
    document.forms[0].method="post";
    document.forms[0].action="Shows_EquitationCountryDetails.jsp?Cntry="+Elem1+"&viewall=Y";       
    document.forms[0].submit();   
}

function fn_SelectCheckBox(obVal)
{
    if(obVal.checked==false)
    {
    obVal.checked=false;    
    return false;
    }

    document.forms[0].Country.checked=false;
    document.forms[0].School.checked=false;
    
    obVal.checked=true;
    /*strSearchType=obVal.name                 */
    document.forms[0].HdnSrch.value=obVal.value;  

}
function fnOpenReport()
{   
    //var Type;
    /*if((document.forms[0].Country.checked==true 
    || document.forms[0].School.checked==true) && document.forms[0].Detailed.checked==true )
        Type="CountrySchoolDetailed";
    else
        Type="CountrySchool";*/
        
    document.forms[0].target="_Blank";
    document.forms[0].method="post";
    document.forms[0].action="EquitationReportServlet";       
    document.forms[0].submit();   
}
function fnMakeDetailView(obVal,Desg)
{
    
    if(obVal.checked==false)
    {      
        document.getElementById(Desg).value="";
    }
    else
        document.getElementById(Desg).value=obVal.value;
  
}