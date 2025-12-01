<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.DBConnection" %>
<%@ page import="pasotracker.GeneralServlet" %>     

<%
if(strMode.equals("1"))
    {
    session.removeAttribute("ses_REGSEQ");
    session.removeAttribute("ses_ENTITYSEQ");
    session.removeAttribute("Regno_str");
    session.removeAttribute("ses_REGISTRY_TYPE");
    session.removeAttribute("ses_DNA");
    session.removeAttribute("ses_INF_EMP");
    session.removeAttribute("ses_Año");
    session.removeAttribute("STRDATE");
    session.removeAttribute("ses_REGISTRY_PLACE");
    session.removeAttribute("ses_REGISTRY_USER");
    session.removeAttribute("STRHORSENAME");
    session.removeAttribute("ses_HORSE_GENDER");
    session.removeAttribute("ses_HORSE_GELDING_DATE");
    session.removeAttribute("ses_HORSE_AGE");
    session.removeAttribute("STRHORSEDOB");
    session.removeAttribute("ses_HORSE_DEATHDATE");
    session.removeAttribute("STRHORSECOLOR");
    session.removeAttribute("ses_HORSE_AIRE");
    session.removeAttribute("ses_ORGANISATION");
    session.removeAttribute("ses_MICROCHIP_NUM");
    session.removeAttribute("ses_CASODNA_NUM");
    session.removeAttribute("ses_EMB_TRANSFER");
    session.removeAttribute("ses_HORSE_BREEDER");
    session.removeAttribute("ses_MEMBER_NUM");
    session.removeAttribute("ses_FIRSTNAME");
    session.removeAttribute("ses_LASTNAME");
    session.removeAttribute("ses_ADDRESS1");
    session.removeAttribute("ses_ADDRESS2");
    session.removeAttribute("ses_CITY");
    session.removeAttribute("ses_STATE");
    session.removeAttribute("ses_ZIP");
    session.removeAttribute("ses_COUNTRY");
    session.removeAttribute("ses_PHONE");
    session.removeAttribute("ses_EMAIL");
       
}
%>
<%--
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

//String address = request.getContextPath()+"/index.jsp";
//response.sendRedirect(response.encodeRedirectURL(address));
--%>
 