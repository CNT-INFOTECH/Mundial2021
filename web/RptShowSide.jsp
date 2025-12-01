<%-- 
    Document   : RptShowSide
    Created on : Jul 19, 2016, 10:56:58 AM
    Author     : cntuser
--%>


<%
    
    String strCurrentPage=request.getParameter("cntPage");
    if(strCurrentPage==null)
        strCurrentPage="";
%>    

<table style="border-collapse:collapse;text-align: left;width:100%;">    
    <tr>
      <td>
        <div  onclick="location.href='RptShow.jsp';" 
              style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Alpha Horse Listing&nbsp;<%if(strCurrentPage.equals("1")){%>&raquo;<%}%></div>
      </td>
    </tr>
</table>
