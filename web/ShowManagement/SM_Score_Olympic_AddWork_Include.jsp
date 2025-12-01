<%-- 
    Document   : SM_Score_Olympic_F1_Include
    Created on : May 18, 2015, 3:30:40 PM
    Author     : CNT
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Shows.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.CallableStatement"%>
<%

    Cookie[] cookies = request.getCookies();
        String strCurrentShowSelected = "";
        String strUserID = "Admin";
        String strDBName = "Confepaso";
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
    ArrayList Al_AddWork_List = new ArrayList();
    CallableStatement cst = null;
    Connection localConnection = null;
    ResultSet rs2 = null;
    int rowCnt = 0;

    int intNumberofJudges = 5;
    int intNumberofPositions = 10;
    ArrayList AlActualValues = new ArrayList();
    ArrayList EachJudgeRow = new ArrayList();
    
     String[] JudgeNames = new String[5];
     String[] JudgeSeq = new String[5];
     String[] JudgeNum = new String[5];

    String strEventSeq = "";
    String strShowSeq="";
    String strWorkOffCount="1";
    if (request.getParameter("EIdent") != null) {
        strEventSeq = request.getParameter("EIdent");
    }
    
    if (request.getParameter("SIdent") != null) {
        strShowSeq = request.getParameter("SIdent");
    }
    
    if (request.getParameter("Swoc") != null) {
        strWorkOffCount = request.getParameter("Swoc");
    }

    try {
         DBConnection dbcmt = new DBConnection(strUserID,strDBName);
        localConnection = dbcmt.getConnection();
        cst = localConnection.prepareCall("{call [SM_GET_F1F2_ADDITIONAL_WO_REQUEST_DETAILS](?,?)}");
        cst.setString(1, strEventSeq);
        cst.setString(2, strWorkOffCount);
        
         


        rs2 = cst.executeQuery();
        while (rs2.next()) {

            
            JudgeNames[rowCnt]=rs2.getString("SM_Official_Name");
            JudgeSeq[rowCnt]=rs2.getString("JudgeSeq");
            JudgeNum[rowCnt]=rs2.getString("JudgeNum");
            
            rowCnt += 1;
            EachJudgeRow = new ArrayList();

            if (rs2.getString("P1") != null) {
                EachJudgeRow.add(rs2.getString("P1"));
            } else {
                EachJudgeRow.add("");
            }

            if (rs2.getString("P2") != null) {
                EachJudgeRow.add(rs2.getString("P2"));
            } else {
                EachJudgeRow.add("");
            }

            if (rs2.getString("P3") != null) {
                EachJudgeRow.add(rs2.getString("P3"));
            } else {
                EachJudgeRow.add("");
            }

            if (rs2.getString("P4") != null) {
                EachJudgeRow.add(rs2.getString("P4"));
            } else {
                EachJudgeRow.add("");
            }

            if (rs2.getString("P5") != null) {
                EachJudgeRow.add(rs2.getString("P5"));
            } else {
                EachJudgeRow.add("");
            }

            if (rs2.getString("P6") != null) {
                EachJudgeRow.add(rs2.getString("P6"));
            } else {
                EachJudgeRow.add("");
            }

            if (rs2.getString("P7") != null) {
                EachJudgeRow.add(rs2.getString("P7"));
            } else {
                EachJudgeRow.add("");
            }
           
             if (rs2.getString("P8") != null) {
             EachJudgeRow.add(rs2.getString("P8"));
             } else {
             EachJudgeRow.add("");
             }

             if (rs2.getString("P9") != null) {
             EachJudgeRow.add(rs2.getString("P9"));
             } else {
             EachJudgeRow.add("");
             }

             if (rs2.getString("P10") != null) {
             EachJudgeRow.add(rs2.getString("P10"));
             } else {
             EachJudgeRow.add("");
             }
            
            AlActualValues.add(EachJudgeRow);
        }

    } catch (Exception ex) {
        System.out.println(ex);
    } finally {
        if (rs2 != null) {
            rs2.close();
        }
        if (cst != null) {
            cst.close();
        }
        if (localConnection != null) {
            localConnection.close();
        }

        if (rowCnt < intNumberofJudges) {

            for (int i = 1; i <= intNumberofJudges - rowCnt; i++) {
                EachJudgeRow = new ArrayList();
                for (int j = 1; j <= intNumberofPositions; j++) {
                    EachJudgeRow.add("");
                }
                AlActualValues.add(EachJudgeRow);
            }
        }

    }

    CallableStatement cst_F1 = null;
    ResultSet rs2_F1 = null;
    localConnection = null;
    try {
         DBConnection dbcmt = new DBConnection(strUserID,strDBName);

        localConnection = dbcmt.getConnection();
        cst_F1 = localConnection.prepareCall("{call [SM_GET_F1F2_ADDITIONAL_WO_PROCESS_RESULTS](?,?)}");
        cst_F1.setString(1, strEventSeq);
        cst_F1.setString(2, strWorkOffCount);

        rs2_F1 = cst_F1.executeQuery();

        while (rs2_F1.next()) {
            ArrayList AlRow=new ArrayList();
            AlRow.add(rs2_F1.getString("AssignedNum"));
            AlRow.add(rs2_F1.getString("AdtnlWorkOff_Compl_Status"));
            AlRow.add(rs2_F1.getString("AdtnlWorkOff_OutPut"));
            Al_AddWork_List.add(AlRow);
        }

    } catch (Exception ex) {
        System.out.println("Exception in Judge _ SM_GET_F1F2_ADDITIONAL_WO_PROCESS_RESULTS_Include:::"+ex);
    } finally {
        if (rs2_F1 != null) {
            rs2_F1.close();
        }
        if (cst_F1 != null) {
            cst_F1.close();
        }
        if (localConnection != null) {
            localConnection.close();
        }

    }


%>