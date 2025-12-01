
$(function() {

$( "#Joiningdate" ).datepicker({
changeMonth: true,
changeYear: true
});

$( "#Paymentdate" ).datepicker({
changeMonth: true,
changeYear: true
});

$( "#duedate" ).datepicker({
changeMonth: true,
changeYear: true
});

$( "#Renewaldate" ).datepicker({
changeMonth: true,
changeYear: true
});

$( "#TxtEventFrom" ).datepicker({
changeMonth: true,
changeYear: true
});

$( "#TxtEventTo" ).datepicker({
changeMonth: true,
changeYear: true
});

$( "#dateObserv" ).datepicker({
changeMonth: true,
changeYear: true
});

$( "#EnddateObserv" ).datepicker({
changeMonth: true,
changeYear: true
});
      
});





function Save_Person()
{

    if(document.forms[0].OWNER_TYPE.value=='')
    {
        alert("Please Select Person Type");
        return false;
    }    
    else if(document.getElementById('OWNER_TYPE').value =='INDIVIDUAL')
    {
       if(document.getElementById("FIRSTNAME").value.length==0)
       {
           alert("Please Enter FirstName and LastName");
           return false;
       }
    }
    else if(document.getElementById('OWNER_TYPE').value =='ORGANIZATION')
    {
       if(document.getElementById('OrganizationName').value.length==0)
       {
           alert("Please Enter Organization Name");
           return false;
       }
    }
    
    document.forms[0].method="post";
    document.forms[0].action="PersonServlet?PAGEID=Person";
    document.forms[0].target="_self";
    document.forms[0].submit();
  
}

function Reset_Person()
{
    document.forms[0].method="post";
    document.forms[0].action="frmPerson.jsp";
    document.forms[0].target="_self";
    document.forms[0].submit();
}

function SaveMode()
{
    document.getElementById('SavedYN').value='N';

 if(document.forms[0].hdnregseq.value =="")
    {
        document.getElementById('SavedYN').value='N';
        return false;
    }
 if(document.forms[0].hdnregseq.value =="")
    {
        document.getElementById('SavedYN').value='N';
        return false;
    }
}

function PersonSearch()
{
    var details = 'titlebar=no,status=no,menubar=no,resizable=no,width=785,height=500,scrollbars=no,left=230,top=150';
    
    childWindow=open("frmReg_PersonSearchPopup.jsp","Cal",details);
   
    if (childWindow.opener == null)
        childWindow.opener = self;
        
    childWindow.focus();

}

function MemberSearch()
{
    
    var details = 'titlebar=no,status=no,menubar=no,resizable=no,width=685,height=500,scrollbars=no,left=200,top=150';

    childWindow=open("frmMemberPopup.jsp","Cal",details);
    if (childWindow.opener == null)
        childWindow.opener = self;
    childWindow.focus();

}

function HorsesOwned(EntitySeq,MemNo)
{
    if(EntitySeq=='' || MemNo=='')
        return false;
    /*
    var details = 'titlebar=no,status=no,menubar=no,resizable=no,width=600,height=500,scrollbars=no,left=230,top=150';

    childWindow=open("frmHorsesOwnedPopup.jsp?ENTITYSEQ="+EntitySeq,"Cal",details);
    if (childWindow.opener == null)
        childWindow.opener = self;
        childWindow.focus();*/
    $('#dialog-HorsesOwned').dialog({ autoOpen: false,height: 500,width: 700, modal: true });
    $('#dialog-HorsesOwned').dialog('open');
    $("#modalIFrame_HorsesOwned").attr('src','frmHorsesOwnedPopup.jsp?ENTITYSEQ='+EntitySeq);

    return false;
}
function Member_MakePayments(EntySeq,MemNo)
{    
    if(document.getElementById("HDNENTITYSEQ").value=='' || MemNo=='')
    {
        return false;
    }
    else if(document.getElementById("MEMBER_TYPE").value=='')
    {
        alert("Please select MemberType");
        return false;
    }
    
    $('#dialog-MakePayment').dialog({ autoOpen: false,height: 260,width: 500, modal: true });
    $('#dialog-MakePayment').dialog('open');
    $("#modalIFrame_MakePayment").attr('src','Person_MakePayment.jsp?EntitySeq='+EntySeq+'&MemberNum='+MemNo);

    return false;
}
/*function MakePayment()
{
        
    var strMembernum=document.getElementById('hiddenMemberSeq').value;
    $('#dialog-MakePayment').dialog({ autoOpen: false,height: 260,width: 450, modal: true });
    $('#dialog-MakePayment').dialog('open');
    $("#modalIFrame_MakePayment").attr('src','frmPaymentHistoryPopup.jsp?MemberNum='+strMembernum);

    return false;
  */  /*var details = 'titlebar=no,status=no,menubar=no,resizable=no,width=450,height=260,scrollbars=no,left=350,top=180';

    childWindow=open("frmPaymentHistoryPopup.jsp?MemberNum="+strMembernum ,"Cal",details );
    if (childWindow.opener == null)
        childWindow.opener = self;
        childWindow.focus();
*/
//}

