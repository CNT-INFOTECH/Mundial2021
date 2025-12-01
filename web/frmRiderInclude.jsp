<%--
    Document   : frmSireDamSearchResults
    Created on : Jun 19, 2011, 1:03:26 PM
    Author     : CNT
--%>
<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.text.*" %>


<%@ page import =  "model.*" %>
<html>

    <body>
        <%

        Connection localConnection=null;
        DbConnMngr dbcmt=new DbConnMngr();
        String strEntitySeq="";
          if(request.getParameter("ID")!=null)
              strEntitySeq=request.getParameter("ID");

        String strAssignedNum="";
        String strOwnerType="";
        String strOrgName="";

        String strFirstName="";
        String strLastName="";
        String strMidName="";

        String strAddress1="";
        String strAddress2="";

        String strCity="";
        String strState="";
        String strZip="";
        String strCountry="";

        String strPhone="";
        String strEmail="";

        String strSearch="";
        String strCompleteName="";

                 if(request.getParameter("srch")!=null)
                      strSearch=request.getParameter("srch");

      if(strEntitySeq.length() > 0)
      {

          try
        {
      

            localConnection=dbcmt.getConnection();
            localConnection.setAutoCommit(false);
            CallableStatement cst = localConnection.prepareCall("{call GET_SHOWS_OWNERDETAILS(?,?,?,?,?, ?,?,?,?,?)}");
            cst.setString(1,"");
            cst.setString(2,"");
            cst.setString(3,"");
            cst.setString(4,"");
            cst.setString(5,"");

            cst.setString(6,"");
            cst.setString(7,"");
            cst.setString(8,"");
            cst.setString(9,strEntitySeq);
            cst.setInt(10,1);

            ResultSet rs1 = cst.executeQuery();
            while (rs1.next())
            {
                   if(rs1.getString("EntitySeq")!=null)
                    strEntitySeq=rs1.getString("EntitySeq");

                 

                  if(rs1.getString("AssignedNum")!=null)
                    strAssignedNum=rs1.getString("AssignedNum");

                  if(rs1.getString("Owner_Type")!=null)
                    strOwnerType=rs1.getString("Owner_Type");

                  if(rs1.getString("Organization_Name")!=null)
                    strOrgName=rs1.getString("Organization_Name");

                  if(rs1.getString("FirstName")!=null)
                     strFirstName=rs1.getString("FirstName");
                  if(rs1.getString("Lastname")!=null)
                    strLastName=rs1.getString("Lastname");
                  if(rs1.getString("Suffix")!=null)
                    strMidName=rs1.getString("Suffix");

                    if(rs1.getString("Name")!=null)
                    strCompleteName=rs1.getString("Name");

                  if(rs1.getString("Address1")!=null)
                    strAddress1=rs1.getString("Address1");
                  if(rs1.getString("Address2")!=null)
                    strAddress2=rs1.getString("Address2");

                 if(rs1.getString("City")!=null)
                     strCity=rs1.getString("City");
                  if(rs1.getString("State")!=null)
                    strState=rs1.getString("State");
                  if(rs1.getString("Zip")!=null)
                     strZip=rs1.getString("Zip");
                  if(rs1.getString("Country")!=null)
                        strCountry=rs1.getString("Country");
                if(rs1.getString("Phone")!=null)
                 strPhone=rs1.getString("Phone");
                 if(rs1.getString("Email")!=null)
                    strEmail=rs1.getString("Email");
               

         }
            System.out.println(strEmail);
                    rs1.close();
                    cst.close();


                    dbcmt.releaseConnection(localConnection);
                    }


                catch(Exception ex)
		{
			ex.printStackTrace();
			try
				{
                                       System.out.println("release:" +ex);
					localConnection.rollback();
					dbcmt.releaseConnection(localConnection);
				}
                                catch(SQLException exc)
				{
					exc.printStackTrace();
				}

		}
          }

        %>

    </body>
</html>
