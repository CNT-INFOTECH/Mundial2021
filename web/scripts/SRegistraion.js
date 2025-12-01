
function trim11 (str) {
	str = str.replace(/^\s+/, '');
	for (var i = str.length - 1; i >= 0; i--) {
		if (/\S/.test(str.charAt(i))) {
			str = str.substring(0, i + 1);
			break;
		}
	}
	return str;
}

function SRSubmit(sireSeq,sireName,damSeq,damName,myname,w,h,scroll)
{

    
            if(trim11(document.forms[0].HorseName_S.value)=='')  {
                      alert('Please enter the HorseName')
                      document.forms[0].HorseName.focus();
                      return false;
             }

              if(trim11(document.forms[0].RegNum_S.value)=='')  {
                      alert('Please enter the RegNum')
                      document.forms[0].RegNum.focus();
                      return false;
             }

              if(trim11(document.forms[0].HGender.value)=='')  {
                      alert('Please select the gender')
                      document.forms[0].HGender.focus();
                      return false;
             }

              if(trim11(document.forms[0].Sreg_HDOB.value)=='')  {
                      alert('Please enter the DOB')
                      document.forms[0].Sreg_HDOB.focus();
                      return false;
             }

              if(trim11(document.forms[0].modality.value)=='')  {
                      alert('Please enter the modality')
                      document.forms[0].modality.focus();
                      return false;
             }

             if(trim11(document.forms[0].OwnerSeq.value)=='' && trim11(document.forms[0].owner.value)==''
                    && trim11(document.forms[0].Mowner.value)=='' && trim11(document.forms[0].Lowner.value)=='')  {

                      alert('Please enter/select the Owner Information')
                      document.forms[0].owner.focus();
                      return false;
             }


             if(trim11(document.forms[0].RiderSeq.value)=='' && trim11(document.forms[0].Rider_FN.value)==''
                    && trim11(document.forms[0].Rider_MN.value)=='' && trim11(document.forms[0].Rider_lN.value)=='')  {
                      alert('Please enter/select the rider information')
                      document.forms[0].Rider_FN.focus();
                      return false;
             }

           document.forms[0].method="post";
            document.forms[0].action="servlet/Shows"
            document.forms[0].submit();
       
    
       
   
}

function SR_Hrs_Submit(varMode)
{

            if(trim11(document.forms[0].HorseName_S.value)=='')  {
                      alert('Please enter the HorseName')
                      document.forms[0].HorseName_S.focus();
                      return false;
             }

           if(varMode=='M') // Madatory
          {
              if(trim11(document.forms[0].RegNum_S.value)=='')  {
                      alert('Please enter the RegNum')
                      document.forms[0].RegNum_S.focus();
                      return false;
             }

              if(trim11(document.forms[0].HGender.value)=='')  {
                      alert('Please select the gender')
                      document.forms[0].HGender.focus();
                      return false;
             }

              if(trim11(document.forms[0].Sreg_HDOB.value)=='')  {
                      alert('Please enter the DOB')
                      document.forms[0].Sreg_HDOB.focus();
                      return false;
             }

              if(trim11(document.forms[0].modality.value)=='')  {
                      alert('Please enter the modality')
                      document.forms[0].modality.focus();
                      return false;
             }

             if(trim11(document.forms[0].OwnerSeq.value)=='')  {

                      alert('Please enter/select the Owner Information')
                      document.forms[0].owner.focus();
                      return false;
             }

          }


            document.forms[0].method="post";
            document.forms[0].action="servlet/Shows"
            document.forms[0].submit();




}
function SR_Hrs_Reset()
{
            document.forms[0].method="post";
            document.forms[0].action="frmHrsRegistration.jsp"
            document.forms[0].submit();
}

function SR_Hrs_SD_Reset()
{
            document.forms[0].method="post";
            document.forms[0].action="frmSHrsRegistration.jsp"
            document.forms[0].submit();
}



function SR_Hrs_Close()
{
           self.close()
}
function chkSDContinue(){

            //opener.document.forms[0].method="post";
            //opener.document.forms[0].action="servlet/Shows"
            //opener.document.forms[0].submit();
            window.close();
}

function SireList(SireSeq,SireValue,Num,RegNum)
{


    if(Num==2)
    {

    opener.document.getElementById('sire2').value=SireSeq
    opener.document.getElementById('sireName2').value=SireValue

    }
    else if(Num==3)
    {
    opener.document.getElementById('sire3').value=SireSeq
    opener.document.getElementById('sireName3').value=SireValue
    }
else
{
opener.document.forms[0].sire.value=SireSeq
opener.document.forms[0].sireName.value=RegNum
opener.document.getElementById('Name_Label').innerHTML=SireValue
}
  window.close();
  
}