//EXEC INS_UPD_MEMBERPAYMENTDETAILS @P0,@P1,@P2,@P3,@P4, @P5,@P6,@P7,@P8,@P9                                                                                ',4112,8193,@p7 output,N'',N'843',N'750',N'LIFETIME',N'2000',N'ACTIVE',N'02/16/2012',N'119',N'2/27/2012',N'CASH'
function Member_PaymentTransaction(pymtDate,modepymt,amtPaid)
{
        
    if(document.getElementById(pymtDate).value=='') 
    {
        alert("Please Select Payment Date");
        return false;
    }     
    else if(document.getElementById(modepymt).value=='') 
    {
        alert("Please Select Mode of Payment");
        return false;
    }
    else if(document.getElementById(amtPaid).value=='') 
    {
        alert("Please Enter Amount to be Paid");
        return false;
    }    
    else if( document.getElementById(amtPaid).value=='0')
    {
        alert("Amount Paid cannot be 0");
        return false;
    }
    
    valpymtDate=document.getElementById(pymtDate).value;
    valModePymnt=document.getElementById(modepymt).value;
    //valAmtPaid=document.getElementById(amtPaid).value;
    var valAmtPaid1=document.getElementById(amtPaid).value.split("$");;
    
    var valAmtPaid=valAmtPaid1[0];
    
    var valMemNum=document.getElementById("MemberNum").value;
    var valEntySeq=document.getElementById("EntitySeq").value;
    var valMemTyp=document.getElementById("Member_Type").value;    
    
    var valMemFeesSplit=document.getElementById("MemberFees").value.split("$");    
    //var valMemFees=document.getElementById("MemberFees").value;
    var valMemFees=valMemFeesSplit[0];    
    
    var valStatus=document.getElementById("Status").value;
    var valJoinDate=document.getElementById("JoiningDate").value;
            
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
              return false;
          else
          {
            var Items=xmlhttp.responseText;        
            alert("Your Payment has been processed successfully"); 
            
            window.parent.jQuery('#dialog-MakePayment').dialog('close');
            ReLoadMember(valEntySeq);
            //opener.parent.window.reload();                     
            //opener.parent.window.reload();             
          }                                                                                                                                                                                                  
        }
    }
    xmlhttp.open("GET","Member_MakePaymentServlet?PAGEID=MakePayment&Paymentdate="+valpymtDate+"&Modeofpayment="+valModePymnt+"&Amountpaid="+valAmtPaid+"&MemberNum="+valMemNum+"&EntitySeq="+valEntySeq+"&JoiningDate="+valJoinDate+"&Member_Type="+valMemTyp+"&MemberFees="+valMemFees+"&Status="+valStatus,true);
    xmlhttp.send();                
}
function ReLoadMember(valEntySeq)
{
    parent.window.document.forms[0].method="post";
    parent.window.document.forms[0].action="frmMember.jsp?Mode=1&Assigned="+valEntySeq;
    parent.window.document.forms[0].target="_self";
    parent.window.document.forms[0].submit();
}

function Save_Member()
{
    if(document.getElementById("MEMBER_TYPE").value=='')
    {
        alert("Please select MemberType");
        return false;
    }

    document.forms[0].method="post";
    document.forms[0].action="PersonServlet?PAGEID=Member";
    document.forms[0].target="_self";
    document.forms[0].submit();
}

function Reset_Member()
{
    document.forms[0].method="post";
    document.forms[0].action="frmMember.jsp";
    document.forms[0].target="_self";
    document.forms[0].submit();
}

function ImageEmpty()
{
    document.getElementById('upload1').value="";
}


