<%-- 
    Document   : SM_Score_Olympic
    Created on : Oct 1, 2014, 11:32:36 AM
    Author     : RAJU
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Shows.ScoringOlympic"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SCORING - EQUITABLE-OLYMPIC FIVE JUDGES SCORING SYSTEM</title>
        <link rel="stylesheet" href="menu.css" type="text/css" media="screen" />
        <link href="Styles/menu.css" rel="stylesheet" type="text/css" />
        <script src="Scripts/SM_Common.js" type="text/javascript"></script>
         <script src="Scripts/SM_jscF1F2Admin.js" type="text/javascript"></script>
         <script src="Scripts/SM_Placements.js"></script>         
         
        <script>
            function ProcessResults()
            {
                document.forms[0].method = "post";
                document.forms[0].action = "../Scoring_Results?PAGEID=F1_AddMore";
                document.forms[0].submit();
            }
            
        </script>
    </head>


    <body>
        <form>
             <table class="Events">
                  <% String strEventSeq = request.getParameter("EIdent");%>
                <th colspan="2">BACK#</th>
                    <%for (int i = 0; i < 6; i++) {%>
                <tr>

                    <td align="center" valign="middle"><input type="text" autocomplete="off" size="3" name="Assigned_1_<%=i%>" > </td>
                    <td align="center" valign="middle"><input type="text" autocomplete="off" size="3" name="Assigned_2_<%=i%>" > </td>
                </tr>
                <%}%>
                <tr><td colspan="2"><input type="button" value="Submit" onClick="ProcessResults()">
                    <input type="hidden" value="<%=strEventSeq%>" name="EIdent">
                    </td></tr>
            </table>
        </form>
    </body>
</html>
