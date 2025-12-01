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

String strBreederName="";
    
    String strFirstName="";
    String strLastName="";
    String strMiddleName="";
    String strEntitySeq="";
    String strOrgName="";
    String strBreederNo="";
    int Counter=0;
    int asgno=0;

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
            CallableStatement cst = localConnection.prepareCall("{call Get_OwnerName(?)}");
            cst.setString(1, Name);
            
            ResultSet rs1 = cst.executeQuery();
        

            while (rs1.next())
            {
                strBreederName="";
                strFirstName="";
                strLastName="";
                strMiddleName="";
                strEntitySeq="";
                strOrgName="";
                strBreederNo="";
                asgno=0;
                
                if(rs1.getString("FIRSTNAME")!=null)
                    strFirstName= rs1.getString("FIRSTNAME").trim();
                else
                    strFirstName="";

                if(rs1.getString("LASTNAME")!=null)
                    strLastName= rs1.getString("LASTNAME").trim();
                else
                    strLastName="";

                if(rs1.getString("SUFFIX")!=null)
                    strMiddleName= rs1.getString("SUFFIX").trim();
                else
                    strMiddleName="";
                
                if(rs1.getString("ORGANIZATION_NAME")!=null)                     
                    strOrgName= rs1.getString("ORGANIZATION_NAME").trim(); 
                else
                    strOrgName="";


                if(rs1.getString("ENTITYSEQ")!=null)
                    strEntitySeq= rs1.getString("ENTITYSEQ").trim();
                
                
                if(rs1.getString("ASSIGNEDNUM")!=null)
                {
                      strBreederNo= rs1.getString("ASSIGNEDNUM").trim();
                      asgno=Integer.parseInt(strBreederNo);  
                }

                strBreederName=strFirstName+" "+strLastName;
                
                    
                    if(!strOrgName.equals(""))
                     {
                        ArHorse.add(strOrgName.trim()+"[ID:]"+strBreederNo+"#@#"+strEntitySeq);    
                     }
                    else
                    {
                        ArHorse.add(strBreederName.trim()+"[ID:]"+strBreederNo+"#@#"+strEntitySeq);                            
                    }                    
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
