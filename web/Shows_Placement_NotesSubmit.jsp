<%--
    Document   : frmSireDamSearchResults
    Created on : Jun 19, 2011, 1:03:26 PM
    Author     : CNT
--%>
<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.text.*" %>
<%@ page import =  "model.*" %>
<html>

    <body>
        <%


                 String strRegSeq=request.getParameter("RegSeq");
                 String strGroupSeq=request.getParameter("GroupSeq");
                 String strNotes=request.getParameter("Notes");
                 String strStatus=request.getParameter("status");

                Connection localConnection = null;
                DbConnMngr dbcmt = new DbConnMngr();


                try {
                    localConnection = dbcmt.getConnection();
                    localConnection.setAutoCommit(false);
                    CallableStatement cst = localConnection.prepareCall("{call InsUpd_EventRegistration_Notes(?,?,?,?,?, ?)}");
                    cst.setString(1, strRegSeq);
                    cst.setString(2, strGroupSeq);
                    cst.setString(3, strNotes);
                    cst.setString(4, "");
                    cst.setString(5, strStatus);

                    cst.setString(6, "admin");
                    ResultSet rs1 = cst.executeQuery();
                    rs1.close();
                    cst.close();
                    localConnection.commit();
                    dbcmt.releaseConnection(localConnection);
                    out.println("Updated Successfully");
                } catch (Exception ex) {
                    ex.printStackTrace();
                    try {
                        System.out.println("release:" + ex);
                        localConnection.rollback();
                        dbcmt.releaseConnection(localConnection);
                    } catch (SQLException exc) {
                        exc.printStackTrace();
                    }

                }
                finally
                {
                     dbcmt.releaseConnection(localConnection);
                }
           
        %>

    </body>
</html>
