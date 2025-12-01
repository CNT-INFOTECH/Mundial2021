<%-- 
    Document   : SM_Score_Olympic_F1_Include
    Created on : May 18, 2015, 3:30:40 PM
    Author     : CNT
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.util.SortedSet"%>
<%@page import="java.util.TreeSet"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Shows.DBConnection"%>
<%@page import="Shows.ShowUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.CallableStatement"%>
<%
    
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
    
    ShowUtil sutil=new ShowUtil();
    CallableStatement cst = null;
    Connection localConnection = null;
    ResultSet rs2 = null;

    CallableStatement cst_Results = null;
    CallableStatement cst_Results_WO= null;
    ResultSet rs2_Results = null;
    ResultSet rs2_Results_WO= null;
    
    
    CallableStatement cst_Results_TieBreaker_Mobile_Value= null;
    ResultSet rs2_Results_TieBreaker_Mobile_Value = null;
    ArrayList AlActualValues_TieBreaker_Mobile_Value=new ArrayList();
    
    int rowCnt = 0;
    int rowCnt_TB = 0;

    int intNumberofJudges = 3;
    int intNumberofPositions = 7;
    ArrayList AlActualValues = new ArrayList();
    ArrayList EachJudgeRow = new ArrayList();
     ArrayList Al = new ArrayList();
     ArrayList Al_WO = new ArrayList();
     
     String[] JudgeNames = {"","","","",""};
     String[] JudgeSeq = {"","","","",""};
     String[] JudgeNum = {"","","","",""};
     String[] JudgeCalling = {"N","N","N","N","N"};
      SortedSet AlTiedPositions = new TreeSet(); 
    

         

    String strEventSeq = "";
  
    String strCurrTieBreaker = "";
    if (request.getParameter("EIdent") != null) {
        strEventSeq = request.getParameter("EIdent");
    }
   

    try {
        DBConnection dbcmt = new DBConnection(strUserID,strDBName);
        localConnection = dbcmt.getConnection();
        
        
        if (request.getParameter("Stb") != null) {
            
             Connection localConnection_tb = dbcmt.getConnection();
             CallableStatement cst_Results_tb= null;
             ResultSet rs2_tb = null;
    
            try{
             strCurrTieBreaker = request.getParameter("Stb");
     
             cst_Results_tb = localConnection_tb.prepareCall("{call SM_InsUpd_F2_TieBreak(?,?,?,?)}");
             cst_Results_tb.setString(1, null);
             cst_Results_tb.setString(2, strEventSeq);
             cst_Results_tb.setString(3, strCurrTieBreaker);
             cst_Results_tb.setInt(4, 1);
             int rslt=cst_Results_tb.executeUpdate();
 
            }
            catch(SQLException Ex){
                System.out.println("****SM_Score_Olympic_F2_Include::::"+Ex);
            }
            finally{
                if(localConnection_tb!=null){
                    localConnection_tb.commit();
                    localConnection_tb.close();
                }
                if(cst_Results_tb!=null)
                    cst_Results_tb.close();
            }
        }
        
        cst = localConnection.prepareCall("{call [SM_GET_F1F2_DETAILS](?,?)}");
        cst.setString(1, strEventSeq);
        cst.setString(2, "F2");
        
        
         
        rs2 = cst.executeQuery();
        while (rs2.next()) {

           
            if(rs2.getString("SM_Official_Name")!=null)
                JudgeNames[rowCnt]=sutil.getValue(rs2.getString("SM_Official_Name"));
            
            if(rs2.getString("JudgeSeq")!=null)   
                JudgeSeq[rowCnt]=sutil.getValue(rs2.getString("JudgeSeq"));
           
            if(rs2.getString("JudgeNum")!=null)   
                JudgeNum[rowCnt]=sutil.getValue(rs2.getString("JudgeNum"));
            
            
            
            if(rs2.getString("CallingJudge")!=null)
                JudgeCalling[rowCnt]=sutil.getValue(rs2.getString("CallingJudge"));

            rowCnt += 1;
            EachJudgeRow = new ArrayList();
            
            if (rs2.getString("P1") != null) {
                EachJudgeRow.add(sutil.getValue(rs2.getString("P1")));
            } else {
                EachJudgeRow.add("");
            }

            if (rs2.getString("P2") != null) {
                EachJudgeRow.add(sutil.getValue(rs2.getString("P2")));
            } else {
                EachJudgeRow.add("");
            }

            if (rs2.getString("P3") != null) {
                EachJudgeRow.add(sutil.getValue(rs2.getString("P3")));
            } else {
                EachJudgeRow.add("");
            }

            if (rs2.getString("P4") != null) {
                EachJudgeRow.add(sutil.getValue(rs2.getString("P4")));
            } else {
                EachJudgeRow.add("");
            }

            if (rs2.getString("P5") != null) {
                EachJudgeRow.add(sutil.getValue(rs2.getString("P5")));
            } else {
                EachJudgeRow.add("");
            }

            if (rs2.getString("P6") != null) {
                EachJudgeRow.add(sutil.getValue(rs2.getString("P6")));
            } else {
                EachJudgeRow.add("");
            }

            if (rs2.getString("P7") != null) {
                EachJudgeRow.add(sutil.getValue(rs2.getString("P7")));
            } else {
                EachJudgeRow.add("");
            }
            
            
            /*
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
             */
            AlActualValues.add(EachJudgeRow);
        }
        

        cst_Results = localConnection.prepareCall("{call [SM_GET_F2_Results](?,?,?)}");
        cst_Results.setString(1, null);
        cst_Results.setString(2, strEventSeq);
        cst_Results.setString(3, "F2"); // this will give the Processed F2 Results
       

        rs2_Results = cst_Results.executeQuery();
        
       
        
        while (rs2_Results.next()) {
            ArrayList AlRow_Results = new ArrayList();
            List AlRow_Results_Pos = new ArrayList();
         
            AlRow_Results.add(sutil.getValue(rs2_Results.getString("AssignedNum")));
                AlRow_Results_Pos.add(sutil.getValue(rs2_Results.getString("J1")));
                AlRow_Results_Pos.add(sutil.getValue(rs2_Results.getString("J2")));
                AlRow_Results_Pos.add(sutil.getValue(rs2_Results.getString("J3")));
                //AlRow_Results_Pos.add(sutil.getValue(rs2_Results.getString("J4")));
                //AlRow_Results_Pos.add(sutil.getValue(rs2_Results.getString("J5")));
           AlRow_Results.add(AlRow_Results_Pos);
         
            AlRow_Results.add(sutil.getValue(rs2_Results.getString("Total")));
            AlRow_Results.add(sutil.getValue(rs2_Results.getString("TieFlag")));
            AlRow_Results.add(sutil.getValue(rs2_Results.getString("FinalPosition")));
        
            
            // This is used for the Drop Down Values of the Tie Drop Down
            if(rs2_Results.getString("TieFlag")!=null && rs2_Results.getString("TieFlag").trim().equals("T")){
                 AlTiedPositions.add(sutil.getValue(rs2_Results.getString("Tied_Position")));
                
            }
            if(strCurrTieBreaker!=null && strCurrTieBreaker.trim().length()==0)
                strCurrTieBreaker=sutil.getValue(rs2_Results.getString("Current_TieBreaker_Pos"));
            
            Al.add(AlRow_Results);
        }
        
        
       /**************************************First Tie Breaker*****************************************************************************/
        
        if(strCurrTieBreaker!=null && strCurrTieBreaker.trim().length()>0){
            
       
        cst_Results_TieBreaker_Mobile_Value = localConnection.prepareCall("{call [SM_GET_F1F2_DETAILS](?,?)}");
        cst_Results_TieBreaker_Mobile_Value.setString(1, strEventSeq);
        cst_Results_TieBreaker_Mobile_Value.setString(2, strCurrTieBreaker); // First Tie Breaker
        
        
         
        rs2_Results_TieBreaker_Mobile_Value = cst_Results_TieBreaker_Mobile_Value.executeQuery();
        while (rs2_Results_TieBreaker_Mobile_Value.next()) {

            rowCnt_TB += 1;
            EachJudgeRow = new ArrayList();
            
            
      
            if (rs2_Results_TieBreaker_Mobile_Value.getString("P1") != null) {
                EachJudgeRow.add(rs2_Results_TieBreaker_Mobile_Value.getString("P1"));
            } else {
                EachJudgeRow.add("");
            }

            if (rs2_Results_TieBreaker_Mobile_Value.getString("P2") != null) {
                EachJudgeRow.add(rs2_Results_TieBreaker_Mobile_Value.getString("P2"));
            } else {
                EachJudgeRow.add("");
            }

            if (rs2_Results_TieBreaker_Mobile_Value.getString("P3") != null) {
                EachJudgeRow.add(rs2_Results_TieBreaker_Mobile_Value.getString("P3"));
            } else {
                EachJudgeRow.add("");
            }

            if (rs2_Results_TieBreaker_Mobile_Value.getString("P4") != null) {
                EachJudgeRow.add(rs2_Results_TieBreaker_Mobile_Value.getString("P4"));
            } else {
                EachJudgeRow.add("");
            }

            if (rs2_Results_TieBreaker_Mobile_Value.getString("P5") != null) {
                EachJudgeRow.add(rs2_Results_TieBreaker_Mobile_Value.getString("P5"));
            } else {
                EachJudgeRow.add("");
            }

            if (rs2_Results_TieBreaker_Mobile_Value.getString("P6") != null) {
                EachJudgeRow.add(rs2_Results_TieBreaker_Mobile_Value.getString("P6"));
            } else {
                EachJudgeRow.add("");
            }

            if (rs2_Results_TieBreaker_Mobile_Value.getString("P7") != null) {
                EachJudgeRow.add(rs2_Results_TieBreaker_Mobile_Value.getString("P7"));
            } else {
                EachJudgeRow.add("");
            }
            
            
            
            AlActualValues_TieBreaker_Mobile_Value.add(EachJudgeRow);
        
        }
        
       /*******************************************************************************************************************/
        
        
        
        
        
        
    /* **************************************************************************************************************************/    
        cst_Results_WO = localConnection.prepareCall("{call [SM_GET_F2_Results](?,?,?)}");
        cst_Results_WO.setString(1, null);
        cst_Results_WO.setString(2, strEventSeq);
        cst_Results_WO.setString(3, strCurrTieBreaker);
       

        rs2_Results_WO = cst_Results_WO.executeQuery();
        
        while (rs2_Results_WO.next()) {
            ArrayList AlRow_Results = new ArrayList();
            List AlRow_Results_Pos = new ArrayList();
            
            AlRow_Results.add(rs2_Results_WO.getString("AssignedNum"));
                AlRow_Results_Pos.add(rs2_Results_WO.getString("J1"));
                AlRow_Results_Pos.add(rs2_Results_WO.getString("J2"));
                AlRow_Results_Pos.add(rs2_Results_WO.getString("J3"));
                //AlRow_Results_Pos.add(rs2_Results_WO.getString("J4"));
                //AlRow_Results_Pos.add(rs2_Results_WO.getString("J5"));
           AlRow_Results.add(AlRow_Results_Pos);
         
            AlRow_Results.add(rs2_Results_WO.getString("Total"));
            AlRow_Results.add(rs2_Results_WO.getString("TieFlag"));
            Al_WO.add(AlRow_Results);
        }
    }

    } catch (Exception ex) {
        out.println(ex);
    } finally {
        if (rs2 != null) {
            rs2.close();
        }
        if (cst != null) {
            cst.close();
        }
        
        if (rs2_Results != null) {
            rs2_Results.close();
        }
        
         if (rs2_Results_WO != null) {
            rs2_Results_WO.close();
        }
        if (cst_Results_WO != null) {
            cst_Results_WO.close();
        }
        
        if (cst_Results != null) {
            cst_Results.close();
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
        
           if (rowCnt_TB < intNumberofJudges) {

            for (int i = 1; i <= intNumberofJudges - rowCnt_TB; i++) {
   
                EachJudgeRow = new ArrayList();
                for (int j = 1; j <= intNumberofPositions; j++) {
                    EachJudgeRow.add("");
                }
                AlActualValues_TieBreaker_Mobile_Value.add(EachJudgeRow);
            }
        }

    }


%>