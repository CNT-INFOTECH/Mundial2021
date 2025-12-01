/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function fnCommonAlert(msg,action,focusVar){
   $(function() {

      $('<div></div>').dialog({
            modal: true,
            title: "Confirmation",
            width:500,
            open: function () {
               var markup = "<b>"+msg+"</b>";
               $(this).html(markup);                      
            },
            buttons: {
            "Ok": function() {     
                  $(this).dialog("close");
                  
                  if(focusVar!='' && focusVar!=undefined)
                  focusVar.focus();
               } 
            } 
      }); //end confirm dialog

   });                     
   return false;   
}
function  fnCommonAjaxCal(url)
{

   var Items;
   var xmlhttp;
   if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
      xmlhttp = new XMLHttpRequest();
   }
   else
   {// code for IE6, IE5
      xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
   }
   xmlhttp.onreadystatechange = function()
   {
      if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
      {
         if (xmlhttp.responseText == 0)
            Items = ""
         else
         {
            Items = xmlhttp.responseText;
         }
      }
   }
   xmlhttp.open("GET", url, false);
   xmlhttp.send();
   return Items;
}

function getf1f2EventDetails(ShowSeq, ObjEventNum, EventSeq, EventName,NumOfJudg,screen,url) {
   
   var EventNum=ObjEventNum.value;
   if(EventNum==''){      
      document.getElementById(EventSeq).value = "";
      document.getElementById(EventName).innerHTML = "";   
      return false;
   }
      
   var result ="";
   var resultVal ="";

   result=fnCommonAjaxCal("SM_AjaxInfmF1F2.jsp?src=f1f2EventDetails&shSeq="+ShowSeq+"&q=" + EventNum);
   resultVal=result.split("#@#");
   
   if (resultVal.length>1){
      ObjEventNum.value = EventNum;
      document.getElementById(EventSeq).value = resultVal[0].trim();
      document.getElementById(EventName).innerHTML = resultVal[1];            
        

      if(screen!='ResultBanner'){
            fnJudPageAction(ShowSeq,ObjEventNum.id,EventSeq,'onblur')

      }
      else if(screen=='ResultBanner'){        
          document.getElementById("eventName").value=resultVal[1];
        fnCommonPageLoad(url+".jsp?EIdent="+resultVal[0]+"&eventNum="+EventNum);//&eventName="+resultVal[1]+"
      }
   }else{
      fnCommonAlert("Please enter a valid class#..","",ObjEventNum);
      ObjEventNum.value = "";
      document.getElementById(EventSeq).value = "";
      document.getElementById(EventName).innerHTML = "";   
   }
}



function fnCommonPageLoad(Url){
   document.forms[0].method = "post";
   document.forms[0].action = Url;
   document.forms[0].target = "_self";
   document.forms[0].submit();
}
function fnRadioAction(radioBtnObj,totalSize,radioBtnname){

   var i=0;
   for(i=0;i<totalSize;i++){      
     
      if(document.getElementById(radioBtnname+i)!=radioBtnObj)
      document.getElementById(radioBtnname+i).checked=false;
   else
      document.getElementById('CurrentJudge'+i).checked=true;
   }
}
function fnChkBoxEdit(curntJudObj,callingJudObj){
   if(curntJudObj.checked==false)
      callingJudObj.checked=false;
}
function fnJudPageAction(ShowSeq,EventNum,EventSeq,action){  
   
      var counter = 0;
        TtlRecords=parseInt(document.forms[0].TotalRecs.value)        
      if(action=='previous' && document.forms[0].hidden.value>=1)
         counter = parseInt(document.forms[0].hidden.value) - 1;
      else if(action=='next' && document.forms[0].hidden.value <TtlRecords){
        
         counter = parseInt(document.forms[0].hidden.value) + 1;
        
     }
      else if(action=='first')
         counter = 0;
      else if(action=='last')
         counter = parseInt(document.forms[0].TotalRecs.value);
      else
         counter= parseInt(document.forms[0].hidden.value)
      
      document.forms[0].hidden.value = counter;
     
      document.forms[0].target="_self";
      document.forms[0].method="post";
      document.forms[0].action="SM_F1_F2_Admin.jsp?sIdent="+ShowSeq
      document.forms[0].submit();
}


function fnJudPageAction_Dmd(ShowSeq,EventNum){  
   
      document.forms[0].target="_self";
      document.forms[0].method="post";
      document.forms[0].action="SM_F1_F2_Admin.jsp?sIdent="+ShowSeq+"&DmdCde="+EventNum;
      document.forms[0].submit();
}
function applyCurntPgAllJudges(allPgObj,noOfJudge,curntPg){    
    
    for(var i=0;i<noOfJudge.value;i++){
        document.getElementById(curntPg+i).value=allPgObj.value;
    }
    
    fnCommonPageLoad("../ShowController?PageID=F1F2_AdminJudge");
}


function fnCommonPageLoad_Tar(Url,vartarget){
   document.forms[0].method = "post";
   document.forms[0].action = Url;
   document.forms[0].target = vartarget;
   document.forms[0].submit();
}


 function UpdateClassStartStopTime(varType,objTxt,varEventSeq)
{
var xmlhttp;

if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
            
              document.getElementById(objTxt).innerHTML=xmlhttp.responseText.trim()
           
             
    }
  }
xmlhttp.open("GET","SM_Ajax_Show_Event_Timer.jsp?Type="+varType+"&EventSeq="+varEventSeq,true);
xmlhttp.send();

}

function startTimer_Gate(varEvnSeq,varStartTime){
    alert(varEvnSeq)
}