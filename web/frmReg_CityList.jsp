

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
        int crs_size=0;
	try
        {               
	String query = (String)request.getParameter("q");	 
        GeneralServlet gen=new GeneralServlet();
        
 RowSetFactory factorycrs = RowSetProvider.newFactory();
   CachedRowSet crs= factorycrs.createCachedRowSet();
       // CachedRowSetImpl crs = new CachedRowSetImpl();            	
	int cnt=1;
        ArrayList  ArCity=new ArrayList();

        if(query.length()>0)
        crs = gen.GET_CountryDetails(CITY,"","","");
           
        while(crs.next())
        {
        if(crs.getString("CITY")!=null)
            ArCity.add(crs.getString("CITY").trim()+" [ST:] "+crs.getString("STATE").trim()+" [ZIP:] "+crs.getString("ZIP").trim()+" [COUNTRY:] "+crs.getString("COUNTRY").trim());                                                            
                                           
        }
        
        for(int i=0;i<ArCity.size();i++)
	{            
            String value=ArCity.get(i).toString();            
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
<%--<input type="hidden" value="<%=crs_size%>" name="Txt_crs_size" id="Txt_crs_size"/>--%>
