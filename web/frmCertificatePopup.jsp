<%-- 
    Document   : frmCertificatePopup
    Created on : Jul 11, 2011, 8:07:25 PM
    Author     : ramani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <script type="text/javascript" src="jscIndex.js"></script>   
    </head>
    <body>
        <form>
            <%
String strRegSeq="";
           if(request.getParameter("Seq")!=null)
               strRegSeq=request.getParameter("Seq");

%>
        <table align="center">
            <tr>
                <td  colspan="">
                    <input align="left" name="Certificate" id="Certificate" type="Radio" onclick="OpenCertificate('CERTIFICATEONE')">Certificate1
                </td>
            </tr>
            <tr>
                <td  colspan="">
                    <input align="left" type="Radio" name="Certificate" id="Certificate" onclick="OpenCertificate('CERTIFICATETWO')">Certificate2
                </td>
            </tr>
            <tr>
                <td  colspan="">
                    <input align="left" type="Radio" name="Certificate" id="Certificate" onclick="OpenCertificate('CERTIFICATETHREE')">Certificate3
                </td>
            </tr>
        </table>
            <input type="hidden" name="PAGEID" id="PAGEID" value="REGISTRATION"/>
            <input type="hidden" name="HdnRegSeq" id="HdnRegSeq" value="<%=strRegSeq%>"/>
        </form>
        
    </body>
</html>
