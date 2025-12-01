function trim_R (str) {
	str = str.replace(/^\s+/, '');
	for (var i = str.length - 1; i >= 0; i--) {
		if (/\S/.test(str.charAt(i))) {
			str = str.substring(0, i + 1);
			break;
		}
	}
	return str;
}


function getRoleDetails(role_IdObj)
{

role_Idvalue=role_IdObj.value

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
		else
		{
              var Items=xmlhttp.responseText.split('#@#');
              
              document.forms[0].role_Id.value=trim_R(Items[0]);
                document.forms[0].role_name.value=trim_R(Items[1]);
                  document.forms[0].status.value=trim_R(Items[2]);   
	    }
	}       
  }
xmlhttp.open("GET","frmAjax_GetRoleDetails.jsp?RoleID="+role_Idvalue,true);

xmlhttp.send();
}




function getUserDetails(userIdObj)
{

userIdvalue=userIdObj.value

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

              var Items=xmlhttp.responseText.split('#@#');

            if(trim_R(Items[1])=='Y')
                {
                    element = document.getElementById('Password_DIV');
                    element.style.display = 'none';
                    document.forms(0).ChkPwdFlg.value='N';
                   
                }
              else
                  {
                      
                      element.style.display = 'block';
                  }   
            
                  document.forms(0).userId.value=trim_R(Items[0])
                 /* document.forms(0).firstname.value=trim_R(Items[1])
                  document.forms(0).middlename.value=trim_R(Items[2])
                  document.forms(0).lastname.value=trim_R(Items[3])
                  document.forms(0).address.value=trim_R(Items[4])
                  document.forms(0).phone.value=trim_R(Items[5])
                  document.forms(0).email.value=trim_R(Items[6])
                  document.forms(0).address2.value=trim_R(Items[7])
                  document.forms(0).city.value=trim_R(Items[8])
                  document.forms(0).state.value=trim_R(Items[9])
                  document.forms(0).zip.value=trim_R(Items[10])
                  document.forms(0).status.value=trim_R(Items[11])
                  */

                    //alert(document.getElementByName('address'));
                    document.forms[0].method="post";
                    document.forms[0].action="User_Selected.jsp?userID="+trim_R(Items[0]);
                    document.forms[0].submit();

    }


  }
xmlhttp.open("GET","frmAjax_GetUserDetails.jsp?USERID="+userIdvalue,true);

xmlhttp.send();
}




