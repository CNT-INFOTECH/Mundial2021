<%--     Document   : InvoiceDetailList    Created on : Dec 17, 2015, 3:51:28 PM    Author     : ruban   --%>
<%@page import = "java.sql.CallableStatement"%>
<%@page import = "java.sql.ResultSet"%>
<%@page import = "pasotracker.DbConnMngr"%>
<%@page import = "java.sql.Connection"%>
<%@page import = "pasotracker.InsUpdInvoice"%>
<%@page import = "java.util.*" %>
<script type="text/javascript" src="jscInvoice.js"></script>
<%
    //Common variable
    String strMod="";
    String strExpType="2";
    String strTitle="";
    String strAllVal="";
    String[] strSplitVal=null;

    InsUpdInvoice iuInv = new InsUpdInvoice();
    ArrayList alValue = new ArrayList();
    ArrayList alRow = new ArrayList();

    //Referance variable for arguments
    String strTransDateFrom="";
    String strTransDateTo="";
    String strTransType="";
    String strUnInvoice="";

    if(request.getParameter("mode")!=null)
        strMod=request.getParameter("mode");
    if(request.getParameter("AllVal")!=null)
        strAllVal=request.getParameter("AllVal");

    if(strAllVal != null)
        strSplitVal=strAllVal.split(",");

    if(strSplitVal.length >= 1)
        strTransType=strSplitVal[0];
    if(strSplitVal.length >= 2)
        strTransDateFrom=strSplitVal[1];
    if(strSplitVal.length >= 3)
        strTransDateTo=strSplitVal[2];
    if(strSplitVal.length >= 4)
        strUnInvoice=strSplitVal[3];

    alRow = iuInv.getTransCount_Certificate_TransOwner(strExpType,strTransType, strTransDateFrom, strTransDateTo, strUnInvoice);

%>

<tr>
    <th  class="Grid_Header" style="text-align:center">&nbsp;</th>
    <th  class="Grid_Header" style="text-align:center">Horse Reg#</th>
    <th  class="Grid_Header" style="text-align:center">Horse Name</th>
    <th  class="Grid_Header" style="text-align:center">Owner Id</th>
    <th  class="Grid_Header" style="text-align:center">Owner Name</th>
    <th  class="Grid_Header" style="text-align:center">Transaction Date</th>
    <th  class="Grid_Header" style="text-align:center">Transaction User</th>
    <%if(strTransType.equalsIgnoreCase("1")){%>
    <th  class="Grid_Header" style="text-align:center">Include for Invoice</th>
    <%}%>
    <%if(strTransType.equalsIgnoreCase("2")){%>
    <th  class="Grid_Header" style="text-align:center">Certificate Issued</th>
    <%}%>
</tr>

<%
    String strCheckPoints = "";
    int count = 1;
    for (int i = 0; i < alRow.size(); i++) {
        String strClass = "";
        if (i % 2 == 0) {
            strClass = "even";
        } else {
            strClass = "odd";
        }

        ArrayList AlRows = new ArrayList();
        AlRows = (ArrayList) alRow.get(i);
%>
<tr class="grid">
    <td><%=count%></td>
    <td style="text-align:left" nowrap><%=AlRows.get(2)%></td>
    <td style="text-align:left"><%=AlRows.get(3)%></td>
    <td style="text-align:left" > <%=AlRows.get(5)%></td>
    <td style="text-align:left"><%=AlRows.get(6)%></td>
    <td style="text-align:left"><%=AlRows.get(7)%></td>
    <td style="text-align:left"><%=AlRows.get(8)%></td>
    <%if(strTransType.equalsIgnoreCase("1")){%>
    <td style="text-align:center"><input type="checkbox" <%if(AlRows.get(9).toString().equalsIgnoreCase("Y")){%> checked <% }%> onclick="AjaxCallInsUpd('<%=AlRows.get(0)%>','<%=strTransType%>',this.checked)"  ></td>
    <%}%>
    <%if(strTransType.equalsIgnoreCase("2")){%>
    <td style="text-align:center"><%=AlRows.get(10)%></td>
    <%}%>
</tr>
<%
    count++;
    }
%>