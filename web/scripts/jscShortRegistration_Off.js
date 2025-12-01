function trim_Off(str) {
	str = str.replace(/^\s+/, '');
	for (var i = str.length - 1; i >= 0; i--) {
		if (/\S/.test(str.charAt(i))) {
			str = str.substring(0, i + 1);
			break;
		}
	}
	return str;
}

$().ready(function() {
function formatItem(row) {
                 finalVal_formatItem=row[0].split('#@#')
		 return finalVal_formatItem[0] ;
	}
	function formatResult(row) {
                finalVal_formatResult=row[0].split('#@#')
		return finalVal_formatResult[0].replace(/(<.+?>)/gi, '');
	}


	$("#owner").autocomplete('Auto_Persons.jsp', {
		width: 300,
		matchContains: true,
		formatItem: formatItem,
		formatResult: formatResult
	});

         $("#owner").result(function(event, data, formatted) {
            //var hiddenShowSeq = $("#microchip_num");
            var value = data.toString().split('#@#');
           // hiddenShowSeq.val(value[1]);

            });



});


function SearchHorse(myname,w,h,scroll,varType,VarGroupType,EventSeq)
{

    var winPop = null;

    LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
    TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
    Details ='height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable'
    winPop = window.open('frmSearchHrs.jsp?Type='+varType+'&Group='+VarGroupType+'&ES='+EventSeq,myname,Details)
}

function SearchHorse_OffSprings(myname,w,h,scroll,varType,VarGroupType,EventSeq,ParentSeq,ParentType)
{

    var winPop = null;

    LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
    TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
    Details ='height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable'
    winPop = window.open('frmSearchDescHrs.jsp?Type='+varType+'&Group='+VarGroupType+'&ES='+EventSeq+'&TPS='+ParentSeq+'&PAR='+ParentType,myname,Details)
}

function SearchHorse_List(varHrsType,GroupType,EventSeq)
{

            document.forms[0].method="post";
            document.forms[0].action="frmSearchHrs.jsp?mode=1&Type="+varHrsType+'&Group='+GroupType+'&ES='+EventSeq;
            document.forms[0].submit();

}


function SearchHorse_Retn_Group(VarRegNum,GroupNum,GroupEventNum)
{
varEventSeq=opener.document.forms[0].EventSeq.value

 // if there is a Group Number assosiated with the Reg Num, we have to bring the Event Registration details, else we need to bring only the specific horse Details
if(GroupEventNum!='0')
    {

        opener.document.forms[0].method="post";
        opener.document.forms[0].action="frmRegister_Horse_Shows_Group.jsp?mode=1&GroupSeq="+GroupEventNum
        opener.document.forms[0].submit();

    }

else if (GroupNum==1)
  ajaxpage("frmShortRegistration_Off_G.jsp?mode=1&Reg="+VarRegNum+"&EventSeq="+varEventSeq,"Mare1","Y");
else if(GroupNum==2)
     ajaxpage("frmShortRegistration_Off_G2.jsp?mode=1&Reg="+VarRegNum+"&EventSeq="+varEventSeq,"Mare2","Y");
 else if(GroupNum==3)
     ajaxpage("frmShortRegistration_Off3.jsp?mode=1&Reg="+VarRegNum+"&EventSeq="+varEventSeq,"Mare3","Y")

  closeWindow();


}

function SearchHorse_Retn_Raza(VarRegNum,GroupNum,GroupEventNum)
{
varEventSeq=opener.document.forms[0].EventSeq.value

 // if there is a Group Number assosiated with the Reg Num, we have to bring the Event Registration details, else we need to bring only the specific horse Details
if(GroupEventNum!='0')
    {

        opener.document.forms[0].method="post";
        opener.document.forms[0].action="frmRegister_Horse_Shows_Group_Raza.jsp?mode=1&GroupSeq="+GroupEventNum
        opener.document.forms[0].submit();

    }

else if (GroupNum==1)
  ajaxpage("frmShortRegistration_Off_J4.jsp?mode=1&Reg="+VarRegNum+"&EventSeq="+varEventSeq,"Mare1","Y");
else if (GroupNum=='D1')
  ajaxpage("frmGroupReg_Dependent1.jsp?mode=1&Reg="+VarRegNum+"&EventSeq="+varEventSeq+'&Group=4',"Descendent1","Y");
else if (GroupNum=='D2')
  ajaxpage("frmGroupReg_Dependent2.jsp?mode=1&Reg="+VarRegNum+"&EventSeq="+varEventSeq+'&Group=4',"Descendent2","Y");
else if (GroupNum=='D3')
  ajaxpage("frmGroupReg_Dependent3.jsp?mode=1&Reg="+VarRegNum+"&EventSeq="+varEventSeq+'&Group=4',"Descendent3","Y");
else if (GroupNum=='D4')
  ajaxpage("frmGroupReg_Dependent4.jsp?mode=1&Reg="+VarRegNum+"&EventSeq="+varEventSeq+'&Group=4',"Descendent4","Y");

  closeWindow();


}

