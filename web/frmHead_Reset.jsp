<%

if(session.getAttribute("Regno_str")!=null)
    {
    session.removeAttribute("Regno_str");
}
if(session.getAttribute("STRHORSENAME")!=null)
    {
    session.removeAttribute("STRHORSENAME");
}
if(session.getAttribute("STRHORSEDOB")!=null)
    {
    session.removeAttribute("STRHORSEDOB");
}
if(session.getAttribute("STRHORSECOLOR")!=null)
    {
    session.removeAttribute("STRHORSECOLOR");
}




String address = request.getContextPath()+"/Markings.jsp";
response.sendRedirect(response.encodeRedirectURL(address));
%>