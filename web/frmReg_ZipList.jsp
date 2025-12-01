
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.DBConnection" %>
<%@ page import="pasotracker.GeneralServlet" %> 



<%
        
        String CITY="";
        String STATE="";
        String ZIP="";
        String COUNTRY="";
	try
        {
       
        
	String query = (String)request.getParameter("q");
	 
        GeneralServlet gen=new GeneralServlet();

        CachedRowSetImpl crs = new CachedRowSetImpl();    
        
	
	int cnt=1;
       
        ArrayList  ArZip=new ArrayList();
        
        crs = gen.GET_CountryDetails(CITY, STATE, ZIP, COUNTRY);
       
        
        while(crs.next())
        {
            /*if(crs.getString("CITY")!=null)
                CITY=crs.getString("CITY");
            
            if(request.getParameter("STATE")!=null)
                STATE=request.getParameter("STATE");
            
             if(request.getParameter("ZIP")!=null)
                ZIP=request.getParameter("ZIP");*/
            
            if(request.getParameter("ZIP")!=null)
                ZIP=request.getParameter("ZIP");
            
              ArZip.add(crs.getString("ZIP"));                 
        }
        
        for(int i=0;i<ArZip.size();i++)
	{
            
            String value=ArZip.get(i).toString();
            
		if(value.toUpperCase().startsWith(query.toUpperCase()))
		{
			out.print(value+"\n");

			
		}
	}
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
%>