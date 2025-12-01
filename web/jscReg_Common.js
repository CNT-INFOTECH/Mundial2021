

function OpenPop(RefType,Action,FldValue,FldSeq){

    if(Action=='Modify' && FldSeq=='')
    {
        alert('Please select a value to modify')
        return false;
    }
    
PopWin=dhtmlmodal.open('EmailBox', 'iframe', 'frmReg_CommonRef_Pop.jsp?RefType='+RefType+'&fldVal='+FldValue+'&fldSeq='+FldSeq+'&Action='+Action, RefType, 'width=350px,height=200px,center=1,resize=0,scrolling=1')

PopWin.onclose=function(){
        var varRefSeq=this.contentDoc.getElementById("RefSeq").value       
        var varRefDesc=this.contentDoc.getElementById("Desc").value
        
         document.forms[0].RefSeq.value=varRefSeq
         document.forms[0].Desc.value=varRefDesc         
        if(Action!='Search')
        { 
        if(varRefDesc!='')
        {
            document.forms[0].method="post";
            document.forms[0].action="ReferenceValueServlet"
            document.forms[0].submit();
        }
        }
        else if(Action=='Search')
        {         
            document.forms[0].method="post";
            document.forms[0].action="frmReg_CommonRef.jsp?RefType="+RefType+"&SrchValue="+varRefDesc;
            document.forms[0].target="_self";
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
              return false;
    }
      
    var bok=confirm('Are you sure want to delete?')
    if(bok)
     {
        document.forms[0].Status.value='I'
        document.forms[0].method="post";
        document.forms[0].action="ReferenceValueServlet"
        document.forms[0].submit();
     }
return true
}

function ReturnVal(strRetVal,Desc,RefSeq,Rtn_ParentIDSeq,Rtn_ParentVal,Rtn_ParentTxtVal)
{  
    if(RefSeq=='')
    {
        alert('Please select a value')
        return false;
    }       
    window.parent.document.getElementById("SavedYN").value='N';//This makes the user to save the value 
    window.parent.document.getElementById(Rtn_ParentIDSeq).value=RefSeq
    window.parent.document.getElementById(Rtn_ParentVal).innerHTML=Desc  // lable id we pass from the index   
    window.parent.document.getElementById(Rtn_ParentTxtVal).value=Desc      // TextBox id we pass from the index  
    window.parent.jQuery('#dialog-CmmnRef').dialog('close');

    return true;
}


function OpenPop_Place(RefType,Action,FldValue,FldSeq){

    
PopWin=dhtmlmodal.open('EmailBox', 'iframe', 'frmReg_CommonRef_Pop_Place.jsp?RefType='+RefType+'&fldVal='+FldValue+'&fldSeq='+FldSeq+'&Action='+Action, RefType, 'width=350px,height=200px,center=1,resize=0,scrolling=1')

PopWin.onclose=function(){


        /*var varRefSeq=this.contentDoc.getElementById("RefSeq").value
        var varRefDesc=this.contentDoc.getElementById("Desc").value*/
        var varCity=this.contentDoc.getElementById("City").value
        var varState=this.contentDoc.getElementById("State").value
        var varZip=this.contentDoc.getElementById("Zip").value
        var varCountry=this.contentDoc.getElementById("Country").value
        

       /*document.forms[0].City.value=varCity         
         document.forms[0].State.value=varState         
         document.forms[0].Zip.value=varZip         
         document.forms[0].Country.value=varCountry*/
        if(varCity!='')
        {            
            document.forms[0].method="post";
            document.forms[0].action="RegistrationServlet?PAGEID=ADD_CITYSTATEZIP&City="+varCity+"&State="+varState+"&Zip="+varZip+"&Country="+varCountry;
            document.forms[0].submit();                        
        }
        
        //document.Registrationform.place_Lbl.innerHTML=varCity;
        
//window.parent.jQuery('#dialog-PlaceOfBirth').dialog('close');
    return true; //allow closing of window
    
}

}