function Reset_Observation()
{
    document.forms[0].method="post";
    document.forms[0].action="frmPerson_Observation.jsp";
    document.forms[0].target="_self";
    document.forms[0].submit();
}


function GenerateMemberShipFees(TypeMem)
{
    var strMembertype=document.getElementById(TypeMem).value;    
    if(strMembertype=='')
    {
        document.getElementById('Membership').value="";
        return false;
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
      if(xmlhttp.responseText == 0)
           return false;
      else
      {
        var Items=xmlhttp.responseText.split("#@#");
        document.getElementById('Membership').value=trimRegister(Items[0]);
        document.getElementById(varFocus).focus();
      }
    }
    }
    xmlhttp.open("GET","frm_MemberType.jsp?Membertype="+strMembertype,true);
    xmlhttp.send();
}

function PaymentHistory(EntySeq,MemNo)
{
    if(EntySeq==''|| MemNo=='')
        return false;
    
    $('#dialog-PaymentHistoryPopUp').dialog({ autoOpen: false,height: 500,width: 660, modal: true });
    $('#dialog-PaymentHistoryPopUp').dialog('open');
    $("#modalIFrame_PaymentHistoryPopUp").attr('src','Person_PaymentHistoryPopUp.jsp?EntySeq='+EntySeq);

    return false;   
}
function CheckDate(varDob,varTo)
{
    var currentdate = new Date();
    var curday  = currentdate.getDate();
    var curmon  = currentdate.getMonth()+1;
    var curyear = currentdate.getFullYear(); 
    
    var dString = document.getElementById(varDob).value;   
    var calmon=dString.split("/")[0]
    var calday=dString.split("/")[1]
    var calyear=dString.split("/")[2]   
    
    if(varTo!='')
    var varToDate = document.getElementById(varTo).value;   
    
    if(varTo=='')
    {
    if(Date.parse(dString) > Date.parse(currentdate) && varDob!='Paymentdate')
    {
    if(varDob=='Joiningdate')       
    alert("Invalid Date Range!\n Joining Date cannot be Future Date!")    
    else    
    alert("Invalid Date Range!\n Birth Date cannot be Future Date!")
    
    document.getElementById(varDob).value="";
    return false;    
    }
    else if(Date.parse(dString) > Date.parse(currentdate) && varDob=='Paymentdate')
    {
    alert("Invalid Date Range!\n Payment Date cannot be Future Date!")
    document.getElementById(varDob).value="";
    return false;    
    }
    else if(calday < curday && calmon <= curmon && calyear <= curyear && varDob=='Paymentdate')
    {
    alert("Invalid Date Range!\n Payment Date cannot be Before Date!")
    document.getElementById(varDob).value="";
    return false;    
    }      
    }
    else
    {
        if(Date.parse(dString) > Date.parse(currentdate) && (varDob!='Paymentdate' && varDob!='dateObserv'))
        {
        alert("Invalid Date Range!\n From Date cannot be Future Date!")
        document.getElementById(varDob).value="";
        return false;    
        }
        else if(Date.parse(varToDate) > Date.parse(currentdate) && (varDob!='Paymentdate' && varDob!='dateObserv'))
        {
        alert("Invalid Date Range!\n To Date cannot be Future Date!")
        document.getElementById(varTo).value="";
        return false;    
        }  
        else if(Date.parse(dString) > Date.parse(varToDate) && (varDob!='Paymentdate' && varDob!='dateObserv'))
        {
        alert("Invalid Date Range!\n To Date cannot be before From Date!")
        document.getElementById(varTo).value="";
        return false;    
        }  
        else if(Date.parse(dString) > Date.parse(currentdate) && varDob=='dateObserv')
        {
        alert("Invalid Date Range!\n Date of Observation cannot be Future Date!")
        document.getElementById(varDob).value="";
        return false;    
        }  
        else if(Date.parse(dString) > Date.parse(varToDate) && varDob=='dateObserv')
        {
        alert("Invalid Date Range!\n End Date cannot be before Date of Observation!")
        document.getElementById(varTo).value="";
        return false;    
        }
    }    
}
function DisplayPaymentHistory()
{
    document.forms[0].method="post";
    document.forms[0].action="Person_PaymentHistoryPopUp.jsp?Srch=1";
    document.forms[0].target="_self";
    document.forms[0].submit();
}