function DamList(DamSeq,DamValue,Num,DamRegNum)
{


if(Num==2)
{
    opener.document.getElementById('dam2').value=DamSeq
    opener.document.getElementById('damName2').value=DamValue
}
else if(Num==3)
{
    opener.document.getElementById('dam3').value=DamSeq
    opener.document.getElementById('damName3').value=DamValue
}
else
{
    opener.document.forms[0].dam.value=DamSeq
    opener.document.forms[0].damName.value=DamRegNum
    opener.document.getElementById('Dam_Label').innerHTML=DamValue
   
 }
     window.close();
   
}


$(document).ready(
function() {
        $( "#Sreg_HDOB" ).datepicker({
        changeMonth: true,
        changeYear: true
        });
});

$(document).ready(
function() {
        $( "#Sreg_HDOB2" ).datepicker({
        changeMonth: true,
        changeYear: true
        });
});

function SearchSireDame(myname,w,h,scroll,varType,SireNum)
{



    var winPop = null;

    LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
    TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
    Details ='height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable'
    winPop = window.open('frmSearchSire.jsp?Type='+varType+"&Num="+SireNum,myname,Details)
    

}



function Pop_Search_Sire_Dam(vartype,Num)
{
   
            document.forms[0].method="post";
            document.forms[0].action="frmSearchSire.jsp?mode=1&Type="+vartype+"&Num="+Num
            document.forms[0].submit();

}

function SearchOwner(myname,w,h,scroll,vartype,OwnNum)
{
     var winPop = null;

    LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
    TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
    Details ='height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable'
    winPop = window.open('frmOwner.jsp?Type='+vartype+"&Num="+OwnNum,myname,Details)


}

function Pop_Search_Owner(vartype,OwnNum)
{
            document.forms[0].method="post";
            document.forms[0].action="frmOwner.jsp?srch=1&Type="+vartype+"&Num="+OwnNum
            document.forms[0].submit();

}

function Pop_Search_Rider(RiderNum)
{
            document.forms[0].method="post";
            document.forms[0].action="frmListRider.jsp?srch=1&Num="+RiderNum
            document.forms[0].submit();

}



function SRReset(ObjEventSeq,ObjEventName)
{
  
    varEventSeq=ObjEventSeq.value
    varEventName=ObjEventName.value
    
            document.forms[0].method="post";
            document.forms[0].action="frmRegister_Horse_Shows.jsp?EventSeq="+varEventSeq+"&EventName="+varEventName
            document.forms[0].submit();


}


function SaveRider()
{


        document.forms[0].method="post";
        document.forms[0].action="servlet/Shows"
        document.forms[0].submit();

}

function ClosePerson()
{
   self.close()
}

function SetBreeder(BreederSeq,BreederVal,BredNum,AssignedNum)
{

    if(BredNum==2)
    {
      
    opener.document.getElementById('BreederSeq2').value=BreederSeq
    opener.document.getElementById('breeder2').value=BreederVal
    }
    else if(BredNum==3)
    {

    opener.document.getElementById('BreederSeq3').value=BreederSeq
    opener.document.getElementById('breeder3').value=BreederVal
    }

     else if(BredNum==21)  // For PARA CRIA BREEDER 1
    {
        opener.document.forms[0].BreederSeq.value=BreederSeq
        opener.document.forms[0].breeder.value=BreederVal
        opener.document.forms[0].Breeder_Assigned.value=AssignedNum
        opener.document.getElementById('Breeder_Label').innerHTML=BreederVal
    }

    else if(BredNum==22)  // For PARA CRIA BREEDER 2
    {
        opener.document.forms[0].BreederSeq2.value=BreederSeq
        opener.document.forms[0].breeder2.value=BreederVal
        opener.document.forms[0].Breeder_Assigned2.value=AssignedNum
        opener.document.getElementById('Breeder_Label2').innerHTML=BreederVal
    }
     else if(BredNum==23)  // For PARA CRIA BREEDER 2
    {
        opener.document.forms[0].BreederSeq3.value=BreederSeq
        opener.document.forms[0].breeder3.value=BreederVal
        opener.document.forms[0].Breeder_Assigned3.value=AssignedNum
        opener.document.getElementById('Breeder_Label3').innerHTML=BreederVal
    }

    else
    {
    opener.document.forms[0].BreederSeq.value=BreederSeq
    opener.document.forms[0].breeder.value=BreederVal
     opener.document.forms[0].Breeder_Assigned.value=AssignedNum
    opener.document.getElementById('Breeder_Label').innerHTML=BreederVal
    }
     window.close();

}

