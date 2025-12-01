

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

function CheckDuplicateEntry(varRow,ColVal,VarRowColVal)
{
    if(VarRowColVal.value!='')
    {
    for(var i=1;i <8 ; i++){ 
      var ColName='J'+varRow+'_F1_'+i;
      //alert(ColName)
      try{
            alert(document.getElementById(VarRowColVal).value)
    //alert(document.forms[0].ColName.value)
        }
        catch(err) {
          alert(err.message)
      }
  }
    }
}

function getResults(mode)
{

    
    document.forms[0].target="iFrame_F1_F2_Results";
    document.forms[0].method="post";
    document.forms[0].action="SM_F1_F2_Results.jsp?mode="+mode
    document.forms[0].submit();

}

function getResults5(mode)
{
        count=0;

       
        for(var i=1;i<6;i++)
        {
            JudgeSeq="JudgeSeq"+i
           if(document.getElementById(JudgeSeq).value!="")
               count+=1;
        }

        if(document.forms[0].hdnRefreshYN.value=='Y')
        {
             if(!(count==3 || count==5))
             {
                    alert("The event cannot be a "+count+" judge system.")
                    return false;
             }


            alert('You have deleted some judge Information,\nSo please click on the Refresh button')
            return false
        }
        
       if( count==3 )
       {
           
        document.forms[0].target="iFrame_F1_F2_Results";
        document.forms[0].method="post";
        document.forms[0].action="frmF1_F2_Results.jsp?mode="+mode
        document.forms[0].submit();
       }
       else if (count==5)
        {
            document.forms[0].target="iFrame_F1_F2_Results";
            document.forms[0].method="post";
            document.forms[0].action="frmF1_F2_Results_5.jsp?mode="+mode
            document.forms[0].submit();
        }
       else
        {
             alert("The event cannot be a "+count+" judge system.")
             return false;
       }



}

function Refresh(mode,varEventSeq,varShowSeq)
{
        count=0;

       if(document.forms[0].hdnRefreshYN.value=='N')  // If there is no Change in the Judges then do not Refresh
        return false

        for(var i=1;i<6;i++)
        {
           JudgeSeq="JudgeSeq"+i
           if(document.getElementById(JudgeSeq).value!="")
               count+=1;
        }

      
       if( count==3 )
       {
        document.forms[0].target="iFrame_F1_F2_Results";
        document.forms[0].method="post";
        document.forms[0].action="frmF1_F2_Results.jsp?mode="+mode
        document.forms[0].submit();
       }
       else if (count==5)
       {
            document.forms[0].target="iFrame_F1_F2_Results";
            document.forms[0].method="post";
            document.forms[0].action="frmF1_F2_Results_5.jsp?mode="+mode
            document.forms[0].submit();
       }

     Call_Refresh(varEventSeq,varShowSeq);

}

function Call_Refresh(varEventSeq,varShowSeq)
{
    window.location.href = "frmF1_F2.jsp?EventSeq="+varEventSeq+"&ShowSeq="+varShowSeq;
}
function OpenCommonRef(DgTitle,RetnID,RetnValue)
{

$('#dialog-CmmnRef').dialog({ autoOpen: false,height: 400,width: 400, modal: true,title:DgTitle});
$('#dialog-CmmnRef').dialog('open');

$("#IFrame_F1F2CmnRef").attr('src','frmCommonRef.jsp?RefType='+DgTitle+'&ReturnID='+RetnID+'&ReturnVal='+RetnValue);

return false;

}

function Placements()
{

 
   var myIFrame = document.getElementById('iFrame_F1_F2_Results');
  var content = myIFrame.contentWindow.document.body.innerHTML;
  if(content!="")
      {
          if(myIFrame.contentWindow.document.forms[0].Mode.value=='F1')
              {
                    alert("Please process the F2 and click OK")
                   return false;
              }
     }
   else
       {
            Sexy.alert("Please process the F2 and click OK")
            return false;

       }


    myIFrame.contentWindow.document.forms[0].method="post";
    myIFrame.contentWindow.document.forms[0].action="servlet/Shows"
    myIFrame.contentWindow.document.forms[0].submit();


  
}

function F1F2Colse()
{

        window.parent.jQuery('#dialog').dialog('close');

}


function Deviation(VarESeq)
{

       PopDev=dhtmlmodal.open('EmailBox', 'iframe', 'frmDeviation.jsp?EventSeq='+VarESeq, 'DEVIATION', 'width=630px,height=380px,center=1,resize=0,scrolling=1')

PopDev.onclose=function(){



        return true //allow closing of window

}

}

function PrintF1()
{
   
    document.forms[0].target="_Blank";
    document.forms[0].method="post";
    document.forms[0].action="servlet/do";
    document.forms[0].submit();
}
function Delete_Judges(JudgeNum)
{
    var JudgeSeq="JudgeSeq"+JudgeNum
    var JudgeName="lblJudge"+JudgeNum
     document.getElementById(JudgeSeq).value="";
     document.getElementById(JudgeName).innerHTML="";
     document.getElementById("hdnRefreshYN").value='Y' //If they delete any Judge, we should ask them to Refresh the screen
  
}