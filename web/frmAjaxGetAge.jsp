<%@ page import = "model.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
 <%
            String strExpType=request.getParameter("Type");
            String strStartDate=request.getParameter("Begin");
            String strEndDate=request.getParameter("End");
            String strOutput="";
            Connection localConnection=null;
            DbConnMngr dbcmt=new DbConnMngr();

         try
        {

            localConnection=dbcmt.getConnection();
            localConnection.setAutoCommit(false);
            CallableStatement cst = localConnection.prepareCall("{call GET_AGE(?,?,?,?)}");
            cst.setString(1,strExpType);
            cst.setString(2,strStartDate);
            cst.setString(3,null);
            cst.setString(4,strEndDate);
           


        ResultSet rs1 = cst.executeQuery();

         while (rs1.next())
        {

            strOutput=rs1.getString("AgeYY");

        }

                    rs1.close();
                    cst.close();


                    dbcmt.releaseConnection(localConnection);
                    }


                catch(Exception ex)
		{
			ex.printStackTrace();
			try
				{
                                       System.out.println("release:" +ex);
					localConnection.rollback();
					dbcmt.releaseConnection(localConnection);
				}
                                catch(SQLException exc)
				{
					exc.printStackTrace();
				}

		}



            out.print(strOutput);


%>
