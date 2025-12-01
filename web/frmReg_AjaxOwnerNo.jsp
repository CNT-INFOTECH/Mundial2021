
<%@ page import="pasotracker.GeneralServlet" %>    
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import = "java.util.*" %>
<%
    String strEntitySeq="";
    String strmem_num="";
    String strOrg_Name="";
    String strmem_name="";
    String strmem_lname="";
    String strmem_mname="";
    String strmem_add1="";
    String strmem_add2="";
    String strmem_city="";
    String strmem_state="";
    String strmem_zip="";
    String strmem_country="";
    String strmem_phone="";
    String strmem_email="";
    String strOwnerNo="";
    String strOwn_Type="";
    String strOwnerName="";
    
    if(request.getParameter("ON")!=null)
        strOwnerNo=request.getParameter("ON").trim();
    else
        strOwnerNo="";
             
    /*try
    { */                   
     GeneralServlet gen_OwnerInformation = new GeneralServlet();
     List LiValues = new ArrayList();
      RowSetFactory factorycrsOwnerInformation = RowSetProvider.newFactory();
   CachedRowSet crsOwnerInformation= factorycrsOwnerInformation.createCachedRowSet();
    // CachedRowSetImpl crsOwnerInformation = new CachedRowSetImpl();
     if(strOwnerNo!=null)
     crsOwnerInformation = gen_OwnerInformation.GET_OwnerInformation("","","","",strOwnerNo);
     
     ArrayList ArrRow=new ArrayList();
     while(crsOwnerInformation.next())
     {
        ArrRow=new ArrayList();
        strEntitySeq="";
        strmem_num="";
        strOrg_Name="";
        strmem_name="";
        strmem_lname="";
        strmem_mname="";
        strmem_add1="";
        strmem_add2="";
        strmem_city="";
        strmem_state="";
        strmem_zip="";
        strmem_country="";
        strmem_phone="";
        strmem_email="";
        strOwnerNo="";
        strOwnerName="";        

           if(crsOwnerInformation.getString("ENTITYSEQ")!=null)                                  
                ArrRow.add(strEntitySeq= crsOwnerInformation.getString("ENTITYSEQ").trim());                                           
            else 
                ArrRow.add("");
        
           if(crsOwnerInformation.getString("ASSIGNEDNUM")!=null)                                  
                ArrRow.add(strOwnerNo= crsOwnerInformation.getString("ASSIGNEDNUM").trim());                            
           else 
                ArrRow.add("");
        
            if(crsOwnerInformation.getString("OWNER_TYPE")!=null)                  
                ArrRow.add(strOwn_Type= crsOwnerInformation.getString("OWNER_TYPE").trim());
            else 
                ArrRow.add("");
        
            if(crsOwnerInformation.getString("ORGANIZATION_NAME")!=null)                  
                ArrRow.add(strOrg_Name= crsOwnerInformation.getString("ORGANIZATION_NAME").trim());
            else 
                ArrRow.add("");
        
            if(crsOwnerInformation.getString("MEMBER_NUM")!=null)                  
                ArrRow.add(strmem_num= crsOwnerInformation.getString("MEMBER_NUM").trim());
            else 
                ArrRow.add("");
            
            if(crsOwnerInformation.getString("FIRSTNAME")!=null)                  
                ArrRow.add(strmem_name= crsOwnerInformation.getString("FIRSTNAME").trim());
            else 
                ArrRow.add("");
        
            if(crsOwnerInformation.getString("LASTNAME")!=null)                  
                ArrRow.add(strmem_lname= crsOwnerInformation.getString("LASTNAME").trim());
            else 
                ArrRow.add("");
            
            if(crsOwnerInformation.getString("ADDRESS1")!=null)                  
                ArrRow.add(strmem_add1= crsOwnerInformation.getString("ADDRESS1").trim());
            else 
                ArrRow.add("");
            
            if(crsOwnerInformation.getString("ADDRESS2")!=null)                  
               ArrRow.add(strmem_add2= crsOwnerInformation.getString("ADDRESS2").trim());
             else 
                ArrRow.add("");
            
            if(crsOwnerInformation.getString("CITY")!=null)                  
                ArrRow.add(strmem_city= crsOwnerInformation.getString("CITY").trim());
            else 
                ArrRow.add("");
            
            if(crsOwnerInformation.getString("STATE")!=null)                  
                ArrRow.add(strmem_state= crsOwnerInformation.getString("STATE").trim());
            else 
                ArrRow.add("");
            
            if(crsOwnerInformation.getString("ZIP")!=null)                  
                ArrRow.add(strmem_zip= crsOwnerInformation.getString("ZIP").trim());
            else 
                ArrRow.add("");
            
            if(crsOwnerInformation.getString("COUNTRY")!=null)                  
                ArrRow.add(strmem_country= crsOwnerInformation.getString("COUNTRY").trim());
            else 
                ArrRow.add("");
            
            if(crsOwnerInformation.getString("PHONE")!=null)                  
                ArrRow.add(strmem_phone= crsOwnerInformation.getString("PHONE").trim());
            else 
                ArrRow.add("");
            
            if(crsOwnerInformation.getString("EMAIL")!=null)                  
                ArrRow.add(strmem_email= crsOwnerInformation.getString("EMAIL").trim());
            else 
                ArrRow.add("");
        
            if(crsOwnerInformation.getString("SUFFIX")!=null)                  
                ArrRow.add(strmem_mname= crsOwnerInformation.getString("SUFFIX").trim());
            else 
                ArrRow.add("");
        
            strOwnerName=strmem_name+" "+strmem_lname;                        
            
            
            if(!strOrg_Name.equals(""))
                ArrRow.add(strOrg_Name.trim());
            else if(!strOwnerName.equals("") && strOrg_Name.equals(""))
                ArrRow.add(strOwnerName.trim());
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