function SetOwner(OwnSeqVal,OwnerNameVal,OwnNum,AssignedNum)
    {
    if(OwnNum==0)
    {
        opener.document.forms[0].OwnerSeq_Main.value=OwnSeqVal
        opener.document.forms[0].owner_Main.value=OwnerNameVal
    }

     if(OwnNum==11) // For ParaCria and ConCria on the TOP
    {
     
        opener.document.forms[0].OwnerSeq_Main.value=OwnSeqVal
        opener.document.forms[0].owner_Main.value=OwnerNameVal
        opener.document.forms[0].Owner_Assigned_Main.value=AssignedNum
        opener.document.getElementById('owner_Label_Main').innerHTML=OwnerNameVal
    }
    else // For Short Registraion
    {
        opener.document.forms[0].OwnerSeq.value=OwnSeqVal
        opener.document.forms[0].owner.value=OwnerNameVal
        opener.document.forms[0].Owner_Assigned.value=AssignedNum
        opener.document.getElementById('owner_Label').innerHTML=OwnerNameVal
    }
     window.close();

}

function SetRider(SelRiderSeq,SelRiderVal,Num,AssignedNum)
{

    if(Num==2)
    {

    opener.document.getElementById('RiderSeq2').value=SelRiderSeq
    opener.document.getElementById('Rider_FN2').value=SelRiderVal
    }
    else if(Num==3)
    {
    opener.document.getElementById('RiderSeq3').value=SelRiderSeq
    opener.document.getElementById('Rider_FN3').value=SelRiderVal
    }

     else if(Num==21)  // For PARA CRIA RIDER 1
    {
        opener.document.forms[0].RiderSeq.value=SelRiderSeq
        opener.document.forms[0].Rider_FN.value=SelRiderVal
        opener.document.forms[0].Rider_Assigned.value=AssignedNum
        opener.document.getElementById('Rider_Label').innerHTML=SelRiderVal
    }
     else if(Num==22)  // For PARA CRIA RIDER 2
    {
        opener.document.forms[0].RiderSeq2.value=SelRiderSeq
        opener.document.forms[0].Rider_FN2.value=SelRiderVal
        opener.document.forms[0].Rider_Assigned2.value=AssignedNum
        opener.document.getElementById('Rider_Label2').innerHTML=SelRiderVal
    }

     else if(Num==23)  // For PARA CRIA RIDER 3
    {
        opener.document.forms[0].RiderSeq3.value=SelRiderSeq
        opener.document.forms[0].Rider_FN3.value=SelRiderVal
        opener.document.forms[0].Rider_Assigned3.value=AssignedNum
        opener.document.getElementById('Rider_Label3').innerHTML=SelRiderVal
    }

    else
   {
        opener.document.forms[0].RiderSeq.value=SelRiderSeq
        opener.document.forms[0].Rider_FN.value=SelRiderVal
        opener.document.forms[0].Rider_Assigned.value=AssignedNum
        opener.document.getElementById('Rider_Label').innerHTML=SelRiderVal
    
   }
    window.close();



}


function GetRiderInfo(url,xLeft,yTop)
{
    var yHeight = "";
		var xWidth = parseInt(xLeft - 200);

		var avilTH = window.screen.availHeight;
		var avilH = parseInt(yTop + 200);

		if(parseInt(avilTH) < parseInt(avilH) ) {
		yHeight = parseInt(yTop - 220);
		}
		else {
		yHeight = parseInt(yTop + 15);
		}

	 params  = 'dialogWidth=475';
	 params += ', dialogHeight=475';
	 params += ', left='+parseInt(xWidth)+',top='+parseInt(yHeight);
	 params += ', fullscreen=yes';


	window.showModalDialog(url,'popRider', params);

}


function CityStateZipDetails2(city,state,zip,Country)
{
    var w=500;
    var h=500
    var scroll='yes'

     var winPopZip = null;

    LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
    TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
    Details ='height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable'
    winPopZip = window.open('frmCityStateZipDetails.jsp?City='+city+'&State='+state+'&Zip='+zip,'CityStateZip',Details)

}

