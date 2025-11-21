<%-- 
    Document   : index
    Created on : Jun 11, 2011, 10:37:26 AM
    Author     : administrator
--%>

<html>
    <head>
        <title>PASO TRACKER</title>
        <link href="login.css" rel="stylesheet" type="text/css" />
        
<script>
function validate(){
var username=document.form.user.value;
var password=document.form.pass.value;
if(username==""){
 alert("Enter Username!");
  return false;
}
if(password==""){
 alert("Enter Password!");
  return false;
}
return true;
}
</script>

        <script language="JavaScript" type="text/javascript">


function newCookie(name,value,days) {
 var days = 1;   // the number at the left reflects the number of days for the cookie to last
                 // modify it according to your needs
 if (days) {
   var date = new Date();
   date.setTime(date.getTime()+(days*24*60*60*1000));
   var expires = "; expires="+date.toGMTString(); }
   else var expires = "";
   document.cookie = name+"="+value+expires+"; path=/"; }

function readCookie(name) {
   var nameSG = name + "=";
   var nuller = '';
  if (document.cookie.indexOf(nameSG) == -1)
    return nuller;

   var ca = document.cookie.split(';');
  for(var i=0; i<ca.length; i++) {
    var c = ca[i];
    while (c.charAt(0)==' ') c = c.substring(1,c.length);
  if (c.indexOf(nameSG) == 0) return c.substring(nameSG.length,c.length); }
    return null; }

function eraseCookie(name) {
  newCookie(name,"",1); }

function toMem(a) {
	//alert("toMem"+a);
    newCookie('theName', document.form.user.value);     // add a new cookie as shown at left for every
    newCookie('theEmail', document.form.pass.value);   // field you wish to have the script remember
}

function delMem(a) {
  eraseCookie('theName');   // make sure to add the eraseCookie function for every field
  eraseCookie('theEmail');

   document.form.user.value = '';   // add a line for every field
   document.form.pass.value = ''; }



</script>

</head>

<!---<%

 
    if(session.getAttribute("user")!=null)
       session.removeAttribute("user");


%>*/-->
<body>
<div id="container">
    <div id="header">
              <img src="Images/HeaderBanner.png"alt="header image" width="100%"> 
    </div>

    <span style="float:left;border:solid 2px #4e738f;">
    <img src="Images/Picture1.png" width="482" height="250"></span>
    
    <span style="float:right; width:470;height:250;border:solid 2px #4e738f;">
        
    <form name="form" method="post" action="Login" onsubmit="if (this.checker.checked) toMem(this); return validate()">
    <br/>
    
    <table align="center">
        <tr><td>
		<%
        String chkLogin = "";
        if(request.getParameter("log")!=null)
            chkLogin=request.getParameter("log");
        else
            chkLogin="";

        if(chkLogin.equals("F")){
        %>
        <span style="color:red;font-size:20;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Incorrect Login!!!!!!!!</span>
        <%}else{%>
        <span style="color:blue;font-size:20;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sign In</span>
        <%}%>

<tr><td><br/>
            <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;USERNAME:</td></tr>
        <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="user" id="user" maxsize="10" style=" border: 1px solid #000000;"></td></tr>
        <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PASSWORD:</td></tr>
        <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="pass" id="pass" maxsize="20" style=" border: 1px solid #000000;"></td></tr>
        <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">Can't access your account?</a></td></tr>
        <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="checker" name="checker">Stay signed In</td></tr>
        <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" class="button" value="Sign In"></td></tr>
    
        </table>
    
    

</form>

    <script type="text/javascript" language="javascript">
<!--
document.form.user.value = readCookie("theName");
document.form.pass.value = readCookie("theEmail");
//-->
</script>
    </span>
    
    
    <table class="bottomtype" width="200" align="center">
        <tr align="center" valign="center">
            
            <td valign="center" align="center">©2011&nbsp;&nbsp;<a href="http://www.cntit.com" target="_blank"><img src="Images/cntit_smallest.png" align="center"></a> &nbsp;&nbsp;&nbsp;  ALL RIGHTS RESERVED.</td>

        </tr>
    </table>
</div>


</body>
</html>
