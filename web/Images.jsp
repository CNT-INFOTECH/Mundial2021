



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">




<%@ page import="java.io.*" %>
<%@ page import=" java.util.*"%>
<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>
<%@ page language="java" import="java.sql.*,java.io.*" %>
<%@ page import="java.io.*,javax.servlet.http.HttpServletRequest,javax.servlet.ServletInputStream" %>  
<%@ page import="java.io.FileWriter,java.io.IOException" %>  
<%@ page import ="java.sql.*,java.io.*,java.util.*" %>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>


<html>
<head>
<title>IMAGES</title>
<link rel="stylesheet" href="themes/base/jquery.ui.all.css">
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
<script type="text/javascript" src="jscRegistration.js"></script>
<script type="text/javascript" src="jscIndex.js"></script>     

 <link href="Registration.css" rel="stylesheet" type="text/css" />
 <link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/interface.js"></script>

<style type="text/css">
#footer_Bot {
	clear:both;
	text-align:center;
	/*background: #555;
	color:#fff;*/
	height:50px;
	padding:5px;
         bottom: auto;

}
</style>
</head>

<body>
<form enctype="multipart/form-data" name="images_frm" method="post">
<%@ include file="frmReg_ScreenAttributes.jsp"%>
<%       
    String REGSEQ="";        
    String strMode="";
    String SaveYN="N";
    if(request.getParameter("Mode")!=null)
        strMode=request.getParameter("Mode");

    if(strMode.equals("1"))
    {
    SaveYN="N";            
    session.removeAttribute("ses_REGSEQ");        
    }
    if(strMode.equals("2"))
    {
        if(request.getParameter("RegNo")!=null)
        REGSEQ =request.getParameter("RegNo");
        else
        REGSEQ="";           
    }
    else if(session.getAttribute("ses_REGSEQ")!=null)
        REGSEQ =(String) session.getAttribute("ses_REGSEQ");
    else
        REGSEQ="";                
%>
<%@ include file="frmImagesInclude.jsp"%>
    <div id="container">

    <div id="header">
    <%@ include file="frmHeader.jsp"%>
    </div>
	<%
		if(!bRegistraion)
		response.sendRedirect("login.jsp");

String FontColor="";
String RegType="";

if(strRegistration_Type.equals("R"))
{
   FontColor="blue";
   RegType="R";
}
else if(strRegistration_Type.equals("P"))
{
   FontColor="red";
   RegType="P";
}
else if(strRegistration_Type.equals("S"))
{
   FontColor="green";
   RegType="S";
}
%>
    <div id="content">              
     <table  border="0" cellpadding="0" cellspacing="0" width="100%" align="center">            
        <tr>
            <td>                    
                <%@ include file="frmReg_Top.jsp"%>
            </td>
        </tr>   
        <tr>
            <td>
                <table  border="1" width="100%" bordercolor="#ffffff" align="center" cellpadding="0" cellspacing="0">
                    <thead>
                        <tr>
                            <th>LADO DERECHO</th>
                            <th>FRENTE</th>
                            <th>LADO IZQUIERDO</th>
                        </tr>
                    </thead>
                    <tr>
                        <td>
                            <img src="putfile1.jsp?Type=0&ImgId=<%=REGSEQ%>" width="270" height="180">
                        </td> 
                        <td>
                            <img src="putfile1.jsp?Type=1&ImgId=<%=REGSEQ%>"  width="270" height="180">
                        </td> 
                        <td>
                            <img src="putfile1.jsp?Type=2&ImgId=<%=REGSEQ%>" width="270" height="180">
                        </td>   

                    </tr>
                    <tr class="altRow" >
                         <jsp:include page="/leftimage.jsp" />
                    </tr>

					<tr colspan="3" >
        <td  COLSPAN="3" align="center" >        
            <BR>
            <BR>
            <input type="button" id="Save_Images" class="button" value="Save" <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%>/>            
            <input type="button" id="ResetOwnersHistory" class="button" value="Reset" onclick="Reset_Images()"/>
            <!--<input type="button" id="Close" class="button" onclick="Close_Paso('Images.jsp')" value="Close" />-->
            <input type="button" id="Previous_Images" class="button" value="&laquo;" />
            <input type="button" id="Next_Images" class="button" value="&raquo;" />            
        </td>
    </tr>
                </table>
            </td>
        </tr>            <input type="hidden" name="SavedYN" id="SavedYN" value="" />
    </table>      
    </div>

    <div id="sidebar">
        <%@ include file="images_Side.jsp" %>
    </div>
           
    <div id="footer_Bot" align="bottom">
    <jsp:include page="/frmBottom_Registration.jsp"/>
    </div>

    </div>
    <div id="dialog-Reg" title="Search Registration" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  src="regsearchpopup.jsp"  id="modalIFrame_Show" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes">
        </iframe>
    </div>
    <div id="dialog-Calculator" style="display:none; background:url('Images/trans-wood-1.png')" >
        <iframe src="frmCalculator.jsp" id="modalIFrame_Calculator" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" >
        </iframe>
    </div>
   
</form>
</body>
</html>