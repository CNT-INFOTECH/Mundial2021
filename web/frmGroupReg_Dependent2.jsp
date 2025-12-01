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
       String strMode2="";
       if(request.getParameter("mode")!=null)
           strMode2=request.getParameter("mode");

        String strGroup2="";
       if(request.getParameter("Group")!=null )
                strGroup2=request.getParameter("Group");



        String strRegNum2="";
        String strEventSeq2="";

        if(request.getParameter("EventSeq")!=null )
                strEventSeq2=request.getParameter("EventSeq");


        if(strMode2.equals("1") )
        {
           strRegNum2=request.getParameter("Reg");

        }
    %>
     <%@ include file="frmShortRegistration_Off2_Include.jsp" %>
    <body>
       <table width="100%" cellspacing="0px" cellpadding="3px" border="0px">
               
                <td><font>DESCENDENT2</font>
                <input type="hidden" name="RegSeq_S_D2" id="RegSeq_S_D2"   value="<%=strSht_RegSeq2%>">

                <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;"
                name="RegNum_S_D2" id="RegNum_S_D2" size="10" 
               value="<%=strSht_RegNum2%>"
                onblur="GetHorseName_ByNum_off(this.value, 'RegSeq_S_D2','RegNum_S_D2','Name_Label_D2')">
             
                <img src="Images/Find.gif" onClick="SearchHorse('PopHrs',600,600,'yes','D2','<%=strGroup2%>','<%=strEventSeq2%>')"/>
                 <a href="#" onClick="OpenLink('PopRegNum',600,600,'yes','frmHrsRegistration.jsp',RegSeq_S_D2.value,'RegNum','Num=1')" >
                <span id="Name_Label_D2" style="color :blue; font-size:12px"  class="Onlycaps"><%=strSht_HorseName2%></span></a>
               
                <input type="hidden"  name="HorseName_S_D2" size="1" class="allcaps"
                value="<%=strSht_HorseName2%>">
                  </td>
                
                </table>
    </body>
</html>
