$(function() {$( "#txtDateFrom" ).datepicker({
    changeMonth: true,
    changeYear: true,
    onSelect: function (){this.focus();}
});});
       
$(function(){$( "#txtDateTo" ).datepicker({
    changeMonth: true,
    changeYear: true,
    onSelect: function (){this.focus();}
});});

function chkToFutureDate(varDate,msg){
    var dString = document.getElementById(varDate).value;
    var calmon=dString.split("/")[0];
    var calday=dString.split("/")[1];
    var calyear=dString.split("/")[2];

    if((calday<1 || calday >28) && calmon==02 && calyear%4!=0){    
        alert("Invalid Date","");
        document.getElementById(varDate).value="";
        return false;
    }else if((calday<1 || calday >29) && calmon==02 && calyear%4==0){
        alert("Invalid Date Format","");
        document.getElementById(varDate).value="";
        return false;
    }
    
    if((calday<1 || calday >31) || (calmon<1 || calmon>12)  || (calyear.length != 4 || calyear < 1900 )){     
        if(dString!=''){
            alert("Invalid Date Format","");
            document.getElementById(varDate).value="";
            return false;
        }
    }else{
       var currentdate = new Date();
       if(Date.parse(dString) > Date.parse(currentdate)){
           alert("Invalid Date "+dString+"  !\n"+msg+" cannot be Future Date!","");
           document.getElementById(varDate).value="";
           return false;
       }
    }
}

function maskme(str, textbox, loc, delim, maxLength,event){
    if (event != null && (event.keyCode == 9 || event.keyCode == 8 || event.keyCode == 37 || event.keyCode == 46))// || event.keyCode == 58))
            return true;    
    if (maxLength == null)
            maxLength = 1000;
    str = str.substring(0, maxLength);
    var locs = loc.split(',');
    for (var i = 0; i <= locs.length; i++){
        for (var k = 0; k <= str.length; k++){
            if (k == locs[i]){
                if (str.substring(k, k+1) != delim)
                        str = str.substring(0,k) + delim + str.substring(k,str.length)
            }
        }
    }

    textbox.value = str;
}

function compToDate(varStartDt,varEndDt,msgst,msgend){
    var startDt=document.getElementById(varStartDt).value;
    var endDt=document.getElementById(varEndDt).value;
//    return chkToFutureDate(varStartDt.id,'')
    if((Date.parse(startDt) > Date.parse(endDt))&& (Date.parse(startDt)!= Date.parse(endDt))){
        alert("Invalid Date Range!\n"+msgend+" cannot be Less than "+msgst+"!");
        document.getElementById(varEndDt).value="";
        return false;
    }
}
function fnClickAction(actionType,title){
//    alert("txtUnInvoice "+document.getElementById("txtUnInvoice").checked)
    var url="";
    var target="_self"
    var strAllVal=""
    var strChekStat=""
    
    if(document.forms[0].name == "Invoice" && actionType != "Reset"){
        if(document.getElementById("txtTransType").options[document.getElementById("txtTransType").selectedIndex].value == ""){
            alert("Please select type.")
            return false;
        }
    }
    if(actionType == "Reset")
        url="frmInvoices.jsp?mode=0"
    else if(actionType == "Search")
        url="frmInvoices.jsp?mode=1"
    else if(actionType == "Popup")
        url='frmInvoiceDetailList.jsp?';
    else if(actionType == "ExlSummary"){
        strChekStat=document.getElementById("txtIncludeType").options[document.getElementById("txtIncludeType").selectedIndex].value
        strAllVal="1,"+document.getElementById("txtTransType").options[document.getElementById("txtTransType").selectedIndex].value+","
                +document.getElementById("txtDateFrom").value+","+document.getElementById("txtDateTo").value+","+strChekStat
        url="frmExportExcel.jsp?Pg=InvoiceSummary&AllVal="+strAllVal;
        target="_blank"
    }else if(actionType == "ExlDetail"){
        strChekStat=document.getElementById("txtIncludeType").options[document.getElementById("txtIncludeType").selectedIndex].value
        strAllVal="2,"+document.getElementById("txtTransType").options[document.getElementById("txtTransType").selectedIndex].value+","
                +document.getElementById("txtDateFrom").value+","+document.getElementById("txtDateTo").value+","+strChekStat
        url="frmExportExcel.jsp?Pg=InvoiceDetails&AllVal="+strAllVal;
        target="_blank"
    }
    
//    alert("strAllVal : "+strAllVal)
    if(actionType != "Popup"){
        document.forms[0].target=target;
        document.forms[0].method="post";
        document.forms[0].action=url
        document.forms[0].submit();
    }else{
        $('#dialog-Invoice').dialog({ autoOpen: false,height: 600,width: 1080, modal: true, title: title });
        $('#dialog-Invoice').dialog('open');
        $("#modalIFrame_Invoice").attr('src',url);
        return false;
    }
}
function getRecordDetails(IdSeq){
    var strVal=IdSeq+","+document.getElementById("txtDateFrom").value+","+document.getElementById("txtDateTo").value
    strVal=strVal+","+document.getElementById("txtIncludeType").options[document.getElementById("txtIncludeType").selectedIndex].value
    
   var xmlhttp;
    if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
    }else{// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange=function(){
        if (xmlhttp.readyState==4 && xmlhttp.status==200){
            var vrResult='<table  class="grid"  style="border-color:Black;border-width:0px;width:100%;border-collapse:collapse;">'
            vrResult+=xmlhttp.responseText;
            vrResult+='</table>'
            document.getElementById(IdSeq).innerHTML=vrResult
        }
    }
    xmlhttp.open("GET","frmInvoiceDetailList.jsp?AllVal="+strVal,false);
    xmlhttp.send();
}
function AjaxCallInsUpd(IdSeq,strType,status){
//    alert(status)
//    return false;
//    alert("IdSeq  : "+IdSeq+"  strType :"+strType)
   var strVal=IdSeq
   if(status == true)
       strVal=strVal+",Y"
   var xmlhttp;
    if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
    }else{// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange=function(){
        if (xmlhttp.readyState==4 && xmlhttp.status==200){
            getRecordDetails(strType);
            if(xmlhttp.responseText.trim() != "" && xmlhttp.responseText.trim() != "undefined"){
                var str=document.getElementById("txtIncludeType").options[document.getElementById("txtIncludeType").selectedIndex].value
                if(str == "2" || str == "1")
                    document.getElementById("txtCount").innerHTML = parseInt(document.getElementById("txtCount").innerHTML) - 1
                alert(xmlhttp.responseText.trim())
            }
        }
    }
    xmlhttp.open("GET","Ajax_GetPost.jsp?Key=PrintRecordCount&AllVal="+strVal,false);
    xmlhttp.send();
}