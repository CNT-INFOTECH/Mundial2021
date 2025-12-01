<%
String counter="1";
int intCounter=0;

if (request.getParameter("hidden") != null && request.getParameter("hidden").trim().length()>0) {
	counter=request.getParameter("hidden");
	intCounter=Integer.parseInt(counter)+1;
}
response.sendRedirect("Shows_Score_Admin.jsp?DmdCde="+intCounter);  
%>