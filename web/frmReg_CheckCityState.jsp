<%@ page import="pasotracker.GeneralServlet" %>    
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import = "java.util.*" %>

 <%
          String strcity=request.getParameter("City");
          String strState=request.getParameter("State");
          String strZip=request.getParameter("Zip");

          GeneralServlet gen=new GeneralServlet();
          List LiValues = new ArrayList();
          
 RowSetFactory factorycrsDetails = RowSetProvider.newFactory();
   CachedRowSet crsDetails= factorycrsDetails.createCachedRowSet();
        //  CachedRowSetImpl crsDetails = new CachedRowSetImpl();

            crsDetails = gen.GET_CountryDetails(strcity,strState,strZip,"");
            
          //  Map MpAllDetails = new TreeMap();
        /*try
        {   
          */  
            String cityVal="";
            String stateVal="";
            String zipVal="";
            String countryVal="";
            ArrayList ArRow=new ArrayList();
            while (crsDetails.next())
            {
                
                 ArRow=new ArrayList();
                if(crsDetails.getString("CITY")!=null)
                {  
                    ArRow.add(cityVal= crsDetails.getString("CITY").trim());
                }
                else 
                    ArRow.add("");
                 
                 if(crsDetails.getString("STATE")!=null)
                {  
                    ArRow.add(cityVal= crsDetails.getString("STATE").trim());
                }
                else 
                    ArRow.add("");
                 
                 if(crsDetails.getString("ZIP")!=null)
                {  
                    ArRow.add(cityVal= crsDetails.getString("ZIP").trim());
                }
                else 
                    ArRow.add("");
                 
                 if(crsDetails.getString("COUNTRY")!=null)
                {  
                    ArRow.add(cityVal= crsDetails.getString("COUNTRY").trim());
                }
                else 
                    ArRow.add("");
                 
                
                /*
                    MpAllDetails = new TreeMap();
                    MpAllDetails.put("CITY",cityVal);
                    MpAllDetails.put("STATE",stateVal);
                    MpAllDetails.put("ZIP",zipVal);
                    MpAllDetails.put("COUNTRY",countryVal);
                */

                    LiValues.add(ArRow);
                    
                    

            }
       /* }
        catch(Exception ex)
        {
                ex.printStackTrace();

        }*/
            
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
              out.println(2);
%>
 
 