/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


function checkIt(evt) {
    evt = (evt) ? evt : window.event
    var charCode = (evt.which) ? evt.which : evt.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        status = "This field accepts numbers only."
        return false
    }
    status = ""
    return true
}


function Search_Shows(fieldName,DescElement)
{

    $('#dialog-Show').dialog({ autoOpen: false,height: 400,width: 800, modal: true,title:"Search Shows" });
    $('#dialog-Show').dialog('open');
    $("#modalIFrame_ShowList").attr('src','frmShows_Serach_Common.jsp?mode=0&selval='+fieldName+'&DescEl='+DescElement);

    return false;

}

function Search_Events(fieldName,DescElement)
{
    $('#dialog-Show').dialog({ autoOpen: false,height: 400,width: 800, modal: true,title:'Search Events' });
    $('#dialog-Show').dialog('open');
    $("#modalIFrame_ShowList").attr('src','frmEvents_Serach_Common.jsp?mode=0&selval='+fieldName+'&DescEl='+DescElement);
    return false;
}

function OpenPop(RefType,Action,FldValue,FldSeq){

    if(Action=='Modify' && FldSeq=='')
    {
        alert('Please select a value to modify')
        return false
    }
    
PopWin=dhtmlmodal.open('EmailBox', 'iframe', 'frmCommonRef_Pop.jsp?RefType='+RefType+'&fldVal='+FldValue+'&fldSeq='+FldSeq+'&Action='+Action, RefType, 'width=350px,height=200px,center=1,resize=0,scrolling=1')

PopWin.onclose=function(){



        var varRefSeq=this.contentDoc.getElementById("RefSeq").value
        var varRefDesc=this.contentDoc.getElementById("Desc").value


         document.forms[0].RefSeq.value=varRefSeq
         document.forms[0].Desc.value=varRefDesc
        if(varRefDesc!='')
        {
            document.forms[0].method="post";
            document.forms[0].action="servlet/Shows"
            document.forms[0].submit();
        }
    return true //allow closing of window

}
}

var whosChanged = null;
function SelectRow(el,RefValue,RefSeq)
{

     document.forms[0].RefSeq.value=RefSeq
     document.forms[0].Desc.value=RefValue

    el.style.backgroundColor = "#4e738f";
    el.style.color = "#000000";
    if (whosChanged != null)
    {
        whosChanged.style.backgroundColor = ""
        whosChanged.style.color = ""
    }
    whosChanged = el;
}

function Delete()
{
    if  (document.forms[0].RefSeq.value=='')
    {
              alert('Please select a value to delete')
              return false
    }
      
    var bok=confirm('Do you want to delete this Record?')
    if(bok)
     {
        document.forms[0].Status.value='I'
        document.forms[0].method="post";
        document.forms[0].action="servlet/Shows"
        document.forms[0].submit();
     }
return true
}

function ReturnVal(strRetVal,Desc,RefSeq,Rtn_ParentIDSeq,Rtn_ParentVal)
{
   
    if(RefSeq=='')
        {
            alert('Please select a value')
            return false;
        }


    window.parent.document.getElementById(Rtn_ParentIDSeq).value=RefSeq
    ElmType=window.parent.document.getElementById(Rtn_ParentVal).type
   
    if(ElmType=='text')
         window.parent.document.getElementById(Rtn_ParentVal).value=Desc
     else
         window.parent.document.getElementById(Rtn_ParentVal).innerHTML=Desc
   

    window.parent.jQuery('#dialog-CmmnRef').dialog('close');

    return true;
}

function fnBannerScreen(url,showSq,eventSq,target){
    
    if(showSq=='' || eventSq=='')
        return false;
    
    if(target=='_self'){
        
        var eOrder=document.getElementById('EventOrder');
        
        var result=commonAjaxFn("","","Ajax_Common.jsp?Key=judgesCard&param1="+showSq+"&param2="+eOrder.value);               
        
        
        if(result.trim()=='' || result.trim()=="0"){
            fnCommonAlert_New("Event not found. Please enter a valid Event#","",eOrder,"Error Message");                
            return false;
        }else
           eventSq=result.trim();
    }
   
    
    var d= new Date();      
//    launchIntoFullscreen(document.documentElement)
    
    document.forms[0].method="post";
    document.forms[0].action=url+".jsp?sSq="+showSq+"&eSq="+eventSq+"&"+d.getTime();    
    document.forms[0].target=""+target;
    document.forms[0].submit();
//    launchIntoFullscreen(document.documentElement)
    
}


