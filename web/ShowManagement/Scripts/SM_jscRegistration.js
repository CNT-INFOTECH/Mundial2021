/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function validateRegistration(fld, msg) {
    var error = "";
    if (fld.value == "") { 
        fld.style.background = 'lightblue';
        fld.focus();
        error = msg;
    } else {
        fld.style.background = 'White';
    }
    return error;
}


function fnSaveHrsRegistration(theForm)
{   
   
    var MandatoryElement = "";


   var Mandates = [theForm.hrsName, theForm.regNo, theForm.hrsDob, theForm.hrsGender];
   var Mandates_Desc = ["Horse Name"];



   for(var i=0; i < Mandates.length;i++)
   {      
        MandatoryElement = validateRegistration(Mandates[i], "Please enter "+Mandates_Desc[i]);
 
       if (MandatoryElement != "") {
           alert(MandatoryElement);
           return false;
       }
    }
    

    document.forms[0].method = "post";
    document.forms[0].action = "../ShowController?PageID=HORSE_REGISTRATION";
    document.forms[0].target = "_self";
    document.forms[0].submit();
    
}

function fnCalculateAge(varDob,hrsAge,hrsGender)
{
  
    var dob = document.getElementById(varDob).value;

    var death="";
//    if(varDeath!='')
//    death=document.getElementById(varDeath).value;
   
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
        var Items=xmlhttp.responseText;
        document.getElementById(hrsAge).value=Items;
        document.getElementById(hrsGender).focus();
      }
    }
    }
    xmlhttp.open("GET","SM_GetHrsAge.jsp?dob="+dob+"&death="+death,true);
    xmlhttp.send();
}


function fnGetHrsDetails(regNo)
{
 
    var randomVal = randomString();
    document.forms[0].method = "post";
    document.forms[0].action = "SM_Registration.jsp?mode=SR&"+randomVal+"&paramRegNum="+regNo;
    document.forms[0].target = "_self";
    document.forms[0].submit();
}

function fnClearHrsDetails()
{
   
    var randomVal = randomString();
    document.forms[0].method = "post";
    document.forms[0].action = "SM_Registration.jsp?mode=CLR&"+randomVal;
    document.forms[0].target = "_self";
    document.forms[0].submit();
}


function fnSearchHrs()
{

   $('#dialog-Reg').dialog({autoOpen: false,height: 550, modal: true ,width: 735,
        hide:{effect:"explode"}        
    });
    $('#dialog-Reg').dialog('open');
    
    $("#modalIFrame_Reg").attr('src','SM_HrsSearchPopup.jsp');

    return false;
}





 function fnHrsSearch(url)
{  
//               document.forms[0].target="_self";
      document.forms[0].method="post";
      document.forms[0].action=url;
      document.forms[0].submit();
}


function fnDynamicFldAutoComplete_Reg(NameFld, IdNum, seqNum, url) {

try{

    $("#" + NameFld).autocomplete({
        source: function(request, response) {
              
            $.ajax({
              
                url: url,
                dataType: "json",
                data: {txtExhibitorName: request.term},
                success: function(data) {
                    
                    response($.map(data, function(item) {
                        return {
                            label: $.trim(item.Value),
                            id: item.id,
                            Num: item.Num
                        };
                    }));
                }
            });
        },
        minLength: 3,
        select: function(event, ui) {
            $('#' + seqNum).val(ui.item.id);
            $('#' + IdNum).val(ui.item.Num);
        }
//    });
    });
}
catch(err) {
    alert(err.message);
}

}