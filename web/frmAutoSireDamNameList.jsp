<%-- 
    Document   : frmAutoHorseNameList
    Created on : Jul 19, 2011, 11:03:24 AM
    Author     : Veera
--%>


<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.DbConnMngr" %>
<%@ page import="pasotracker.GeneralServlet" %> 

<%
        Connection localConnection=null;
        DbConnMngr dbcmt=new DbConnMngr();        
        String Name="";
        
        String query = (String)request.getParameter("q");
        
        String ExpType=(String)request.getParameter("ExpType");
        
        ArrayList ArHorse=new ArrayList();
        try
        {
         
            localConnection=dbcmt.getCon();
            localConnection.setAutoCommit(false);
            CallableStatement cst = localConnection.prepareCall("{call Get_SireDaMHorseName(?,?)}");
            cst.setString(1, Name);
            cst.setString(2, ExpType);
            ResultSet rs1 = cst.executeQuery();
        

        while (rs1.next())
        {
            if(rs1.getString("HORSENAME")!=null)
                  ArHorse.add(rs1.getString("HORSENAME").trim()+" [REG:] "+rs1.getString("REG#")+"#@#"+rs1.getString("REGSEQ"));            
         //                ArHorse.add(rs1.getString("HORSENAME").trim()+" [REG:] "+rs1.getString("REG#"));            
            
                    
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
                                   	localConnection.rollback();
					dbcmt.releaseConnection(localConnection);
				}
                                catch(SQLException exc)
				{
					exc.printStackTrace();
				}

		}

        String [] HorseList = (String[])ArHorse.toArray(new String[ArHorse.size()]);

        response.setHeader("Content-Type", "text/html");

	int cnt=1;
	for(int i=0;i<HorseList.length;i++)
	{
		if(HorseList[i].toUpperCase().startsWith(query.toUpperCase()))
		{                    
			out.print(HorseList[i]+"\n");	
                        	
		}
	}
%>
