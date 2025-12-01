<%-- 
    Document   : Admin_GetUserDetails
    Created on : May 30, 2012, 12:38:26 PM
    Author     : Erzath
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.net.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>

<%

String userid=request.getParameter("userid");
if(!userid.equals("null"))
{
    Connection localConnection=null;
    DbConnMngr dbcmt=new DbConnMngr();
    List testData = new ArrayList();
    session.removeAttribute("User");

try {

    localConnection=dbcmt.getConnection();
    localConnection.setAutoCommit(false);

    CallableStatement cst = localConnection.prepareCall("{call GET_USER_DETAIL(?,?,?,?)}");
    cst.setString(1, userid);
    cst.setString(2, "");
    cst.setString(3, "");
    cst.setString(4, "");

    ResultSet rs1 = cst.executeQuery();
    Map map1 = new TreeMap();

    String strOrganization="";
    String strRoleId="";
    String strRoleName="";
	String strOrganization_Seq="";


    while(rs1.next())
    {
		if(rs1.getString("userid")!=null)
        map1.put("Userid",rs1.getString("userid"));
		else
			        map1.put("Userid","");

		if(rs1.getString("user_firstname")!=null)
		map1.put("Firstname",rs1.getString("user_firstname"));
		else
			        map1.put("Firstname","");

		if(rs1.getString("user_lastname")!=null)
		map1.put("Lastname",rs1.getString("user_lastname"));
		else
			        map1.put("Lastname","");

		if(rs1.getString("user_status")!=null)
		map1.put("Status",rs1.getString("user_status"));
		else
			        map1.put("Status","");

		if(rs1.getString("user_middle")!=null)
		map1.put("Middlename", rs1.getString("user_middle"));
		else
			        map1.put("Middlename","");

			if(rs1.getString("user_address1")!=null)
		map1.put("ADDRESS1", rs1.getString("user_address1"));
			else
			        map1.put("ADDRESS1","");
	
	if(rs1.getString("user_address2")!=null)
		map1.put("ADDRESS2", rs1.getString("user_address2"));
	else
			        map1.put("ADDRESS2","");

		if(rs1.getString("user_city")!=null)
		map1.put("CITY", rs1.getString("user_city"));
		else
			        map1.put("CITY","");

		if(rs1.getString("user_state")!=null)
		map1.put("STATE", rs1.getString("user_state"));
		else
			        map1.put("STATE","");

				if(rs1.getString("user_zip")!=null)
		map1.put("ZIP", rs1.getString("user_zip"));
				else
			        map1.put("ZIP","");

						if(rs1.getString("user_country")!=null)
		map1.put("COUNTRY", rs1.getString("user_country"));
						else
			        map1.put("COUNTRY","");

								if(rs1.getString("user_phone")!=null)
		map1.put("PHONE", rs1.getString("user_phone"));
								else
			        map1.put("PHONE","");

										if(rs1.getString("user_email")!=null)
		map1.put("EMAIL", rs1.getString("user_email"));
										else
			        map1.put("EMAIL","");
		//map1.put("user_orgSeq", rs1.getString("UserOrg_Seq"));
				


        if(rs1.getString("user_org")!=null && rs1.getString("user_org").length()>0)
		{
		strOrganization+=rs1.getString("user_org")+"#@#";
		map1.put("Organization", strOrganization);
		}
		else
		{	
			strOrganization+=" "+"#@#";
			map1.put("Organization", strOrganization);
		}
		
		if(rs1.getString("UserOrg_Seq")!=null && rs1.getString("UserOrg_Seq").length()>0)
		{
		strOrganization_Seq+=rs1.getString("UserOrg_Seq")+"#@#";
		map1.put("user_orgSeq", strOrganization_Seq);
		}
		else
		{	
			strOrganization_Seq+=" "+"#@#";
			map1.put("user_orgSeq", strOrganization_Seq);
		}

		/*strRoleId+=rs1.getString("role_id")+"#@#";
		map1.put("roleId", strRoleId);
*/
		if(rs1.getString("ROLENAME")!=null && rs1.getString("ROLENAME").length()>0)
		{
		strRoleName+=rs1.getString("ROLENAME")+"#@#";
		map1.put("roleName", strRoleName);					
		}
		else
		{	
		strRoleName+=" "+"#@#";
		map1.put("roleName", strRoleName);					
		}

		if(rs1.getString("role_id")!=null && rs1.getString("role_id").length()>0)
		{
		strRoleId+=rs1.getString("role_id")+"#@#";
		map1.put("roleId", strRoleId);					
		}
		else
		{						
		strRoleId+=" "+"#@#";
		map1.put("roleId", strRoleId);
		}

		if(rs1.getString("userorgCOUNT")!=null)
			map1.put("OrgCount", rs1.getString("userorgCOUNT"));
		else
			map1.put("OrgCount","0");

		if(rs1.getString("roleidCOUNT")!=null)
			map1.put("RoleCount", rs1.getString("roleidCOUNT"));
		else
	        map1.put("RoleCount","0");


    }
    testData.add(map1);
	
    rs1.close();
    cst.close();       
    }

catch (Exception e) 
    {
        out.println("Exception in Admin_GetUserDetails.jsp---"+e);
        e.printStackTrace();
    }

finally
    {
        localConnection.commit();
        dbcmt.releaseConnection(localConnection);
        response.sendRedirect("User_Selected.jsp?userID="+userid);
    }
session.setAttribute("User", testData);

}
%>

  