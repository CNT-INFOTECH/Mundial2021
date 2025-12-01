
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.GeneralServlet" %> 


<%      
    String HorseName="";
    int crs_size=0;
    try
    {               
    String query = (String)request.getParameter("q");
    GeneralServlet gen=new GeneralServlet();
    
 RowSetFactory factory52 = RowSetProvider.newFactory();
   CachedRowSet crs= factory52.createCachedRowSet();
   // CachedRowSetImpl crs = new CachedRowSetImpl();            	
    int cnt=1;
    ArrayList  ArrHorName=new ArrayList();

    if(query.length()>0)
    crs = gen.GET_DAM("","",HorseName,"","","","","");            

    while(crs.next())
    {
    if(crs.getString("HORSE_PRIMARYNAME")!=null)
        ArrHorName.add(crs.getString("HORSE_PRIMARYNAME")+" [REG:] "+crs.getString("REGISTRATION_NUM"));

    }

    for(int i=0;i<ArrHorName.size();i++)
    {            
        String value=ArrHorName.get(i).toString();            
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