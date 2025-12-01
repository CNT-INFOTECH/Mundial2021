<table style="border-collapse:collapse;">
          <tr>
            <td>
              <div
<%--
if(strEntitySeq!=0)
{
%>
onclick="location.href='frmPerson.jsp?Mode=2&Assigned=<%=strEntitySeq%>';"
<%}
else
{
--%>
onclick="location.href='frmPerson.jsp';"
<%--
}
--%>
style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;

border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;" >&nbsp;General&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
            </td>
          </tr>
          <tr>
            <td>
              <div onclick="location.href='frmMember.jsp'
                  //Ajax_CheckMember('<%--=strASSIGNEDNUM--%>','Link','<%--=strEntitySeq--%>')"
                  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;

border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;" >Member&nbsp;&nbsp;&nbsp;</div>
            </td>
          </tr>
          <tr>
            <td>
              <div
<%--
if(strEntitySeq!=0)
{
%>
onclick="location.href='Person_ShowHistory.jsp?Mode=1&Enty=<%=strEntitySeq%>';"
<%}
else
{
--%>
onclick="location.href='Person_MemberPin.jsp';"
<%--
}
--%>
style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;" >Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
            </td>
          </tr>
          <tr>
            <td>
              <div
<%--
if(strEntitySeq!=0)
{
%>
onclick="location.href='Person_ShowHistory.jsp?Mode=1&Enty=<%=strEntitySeq%>';"
<%}
else
{
--%>
onclick="location.href='Person_ShowHistory.jsp';"
<%--
}
--%>
style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;" >History&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
            </td>
          </tr>
          <tr>
            <td>
              <div
<%--
if(strEntitySeq!=0)
{
%>
onclick="location.href='Person_Observations.jsp?Mode=1&Enty=<%=strEntitySeq%>';"
<%}
else
{
--%>
onclick="location.href='Person_Observations.jsp';"
<%--
}
--%>
style=" cursor: pointer; background-color: #4e738f;color: #FFFFFF; font-weight: bold;

border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;" >&nbsp;&nbsp;&nbsp;&nbsp;Observations&nbsp;&nbsp;</div>
            </td>
          </tr>
          <tr>
            <td>
              <div
<%--
if(strEntitySeq!=0 && strASSIGNEDNUM.length()>0)
{
%>
onclick="location.href='Person_Search.jsp?Seq=<%=strEntitySeq%>&Id=<%=strASSIGNEDNUM%>';"
<%}
else
{
--%>
onclick="location.href='Person_Search.jsp';"
<%--
}
--%>
style=" cursor: pointer; background-color: #4e738f;color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;" >Search&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
            </td>
          </tr>
<tr>
<td>
<div onclick="location.href='Admn_UserProfile.jsp?ty=P&<%=Calendar.getInstance().getTimeInMillis()%>';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;" >&nbsp;User Profile&raquo;</div>
</td>
</tr>
</table>