<%@ page import = "java.util.Iterator"%>
<%@ page import = "java.util.List"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>
<%
        Connection localConnection=null;
        DbConnMngr dbcmt=new DbConnMngr();
         String strEvent="";

         String strShowSeq="";
         if(request.getParameter("ShowSeq")!=null)
            strShowSeq=request.getParameter("ShowSeq");

      


        ArrayList ArEvent=new ArrayList();
        try
        {
            localConnection=dbcmt.getConnection();
            localConnection.setAutoCommit(false);
            CallableStatement cst = localConnection.prepareCall("{call GET_EVENT_INFORMATION(?)}");
            cst.setString(1, strShowSeq);




        ResultSet rs1 = cst.executeQuery();


        while (rs1.next())
        {
            if(rs1.getString("Name")!=null)
                  ArEvent.add(rs1.getString("Name")+"#@#"+rs1.getString("Event_Seq"));
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

        String [] EventList = (String[])ArEvent.toArray(new String[ArEvent.size()]);


	String query = (String)request.getParameter("q");
	response.setHeader("Content-Type", "text/html");

	int cnt=1;
	for(int i=0;i<EventList.length;i++)
	{
		if(EventList[i].toUpperCase().startsWith(query.toUpperCase()))
		{
			out.print(EventList[i]+"\n");
			//if(cnt>=20)
			//	break;
			cnt++;
		}
	}
%>