function SearchHorse_Retn_Desc(VarRegNum,GroupNum,GroupEventNum)
{


varEventSeq=opener.document.forms[0].EventSeq.value
 // if there is a Group Number assosiated with the Reg Num, we have to bring the Event Registration details, else we need to bring only the specific horse Details
if(GroupEventNum!='0')
    {

        opener.document.forms[0].method="post";
        opener.document.forms[0].action="frmRegister_Horse_Shows_Group_Descend.jsp?mode=1&GroupSeq="+GroupEventNum
        opener.document.forms[0].submit();

    }

else if (GroupNum=='1')
  ajaxpage("frmShortRegistration_Off_D.jsp?mode=1&Reg="+VarRegNum+"&EventSeq="+varEventSeq,"Mare1","Y");
else if (GroupNum=='D1')
  ajaxpage("frmGroupReg_Dependent1.jsp?mode=1&Reg="+VarRegNum+"&EventSeq="+varEventSeq+'&Group=3',"Descendent1","Y");
else if (GroupNum=='D2')
  ajaxpage("frmGroupReg_Dependent2.jsp?mode=1&Reg="+VarRegNum+"&EventSeq="+varEventSeq+'&Group=3',"Descendent2","Y");

  closeWindow();


}




function SearchHorse_Retn(VarRegNum,GroupNum,GroupEventNum)
{
varEventSeq=opener.document.forms[0].EventSeq.value


 // if there is a Group Number assosiated with the Reg Num, we have to bring the Event Registration details, else we need to bring only the specific horse Details
if(GroupEventNum!='0')
    {
     
        opener.document.forms[0].method="post";
        opener.document.forms[0].action="frmRegister_Horse_Shows_Group_OffSprings.jsp?mode=1&GroupSeq="+GroupEventNum
        opener.document.forms[0].submit();

    }

else if (GroupNum==1)
  ajaxpage("frmShortRegistration_Off.jsp?mode=1&Reg="+VarRegNum+"&EventSeq="+varEventSeq,"Mare1","Y");
else if(GroupNum==2)
     ajaxpage("frmShortRegistration_Off2.jsp?mode=1&Reg="+VarRegNum+"&EventSeq="+varEventSeq,"Mare2","Y");
 else if(GroupNum==3)
     ajaxpage("frmShortRegistration_Off3.jsp?mode=1&Reg="+VarRegNum+"&EventSeq="+varEventSeq,"Mare3","Y")

  closeWindow();
  

}

function SearchHorse_Retn_NoRefresh(VarRegNum,VarRegSeq,VarHorseName,varGroupType)
{
   

    if(varGroupType==1)  // For Equitation
     {alert(opener.document.forms[0].name)
		 
            if(opener.document.forms[0].name=='frmRider'){
                var eSq=opener.document.getElementById('EventSeq').value;
                   
                var result=commonAjaxFn("","","Ajax_Common.jsp?Key=EventHrsRegCheck&param1="+VarRegNum+"&param2="+eSq);      
                if(result!='Success'){
                    fnCommonAlert_New(result,"","","Error Message");  
                    return false;
                }
            }
            opener.document.forms[0].RegSeq.value=VarRegSeq
            opener.document.forms[0].Reg_Num.value=VarRegNum
            opener.document.getElementById('Name_Label').innerHTML=VarHorseName
     }
     else if(varGroupType==11)  // For CON CRIA AND FIRST OFF SPRING
     {
        
            opener.document.forms[0].RegSeq_S_Off.value=VarRegSeq
            opener.document.forms[0].RegNum_S_Off.value=VarRegNum
            opener.document.getElementById('Name_Label_off').innerHTML=VarHorseName
     }
     else if(varGroupType==12)  // For CON CRIA AND SECOND OFF SPRING
     {

            opener.document.forms[0].RegSeq_S_Off2.value=VarRegSeq
            opener.document.forms[0].RegNum_S_Off2.value=VarRegNum
            opener.document.getElementById('Name_Label_off2').innerHTML=VarHorseName
     }
      else if(varGroupType=='D1')  // For CON CRIA AND SECOND OFF SPRING
     {

            opener.document.forms[0].RegSeq_D1.value=VarRegSeq
            opener.document.forms[0].RegNum_D1.value=VarRegNum
            opener.document.getElementById('Name_Label_D1').innerHTML=VarHorseName
     }
      else if(varGroupType=='D2')  // For CON CRIA AND SECOND OFF SPRING
     {

            opener.document.forms[0].RegSeq_D2.value=VarRegSeq
            opener.document.forms[0].RegNum_D2.value=VarRegNum
            opener.document.getElementById('Name_Label_D2').innerHTML=VarHorseName
     }
      else if(varGroupType=='D3')  // For CON CRIA AND SECOND OFF SPRING
     {

            opener.document.forms[0].RegSeq_D3.value=VarRegSeq
            opener.document.forms[0].RegNum_D3.value=VarRegNum
            opener.document.getElementById('Name_Label_D3').innerHTML=VarHorseName
     }
      else if(varGroupType=='D4')  // For CON CRIA AND SECOND OFF SPRING
     {

            opener.document.forms[0].RegSeq_D4.value=VarRegSeq
            opener.document.forms[0].RegNum_D4.value=VarRegNum
            opener.document.getElementById('Name_Label_D4').innerHTML=VarHorseName
     }
   

  closeWindow();


}



