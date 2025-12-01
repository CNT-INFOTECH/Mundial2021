<%@ page import="pasotracker.GeneralServlet" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import = "java.util.*" %>
<%
   
    String strFEES="";
    String strMEMBER_TYPE="";
   
    
    if(request.getParameter("Membertype")!=null)
        strMEMBER_TYPE=request.getParameter("Membertype").trim();

    
    /*try
    { */
     GeneralServlet gen_Member = new GeneralServlet();
     List LiValues = new ArrayList();
     //CachedRowSetImpl crsmembershiptypedetails = new CachedRowSetImpl();
     RowSetFactory factory2 = RowSetProvider.newFactory();
   CachedRowSet crsmembershiptypedetails= factory2.createCachedRowSet();
     crsmembershiptypedetails = gen_Member.GET_membershiptypedetails(strMEMBER_TYPE);

   
     ArrayList ArrRow=new ArrayList();

     if(crsmembershiptypedetails.next())
     {
        ArrRow=new ArrayList();
       
        strFEES="";
      
            if(crsmembershiptypedetails.getString("FEES")!=null)
                {ArrRow.add(strFEES= crsmembershiptypedetails.getString("FEES").trim());}
            else
                ArrRow.add("");
                LiValues.add(ArrRow);
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
      out.println(2);
%>
    