<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>

  <link href="Shows_Pop.css" rel="stylesheet" type="text/css" />
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />
 
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.net.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>


<%
String strMode="";
if(request.getParameter("mode")!=null)
    strMode=request.getParameter("mode");
//if(strMode.equals("1"))
 //{
 Connection localConnection=null;
 DbConnMngr dbcmt=new DbConnMngr();
  String strShowSeq="";
 List testData = new ArrayList();

try {
        localConnection=dbcmt.getConnection();
	localConnection.setAutoCommit(false);
        CallableStatement cst = localConnection.prepareCall("{call GET_SHOW_INFORMATION(?,?,?,?)}");
        cst.setString(1, strShowName);
        cst.setString(2, strPlace);
        cst.setString(3, strDate);
        cst.setString(4, strShowSeq);


        ResultSet rs1 = cst.executeQuery();
        

       
        Map map1 = new TreeMap();
        while(rs1.next())
        {
            
                map1 = new TreeMap();
                map1.put("Show",rs1.getString("Show_Name"));
                map1.put("Place",rs1.getString("Show_Place"));
                map1.put("Date",rs1.getString("Show_From_Date"));
                map1.put("Seq",rs1.getString("Show_Seq"));

                testData.add(map1);

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
        session.setAttribute("test", testData);
%>


   <display:table  class="grid" id="test"
                   name="sessionScope.test" pagesize="10"
                   style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">


    <display:column style="width:1%" headerClass="Grid_Header" >
        <input type="radio" Name="ChkRadio" onClick="returntoMain(${test.Seq});"></display:column>

    <display:column style="width:25%;text-transform: uppercase"  title="Show Name" property="Show" sortable="true" headerClass="Grid_Header" />
    <display:column style="width:10%;text-transform: uppercase"   property="Place" headerClass="Grid_Header" sortable="true" />
    <display:column style="width:10%;text-transform: uppercase"   property="Date" sortable="true" headerClass="Grid_Header"/>

    

 </display:table>

<%//}
%>
