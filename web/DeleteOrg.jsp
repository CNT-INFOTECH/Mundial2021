<%-- 
    Document   : DeleteOrg
    Created on : Sep 23, 2011, 11:04:50 AM
    Author     : dp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.net.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>


<jsp:useBean id="login" class="login.SessionUserBean" scope="session"/>
<jsp:setProperty name="login" property="*"/>

<%
// session.removeAttribute("User");

            String userid = request.getParameter("userid");
            String Organization = request.getParameter("Organization");
            String strType = request.getParameter("Type");
//session.setAttribute( "theName", Organization );

            if (!userid.equals("null")) {
                Connection localConnection = null;
                DbConnMngr dbcmt = new DbConnMngr();


                List testData = new ArrayList();


                try {

                    localConnection = dbcmt.getConnection();
                    localConnection.setAutoCommit(false);
                    Statement st = localConnection.createStatement();
                    ResultSet rss = null;
                    CallableStatement cstt = null;

                    if (strType.equals("Org")) {

                        rss = st.executeQuery("delete User_Organization where userid='" + userid + "' and user_org='" + Organization + "'");
                        /*cstt = localConnection.prepareCall("{call DeleteUSERROLES(?,?,?)}");
                        cstt.setString(1, userid);
                        cstt.setString(2, Organization);
                        cstt.setString(3, "O");

                        rss = cstt.executeQuery();*/
                    } else if (strType.equals("Role")) {
                        /*rs=st.executeQuery("delete User_roles where userid='"+userid+
                        "' and 	Role_id='"+Organization+"'");*/

                        cstt = localConnection.prepareCall("{call DeleteUSERROLES(?,?,?)}");
                        cstt.setString(1, userid);
                        cstt.setString(2, Organization);
                        cstt.setString(3, "R");

                        rss = cstt.executeQuery();

                    }


                    rss.close();
                    cstt.close();
                    st.close();

                    CallableStatement cst = localConnection.prepareCall("{call GET_USER_DETAIL(?,?,?,?)}");
                    cst.setString(1, userid);
                    cst.setString(2, "");
                    cst.setString(3, "");
                    cst.setString(4, "");

                    ResultSet rs1 = cst.executeQuery();

                    Map map1 = new TreeMap();
                    String strUserID = "";
                    String strCheckUserID = "";
                    int count = 1;
                    String strOrganization = "";
                    String strRoleId = "";
                    String strRoleName = "";

                    while (rs1.next()) {


                        strUserID = rs1.getString("userid");
                        if (count == 1) {
                            strCheckUserID = strUserID;
                        }

                        if (!strCheckUserID.equals(strUserID)) {
                            testData.add(map1);
                            map1 = new TreeMap();
                            strCheckUserID = strUserID;
                            strOrganization = "";
                            strRoleName = "";
                            strRoleId = "";
                        }

                        map1.put("Userid", rs1.getString("userid"));
                        map1.put("Firstname", rs1.getString("user_firstname"));
                        map1.put("Lastname", rs1.getString("user_lastname"));
                        map1.put("Status", rs1.getString("user_status"));
                        map1.put("Middlename", rs1.getString("user_middle"));
                        map1.put("ADDRESS1", rs1.getString("user_address1"));
                        map1.put("ADDRESS2", rs1.getString("user_address2"));
                        map1.put("CITY", rs1.getString("user_city"));
                        map1.put("STATE", rs1.getString("user_state"));
                        map1.put("ZIP", rs1.getString("user_zip"));
                        map1.put("COUNTRY", rs1.getString("user_country"));
                        map1.put("PHONE", rs1.getString("user_phone"));
                        map1.put("EMAIL", rs1.getString("user_email"));



                        if (rs1.getString("user_org") != null && rs1.getString("user_org").length() > 0) {
                            strOrganization += rs1.getString("user_org") + "#@#";
                            map1.put("Organization", strOrganization);
                        } else {
                            strOrganization += " " + "#@#";
                            map1.put("Organization", strOrganization);
                        }

                        //strRoleId+=rs1.getString("role_id")+"#@#";
                        //map1.put("roleId", strRoleId);

                        if (rs1.getString("ROLENAME") != null && rs1.getString("ROLENAME").length() > 0) {
                            strRoleName += rs1.getString("ROLENAME") + "#@#";
                            map1.put("roleName", strRoleName);
                        } else {
                            strRoleName += " " + "#@#";
                            map1.put("roleName", strRoleName);
                        }

                        if (rs1.getString("role_id") != null && rs1.getString("role_id").length() > 0) {
                            strRoleId += rs1.getString("role_id") + "#@#";
                            map1.put("roleId", strRoleId);
                        } else {
                            strRoleId += " " + "#@#";
                            map1.put("roleId", strRoleId);
                        }

                        if (rs1.getString("userorgCOUNT") != null) {
                            map1.put("OrgCount", rs1.getString("userorgCOUNT"));
                        } else {
                            map1.put("OrgCount", "0");
                        }

                        if (rs1.getString("roleidCOUNT") != null) {
                            map1.put("RoleCount", rs1.getString("roleidCOUNT"));
                        } else {
                            map1.put("RoleCount", "0");
                        }

                        count += 1;

                    }


                    testData.add(map1);

                    rs1.close();
                    //rs.close();
                    cst.close();

                } catch (Exception e) {
                    out.println(e);
                    e.printStackTrace();
                } finally {
                    localConnection.commit();
                    dbcmt.releaseConnection(localConnection);
                    // session.removeAttribute("theName");
                    response.sendRedirect("User_Selected.jsp?userID=" + userid);

                }

                session.setAttribute("User", testData);
            }
%>


