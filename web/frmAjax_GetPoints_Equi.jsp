<%@ page import = "model.GetInterface" %>
<%@ page import = "java.util.*" %>
 <%
                String strAwardType=request.getParameter("AwardType");
                String strYear=request.getParameter("Year");
                String strFrmDate=request.getParameter("frmDate");
                String strToDate=request.getParameter("ToDate");
                String strShowSeq="";
                 String strAwardName="";
				 String strIncludeFlg="0";
                if(request.getParameter("ShowSeq")!=null)
                    strShowSeq=request.getParameter("ShowSeq");

                 if(request.getParameter("AwName")!=null)
                    strAwardName=request.getParameter("AwName");
				
				if(request.getParameter("IncludeFlg")!=null)
                    strIncludeFlg=request.getParameter("IncludeFlg");

                String strHeaderValue="";



          GetInterface GUI=new GetInterface();
          ArrayList LiValues= GUI.GetPoints(strAwardType,strYear,strFrmDate,strToDate,strShowSeq,strIncludeFlg);

            strHeaderValue="RIDER";
          



%>

<tr>
<th class="Grid_Header" style="text-align:left">&nbsp;</th>
<th  class="Grid_Header" style="text-align:left"><%=strHeaderValue%></th>
<th  class="Grid_Header" style="text-align:left">ID#</th>
<th  class="Grid_Header" style="text-align:center">TOTAL POINTS</th>

</tr>
<%
String strCheckPoints="";
int count=1;
for(int i=0;i<LiValues.size();i++)
    {
    ArrayList AlRows=new ArrayList();
    AlRows=(ArrayList)LiValues.get(i);
    String strPoints=""+AlRows.get(2);
    if(i==0)
        strCheckPoints=strPoints;

        if(!(strCheckPoints.equals(strPoints)))
        {
            strCheckPoints=strPoints;
            count+=1;
        }

    %>
<tr>
    <td><%=count%></td>
    <td ><SPAN onClick="ShowPoints('<%=AlRows.get(0)%>','<%=strAwardType%>','600','800','<%=strShowSeq%>','<%=strAwardName%>','<%=AlRows.get(1)%>','<%=strYear%>','<%=strFrmDate%>','<%=strToDate%>' )"><%=AlRows.get(1)%></SPAN></td>
    <td style="text-align:left"><%=AlRows.get(3)%></td>
  <td style="text-align:center"><%=AlRows.get(2)%></td>

</tr>
<%}%>