function retnCSZDetails(reCity,reState,reZip,reCountry)
{
   
   opener.document.getElementById('CITY').value=reCity
   opener.document.getElementById('STATE').value=reState
   opener.document.getElementById('ZIP').value=reZip
   opener.document.getElementById('COUNTRY').value=reCountry
   window.close();
}


function CityStateZipDetails(varCity,varState,varZip,varCountry,Value)
{
    if(trim11(Value)=='')
        return false;
    
    var City=document.getElementById(varCity).value
    var State=document.getElementById(varState).value
    var Zip=document.getElementById(varZip).value

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
      if(xmlhttp.responseText==0)
          return false
      else if (xmlhttp.responseText==2)
          CityStateZipDetails2(City,State,Zip,Value)
      else
          {
              var Items=xmlhttp.responseText.split('#@#');
              document.getElementById(varCity).value=trim11(Items[0])
              document.getElementById(varState).value=trim11(Items[1])
              document.getElementById(varZip).value=trim11(Items[2])
              document.getElementById(varCountry).value=trim11(Items[3])
          }
    }
  }
xmlhttp.open("GET","frmCheckCityState.jsp?City="+City+"&State="+State+"&Zip="+Zip,true);
xmlhttp.send();
}

function GetPersonByAssignedNum(AssignedNum,Seq,Assigned,Label)
{
    var CheckVal=trim11(AssignedNum)
    if(CheckVal=='')
        return false;
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
        if(xmlhttp.responseText.length >0)
        {
                var Items=xmlhttp.responseText.split('#@#')
               
                document.getElementById(Seq).value=trim11(Items[0])
                document.getElementById(Assigned).value=trim11(Items[1])
                document.getElementById(Label).innerHTML=trim11(Items[2])
                
        }


    }
  }
xmlhttp.open("GET","Ajax?PageID=PERSONS&ChkValue="+CheckVal,true);
xmlhttp.send();
}

function CheckRegNumExists(RegNum)
{

    var CheckVal=trim11(RegNum.value)
    if(CheckVal=='')
        return false;
  
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
        if(xmlhttp.responseText.length >0)
        {
                alert(xmlhttp.responseText)
                RegNum.value="";
                RegNum.focus();
        }

          
    }
  }
xmlhttp.open("GET","Ajax?PageID=SREGISTRAION&ChkValue="+CheckVal,true);
xmlhttp.send();
}



function PostAmount(RegType,MemYN,AmountVal)
{

      if(RegType[0].checked) // pre
        {
            if(MemYN[0].checked) // member
                AmountVal.value='50.00'
            else if(MemYN[1].checked) //non Member
                AmountVal.value='60.00'
        }
        else if (RegType[1].checked) //Spot
       {
           if(MemYN[0].checked)
                AmountVal.value='50.00'
            else if(MemYN[1].checked)
                AmountVal.value='60.00'

        }
}
function PostTotalAmount(CCAmount,ATMAmount,ChkAmount,CashAmount,MOAmount)
{
   
    document.forms[0].TotalPaid.value=
                Number(CCAmount.value) + Number(ATMAmount.value) + Number(ChkAmount.value)
                +Number(CashAmount.value) + Number(MOAmount.value)
     Balance();
}
function Balance()
{
   document.forms[0].Balance.value=Number(document.forms[0].AmountVal.value) - Number(document.forms[0].TotalPaid.value)
}

function chkforSire(sireSeq,sireName,w,h,scroll)
{
   alert(sireName);

    if(sireSeq.value=='')
    {

        if(sireName.value!='')    {
            var winSirePop = null;

            LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
            TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
            Details ='height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable'
            winSirePop = window.open('frmCheckSireDam.jsp?SireName='+sireName.value+'&DamName=','SirePop',Details)
        }
    }
}


function chkforDam(DamSeq,DamName,w,h,scroll)
{
    if(DamSeq.value=='')
    {

        if(DamName.value!='')    {
            var winDamPop = null;

            LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
            TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
            Details ='height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable'
            winDamPop = window.open('frmCheckSireDam.jsp?SireName=&DamName='+damName.value,'DamPop',Details)
        }
    }
}

