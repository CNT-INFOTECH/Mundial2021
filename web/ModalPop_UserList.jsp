<%--
    Document   : ModalPop_RoleList
    Created on : Aug 10, 2011, 9:40:46 AM
    Author     : dp
--%>

<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>

<link href="Shows_Pop.css" rel="stylesheet" type="text/css" />
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />

<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.net.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>
<%@ page import="javax.sql.rowset.*" %>

<%
String strMode="";
if(request.getParameter("mode")!=null)
    strMode=request.getParameter("mode");
int count=1;

if(strMode.equals("1"))
 {
 Connection localConnection=null;
 DbConnMngr dbcmt=new DbConnMngr();
 String strRoleSeq="";
 List testData = new ArrayList();

try {
    localConnection=dbcmt.getConnection();
    localConnection.setAutoCommit(false);
    
 RowSetFactory factory57 = RowSetProvider.newFactory();
   CachedRowSet rs1= factory57.createCachedRowSet();
    //CachedRowSetImpl rs1 = new CachedRowSetImpl();
    CallableStatement cst = localConnection.prepareCall("{call GET_USER_DETAIL(?,?,?,?)}");
    cst.setString(1, strUserId);
    cst.setString(2, strFirstName);
    cst.setString(3, strLastName);
    cst.setString(4, strStatus);

    ResultSet rs = cst.executeQuery();
    rs1.populate(rs);

    Map map1 = new TreeMap();
    String strUserID="";
    String strCheckUserID="";
    
    String strOrganization="";
    String strRoleId="";
    String strRoleName="";

    while(rs1.next())
    {

        strUserID=rs1.getString("userid");
        if(count==1)
        strCheckUserID=strUserID;

        if(!strCheckUserID.equals(strUserID))
        {
        testData.add(map1);
        map1 = new TreeMap();
        strCheckUserID=strUserID;
        strOrganization="";
        strRoleName="";
        strRoleId="";
        }
        
        
        map1.put("Userid",rs1.getString("userid"));
        map1.put("Firstname",rs1.getString("user_firstname"));
        map1.put("Lastname",rs1.getString("user_lastname"));
        map1.put("Status",rs1.getString("user_status"));
        map1.put("Middlename", rs1.getString("user_middle"));
        map1.put("ADDRESS1", rs1.getString("user_address1"));
        map1.put("ADDRESS2", rs1.getString("user_address2"));
        map1.put("CITY", rs1.getString("user_city"));
        map1.put("STATE", rs1.getString("user_state"));
        map1.put("ZIP", rs1.getString("user_zip"));
        map1.put("COUNTRY", rs1.getString("user_country"));
        map1.put("PHONE", rs1.getString("user_phone"));
        map1.put("EMAIL", rs1.getString("user_email"));
        map1.put("OrgCount", rs1.getString("userorgCount"));
        map1.put("RoleCount", rs1.getString("roleidCount"));


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

        count+=1;

    }
    testData.add(map1);

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
    session.setAttribute("User", testData);

    
    if(count>1){
%>


   <display:table  class="grid" id="User"
                   name="sessionScope.User" pagesize="20"
                   style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">

    <display:setProperty name="paging.banner.item_name" value="User" />
    <display:setProperty name="paging.banner.items_name" value="Users" />
  
   <display:column style="width:1%" headerClass="Grid_Header" >
        <input type="radio" Name="ChkRadio" id="ChkRadio" onClick="returntoMain('${User.Userid}');"></display:column>

    <display:column style="width:10%;text-transform: uppercase"  value="Userid" title="USERID" property="Userid" sortable="true" headerClass="Grid_Header" />
    <display:column style="width:25%;text-transform: uppercase"  value="Firstname" title="FIRSTNAME" property="Firstname" headerClass="Grid_Header" sortable="true" />
    <display:column style="width:25%;text-transform: uppercase"  value="Lastname" title="LASTNAME" property="Lastname" headerClass="Grid_Header" sortable="true" />
    <display:column style="width:10%;text-transform: uppercase" value="Status"  property="Status" sortable="true" headerClass="Grid_Header"/>



 </display:table>

<%}
else
    out.println("Nothing Found to display..");
}%>

