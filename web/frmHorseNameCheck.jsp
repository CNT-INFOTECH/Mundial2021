<%-- 
    Document   : frmHorseNameCheck
    Created on : Oct 12, 2011, 11:07:37 AM
    Author     : veera
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
 
          String Name=request.getParameter("Name");
         
              GeneralServlet gen=new GeneralServlet();
              List LiValues = new ArrayList();
          
            localConnection=dbcmt.getCon();
            localConnection.setAutoCommit(false);
            
            CallableStatement cst = localConnection.prepareCall("{call GET_HORSENAME(?)}");
            cst.setString(1, Name);
           
            ResultSet rs1 = cst.executeQuery();
            
            String cityVal="";
            String stateVal="";
            String zipVal="";
            String countryVal="";
            ArrayList ArRow=new ArrayList();

        while (rs1.next())
        {
               ArRow=new ArrayList();
                 
                if(rs1.getString("HORSENAME")!=null)
                    ArRow.add(rs1.getString("HORSENAME").trim());                 
                else 
                    ArRow.add("");
                 
                 
                 if(rs1.getString("REGSEQ")!=null)
                {  
                    ArRow.add(rs1.getString("REGSEQ").trim());
                }
                else 
                    ArRow.add("");
                
                 
                   LiValues.add(ArRow);
            }
            
          int RecSize=LiValues.size();
          if(RecSize==0)
              out.println(0);
           else if(RecSize==1)
            {
               ArrayList AlRow=(ArrayList)LiValues.get(0);
               for(int i=0;i <AlRow.size();i++)
                 {
                   String strValue="";
                    if(AlRow.get(i)!=null)
                        strValue=AlRow.get(i).toString();
                   out.print(strValue.trim()+"#@#");                   
                 }
            }
           else if(RecSize>1)
               {
                    out.println(2);                    
                }
%>
 
 
