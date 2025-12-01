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
       String strMode1="";
       if(request.getParameter("mode")!=null)
           strMode1=request.getParameter("mode");
       String strGroup="";
       if(request.getParameter("Group")!=null )
                strGroup=request.getParameter("Group");



        String strRegNum="";
        String strEventSeq="";

        if(request.getParameter("EventSeq")!=null )
                strEventSeq=request.getParameter("EventSeq");




        if(strMode1.equals("1") )
        {
           strRegNum=request.getParameter("Reg");

        }
    %>

   <%@ include file="frmShortRegistration_Off_Include.jsp" %>
   
    <body>
       <table width="100%" cellspacing="0px" cellpadding="3px" border="0px">
                  
                <tr>
                <td >DESCENDENT1
               
                <input type="hidden" name="RegSeq_S_D1" id="RegSeq_S_D1"  value="<%=strSht_RegSeq%>">

                <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;"
                name="RegNum_S_D1" id="RegNum_S_D1" size="10"
                onblur="GetHorseName_ByNum_off(this.value, 'RegSeq_S_D1','RegNum_S_D1','Name_Label_D1')"
               value="<%=strSht_RegNum%>">
               
                <img src="Images/Find.gif" onClick="SearchHorse('PopHrs',600,600,'yes','D1','<%=strGroup%>','<%=strEventSeq%>')"/>
                <a href="#" onClick="OpenLink('PopRegNum',600,600,'yes','frmHrsRegistration.jsp',RegSeq_S_D1.value,'RegNum','Num=1')" >
                <span id="Name_Label_D1" style="color :blue; font-size:12px"  class="Onlycaps"><%=strSht_HorseName%></span></a>
               
               
                <input type="hidden"  name="HorseName_S_D1" size="40" class="allcaps"
                value="<%=strSht_HorseName%>">
                </td>
                
                </table>
    </body>
</html>
