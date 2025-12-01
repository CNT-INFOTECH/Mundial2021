

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en-US" xml:lang="en-US" xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Tryit Editor v1.4</title>
<link rel="stylesheet" type="text/css" href="/tryit.css" />
<script type="text/javascript">
function displayad()
{
var t=document.getElementById("pre_code").value;t=escape(t);document.getElementById("bt").value="1";
document.getElementById("code").value=t;
document.getElementById("adframe").src="/tryitbanner.asp?secid=trytags&rnd=" + Math.random();
}
</script>
</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr>
<td align="center">
<iframe id="adframe" style="background-color:#ffffff" height="98" width="960" marginwidth="0" marginheight="0" frameborder="0" scrolling="no"
></iframe>
</td>
</tr>
</table>

<table border="0" class="maintable" cellpadding="3px" cellspacing="3px">
<tr>
<td width="50%">

<form style="margin:0px" action="tryit_view.asp" method="post" target="view">
<input style="margin-bottom:5px;font-family:verdana;" name="submit" type="submit" value="Edit and Click Me >>" onclick="displayad()">
<textarea class="code_input" width="100%" height="400px" id="pre_code" wrap="logical">
<html>
<body>

<h3>This is a header</h3>
<p>This is a paragraph.</p>

<div style="color:#00FF00">
  <h3>This is a header</h3>
  <p>This is a paragraph.</p>
</div>

</body>
</html>

</textarea>
<input type="hidden" name="code" id="code" />
<input type="hidden" id="bt" name="bt" />
</form>

</td>
<td valign="top">
<p class="result_header">Your Result:</p>
<iframe class="result_output" width="100%" height="400px" frameborder="0" name="view" src="tryit_view.asp?filename=tryhtml_div_test"></iframe>
</td>
</tr>
<tr>
<td align="left" class="bottomtext">
Edit the code above and click to see the result.
</td>
<td align="right" class="bottomtext">
<a style="color:#617f10" href="http://www.w3schools.com">W3Schools.com</a> - Try it yourself&nbsp;
</td>
</tr>
</table>

</body>
</html>