function DisplayPersonExcel()
{
    document.forms[0].target="_blank";
    document.forms[0].method="post";
    document.forms[0].action="PDFServletExcel?PAGEID=PERSON_PERSONSEARCH";
    document.forms[0].submit();
}
function Reset_PersonHistory()
{
    if(document.getElementById("Enty").value==''
       && document.getElementById("TxtEventFrom").value==''
       && document.getElementById("TxtEventTo").value==''
       && document.getElementById("TxtShowYear").value=='')
        return false;
                
    document.forms[0].target="_self";
    document.forms[0].method="post";
    document.forms[0].action="Person_ShowHistory.jsp?Mode=2";
    document.forms[0].submit();
}
function Show_PersonHistory(Seq)
{    
    document.forms[0].target="_self";
    document.forms[0].method="post";
    document.forms[0].action="Person_ShowHistory.jsp?Mode=1&Srch=1&Enty="+Seq;
    document.forms[0].submit();
}
function Reset_PersonObservation()
{
    if(document.getElementById("Enty").value=='')
        return false;
        
    document.forms[0].target="_self";
    document.forms[0].method="post";
    document.forms[0].action="Person_Observations.jsp?Mode=2";
    document.forms[0].submit();
}
function DisplayPersonObservation(Seq,ObsSeq)
{
    if(Seq=='')
        return false;
       
    $('#dialog-PersonObservation').dialog({ autoOpen: false,height: 320,width: 600, modal: true });
    $('#dialog-PersonObservation').dialog('open');
    $("#modalIFrame_PersonObservation").attr('src','Person_Observations_Popup.jsp?Enty='+Seq+'&ObsvSeq='+ObsSeq);

    return false; 
}
function Save_PersonObservation()
{
                      
    var val = document.getElementsByName('obsStatus')

    if(val[1].checked)
    {
        document.getElementsByName("obsStatus").value="TEMPORARY";
        if(document.getElementById("EnddateObserv").value=="")
        {
        alert("Please Enter the End Date")
        return false;
        }
    }
    else
    {
        document.getElementsByName("obsStatus").value="PERMANENT";
    }

    if(document.getElementById("ShowName").value=="")
    {
    alert("Please enter show name");
    return false;
    }
    if(document.getElementById("dateObserv").value=="")
    {
        alert("Please enter Observation date");
        return false;
    }
    else if(document.getElementById("Observation").value=="")
    {
        alert("Please enter Observation");
        return false;
    }
    else if(document.getElementById("ObservationType").value=="")
    {
        alert("Please enter ObservationType");
        return false;
    }
    else if(document.getElementById("UserName").value=="")
    {
        alert("Please enter UserName");
        return false;
    }

    window.parent.document.getElementById("Enty").value=document.getElementById("EntySeq").value;
    window.parent.document.getElementById("ShowName").value=document.getElementById("ShowName").value;
    window.parent.document.getElementById("dateObserv").value=document.getElementById("dateObserv").value;
    window.parent.document.getElementById("Observation").value=document.getElementById("Observation").value;
    window.parent.document.getElementById("ObservationSeq").value=document.getElementById("ObservationSeq").value;

    window.parent.document.getElementById("ObservationType").value=document.getElementById("ObservationType").value;
    window.parent.document.getElementById("obsStatus").value=document.getElementsByName("obsStatus").value;

    window.parent.document.getElementById("EnddateObserv").value=document.getElementById("EnddateObserv").value;
    window.parent.document.getElementById("UserName").value=document.getElementById("UserName").value;


    window.parent.jQuery('#dialog-PersonObservation').dialog('close');


    parent.document.forms[0].method="post";
    parent.document.forms[0].action="PersonServlet?PAGEID=PersonObservaitonPopUp";
    //document.forms[0].target="_self";
    parent.document.forms[0].submit();    
}
function Cancel_PersonObservation()
{
    window.parent.jQuery('#dialog-PersonObservation').dialog('close');
}