function ClearHidderValues(hiddenSeq,ParentVal)
{
    if(ParentVal.value=='')
        hiddenSeq.value=''

}

  function JQueryClose_Short()
    {

        window.parent.jQuery('#dialog-Register').dialog('close');


    }


 function OpenCommonRef(DgTitle,RetnID,RetnSeqID)
{

    $('#dialog-CmmnRef').dialog({ autoOpen: false,height: 400,width: 400, modal: true,title:DgTitle});
    $('#dialog-CmmnRef').dialog('open');
    $("#modalIFrame_CmmnRef").attr('src','frmCommonRef_Others.jsp?RefType='+DgTitle+'&ReturnID='+RetnID+'&ReturnVal='+RetnSeqID);

    return false;

}

function getAge_Months(varDate,RetnObj,varEventSeq) {

   

    if( trim11(varDate)=='' )
    {
    return false
    }


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
        document.getElementById(RetnObj).innerHTML=xmlhttp.responseText
    }
  }
 
xmlhttp.open("GET","frmAjaxGetAge.jsp?Type=MD&Begin="+varDate+"&End="+varEventSeq,true);
xmlhttp.send();

  }


  function Pop_Add_Owner(vartype)
{
  
            document.forms[0].method="post";
            document.forms[0].action="frmEntityDetails.jsp?srch=1&Type="+vartype
            document.forms[0].submit();

}

function CheckGroup(ObjGroupID)
{
    alert('ObjGroupID.value')
}

function getAge_Years(varStartDate,varRetnObj,varEventSeq)
{


        if( trim11(varStartDate)=='' )
        {
           return false
        }
       

    
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
        document.getElementById("txtAGE").innerHTML=xmlhttp.responseText
    }
  }
xmlhttp.open("GET","frmAjaxGetAge.jsp?Type=YY&Begin="+varStartDate+"&End="+varEventSeq,true);
xmlhttp.send();

}
function SearchHorse(myname,w,h,scroll,varType,VarGroupType,EventSeq)
{

    var winPop = null;

    LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
    TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
    Details ='height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable'
    winPop = window.open('frmSearchHrs.jsp?Type='+varType+'&Group='+VarGroupType+'&ES='+EventSeq,myname,Details)
}


function OpenPlaceofBirth()
{
   
    $('#dialog-PlaceOfBirth').dialog({ autoOpen: false,height: 400,width: 535, modal: true,title:'PLACE OF BIRTH'});
    $('#dialog-PlaceOfBirth').dialog('open');
    $("#modalIFrame_PlaceOfBirth").attr('src','frmReg_CommonRef_Place.jsp');

    return false;

}


function OpenNew_Hrs_SireDam_Reg(varType)
{

 // varType='M'  for Male
  //varType='F'  for FeMale

            document.forms[0].method="post";
            document.forms[0].action="frmSHrsRegistration.jsp?Type="+varType
            document.forms[0].submit();

}


function GetHorseName_ByNum_SD(RegNum,Seq,RegSeq,Label,varGender)
{

   var CheckVal=trim11(RegNum)
    if(CheckVal=='')
        return false;

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

        if(xmlhttp.responseText.length >0)
        {

              var Items=xmlhttp.responseText.split('#@#')
            if(Items[0]=='')
            {
                 alert("Registration number does not exist")
                 document.getElementById(RegSeq).value="";
            }

            else
            {
                document.getElementById(Seq).value=trim11(Items[0])
                document.getElementById(RegSeq).value=trim11(Items[1])
                document.getElementById(Label).innerHTML=trim11(Items[2])
            }

               
        }


    }
  }

xmlhttp.open("GET","Ajax?PageID=GETHORSE_NAME&ChkValue="+CheckVal+"&Gender="+varGender,true);
xmlhttp.send();
}

function ClearFields_Shrt(var1,var2,lbl3)
{
   

    if(document.getElementById(var1).value=='')
    {
       
        document.getElementById(var1).value=''
        document.getElementById(var2).value=''
        document.getElementById(lbl3).innerHTML=''
    }
   
}

function OpenLink(myname,w,h,scroll,frmPage,keyValue,Param1)
{
    var winPop = null;

    LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
    TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
    Details ='height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable'
    var url=frmPage+"?"+Param1+"="+keyValue
    winPop = window.open(url ,myname,Details)
}

function ChageEditable(varObj)  // This function will turn the ReadOnly to Editable Fields
{
    varObj.readOnly=false;
}

function JQueryClose_YouthRiders()  // to close the Youth Riders Edit Pop up from the Particiapants page
{
    window.parent.jQuery('#Participant_Details').dialog('close');
}

function JQueryClose_Short_Edit()// to close the registration Edit Pop up from the Particiapants page
{
     window.parent.jQuery('#Participant_Details').dialog('close');

}