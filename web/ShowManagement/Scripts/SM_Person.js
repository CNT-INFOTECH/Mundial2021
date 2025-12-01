

function submitPersonForm(theForm) {



var MandatoryElement = "";
var Mandates = [theForm.MemberLName];
var Mandates_Desc = ["Last Name"];

for(var i=0; i < Mandates.length;i++)
{
     MandatoryElement = validateField_Person(Mandates[i], "Please enter "+Mandates_Desc[i]);
    if (MandatoryElement != "") {
        alert(MandatoryElement);
        return false;
    }
 }
 $('.modal').show();
    document.forms[0].method = "post";
    document.forms[0].action = "../ShowController?PageID=NPERSON";
    document.forms[0].target = "_self";
    document.forms[0].submit();
    
 $('.modal').hide();  
}

function validateField_Person(fld, msg) {
    var error = "";
    if (fld.value == "") {
                //fld.style.background = 'lightblue';
        fld.focus();
        error = msg;
    } else {
        fld.style.background = 'White';
    }
    return error;
}

function GetInformation(ObjMemberNum){
    
    if(ObjMemberNum=='JAS')
        return false;
  
    if(ObjMemberNum=='')
        return false;
    
    var randomVal = randomString();
    document.forms[0].method = "post";
    document.forms[0].action = "SM_Person.jsp?"+randomVal+"&MemIdent="+ObjMemberNum;
    document.forms[0].target = "_self";
    document.forms[0].submit();
}

function ClearPerson(){
     var randomVal = randomString();
    document.forms[0].method = "post";
    document.forms[0].action = "SM_Person.jsp?"+randomVal+"&sMode=0";
    document.forms[0].target = "_self";
    document.forms[0].submit();
}


function Search_Person_Mst(){
    var randomVal = randomString();
    NewWindow("SM_SearchPerson.jsp?"+randomVal, 'NewPerson', '800', '430', 'no', 'center')
}

   function CloseWindow(evt)
{
    if (evt.keyCode == 27) {
        window.close();
    }
}  
 function DefaultFocus(){
var bFound = false;

for(i=0; i < document.forms[0].length; i++)
{
  if (document.forms[0][i].type != "button")
  {  
    if (document.forms[0][i].type != "hidden")
    {
       
      if (document.forms[0][i].disabled != true)
      {
         
          if(document.forms[0][i].value==''){
            document.forms[0][i].focus();
            var bFound = true;
        }
        
      }
    }
  }
  if (bFound == true)
    break;
}
 }