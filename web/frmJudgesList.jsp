<html>
<head>
<title>Judges</title>

<script type="text/javascript" src="jquery-1.5.1.js"></script>
<script type="text/javascript" src="ui/jquery.ui.autocomplete.js"></script>
<!-- <script type="text/javascript" src="AutoComplete/jquery.js"></script> -->
<script type='text/javascript' src='AutoComplete/jquery.autocomplete.js'></script>
<link rel="stylesheet" type="text/css" href="AutoComplete/jquery.autocomplete.css" />



<script type="text/javascript">
$().ready(function() {



	function formatItem(row) {
                 finalVal_formatItem=row[0].split('#@#')
		 return finalVal_formatItem[0] ;
	}
	function formatResult(row) {
                finalVal_formatResult=row[0].split('#@#')
		return finalVal_formatResult[0].replace(/(<.+?>)/gi, '');
	}


	$("#emailfield").autocomplete('Auto_JudgeList.jsp', {
		width: 200,
		matchContains: true,
		formatItem: formatItem,
		formatResult: formatResult
	});








});
</script>

</head>

<body style="background: #F3F3F3">

<h4>Select a judge</h4>
<form id="myform">
  <p>
  <input id="emailfield" type="text" name="T1" size="30"style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
            padding-left: 18px;
            width: 130px !important;">
  <input type="button" value="Ok" name="B1" onClick="parent.emailwindow.hide()" /></p>
</form>

</body>
</html>
