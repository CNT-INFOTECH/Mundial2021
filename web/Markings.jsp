



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">



<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.DBConnection" %>
<%@ page import="pasotracker.GeneralServlet" %>
<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>
<html>
<head>
<title>HEAD MARKINGS</title>

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
    
    
 <form name="Head_frm">
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
    String strType1="";
    String strType2="";
    String strType3="";
    String strType4="";
    String strType5="";

    //if(str_reggno!=null)
    if(REGSEQ!=null)
    {
       
 RowSetFactory factorycrsGetHeadMarkingsDetails = RowSetProvider.newFactory();
   CachedRowSet crsGetHeadMarkingsDetails= factorycrsGetHeadMarkingsDetails.createCachedRowSet();
       // CachedRowSetImpl crsGetHeadMarkingsDetails = new CachedRowSetImpl();
        
        if(REGSEQ.length()>0)
        crsGetHeadMarkingsDetails = genn.GetMarkings(REGSEQ);                                                      

        if (crsGetHeadMarkingsDetails.next())
        {
            strTxtHead="";
            strChkHead="";

            if(crsGetHeadMarkingsDetails.getString("Head")!=null)                         
                strTxtHead= crsGetHeadMarkingsDetails.getString("Head").trim();                
            else
                strTxtHead="";

            if(crsGetHeadMarkingsDetails.getString("Head_Type")!=null)                              
            {
               strChkHead= crsGetHeadMarkingsDetails.getString("Head_Type");
               
               
               String strHdType[]=strChkHead.split(",");
               if(strHdType.length>0)
                    strType1=strHdType[0];

               if(strHdType.length>1)
                    strType2=strHdType[1];

               if(strHdType.length>2)
                    strType3=strHdType[2];

               if(strHdType.length>3)
                    strType4=strHdType[3];

               if(strHdType.length>4)
                    strType5=strHdType[4];


            }
            else
                strChkHead="";
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
            <table  border="0" width="100%" bordercolor="#ffffff" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <th align="center" style="background:#4e738f;
	color:#fff;
	font-weight:bold;
	font-size:12pt;">
                    HORSE HEAD MARKINGS
                    </th>
                </tr>
            </table>
            <table border="1" width="100%" bordercolor="#ffffff" align="center" cellpadding="0" cellspacing="0" class="altRow"> 
                <tr>
                    <td width="20%">&nbsp;HEAD</td>
                    <td><input type="text"  size="70" onKeyUp="SaveMode()" name="headmark" value="<%=strTxtHead%>" style=" background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"/></td>
                </tr>
            </table>
            <table border="1" width="100%" bordercolor="#ffffff" align="center" cellpadding="0" cellspacing="0" class="altRow">
                <tr>
                    <% 
                   if(strChkHead!=null)
                   {  %>
                    <td  width="20%" align="left">&nbsp;<input type="checkbox"  onclick="HeadMarking_Values(this)" onchange="SaveMode()" name="Lucero_Corrido"                                      
                    <% if (strType1.trim().equals("Lucero Corrido") || strType2.trim().equals("Lucero Corrido") ||
                            strType3.trim().equals("Lucero Corrido") || strType4.trim().equals("Lucero Corrido") ||
                            strType5.trim().equals("Lucero Corrido")) {
                    %> checked <%}%> />&nbsp;Lucero Corrido</td>
                    <td  width="20%" align="left">&nbsp;<input type="checkbox"  onclick="HeadMarking_Values(this)" onchange="SaveMode()" name="Careto" 
                    <% if (strType1.trim().equals("Careto") || strType2.trim().equals("Careto") ||
                            strType3.trim().equals("Careto") || strType4.trim().equals("Careto") ||
                            strType5.trim().equals("Careto")) {
                        System.out.println();
                    %> checked <%}%> />&nbsp;Careto</td>
                    <td  width="20%" align="left">&nbsp;<input type="checkbox"  onclick="HeadMarking_Values(this)" onchange="SaveMode()" name="Lucero"  
                    <% if (strType1.trim().equals("Lucero") || strType2.trim().equals("Lucero") ||
                            strType3.trim().equals("Lucero") || strType4.trim().equals("Lucero") ||
                            strType5.trim().equals("Lucero")) {
                    %> checked <%}%> />&nbsp;Lucero</td>
                    <td  width="20%" align="left">&nbsp;<input type="checkbox"  onclick="HeadMarking_Values(this)" onchange="SaveMode()" name="Nariz"  
                    <% if (strType1.trim().equals("Nariz") || strType2.trim().equals("Nariz") ||
                            strType3.trim().equals("Nariz") || strType4.trim().equals("Nariz") ||
                            strType5.trim().equals("Nariz")) {
                    %> checked <%}%> />&nbsp;Nariz</td>
                        <td  width="20%" align="left">&nbsp;<input type="checkbox"  onclick="HeadMarking_Values(this)" onchange="SaveMode()" name="Careto_Entero"  
                    <% if (strType1.trim().equals("Careto Entero") || strType2.trim().equals("Careto Entero") ||
                            strType3.trim().equals("Careto Entero") || strType4.trim().equals("Careto Entero") ||
                            strType5.trim().equals("Careto Entero")) {
                    %> checked <%}%> />&nbsp;Careto Entero</td> <%}%>
                </tr>
               
                <tr>
                    <td align="center"><img src="Images/Head1.PNG" align="middle" height="120" width="100"></td>
                    <td align="center"><img src="Images/Head2.PNG" align="middle" height="120" width="100"></td>
                    <td align="center"><img src="Images/Head3.PNG" align="middle" height="120" width="100"></td>                     
                    <td align="center"><img src="Images/Head4.PNG" align="middle" height="120" width="100"></td>
                    <td align="center"><img src="Images/Head5.PNG" align="middle" height="120" width="100"></td>
                </tr>
<%                                                                                          
  } 
    catch (Exception e) {
    System.err.println("Got an exception! ");
    System.err.println("++Markings.jsp+++"+e);
} 
%>                
                <tr class="buttonstyle">
                    <td align="center" colspan="5">                        
                        <input type="button" id="SaveMarkings" name="SaveMarkings" onClick="Save_Markings('Markings.jsp')" class="button" value="Save" 
						<% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%>/>
                        <input type="button" id="Reset_Head" class="button" value="Reset" />
                        <!--<input type="button" id="Close" class="button" onclick="Close_Paso('Markings.jsp')" value="Close" />-->
                        <input type="button" id="PreviousMarkings" onclick="CheckSave('Images.jsp')" class="button" value="&laquo;" />
                        <input type="button" id="NextMarkings" onclick="CheckSave('frmForeLeg.jsp')" class="button" value="&raquo;" />
                    </td>
                    <input type='hidden' name="checkForSave" value="0">
                    <input type="hidden" name="SavedYN" id="SavedYN" />
                    <input type='hidden' name="PAGEID" id="PAGEID" value="HEADMARKINGS">
                </tr>
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