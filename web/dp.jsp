<%-- 
    Document   : index
    Created on : Jun 11, 2011, 10:37:26 AM
    Author     : administrator
--%>

<html>
    <head>
        <title>PASO TRACKER</title>
        <link href="login.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="rememberMe.js"></script>
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
</head>
<body
<div id="outer">
<form name="form" method="post" action="check.jsp" onsubmit="javascript:return validate();"if (this.checker.checked) toMem(this)">
<table>
<tr><td>Username:</td></tr>
<tr><td><input type="text" name="user"></td></tr>
<tr><td>Password:</td></tr>
<tr><td><input type="password" name="pass"></td></tr>
<tr><td><a href="">Can't access your account?</a></td></tr>
<tr><td><input type="checkbox" id="checker" name="checker">Stay signed In</td></tr>
<tr><td></td><td><input type="submit" value="Sign in"></td></tr>
<tr><td><%@include file="/check1.jsp"%></td></tr>
</table>
</form>
</div>
</body>
</html>