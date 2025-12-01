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
            String query = (String)request.getParameter("q");
            localConnection=dbcmt.getConnection();
            localConnection.setAutoCommit(false);
            CallableStatement cst = localConnection.prepareCall("{call GET_PERSON_DETAILS(?)}");
            cst.setString(1,query);


        ResultSet rs1 = cst.executeQuery();


        while (rs1.next())
        {
            String strName="";
            if(rs1.getString("Name")!=null)
            {
                strName=rs1.getString("Name")+ "[ID] ";
            }
            if(rs1.getString("AssignedNum")!=null)
            {
                strName+=rs1.getString("AssignedNum");
            }

            ArShow.add(strName);
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
			/*if(cnt>=20)
				break;*/
			cnt++;
		}
	}
%>