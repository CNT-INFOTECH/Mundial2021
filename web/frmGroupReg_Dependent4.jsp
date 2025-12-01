<%--
    Document   : frmGroupReg_Dependent1
    Created on : Jul 20, 2011, 5:50:04 PM
    Author     : CNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

     <%
       String strMode4="";
       if(request.getParameter("mode")!=null)
           strMode4=request.getParameter("mode");

        String strGroup4="";
       if(request.getParameter("Group")!=null )
                strGroup4=request.getParameter("Group");



        String strRegNum3="";
        String strEventSeq3="";

        if(request.getParameter("EventSeq")!=null )
                strEventSeq3=request.getParameter("EventSeq");


        if(strMode4.equals("1") )
        {
           strRegNum3=request.getParameter("Reg");

        }
    %>
     <%@ include file="frmShortRegistration_Off3_Include.jsp" %>
    <body>
       <table width="100%" cellspacing="0px" cellpadding="3px" border="0px">
                  
                <td ><font >DESCENDENT4</font>
            
                <input type="hidden" name="RegSeq_S_D4" id="RegSeq_S_D4"   value="<%=strSht_RegSeq3%>">

                <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;"
                name="RegNum_S_D4" id="RegNum_S_D4" size="10"
                onblur="GetHorseName_ByNum_off(this.value, 'RegSeq_S_D4','RegNum_S_D4','Name_Label_D4')"
               value="<%=strSht_RegNum3%>">
                <img src="Images/Find.gif" onClick="SearchHorse('PopHrs',600,600,'yes','D4','<%=strGroup4%>','<%=strEventSeq3%>')"/>
               <a href="#" onClick="OpenLink('PopRegNum',600,600,'yes','frmHrsRegistration.jsp',RegSeq_S_D4.value,'RegNum','Num=1')" >
                <span id="Name_Label_D4" style="color :blue; font-size:12px"  class="Onlycaps"><%=strSht_HorseName3%></span></a>
                <input type="hidden"  name="HorseName_S_D4" size="1" class="allcaps"
                value="<%=strSht_HorseName3%>">
               </td>
                
                </table>
    </body>
</html>
