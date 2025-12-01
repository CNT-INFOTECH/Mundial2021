<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.net.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>

<%
  String strShowSeq=request.getParameter("ShowSeq");

  String strNumberofJudges="5";

  
          if(request.getParameter("Judges")!=null)
              strNumberofJudges=request.getParameter("Judges");

   ArrayList AlCategories=new ArrayList();
 if(!strShowSeq.equals("0"))
 {
 Connection localConnection=null;
 DbConnMngr dbcmt=new DbConnMngr();

try {
        localConnection=dbcmt.getConnection();
	localConnection.setAutoCommit(false);
        CallableStatement cst = localConnection.prepareCall("{call GET_SHOWS_JUDGES(?)}");
        cst.setString(1, strShowSeq);
        ResultSet rs2 = cst.executeQuery();
        ArrayList AlRows=new ArrayList();
        


        while(rs2.next())
        {

            AlRows=new ArrayList();
           
            AlRows.add(rs2.getString("Category"));
            AlRows.add(rs2.getString("JudgeNum"));
            AlRows.add(rs2.getString("JudgeName"));


            AlCategories.add(AlRows);
        }


      




         rs2.close();
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

 } 
%>