var bustcachevar=1 //bust potential caching of external pages after initial request? (1=yes, 0=no)
var loadedobjects=""
var rootdomain="http://"+window.location.hostname
var bustcacheparameter=""

function ajaxpage(url, containerid,isPopUp){
var page_request = false
if (window.XMLHttpRequest) // if Mozilla, Safari etc
page_request = new XMLHttpRequest()
else if (window.ActiveXObject){ // if IE
try {
page_request = new ActiveXObject("Msxml2.XMLHTTP")
}
catch (e){
try{
page_request = new ActiveXObject("Microsoft.XMLHTTP")
}
catch (e){}
}
}
else
return false
page_request.onreadystatechange=function(){

if(isPopUp=='Y')
    loadpage(page_request, containerid)
if(isPopUp=='N')
    Ajaxpage(page_request, containerid)


}
if (bustcachevar) //if bust caching of external page
bustcacheparameter=(url.indexOf("?")!=-1)? "&"+new Date().getTime() : "?"+new Date().getTime()
page_request.open('GET', url+bustcacheparameter, false)
page_request.send(null)

}

function loadpage(page_request, containerid){

if (page_request.readyState == 4 && (page_request.status==200 || window.location.href.indexOf("http")==-1))
opener.document.getElementById(containerid).innerHTML=page_request.responseText

}

function Ajaxpage(page_request, containerid){

if (page_request.readyState == 4 && (page_request.status==200 || window.location.href.indexOf("http")==-1))
document.getElementById(containerid).innerHTML=page_request.responseText

}
function closeWindow()
{
    
    window.close();
}


function SRSubmit()
{

           document.forms[0].method="post";
            document.forms[0].action="servlet/Shows"
            document.forms[0].submit();
 

}


function SRReset_Off(ObjEventSeq,ObjEventName)
{
    varEventSeq=ObjEventSeq.value
    varEventName=ObjEventName.value

            document.forms[0].method="post";
            document.forms[0].action="frmRegister_Horse_Shows_Group_OffSprings.jsp?EventSeq="+varEventSeq+"&EventName="+varEventName
            document.forms[0].submit();


}

function SRReset_Group(ObjEventSeq,ObjEventName)
{
    varEventSeq=ObjEventSeq.value
    varEventName=ObjEventName.value

            document.forms[0].method="post";
            document.forms[0].action="frmRegister_Horse_Shows_Group.jsp?EventSeq="+varEventSeq+"&EventName="+varEventName
            document.forms[0].submit();


}

function SRReset_3D(ObjEventSeq,ObjEventName)
{
    varEventSeq=ObjEventSeq.value
    varEventName=ObjEventName.value

            document.forms[0].method="post";
            document.forms[0].action="frmRegister_Horse_Shows_Group_Descend.jsp?EventSeq="+varEventSeq+"&EventName="+varEventName
            document.forms[0].submit();


}
function SRReset_RAZA(ObjEventSeq,ObjEventName)
{
    varEventSeq=ObjEventSeq.value
    varEventName=ObjEventName.value

            document.forms[0].method="post";
            document.forms[0].action="frmRegister_Horse_Shows_Group_Raza.jsp?EventSeq="+varEventSeq+"&EventName="+varEventName
            document.forms[0].submit();


}




