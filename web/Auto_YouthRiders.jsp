<%@ page import = "java.util.Iterator"%>
<%@ page import = "java.util.List"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>
<%
        Connection localConnection=null;
        DbConnMngr dbcmt=new DbConnMngr();
         String strShow="";
        ArrayList ArShow=new ArrayList();
        try
        {
            localConnection=dbcmt.getConnection();
            localConnection.setAutoCommit(false);
            CallableStatement cst = localConnection.prepareCall("{call GET_SHOWS_OWNERDETAILS(?,?,?,?,? ,?,?,?,?,?)}");
             cst.setString(1,"");
            cst.setString(2,"");
            cst.setString(3,"");
            cst.setString(4,"");
            cst.setString(5,"");

            cst.setString(6,"");
            cst.setString(7,"");
            cst.setString(8,"");
            cst.setString(9,"");
            cst.setInt(10,2);

        ResultSet rs1 = cst.executeQuery();


        while (rs1.next())
        {
            if(rs1.getString("NAME")!=null)
                  ArShow.add(rs1.getString("NAME")+" [REG:] "+rs1.getString("ASSIGNEDNUM"));
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
                                       System.out.println("release:");
					localConnection.rollback();
					dbcmt.releaseConnection(localConnection);
				}
                                catch(SQLException exc)
				{
					exc.printStackTrace();
				}

		}

        String [] ShowList = (String[])ArShow.toArray(new String[ArShow.size()]);


	String query = (String)request.getParameter("q");
	response.setHeader("Content-Type", "text/html");

	int cnt=1;
	for(int i=0;i<ShowList.length;i++)
	{
		if(ShowList[i].toUpperCase().startsWith(query.toUpperCase()))
		{
			out.print(ShowList[i]+"\n");
			//if(cnt>=20)
			//	break;
			cnt++;
		}
	}
%>