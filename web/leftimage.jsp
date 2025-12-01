<html>
<head>

<link rel="stylesheet" href="themes/base/jquery.ui.all.css">
<meta name="Description" content="How to Build a Basic CSS Layout" />
<meta name="Keywords" content="css layout" />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
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

<link href="Registration.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/interface.js"></script>
</head>
<body>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*" %>
<%@ page import="java.io.*,javax.servlet.http.HttpServletRequest,javax.servlet.ServletInputStream" %>  
<%@ page import="java.io.FileWriter,java.io.IOException" %>  
<%@ page import ="java.sql.*,java.io.*,java.util.*" %>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.io.*" %>
<%@ page import=" java.util.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<form name="LeftImage" enctype="multipart/form-data"  method="post" action="Gettostore.jsp" >
<table width="100%">    
    <tr>   
        <td align="left">    
            <input type="file" name="up" size="20" />
        </td>
        <td align="left">
            <input type="file" name="up1" size="20"/>
        </td>
        <td>
            <input type="file" name="up2" size="10"/>
        </td>
    </tr> 
    
</table>
</form>
</body>
</html>