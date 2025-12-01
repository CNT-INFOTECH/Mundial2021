/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function display_c() {
   var refresh = 1000; // Refresh rate in milli seconds
   mytime = setTimeout('display_ct()', refresh)
}

function display_ct() {
   var date = new Date;
   var vyear = date.getFullYear();
   month = date.getMonth();
   months = new Array('January', 'February', 'March', 'April', 'May', 'June', 'Jully', 'August', 'September', 'October', 'November', 'December');
   d = date.getDate();
   day = date.getDay();
   days = new Array('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');
   h = date.getHours();
   if (h < 10)
   {
      h = "0" + h;
   }
   m = date.getMinutes();
   if (m < 10)
   {
      m = "0" + m;
   }
   s = date.getSeconds();
   if (s < 10)
   {
      s = "0" + s;
   }
   result = '' + days[day] + ' ' + months[month] + ' ' + d + ' ' + vyear + ' ' + h + ':' + m + ':' + s;

   document.getElementById('ct').innerHTML = result;
   tt = display_c();
}
function truncate(textbox){if(textbox.value.length > 0){textbox.value = textbox.value.replace(/^\s+/, '');}}
function trim_Common (str) {
	str = str.replace(/^\s+/, '');
	for (var i = str.length - 1; i >= 0; i--) {
		if (/\S/.test(str.charAt(i))) {
			str = str.substring(0, i + 1);
			break;
		}
	}
	return str;
}

/*	Purpose:fuction to mask  date	*/
function mask4(str, textbox, loc, delim, maxLength,event)
{
    // Added To avoid the BackSpace problem
    if (event != null && (event.keyCode == 9 || event.keyCode == 8 || event.keyCode == 37 || event.keyCode == 46))
            return true;
    // Added To Check the Max Length
    if (maxLength == null)
            maxLength = 1000;
    str = str.substring(0, maxLength);
        
    
    var locs = loc.split(',');
    for (var i = 0; i <= locs.length; i++)
    {
            for (var k = 0; k <= str.length; k++)
            {
                    if (k == locs[i])
                    {
                            if (str.substring(k, k+1) != delim)
                                    str = str.substring(0,k) + delim + str.substring(k,str.length)
                    }
            }
    }

    textbox.value = str;
}


function fnCommonAlert_New(msg,action,focusVar,title){
   $(function() {

      $('<div></div>').dialog({
            modal: true,
            title: title,
            width:500,
            open: function () {
               var markup = "<b>"+msg+"</b>";
               $(this).html(markup);                      
            },
            buttons: {
            "Ok": function() {     
                  $(this).dialog("close");
                  
                  if(action=='TransferOwnerPopup'){                     
//                    window.parent.jQuery('#dialog-Trans').dialog('close');                                              
                    window.location.reload();                             
                  }
                  if(focusVar!='' && focusVar!=undefined)
                  focusVar.focus();
               } 
            } 
      }); //end confirm dialog

   });                     
//   return false;   
}
function  commonAjaxFn(pageId, retnObj, url)
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
//                     alert(xmlhttp.responseText+":::::::::::::::")
         if (xmlhttp.responseText == 0)
            Items = ""
         else
         {
            Items = xmlhttp.responseText.trim();
            //retnObj.value=Items+"#@#";              
         }
      }
   }
   xmlhttp.open("GET", url, false);
   xmlhttp.send();

   return Items;
}
function fnGetCurrentUrl(){
    var sPath = window.location.pathname;
    var sPage = sPath.substring(sPath.lastIndexOf('/') + 1);   
    return sPage;
}
function fnResetPerson(){
    
    var pgUrl=fnGetCurrentUrl();
    
    document.forms[0].target="_self";
    document.forms[0].method="post";
    document.forms[0].action=pgUrl+"?Mode=2";
    document.forms[0].submit();
}


function getPersonDetails(asgnNo)
{
  
    if(asgnNo.value=='')  
           return false;
     
    var d= new Date();    
    var timeMillis=d.getTime();           
    
    alert(asgnNo.value)
    var result=commonAjaxFn("","","Ajax_Common.jsp?Key=CheckPerson&param1="+asgnNo.value);   
    alert(result)
    var entySeq="";
    
    if(result.trim()=='' || result.trim()=="0"){
        fnCommonAlert_New("Person not found. Please enter a valid ID#","",asgnNo,"Error Message");  
        asgnNo.value="";        
        return false;
    }else
       entySeq=result.trim();

//    var frmNames=["Person_frm","MembershipDetailsView","Member_PinDetails","Member_HorsesOwned","Person_ShowHistory_frm","Person_Observation_frm","Member_Regions"
//    ,"Member_AddressHistory","Documents_frmMember","Member_OtherAssociationsHistory","Member_MembershipHistory","Member_Partners","frmCommonLetters"
//   ,"CommonNotes_Main","Member_ServiceDetailsHistory","Person_InvoicesHistory","Member_Flags","HistoryAmateur","MagazineHistory"
//   ,"Member_WorkOrderDetails","Member_AddNewAddress","Member_AffidavitOfHeirship","Member_DisciplinaryActions","Membership_MakePayment","Member_SignatureAuthorization","HorsesBred","MERIT_AWARDS"];
//    
//    var frmUrl=["frmPerson.jsp?","Person_ViewMembershipInfm.jsp?","Member_PinDetails.jsp?","Member_HorsesOwned.jsp?","Person_ShowHistory.jsp?","Person_Observations.jsp?","Member_Regions.jsp?"
//    ,"Member_AddressHistory.jsp?","frmMemDocuments.jsp?","Member_OtherAssociationsHistory.jsp?","Member_MembershipHistory.jsp?","Member_Partners.jsp?","frmCommonLetters.jsp?"
//    ,"frmCommonNotes_Main.jsp?","Member_FullPaidServices.jsp?","Person_InvoicesHistory.jsp?","Member_Flags.jsp?","frmHistoryAmateur.jsp?","frmMember_MagazineHistory.jsp?"
//    ,"Member_WorkOrderDetails.jsp?","Member_AddNewAddress.jsp?","Member_AffidavitOfHeirship.jsp?","Member_DisciplinaryAction.jsp?","Membership_MakePayment.jsp?","Member_SignatureAuthorization.jsp?","Member_HorsesBred.jsp?"
//    ,"frmAwardsForMembers.jsp?amod=MemMod&srch=1&pg=1&"];

    var i=0;
    var url=fnGetCurrentUrl();
//    for(i=0;i<frmNames.length;i++){       
//       if(document.forms[0].name==frmNames[i]){
//          url=frmUrl[i];
//          break;       
//       }       
//    }
    if(url=="")
       url="frmPerson.jsp?";
    
    document.forms[0].target="_self";
    document.forms[0].method="post";
    document.forms[0].action=url+"?Mode=1&Enty="+entySeq+"&"+d.getTime();
    document.forms[0].submit();
}
