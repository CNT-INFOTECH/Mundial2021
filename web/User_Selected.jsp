<%--
    Document   : User_Reset
    Created on : Aug 1, 2011, 3:53:49 PM
    Author     : dp
--%>

<%@page import="javax.sql.rowset.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="login.SessionUserBean" %>

<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.net.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>
<jsp:useBean id="login" class="login.SessionUserBean" scope="session"/>
<jsp:setProperty name="login" property="*"/>
    
   
       <%
	   //SessionUserBean login = new SessionUserBean();
    List testData = new ArrayList();
    testData=(ArrayList)session.getAttribute("User");


    String struserID="";

    if(request.getParameter("userID")!=null)
            struserID=request.getParameter("userID");

    Connection localConnection=null;
    DbConnMngr dbcmt=new DbConnMngr();
    localConnection=dbcmt.getConnection();
    localConnection.setAutoCommit(false);
   // CachedRowSetImpl rs1 = new CachedRowSetImpl();
    try{
        CallableStatement cst = localConnection.prepareCall("{call GET_USER_DETAIL(?,?,?,?,?)}");
        cst.setString(1, struserID);
        cst.setString(2, "");
        cst.setString(3, "");
        cst.setString(4, "");
		cst.setString(5, "1");

        ResultSet rs1 = cst.executeQuery();
        //rs1.populate(rs);
        String strOrganization="";
        String strRoleName="";
        String strRoleId="";
        while(rs1.next())
        {
            login.setUserId(rs1.getString("userid"));
            login.setFirstname(rs1.getString("user_firstname"));
            login.setLastname(rs1.getString("user_lastname"));
            login.setStatus(rs1.getString("user_status"));
            login.setMiddlename(rs1.getString("user_middle"));
            login.setAddress(rs1.getString("user_address1"));
            login.setAddress2(rs1.getString("user_address2"));
            login.setCity(rs1.getString("user_city"));
            login.setState(rs1.getString("user_state"));
            login.setZip(rs1.getString("user_zip"));
            login.setCountry(rs1.getString("user_country"));
            login.setPhone(rs1.getString("user_phone"));
            login.setEmail(rs1.getString("user_email"));
            login.setOrgCount(rs1.getString("userorgCount"));
            login.setRoleCount(rs1.getString("roleidCount"));

            if(rs1.getString("user_org")!=null && rs1.getString("user_org").length()>0)
            {
            strOrganization+=rs1.getString("user_org")+"#@#";
            login.setOrganization(strOrganization);
            }
            else
            {
            strOrganization+=" "+"#@#";
            login.setOrganization(strOrganization);
            }

            if(rs1.getString("ROLENAME")!=null && rs1.getString("ROLENAME").length()>0)
            {
            strRoleName+=rs1.getString("ROLENAME")+"#@#";
            login.setRoles(strRoleName);
            }
            else
            {
            strRoleName+=" "+"#@#";
            login.setRoles(strRoleName);
            }

            if(rs1.getString("role_id")!=null && rs1.getString("role_id").length()>0)
            {
            strRoleId+=rs1.getString("role_id")+"#@#";
            login.setUser_RoleId(strRoleId);
            }
            else
            {
            strRoleId+=" "+"#@#";
            login.setUser_RoleId(strRoleId);
            }
        }
    rs1.close();
    cst.close();
    localConnection.commit();
    dbcmt.releaseConnection(localConnection);
    }

    catch(Exception ex)
    {
        ex.printStackTrace();
        try
        {
            localConnection.rollback();
            dbcmt.releaseConnection(localConnection);
        }
        catch(SQLException exc)
        {
        exc.printStackTrace();
        }

    }
    session.setAttribute("userBean", login);
    String address =request.getContextPath()+"/createuser.jsp?mode=2";
    response.sendRedirect(response.encodeRedirectURL(address));

%>
        




