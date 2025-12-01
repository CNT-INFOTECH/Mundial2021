<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.net.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import= "javax.naming.*" %>
<%@ page import= "javax.sql.rowset.*" %>
<%@ page import =  "model.*" %>

<%@ page import =  "pasotracker.*" %>
<%
   String Login_UserName="";
  
   if(session.getAttribute("user")!=null)
        Login_UserName=(String)session.getAttribute("user");
 
   if(Login_UserName.trim().equals(""))
   {
        response.sendRedirect("login.jsp");
   }
   
   ArrayList ArScreenName = new ArrayList();
   ArrayList Screen_InsUpd = new ArrayList();
   RowSetFactory factory22 = RowSetProvider.newFactory();
   CachedRowSet crsGetUserAccess= factory22.createCachedRowSet();
   //CachedRowSetImpl crsGetUserAccess = new CachedRowSetImpl();
   GeneralServlet gen_User = new GeneralServlet();
   if(Login_UserName.length()>0)
   crsGetUserAccess = gen_User.Get_User_ScreenAccess(Login_UserName);
    
   String RoleName="";
   //String Screen_InsUpd="";
   String Screen_View="";
   String Screen_Name="";
   int CrsUserSize=0;
   CrsUserSize= crsGetUserAccess.size();
   
   while(crsGetUserAccess.next())
    {
        if(crsGetUserAccess.getString("RoleName")!=null)
        RoleName= crsGetUserAccess.getString("RoleName");
        else
        RoleName="";    

        if(crsGetUserAccess.getString("SCREEN_INSERT_UPDATE")!=null)
            {
                    Screen_InsUpd.add(crsGetUserAccess.getString("SCREEN_INSERT_UPDATE"));
        }
        else
        Screen_InsUpd.add("");

        if(crsGetUserAccess.getString("SCREEN_INSERT_UPDATE")!=null)
        Screen_View= crsGetUserAccess.getString("SCREEN_INSERT_UPDATE");
        else
        Screen_View="";

       if(crsGetUserAccess.getString("SCREEN_NAME")!=null)
        {        
            ArScreenName.add(crsGetUserAccess.getString("SCREEN_NAME"));
        }
        else
        ArScreenName.add(""); 

    }
   
%>
