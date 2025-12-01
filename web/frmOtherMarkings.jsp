



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">


<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.DBConnection" %>
<%@ page import="pasotracker.GeneralServlet" %>
<html>
<head>
<title>OTHER MARKINGS</title>

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

<link href="buttons.css" rel="stylesheet" type="text/css" />
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
<form name="OtherMarkings_frm">
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

try{               
    GeneralServlet genn =new GeneralServlet();
            
    if(REGSEQ!=null)
    {
        RowSetFactory factory14 = RowSetProvider.newFactory();
   CachedRowSet crsOtherMarkings= factory14.createCachedRowSet();
   // CachedRowSetImpl crsOtherMarkings = new CachedRowSetImpl();
    if(REGSEQ.length()>0)
    crsOtherMarkings = genn.GetMarkings(REGSEQ);                                             
        if(crsOtherMarkings.next())
        {
        strBody="";
        strTail="";
        strHair="";
        strBranding="";
        strScars="";
        strOthers="";

            if(crsOtherMarkings.getString("Body")!=null)                  
                strBody= crsOtherMarkings.getString("Body").trim();
            else
                strBody="";
        
            if(crsOtherMarkings.getString("Tail")!=null)                  
                strTail= crsOtherMarkings.getString("Tail").trim();
            else
                strTail="";
        
            if(crsOtherMarkings.getString("Hair")!=null)                  
                strHair= crsOtherMarkings.getString("Hair").trim();
            else
                strHair="";
          
            if(crsOtherMarkings.getString("Branding")!=null)                  
                strBranding= crsOtherMarkings.getString("Branding").trim();
            else
                strBranding="";
        
            if(crsOtherMarkings.getString("Scars")!=null)                  
                strScars= crsOtherMarkings.getString("Scars").trim();
            else
                strScars="";
          
            if(crsOtherMarkings.getString("Others")!=null)                  
                strOthers= crsOtherMarkings.getString("Others").trim();
            else
                strOthers="";            
        }
   }

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
              
              <table class="altRow" align="center" width="100%" border="0"  >
                <th width="25%"><a onclick="CheckSave('Markings.jsp')" >HEAD</th><th></th>
                <th width="25%"><a onclick="CheckSave('frmForeLeg.jsp')" >FORE LEG</th><th></th>
                <th width="25%"><a onclick="CheckSave('frmHindLeg.jsp')" >HIND LEG</th><th></th>
                <th width="25%"><a onclick="CheckSave('frmOtherMarkings.jsp')" >OTHER MARKINGS</th>
             </table>
            <%@ include file="frmReg_Top.jsp"%>
            <table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
        <tr >
        <th style="background:#4e738f;
	color:#fff;
	font-weight:bold;
	font-size:12pt;">
         HORSE  OTHER MARKINGS
        </th>
        </tr>
        </table>
         <table border="0" cellpadding="0" cellspacing="0" width="100%" align="center" class='altRow'>
        <tr>
            <td>BODY</td>
            <td><input type="text" name="body" id="body" onKeyUp="SaveMode()" onfocus="clearDefault(this)" value="<%=strBody%>" size="100" style=" background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"/></td>
        </tr>
        <tr>
            <td>TAIL</td>
            <td><input type="text" name="tail" id="tail" onKeyUp="SaveMode()" value="<%=strTail%>" size="100" style=" background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"/></td>
        </tr>
        <tr>
            <td>HAIR</td>
            <td><input type="text" name="hair"  id="hair" onKeyUp="SaveMode()" value="<%=strHair%>"size="100" style=" background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"/></td>

        </tr>
        <tr>
            <td>BRANDING</td>
            <td><input type="text" name="branding" id="branding" onKeyUp="SaveMode()" value="<%=strBranding%>" size="100" style=" background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"/></td>

        </tr>
        <tr>
           <td>SCARS</td>
            <td><input type="text" name="scars" id="scars" onKeyUp="SaveMode()" value="<%=strScars%>" size="100" style=" background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"/></td>

        </tr>
        <tr>
           <td>OTHERS</td>
            <td><input type="text" name="others" id="others"  onKeyUp="SaveMode()" value="<%=strOthers%>" size="100" style=" background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"/></td>
        </tr>
<%                                                                                         
           }
            catch (Exception e) {
            System.err.println("Got an exception! ");
            System.err.println("++frmOtherMarkings.jsp+++"+e);
        } 
%>                
        <tr class="buttonstyle">
            <td align="center" colspan="5">
                <input type="button" id="Save_OtherMarkings"  onclick="Save_OtherMarking('frmOtherMarkings.jsp')" class="button" value="Save" />
                <input type="button" id="Reset_OtherMarkings" class="button" value="Reset" />
                <!--<input type="button" id="Close" class="button" value="Close" onclick="Close_Paso('frmOtherMarkings.jsp')"/>-->
                <input type="button" id="Previous_OtherMarkings" class="button" onclick="CheckSave('frmHindLeg.jsp')" value="&laquo;" />
                <input type="button" id="Next_OtherMarkings" class="button" onclick="CheckSave('frmPedigree.jsp')" value="&raquo;" />                                           
            </td>
        </tr>    
        <input type="hidden" name="SavedYN" id="SavedYN" />
        <input type='hidden' name="PAGEID" id="PAGEID" value="OTHERMARKINGS">
    </table>
              
    </div>


    <div id="sidebar">
        <%@ include file="Markings_Side.jsp" %>
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