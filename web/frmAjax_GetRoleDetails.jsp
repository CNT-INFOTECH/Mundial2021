<%@page import="model.*"%>
<%@ page import = "java.util.*" %>
<%@page import="java.sql.*"%>
<%@ page import="javax.sql.rowset.*" %>
<%

String strRoleID=request.getParameter("RoleID");


Connection localConnection=null;
DbConnMngr dbcmt=new DbConnMngr();
 RowSetFactory factory12 = RowSetProvider.newFactory();
   CachedRowSet crs= factory12.createCachedRowSet();
//CachedRowSetImpl crs = new CachedRowSetImpl();
//Connection connection=null;
ResultSet rs;
//Call your DB
localConnection=dbcmt.getConnection();
	localConnection.setAutoCommit(false);

//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
   // Connection con=login.ConnectionManager.getConnection();
           Statement st=localConnection.createStatement();
    rs=st.executeQuery("select roleid,rolename,rolestatus from master_roles where roleid="+strRoleID);
    
	crs.populate(rs);
	int RecSize=crs.size();
	if(RecSize>0){
	  if(crs.next())
	  {

			  String strResult= crs.getString(1) + "#@#" + crs.getString(2) + "#@#" + crs.getString(3);
			 out.println(strResult);
	  }}
    else if(RecSize==0)
              out.println(0);
        /*{
        String strResult= strRoleID + "#@#" + "" + "#@#" + "";

		

        }*/

    /*             if(count>0)
          {



String strResult= rs.getString(1) + "#@#" + rs.getString(2) + "#@#" + rs.getString(3);
out.println(strResult);
}
   */

%>