<%-- 
    Document   : Shows_Placement_Notes
    Created on : Oct 16, 2013, 11:30:07 AM
    Author     : CNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
            function fnSubmit_Notes()
            {
               
                document.forms[0].method="post";
                document.forms[0].action="Shows_Placement_NotesSubmit.jsp";
                document.forms[0].submit();
            }

        </script>
    </head>
    <body>
        <form>
            <%
                        String strRegSeq = request.getParameter("RegSeq");
                        String strGroupSeq = request.getParameter("GroupSeq");

                        //GetInterface GUI=new GetInterface();
                        //ArrayList AlEventInfo=GUI.GET_EVENT_INFORMATION("",strEventSeq);
%>
            <table width="100%" border="0" cellspacing="1" cellpadding="2">
                <tr>
                    <td width="106"><font class="label">COMMENTS</font> </td>
                </tr>
                <tr>
                    <td>
                        <Select  style="background-color:  #FFF8DC; border:  1px solid #000000;" name="Notes" >

                            <option value="EX">Excusado / Excused</option>
                            <option value="NP">Fuera del Marcador / No Placement</option>
                            <option value="CF1">No entro al F1 / Cut at F1</option>
                            <option  value="DQ">Descalificado / Disqualified</option>
							<option  value="PEX">Excusado En Prepista / Excused at Prepista</option>
                             <option value="">NONE</option>

                        </Select>
                    </td>
                    <td> <input style="background-color:  #FFF8DC; border:  1px solid #000000;"  type="text" size="2" name="status" value="A" > </td>
                </tr>

                <tr>
                    <td width="106">
                        <input type="hidden" value="<%=strRegSeq%>" name="RegSeq" >
                        <input type="hidden" value="<%=strGroupSeq%>" name="GroupSeq" >
                        <font class="label"><input type="button" value="Submit" onClick="fnSubmit_Notes()"></font> </td>
                </tr>
            </table>
</form>

    </body>

</html>
