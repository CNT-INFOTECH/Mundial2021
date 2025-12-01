
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">



<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.DBConnection" %>
<%@ page import="pasotracker.GeneralServlet" %>
<html>
<head>
<title>FORELEG MARKINGS</title>

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
<script type="text/javascript" src="jscForeLeg.js"></script>

 <link href="Registration.css" rel="stylesheet" type="text/css" />
 <link href="buttons.css" rel="stylesheet" type="text/css" />
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
    
    
 <form name="ForeLeg_frm">
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
    //String str_reggno =(String) session.getAttribute("Regno_str");               
    GeneralServlet genn =new GeneralServlet();
                        
    if(REGSEQ!=null)
    {
        
        
 RowSetFactory factorycrsGetForeLegMarkingsDetails = RowSetProvider.newFactory();
   CachedRowSet crsGetForeLegMarkingsDetails= factorycrsGetForeLegMarkingsDetails.createCachedRowSet();
        //CachedRowSetImpl crsGetForeLegMarkingsDetails = new CachedRowSetImpl();
        if(REGSEQ.length()>0)
        crsGetForeLegMarkingsDetails = genn.GetMarkings(REGSEQ);            
        //while(crsGetForeLegMarkingsDetails.next())
        if(crsGetForeLegMarkingsDetails.next())
        {
            strTxtLeftForeLeg="";
            strTxtRightForeLeg="";
            strChkLeftForeLeg="";
            strChkRightForeLeg="";

        if(crsGetForeLegMarkingsDetails.getString("LeftFLeg")!=null)                  
            strTxtLeftForeLeg= crsGetForeLegMarkingsDetails.getString("LeftFLeg").trim();
        else    
            strTxtLeftForeLeg="";
            
        if(crsGetForeLegMarkingsDetails.getString("LeftFLeg_Type")!=null)                  
            strChkLeftForeLeg= crsGetForeLegMarkingsDetails.getString("LeftFLeg_Type");
        else    
            strTxtLeftForeLeg="";    

        if(crsGetForeLegMarkingsDetails.getString("RightFLeg")!=null)                  
            strTxtRightForeLeg= crsGetForeLegMarkingsDetails.getString("RightFLeg").trim();
        else    
            strTxtRightForeLeg="";   

        if(crsGetForeLegMarkingsDetails.getString("RightFLeg_Type")!=null)                  
            strChkRightForeLeg= crsGetForeLegMarkingsDetails.getString("RightFLeg_Type");
        else    
            strChkRightForeLeg="";

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
                <th width="25%"><a  onclick="CheckSave('Markings.jsp')" >HEAD</th><th></th>
                <th width="25%"><a  onclick="CheckSave('frmForeLeg.jsp')" >FORE LEG</th><th></th>
                <th width="25%"><a  onclick="CheckSave('frmHindLeg.jsp')" >HIND LEG</th><th></th>
                <th width="25%"><a  onclick="CheckSave('frmOtherMarkings.jsp')" >OTHER MARKINGS</th>
             </table>
            <%@ include file="frmReg_Top.jsp"%>
            <table  border="0" width="100%" bordercolor="#ffffff" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <th align="center" style="background:#4e738f;
	color:#fff;
	font-weight:bold;
	font-size:12pt;">
                    HORSE  FORE LEG MARKINGS
                    </th>
                </tr>
            </table>
            <table  border="1" width="100%" bordercolor="#ffffff" align="center" cellpadding="0" cellspacing="0" class="altRow">            
                <tr>
                    <td width="20%">&nbsp;LEFT FORE LEG</td>
                    <td><input type="text"  size="55" onKeyUp="SaveMode()" name="LeftForeLeg" value="<%=strTxtLeftForeLeg%>" style=" background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"/></td>
                </tr>
            </table>
            <table  border="1" width="100%" bordercolor="#ffffff" align="center" cellpadding="0" cellspacing="0" class="altRow">
                <tr>
                    <% 
                   if(strChkLeftForeLeg!=null)
                   {  %>
                    <td  width="20%" align="left">&nbsp;<input type="checkbox" name="CORONA_LEFT_FL" onchange="SaveMode()" onclick="LeftForeLeg_Values(this)"
                    <% if (strChkLeftForeLeg.trim().equals("Corona")) {
                    %> checked <%}%>/>&nbsp;Corona</td>
                    <td  width="20%" align="left">&nbsp;<input type="checkbox" name="CUARTILLA_LEFT_FL" onchange="SaveMode()" onclick="LeftForeLeg_Values(this)" 
                    <% if (strChkLeftForeLeg.trim().equals("Cuartilla")) {
                    %> checked <%}%>/>&nbsp;Cuartilla</td>
                    <td  width="20%" align="left">&nbsp;<input type="checkbox" name="NUDILLO_LEFT_FL" onchange="SaveMode()" onclick="LeftForeLeg_Values(this)" 
                    <% if (strChkLeftForeLeg.trim().equals("Nudillo")) {
                    %> checked <%}%>/>&nbsp;Nudillo</td>
                    <td  width="20%" align="left">&nbsp;<input type="checkbox" name="CALZADO_LEFT_FL" onchange="SaveMode()" onclick="LeftForeLeg_Values(this)" 
                    <% if (strChkLeftForeLeg.trim().equals("Calzado")) {
                    %> checked <%}%>/>&nbsp;Calzado</td>
                    <td  width="20%" align="left">&nbsp;<input type="checkbox" name="PATIBLANCO_LEFT_FL" onchange="SaveMode()" onclick="LeftForeLeg_Values(this)" 
                    <% if (strChkLeftForeLeg.trim().equals("Patiblanco")) {
                    %> checked <%}%>/>&nbsp;Patiblanco</td><%}%>
                </tr>
                <tr>
                    <td align="center"><img src="Images/Leg1.PNG" align="middle" height="100" width="100"></td>
                    <td align="center"><img src="Images/Leg2.PNG" align="middle" height="100" width="100"></td>
                    <td align="center"><img src="Images/Leg3.PNG" align="middle" height="100" width="100"></td>                     
                    <td align="center"><img src="Images/Leg4.PNG" align="middle" height="100" width="100"></td>
                    <td align="center"><img src="Images/Leg5.PNG" align="middle" height="100" width="100"></td>
                </tr>
            </table>
            <table  border="1" width="100%" bordercolor="#ffffff" align="center" cellpadding="0" cellspacing="0" class="altRow">
                <tr>
                    <td width="20%">&nbsp;RIGHT FORE LEG</td>
                    <td ><input type="text"  size="54" onKeyUp="SaveMode()" name="RightForeLeg" value="<%=strTxtRightForeLeg%>" style=" background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;" /></td>
                </tr>
            </table>
            <table  border="1" width="100%" bordercolor="#ffffff" align="center" cellpadding="0" cellspacing="0" class="altRow">
                <tr>
                    <% 
                   if(strChkRightForeLeg!=null)
                   {  %>
                    <td  width="20%" align="left">&nbsp;<input type="checkbox" onchange="SaveMode()" name="CORONA_RIGHT_FL" onclick="RightForeLeg_Values(this)" 
                    <% if (strChkRightForeLeg.trim().equals("Corona")) {
                    %> checked <%}%>/>&nbsp;Corona</td>
                    <td  width="20%" align="left">&nbsp;<input type="checkbox" onchange="SaveMode()" name="CUARTILLA_RIGHT_FL" onclick="RightForeLeg_Values(this)" 
                    <% if (strChkRightForeLeg.trim().equals("Cuartilla")) {
                    %> checked <%}%>/>&nbsp;Cuartilla</td>
                    <td  width="20%" align="left">&nbsp;<input type="checkbox" onchange="SaveMode()" name="NUDILLO_RIGHT_FL" onclick="RightForeLeg_Values(this)" 
                    <% if (strChkRightForeLeg.trim().equals("Nudillo")) {
                    %> checked <%}%>/>&nbsp;Nudillo</td>
                    <td  width="20%" align="left">&nbsp;<input type="checkbox" onchange="SaveMode()" name="CALZADO_RIGHT_FL" onclick="RightForeLeg_Values(this)" 
                    <% if (strChkRightForeLeg.trim().equals("Calzado")) {
                    %> checked <%}%>/>&nbsp;Calzado</td>
                    <td  width="20%" align="left">&nbsp;<input type="checkbox" onchange="SaveMode()" name="PATIBLANCO_RIGHT_FL" onclick="RightForeLeg_Values(this)" 
                    <% if (strChkRightForeLeg.trim().equals("Patiblanco")) {
                    %> checked <%}%>/>&nbsp;Patiblanco</td><%}%>
                </tr>
                <tr>
                    <td align="center"><img src="Images/Leg1.PNG" align="middle" height="100" width="100"></td>
                    <td align="center"><img src="Images/Leg2.PNG" align="middle" height="100" width="100"></td>
                    <td align="center"><img src="Images/Leg3.PNG" align="middle" height="100" width="100"></td>                     
                    <td align="center"><img src="Images/Leg4.PNG" align="middle" height="100" width="100"></td>
                    <td align="center"><img src="Images/Leg5.PNG" align="middle" height="100" width="100"></td>
                </tr>
<%                                                                                        
  } 
    catch (Exception e) {
    System.err.println("Got an exception! ");
    System.err.println("++frmForeLeg.jsp+++"+e);
} 
%>               
               <tr class="buttonstyle">
                    <td align="center" colspan="5">
                        <input type="button" id="Save_FL" onclick="Save_ForeLeg('frmForeLeg.jsp')" class="button" value="Save" />
                        <input type="button" id="Reset_FL" class="button" value="Reset" />
                        <!--<input type="button" id="Close" class="button" value="Close" onclick="Close_Paso('frmForeLeg.jsp')"/>-->
                        <input type="button" id="Previous_FLMarkings" onclick="CheckSave('Markings.jsp')" class="button" value="&laquo;" />
                        <input type="button" id="Next_FLMarkings" onclick="CheckSave('frmHindLeg.jsp')" class="button" value="&raquo;" />                                          
                    </td>
                </tr><input type="hidden" name="SavedYN" id="SavedYN" />
                <input type='hidden' name="PAGEID" id="PAGEID" value="FORELEGMARKINGS">
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