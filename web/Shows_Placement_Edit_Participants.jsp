<%-- 
    Document   : Shows_Placement_Edit_Participants
    Created on : Aug 16, 2011, 5:41:24 PM
    Author     : CNT
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>PASO TRACKER</title>
         <link href="Shows_Pop.css" rel="stylesheet" type="text/css" />
        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
        <link href="buttons.css" rel="stylesheet" type="text/css" />

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




<link rel="stylesheet" href="windowfiles/dhtmlwindow.css" type="text/css" />
 <script type="text/javascript" src="windowfiles/dhtmlwindow.js">
/***********************************************
* DHTML Window Widget- © Dynamic Drive (www.dynamicdrive.com)
* This notice must stay intact for legal use.
* Visit http://www.dynamicdrive.com/ for full source code
***********************************************/

</script>
<link rel="stylesheet" href="modalfiles/modal.css" type="text/css" />
<script type="text/javascript" src="modalfiles/modal.js"></script>

 <script type="text/javascript" src="scripts/SRegistraion.js"></script>
 <script type="text/javascript" src="scripts/Shows_Placement_Edit_Participants.js"></script>

    </head>
    <body>
        <form>
        <%

            


   // String strRegSeq=request.getParameter("RegSeq");
    String strEventSeq=request.getParameter("EventSeq");
    String strRegNum=request.getParameter("RegNum");
    String strType=request.getParameter("Type");
    String strRider=request.getParameter("Rider");
    GetInterface GUI=new GetInterface();
    ArrayList AlEventInfo=GUI.GET_EVENT_INFORMATION("",strEventSeq);

    String strEventCategory=""+AlEventInfo.get(3);
    String strEventAire=""+AlEventInfo.get(4);
    String strEventGender=""+AlEventInfo.get(5);
    String strEventName=""+AlEventInfo.get(6);
    String strEventType=""+AlEventInfo.get(7);
    String strGroupURL="";

    String strGroupSeq="";
    if(request.getParameter("GroupSeq")!=null )
     {
           strGroupSeq=request.getParameter("GroupSeq");

     }

    if(strEventCategory.equals("GRUPO DE YEGUAS PARA CRIA"))
        strGroupURL="frmRegister_Horse_Shows_Group.jsp?mode=1&GroupSeq="+strGroupSeq;
     else if(strEventCategory.equals("GRUPO DE YEGUAS CON CRIA"))
     {
        strGroupURL="frmRegister_Horse_Shows_Group_OffSprings.jsp?mode=1&GroupSeq="+strGroupSeq;
     }
    else if(strEventCategory.equals("MEJOR DESCENDENCIA DE UNA YEGUA"))
        strGroupURL="frmRegister_Horse_Shows_Group_Descend.jsp?mode=1&GroupSeq="+strGroupSeq;
    else if(strEventCategory.equals("JEFE DE RAZA"))
        strGroupURL="frmRegister_Horse_Shows_Group_Raza.jsp?mode=1&GroupSeq="+strGroupSeq;


    

                 if (strType!=null && strType.equals("2")) { %>
                    <jsp:include page="frmEntityDetails_YouthRider_Edit.jsp" >
                    <jsp:param name="EntitySeq" value="<%=strRider%>"/>
                     <jsp:param name="EventSeq" value="<%=strEventSeq%>"/>
                    </jsp:include>
                    
                 <%}
                 else if (strType!=null && strType.equals("1")) {%>
                  <jsp:include page="frmShortRegistration_Edit.jsp" >
                        <jsp:param name="RegNum" value="<%=strRegNum%>"/>
                        <jsp:param name="EventSeq" value="<%=strEventSeq%>"/>
                    </jsp:include>

                
                  <%}
                  else if (strType!=null && strType.equals("3")) {%>
                   <jsp:include page="<%=strGroupURL%>" >
                        <jsp:param name="RegNum" value="<%=strRegNum%>"/>
                        <jsp:param name="EventSeq" value="<%=strEventSeq%>"/>
                    </jsp:include>
                <% }%>

        </form>
    </body>
</html>
