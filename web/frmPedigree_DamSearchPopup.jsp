<%-- 
    Document   : regsearchpopup
    Created on : Apr 28, 2011, 1:07:52 PM
    Author     : Erzath
--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SEARCH</title>
        <link rel="stylesheet" href="themes/base/jquery.ui.all.css">
<meta name="Description" content="How to Build a Basic CSS Layout" />
<meta name="Keywords" content="css layout" />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="Buttons_Style.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="jquery-1.5.1.js"></script>
	<script type="text/javascript" src="external/jquery.bgiframe-2.1.2.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.core.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.widget.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.mouse.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.button.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.datepicker.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.draggable.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.position.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.resizable.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.dialog.js"></script>
	<script type="text/javascript" src="ui/jquery.effects.core.js"></script>
        <script type="text/javascript" src="jscIndex.js"></script>
        <style type="text/CSS">

div#wrapper1 {
width: 100%;
background:url("Images/trans-wood-1.png");
/*height:100%;*/
margin-top:0px;
margin-bottom: 0px;
margin-left: auto;
margin-right: auto;
padding: 0px;
/*border: thin solid #000000;*/

}

#contents {

background:  url("Images/logo_apccpfa_oficial_no_back4.png") no-repeat center;
/*align : center;*/
top : 1px;
margin : 0px 0px 0 100px;
padding : 8 0px 8px 8px;
color : #000000;
width : 70%;
height:100%;
border : 1px solid #ccc;
}
/*
.altRow
{

}

.altRow td
{
	border-bottom:1px dotted #ffffff;
         top : 0px;
	font-size:9pt;
	color:#000000;
	padding:5px 0 5px 5px;
	vertical-align:top;
	text-align:center;
}


.altRow  th
{
	background:#B7C0C7;
	color:#013366;
	font-weight:bold;
	font-size:9pt;
	text-align:center;
}*/
.altRow
{

}

.altRow td
{
	border-bottom:1px dotted #ffffff;
	font-size:9pt;
	color:#000000;
	padding:5px 0 5px 5px;
	vertical-align:top;
	text-align:center;
}


.altRow  th
{
	background:#4e738f;
	color:#fff;
	font-weight:bold;
	font-size:9pt;
	text-align:center;
}
fieldset { padding:20px;  }
input, textarea, select {font:12px/12px Arial, Helvetica, sans-serif; padding:0;}
fieldset.action {background:#9da2a6; border-color:#e5e5e5 #797c80 #797c80 #e5e5e5; margin-top:-20px;}
</style>
    </head>    
    <body>
  <form name="frmPedigree_DamSearchPopup" method="post">                    
      <div id="wrapper1">          
      <!--<div id="Contents">-->                            
                <table width="100%" border="0" class="altRow" title="SEARCH">
                    <tr>
                        <th colspan="2">HORSE SEARCH</th>
                    </tr>
                    <tr>
                        <td >REGISTRATION#</td>
                        <td ><input type="text" size="20" name="regno" id="regno"  style="background-color:  #FFF8DC; border:  1px solid #000000;"></td>
                    </tr>
                    <tr>
                        <td>HORSE NAME</td>
                        <td><input type="text" size="20" name="hor_name" id="hor_name"  style="background-color:  #FFF8DC; border:  1px solid #000000;"></td>            
                    </tr>
                    <tr>
                        <td>DOB</td>
                        <td><input type="text" size="20" name="dob" id="dob"  style="background-color:  #FFF8DC; border:  1px solid #000000;"></td>                
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                        <button id="Search_Pedigree_Dam">Search</button></td>
                    </tr>
                </table>              
  <!-- </div> -->                   
        </div>
        </form>
    </body>  
</html>