function CheckRegNumExists1(RegNum,varEventSeq,MareNum)
{

    var CheckVal=trim_Off(RegNum.value)
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
                if(MareNum=='Mare1')
                    ajaxpage("frmShortRegistration_Off_G.jsp?mode=1&Reg="+RegNum.value+"&EventSeq="+varEventSeq,MareNum,"N");
                else if(MareNum=='Mare2')
                    ajaxpage("frmShortRegistration_Off_G2.jsp?mode=1&Reg="+RegNum.value+"&EventSeq="+varEventSeq,MareNum,"N");
                else if(MareNum=='Mare3')
                    ajaxpage("frmShortRegistration_Off3.jsp?mode=1&Reg="+RegNum.value+"&EventSeq="+varEventSeq,MareNum,"N");
        }
        else
            {
                alert("The Registraion# not found.")
                RegNum.value=''
                RegNum.focus()
                return false
            }
            


    }
  }

xmlhttp.open("GET","Ajax?PageID=SREGISTRAION&ChkValue="+CheckVal,true);
xmlhttp.send();
}


function CheckRegNumExists2(RegNum,varEventSeq,MareNum)
{

    var CheckVal=trim_Off(RegNum.value)
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
                 if(MareNum=='Mare1')
                    ajaxpage("frmShortRegistration_Off.jsp?mode=1&Reg="+RegNum.value+"&EventSeq="+varEventSeq,MareNum,"N");
                 if(MareNum=='Mare2')
                      ajaxpage("frmShortRegistration_Off2.jsp?mode=1&Reg="+RegNum.value+"&EventSeq="+varEventSeq,MareNum,"N");
        }


    }
  }
xmlhttp.open("GET","Ajax?PageID=SREGISTRAION&ChkValue="+CheckVal,true);
xmlhttp.send();
}

function CheckRegNumExists3(RegNum,varEventSeq,MareNum)  // for MAJER DESCENDANTS
{

    var CheckVal=trim_Off(RegNum.value)
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
                if(MareNum=='Mare1')
                    ajaxpage("frmShortRegistration_Off_D.jsp?mode=1&Reg="+RegNum.value+"&EventSeq="+varEventSeq,MareNum,"N");
                
        }
        else
            {
                alert("The Registraion# not found.")
                RegNum.value=''
                RegNum.focus()
                return false
            }



    }
  }

xmlhttp.open("GET","Ajax?PageID=SREGISTRAION&ChkValue="+CheckVal,true);
xmlhttp.send();
}

function CheckRegNumExists4(RegNum,varEventSeq,MareNum)  // FOR JEFE DE RAZA
{

    var CheckVal=trim_Off(RegNum.value)
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
            
                if(MareNum=='Mare1')
                    ajaxpage("frmShortRegistration_Off_J4.jsp?mode=1&Reg="+RegNum.value+"&EventSeq="+varEventSeq,MareNum,"N");
               
        }
        else
            {
                alert("The Registraion# not found.")
                RegNum.value=''
                RegNum.focus()
                return false
            }



    }
  }

xmlhttp.open("GET","Ajax?PageID=SREGISTRAION&ChkValue="+CheckVal,true);
xmlhttp.send();
}


function prntElement(objForm)
{
	var formlen = objForm.elements.length;
	for(var Ti=0; Ti<(parseInt(formlen)); Ti++)
	{
//		alert("Elements: "+Ti+" Name: "+objForm.elements[parseInt(Ti)].name);
		document.write("Elements: "+Ti+" Name: "+objForm.elements[parseInt(Ti)].name);
		document.write('<br>');
	}
}

function NewHrs()
{
	    document.forms[0].method="post";
            document.forms[0].action="frmHrsRegistration.jsp"
            document.forms[0].submit();

}
function GetPersonByAssignedNum_Grp(AssignedNum,Seq,Assigned,Label)
{
   var CheckVal=trim_Off(AssignedNum)
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
                document.getElementById(Seq).value=trim_Off(Items[0])
                document.getElementById(Assigned).value=trim_Off(Items[1])
                document.getElementById(Label).innerHTML=trim_Off(Items[2])
        }


    }
  }
xmlhttp.open("GET","Ajax?PageID=PERSONS&ChkValue="+CheckVal,true);
xmlhttp.send();
}

function GetHorseName_ByNum_off(RegNum,Seq,RegSeq,Label)
{

   var CheckVal=trim_Off(RegNum)
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
                    alert("Registration number does not exist")

                document.getElementById(Seq).value=trim_Off(Items[0])
                document.getElementById(RegSeq).value=trim_Off(Items[1])
                document.getElementById(Label).innerHTML=trim_Off(Items[2])

        }


    }
  }

xmlhttp.open("GET","Ajax?PageID=GETHORSE_NAME&ChkValue="+CheckVal,true);
xmlhttp.send();
}