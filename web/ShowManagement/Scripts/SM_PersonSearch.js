function retnValue_Member(objRadName){

    parentPage=window.opener.document.forms[0].name; // get the Name of the Opener
 
  if(parentPage=="SM_Add_Show_Exhibitor")
    {
        var SelectedVal=objRadName.value; // Get the value of the Selected Value, which contains EntitySeq and EntityName
        var SelectedVal_=SelectedVal.split('--Column--')
      
        if(document.forms[0].ESQ.value!=''){ // This is for the Class Riders Search
            
            try{
            var Seq=document.forms[0].ESQ.value
            var MemNum=document.forms[0].ENUM.value
            var MemName=document.forms[0].EN.value
            
            window.opener.document.getElementById(Seq).value=SelectedVal_[0];
            window.opener.document.getElementById(MemName).value=SelectedVal_[1];
            window.opener.document.getElementById(MemNum).value=SelectedVal_[2];
            window.opener.document.getElementById(MemNum).focus();
            }
            catch(err) {
                alert('Please enter the class details')
            }
            
        }
        
        else{ // This is for the Class Main member Search
        window.opener.document.forms[0].txtExhibitorEntitySeq.value=SelectedVal_[0];
        window.opener.document.forms[0].txtExhibitorName.value=SelectedVal_[1];
         window.opener.document.forms[0].txtExhibitorName.focus();
    }
        
        OpenPersonPop(SelectedVal_[0]);
  }
  
  else if(parentPage=="SM_Person_Master")
    {
       
         var randomVal = randomString();
         var SelectedVal=objRadName.value; // Get the value of the Selected Value, which contains EntitySeq and EntityName
          var SelectedVal_=SelectedVal.split('--Column--') // EntitySeq
         window.opener.location.href = "SM_Person.jsp?"+randomVal+"&EntityIdent="+SelectedVal_[0];
        
  }
   else if(parentPage=="SM_Pop_Update_Class")
     {
         var SelectedVal=objRadName.value; // Get the value of the Selected Value, which contains EntitySeq and EntityName
        var SelectedVal_=SelectedVal.split('--Column--')
        window.opener.document.forms[0].RiderSeq.value=SelectedVal_[0];
        window.opener.document.forms[0].Rider.value=SelectedVal_[1];
        window.opener.document.forms[0].RiderID.value=SelectedVal_[2];

   }
   
   else if(parentPage=="frmAddShowEntry")
     {
        try {
            var SelectedVal = objRadName.value; // Get the value of the Selected Value, which contains EntitySeq and EntityName

            var SelectedVal_ = SelectedVal.split('--Column--')

            window.opener.document.forms[0].TrainerEntitySeq.value = SelectedVal_[0];
            window.opener.document.forms[0].txtTrnMName.value = SelectedVal_[1];
            window.opener.document.forms[0].txtTrnMNum.value = SelectedVal_[2];
        }
        catch (err) {
            alert(err)
        }

   }
    else if(parentPage=="Search")
    {

    }
    

self.close();
}


function retnExhibitorValue(objRadName){

    parentPage=window.opener.document.forms[0].name; // get the Name of the Opener

    if(parentPage=="SM_Add_Show_Exhibitor")
    {
        var SelectedVal=objRadName.value; // Get the value of the Selected Value, which contains EntitySeq and EntityName
        var SelectedVal_=SelectedVal.split('--Column--')
         window.opener.location.href = "SM_Add_Show_Exhibitor.jsp?hidden="+SelectedVal_[0];
    }
    
     else if(parentPage=="frmAddShowEntry")
    {
        var SelectedVal=objRadName.value; // Get the value of the Selected Value, which contains EntitySeq and EntityName
        var SelectedVal_=SelectedVal.split('--Column--')
         window.opener.location.href = "SM_Add_Show_Entry.jsp?AsnNum="+SelectedVal_[2];
    }
   
self.close();
}

 function fnBtnClickActionPopup(url)
{  
//               document.forms[0].target="_self";
      document.forms[0].method="post";
      document.forms[0].action=url;
      document.forms[0].submit();
}


function showHrsSearch(){
document.getElementById('hrsSearch').style.visibility = "visible";
document.getElementById('ExbSearch').style.visibility = "hidden";
document.getElementById('hrsBck').focus();
}

function showExbSearch(){
document.getElementById('ExbSearch').style.visibility = "visible";
document.getElementById('hrsSearch').style.visibility = "hidden";
document.getElementById('exhName').focus();


}

function GetHorseByBackNum(varShowSeq,varBackObj){
 if(varBackObj.value==='')
     return  false;
 var jqxhr = $.get("SM_AjaxInformation.jsp?src=Get_RepPart_BackNumber&ShowSeq="+varShowSeq+"&BackNum="+varBackObj.value, function() {
  })
  .done(function(data) {
      
      var _data=data.trim().split("--EN--")
      if(_data[0].length>0){
      var HrsSelected=_data[2];
           
      window.opener.location.href = "SM_Add_Show_Exhibitor.jsp?hidden="+_data[0]+"&hdnSlc_lv="+HrsSelected;
      window.close();
  }
     
  
  })
  .fail(function() {
    alert( "error" );
  })
 

}
    
   
