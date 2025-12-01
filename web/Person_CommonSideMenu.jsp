<%-- 
    Document   : Person_CommonSideMenu
    Created on : Feb 23, 2016, 2:05:04 PM
    Author     : cntuser
--%>

<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="pasotracker.DbConnMngr"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
<%
    String strCurrentPage=request.getParameter("cntPage");
    if(strCurrentPage==null)
        strCurrentPage="";
    
    String eSeq="";
    String asgNo="";
    
    if(request.getParameter("Seq")!=null && request.getParameter("Seq").length()>0)
        eSeq=request.getParameter("Seq");
    else if(request.getParameter("Enty")!=null && request.getParameter("Enty").length()>0)
        eSeq=request.getParameter("Enty");
    
    if(request.getParameter("Id")!=null && request.getParameter("Id").length()>0)
        asgNo=request.getParameter("Id");
//    else if(request.getParameter("Enty")!=null && request.getParameter("Enty").length()>0)
//        eSeq=request.getParameter("Enty");
%>    

<table style="border-collapse:collapse;">
          <tr>
            <td>
              <div  
<%
if(eSeq.length()>0)
{
%>
onclick="location.href='frmPerson.jsp?Mode=2&Assigned=<%=eSeq%>';"
<%}
else
{
%>
onclick="location.href='frmPerson.jsp';"
<%
}
%>
style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;" >General&nbsp;<%if(strCurrentPage.equals("1")){%>&raquo;<%}%>&nbsp;&nbsp;&nbsp;&nbsp;</div>
            </td>
          </tr>
          <tr>
            <td>
              <div onclick="Ajax_CheckMember('<%=asgNo%>','Link','<%=eSeq%>')"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;

border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;" >Member&nbsp;<%if(strCurrentPage.equals("2")){%>&raquo;<%}%>&nbsp;&nbsp;&nbsp;&nbsp;</div>
            </td>
          </tr>
          <tr>
            <td>
              <div    
<%
if(eSeq.length()>0)
{
%>
onclick="location.href='Person_MemberPin.jsp?Mode=1&Enty=<%=eSeq%>';"
<%}
else
{
%>
onclick="location.href='Person_MemberPin.jsp';"
<%
}
%>              
style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;" >Password&nbsp;<%if(strCurrentPage.equals("3")){%>&raquo;<%}%>&nbsp;&nbsp;&nbsp;&nbsp;</div>
            </td>
          </tr>
          <tr>
            <td>
              <div    
<%
if(eSeq.length()>0)
{
%>
onclick="location.href='Person_ShowHistory.jsp?Mode=1&Enty=<%=eSeq%>';"
<%}
else
{
%>
onclick="location.href='Person_ShowHistory.jsp';"
<%
}
%>              
style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;" >History&nbsp;<%if(strCurrentPage.equals("4")){%>&raquo;<%}%>&nbsp;&nbsp;&nbsp;&nbsp;</div>
            </td>
          </tr>         
          <tr>
            <td>
              <div  
<%
if(eSeq.length()>0)
{
%>
onclick="location.href='Person_Observations.jsp?Mode=1&Enty=<%=eSeq%>';" 
<%}
else
{
%>
onclick="location.href='Person_Observations.jsp';"
<%
}
%>   
style=" cursor: pointer; background-color: #4e738f;color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;" >Observations&nbsp;<%if(strCurrentPage.equals("5")){%>&raquo;<%}%>&nbsp;&nbsp;&nbsp;&nbsp;</div>
            </td>
          </tr>
          <tr>
            <td>
              <div 
<%
if(eSeq.length()>0 && asgNo.length()>0)
{
%>
onclick="location.href='Person_Search.jsp?Seq=<%=eSeq%>&Id=<%=asgNo%>';" 
<%}
else
{
%>
onclick="location.href='Person_Search.jsp';"
<%
}
%>
style=" cursor: pointer; background-color: #4e738f;color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;" >Search&nbsp;<%if(strCurrentPage.equals("6")){%>&raquo;<%}%>&nbsp;&nbsp;&nbsp;&nbsp;</div>
            </td>
          </tr>
          <tr>
<td>
<div onclick="location.href='Admn_UserProfile.jsp?ty=P&<%=Calendar.getInstance().getTimeInMillis()%>';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;" >User Profile&nbsp;<%if(strCurrentPage.equals("7")){%>&raquo;<%}%>&nbsp;&nbsp;&nbsp;&nbsp;</div>
</td>
</tr>
</table>
