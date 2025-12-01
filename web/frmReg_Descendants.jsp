<%-- 
    Document   : frmReg_Descendants
    Created on : Jun 27, 2013, 2:05:21 PM
    Author     : Erzath
--%>

<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>
<html>

    <head>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.GeneralServlet" %>
<%@ page import="pasotracker.DbConnMngr" %>

        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>DESCENDANTS</title>
        <link rel="stylesheet" href="Style_Popup.css">
        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
        <link href="buttons.css" rel="stylesheet" type="text/css" />
        <link href="frmReg_CommonRef.css" rel="stylesheet" type="text/css" />
        <link href="Registration.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="themes/base/jquery.ui.all.css">

        <script src="jquery-1.5.1.js"></script>
        <script src="external/jquery.bgiframe-2.1.2.js"></script>
        <script src="ui/jquery.ui.core.js"></script>
        <script src="ui/jquery.ui.widget.js"></script>
        <script src="ui/jquery.ui.mouse.js"></script>
        <script src="ui/jquery.ui.button.js"></script>
        <script src="ui/jquery.ui.draggable.js"></script>
        <script src="ui/jquery.ui.position.js"></script>
        <script src="ui/jquery.ui.resizable.js"></script>
        <script src="ui/jquery.ui.dialog.js"></script>
        <script src="ui/jquery.effects.core.js"></script>
        <script src="ui/jquery.ui.datepicker.js"></script>
        <script src="js/jquery.autocomplete.js"></script>
        <script type="text/javascript" src="jscIndex.js"></script>
        <script type="text/javascript" src="jscRegistration.js"></script>
        <script type="text/javascript" src="js/interface.js"></script>

<style type="text/CSS">
<!--
@import url("CommonTableStyle.css");
-->

</style>
    </head>
    <body>
<form name="Reg_Descendants">
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
    <%@ include file="frmOwnersHistoryInclude.jsp"%>
<div id="container">

    <div id="header">
        <%@ include file="frmHeader.jsp"%>
    </div>
<%
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

    String Regno="";
    Regno=str_reggno;  //Regno is used in frmReg_Top.jsp
%>
    <div id="content">

        <%@ include file="frmReg_Top.jsp"%>

<%
    int totalCount=0;
    Connection localConnection=null;
    DbConnMngr dbcmt=new DbConnMngr();

    if(!REGSEQ.equals(""))
    {

        List desCList = new ArrayList();
        try
        {

        String strRegno="";
        String strname="";
        String strage="";
        String strGender="";
        strSire="";
        strDam="";
        String strOwnername="";



        localConnection=dbcmt.getConnection();
        localConnection.setAutoCommit(false);



        CallableStatement cst = localConnection.prepareCall("{call GET_DESCENDANTS(?,?)}");
        cst.setString(1, REGSEQ);
        cst.setString(2, strhor_gender);


        ResultSet rsGetdesc=cst.executeQuery();

        Map MpHorseDetails = new TreeMap();

        while(rsGetdesc.next())
        {

        strRegno="";
        strname="";
        strage="";
        strGender="";
        strSire="";
        strDam="";
        strOwnername="";

        if(rsGetdesc.getString("REGISTRATION_NUM")!=null)
        strRegno= rsGetdesc.getString("REGISTRATION_NUM");


        if(rsGetdesc.getString("HORSE_PRIMARYNAME")!=null)
        strname= rsGetdesc.getString("HORSE_PRIMARYNAME").toUpperCase();

        if(rsGetdesc.getString("Age")!=null)
        strage= rsGetdesc.getString("Age");


        if(rsGetdesc.getString("HORSE_GENDER")!=null)
        strGender= rsGetdesc.getString("HORSE_GENDER");

        if(rsGetdesc.getString("SIRE")!=null)
        strSire= rsGetdesc.getString("SIRE").toUpperCase();

        if(rsGetdesc.getString("DAM")!=null)
        strDam= rsGetdesc.getString("DAM").toUpperCase();

        if(rsGetdesc.getString("OWNERNAME")!=null)
        strOwnername= rsGetdesc.getString("OWNERNAME");

        MpHorseDetails = new TreeMap();

        MpHorseDetails.put("REGNO#",strRegno);
        MpHorseDetails.put("NAME",strname);
        MpHorseDetails.put("AGE",strage);
        MpHorseDetails.put("GENDER",strGender);
        MpHorseDetails.put("SIRE",strSire);
        MpHorseDetails.put("DAM",strDam);

        MpHorseDetails.put("OWNER",strOwnername);

        totalCount=totalCount+1;
        desCList.add(MpHorseDetails);
        }

        rsGetdesc.close();
        cst.close();

        localConnection.commit();
        dbcmt.releaseConnection(localConnection);

        }
        catch(Exception ex)
        {
        ex.printStackTrace();
        }
        request.setAttribute("desCList", desCList);



        if(desCList.size()>0)
        {
            out.println("<br>Total Descendants : <B>"+ totalCount+"</B>");
        %>
        <display:table  id="Details" name="requestScope.desCList"
        class="grid" style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;" >

        <display:column style="width:10%;height:30px;" title="REGNO#" property="REGNO#" sortable="true" headerClass="Grid_Header"/>
        <display:column style="width:20%;" property="NAME" sortable="true" headerClass="Grid_Header"/>
        <display:column style="width:5%;text-align:center;"   title="AGE (M)" sortable="true" property="AGE" headerClass="Grid_Header"/>
        <display:column style="width:5%;"  property="GENDER" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:20%;" property="SIRE" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:20%;" property="DAM" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:20%;" property="OWNER" sortable="true" headerClass="Grid_Header" />
        </display:table>

        <% } %>

    <%}%>

        <input type="hidden" name="SavedYN" id="SavedYN" value="" />
    </div>

    <div id="sidebar">
        <%@ include file="frmReg_Descendants_Side.jsp" %>
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
        <iframe src="frmCalculator.jsp" id="modalIFrame_Calculator" width="99.7%" height="100%" marginwidth="0" marginheight="0"  frameborder="0" >
        </iframe>
    </div>
</form>

    </body>
</html>
