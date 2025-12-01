<%-- 
    Document   : SM_Score_Olympic_F1_Clear
    Created on : May 26, 2016, 10:46:50 PM
    Author     : CNT
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="Shows.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.CallableStatement"%>
<%
    String strResult="";
        String strError="0";
    Cookie[] cookies = request.getCookies();
        String strCurrentShowSelected = "";
        String strUserID = "";
        String strDBName = "";
        for (int i = 0; i < cookies.length; i++) {
            Cookie c = cookies[i];
            if (c.getName().equals("CurrentShowNumber")) {
                strCurrentShowSelected = c.getValue();
            }
            if (c.getName().equals("username")) {
                strUserID = c.getValue();
            }
            if (c.getName().equals("DBName")) {
                strDBName = c.getValue();
            }
        }
                    
  Connection localConnection = null;


    String strShowSeq = "";
    String strEventSeq = "";
    String strMode="";
    if (request.getParameter("EIdent") != null) {
        strEventSeq = request.getParameter("EIdent");
    }
    
    if (request.getParameter("SIdent") != null) {
        strShowSeq = request.getParameter("SIdent");
    }
      if (request.getParameter("mode") != null) {
        strMode = request.getParameter("mode");
    }
    
    
    CallableStatement cst_F1 = null;
    ResultSet rs2_F1 = null;
    localConnection = null;
    try {
         DBConnection dbcmt = new DBConnection(strUserID,strDBName);

        localConnection = dbcmt.getConnection();
        cst_F1 = localConnection.prepareCall("{call [SM_RESET_F1_F2_RESULTS](?,?,?)}");
        cst_F1.setString(1, strShowSeq);
        cst_F1.setString(2, strEventSeq);
        cst_F1.setString(3, strMode);

        rs2_F1 = cst_F1.executeQuery();
        
        while(rs2_F1.next()){
            strResult=rs2_F1.getString("Result");
            strError=rs2_F1.getString("ErrorCode");
        }

        

    } catch (Exception ex) {
        System.out.println("Exception Clear results:::"+ex);
    } finally {
        if (rs2_F1 != null) {
            rs2_F1.close();
        }
        if (cst_F1 != null) {
            cst_F1.close();
        }
        if (localConnection != null) {
            localConnection.commit();
            localConnection.close();
        }

    }
   
    if(strMode.equals("F2")){
         response.sendRedirect(request.getContextPath() + "/ShowManagement/SM_Score_Olympic.jsp?7a8225d145bb1136c894b1f5dbcd7a8225d145bb1136c894b1f5dbcd&EIdent="+strEventSeq+"&ECde=" +strError );
    }
    else
      response.sendRedirect(request.getContextPath() + "/ShowManagement/SM_Score_Olympic_F1.jsp?7a8225d145bb1136c894b1f5dbcd7a8225d145bb1136c894b1f5dbcd&EIdent=" +strEventSeq+"&ECde=" +strError );    
   

%>