function DeletePersonObservation(EntySeq,ObsvSeq)
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
      if(xmlhttp.responseText == 0)
           return false;
      else
      {
        var EntySeq=xmlhttp.responseText;
        
        document.forms[0].target="_self";
        document.forms[0].method="post";
        document.forms[0].action="Person_Observations.jsp?Mode=1&Enty="+EntySeq;
        document.forms[0].submit();
      }
    }
    }
    xmlhttp.open("GET","Member_MakePaymentServlet?PAGEID=DELETEPERSONOBSERVAIONS&Enty="+EntySeq+"&ObsvSeq="+ObsvSeq,true);
    xmlhttp.send();
}
function Ajax_CheckMember(AsgNo,type,EntySeq)
{
    if(type=="button" && (AsgNo=="0" || AsgNo==''))
    {
        return false;
    }
    else if(AsgNo!=''&& AsgNo!="0")
    {    //return false;     
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
          {   
              
              if(type=="Link")
              {
              alert("Not a Member.Press Membership to become a Member.");             
              /*document.forms[0].target="_self";
              document.forms[0].method="post";
              document.forms[0].action="frmMember.jsp?Ent="+AsgNo;
              document.forms[0].submit();*/
              return false;   
              }
              else if(type=="button")
              {
                var bConfirm= confirm("Are you sure you want to become Member?");                                                        
                if (bConfirm)
                {
                   document.forms[0].target="_self";
                   document.forms[0].method="post";
                   document.forms[0].action="frmMember.jsp?Mode=2&Assigned="+EntySeq;
                   document.forms[0].submit(); 
                }    
              }
              else if(type=="button_Next")
              {                
                   document.forms[0].target="_self";
                   document.forms[0].method="post";
                  if(EntySeq!='')
                      document.forms[0].action="Person_ShowHistory.jsp?Mode=1&Enty="+EntySeq;                                     
                  else
                      document.forms[0].action="Person_ShowHistory.jsp";                                     
                  
                  document.forms[0].submit();                   
              }
              else if(type=="button_Previous")
              {                
                   document.forms[0].target="_self";
                   document.forms[0].method="post";
                  if(EntySeq!='')
                      document.forms[0].action="frmPerson.jsp?Mode=2&Assigned="+EntySeq;                                     
                  else
                      document.forms[0].action="frmPerson.jsp";                                     
                  
                  document.forms[0].submit();                   
              }
          }
          else 
          {
              var Items=xmlhttp.responseText; 
              
              document.forms[0].target="_self";
              document.forms[0].method="post";
              document.forms[0].action="frmMember.jsp?Mode=1&Assigned="+Items;
              document.forms[0].submit();
          }
        }
    }
    xmlhttp.open("GET","Member_MakePaymentServlet?PAGEID=MEMBER_NUM_CHECK&ID_NO="+AsgNo,true);
    xmlhttp.send(); 
    }
    else  //if(type=="Link")
    {
        document.forms[0].target="_self";
        document.forms[0].method="post";
        document.forms[0].action="frmMember.jsp";
        document.forms[0].submit();
    }
    /*else  if(type=="button_Next")
    {
        document.forms[0].target="_self";
        document.forms[0].method="post";
        document.forms[0].action="frmMember.jsp";
        document.forms[0].submit();
    }*/
}
function Person_BottomNavigation(URL)
{
    document.forms[0].target="_self";
    document.forms[0].method="post";
    document.forms[0].action=URL;
    document.forms[0].submit();
}
function checkOwnerType(obVal)
{
    if(obVal.value=='INDIVIDUAL')
    {            
    document.forms[0].ORG_NAME.disabled=true;            
    document.forms[0].ORG_NAME.value="";
    }
    if(obVal.value=='ORGANIZATION')
    {
    document.forms[0].ORG_NAME.disabled=false;       
    }         
}

function FNSchool(obj)
{  

	    
	if(obj.value=='YOUTH RIDER')
	{ 
		document.getElementById("ORGNAME").innerHTML="SCHOOL";

		document.forms[0].OrganizationName.disabled=true; 
		//document.forms[0].OrganizationName.STYLE.WIDTH=58; 
		document.getElementById("image").style.visibility="visible";
		//document.getElementById("OrganizationName").style.width = "25em";
		
	}
	 if(obj.value=='INDIVIDUAL')
	{ 
		document.getElementById("ORGNAME").innerHTML="ORG NAME"
		document.forms[0].OrganizationName.disabled=true;            
        document.forms[0].OrganizationName.value="";
		document.getElementById("image").style.visibility="Hidden";
	//	document.getElementById("OrganizationName").style.width = "33.6em";
		
	} 
	if(obj.value=='ORGANIZATION')
	{ 
		document.getElementById("ORGNAME").innerHTML="ORG NAME"
		document.forms[0].OrganizationName.disabled=false;  
		document.getElementById("image").style.visibility="Hidden";
		//document.getElementById("OrganizationName").style.width = "33.6em";
		
	} 
}