<%--
    Document   : frmRegister_RIder_Shows_HSearch
    Created on : Jun 7, 2011, 12:16:55 PM
    Author     : CNT
--%>
<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>
 <head>
      
         <link href="Tables_style.css" rel="stylesheet" type="text/css" />
 <script>

 function ViewAll() {

    document.forms[0].FlgViewAll.value='Y';
    document.forms[0].method="post";
    document.forms[0].action="frmRegister_Rider_Shows.jsp?mode=1"
    document.forms[0].submit();
   


}
</script>
    </head>
    <body>
    <%
        String strMode="";
        if(request.getParameter("mode")!=null)
            strMode=request.getParameter("mode");

        
            





        Connection localConnection=null;
        DbConnMngr dbcmt=new DbConnMngr();
        if(strMode.equals("1")) // Search Mode is 1 list the horses
         {
         List YouthRiderList = new ArrayList();
        try
        {
            localConnection=dbcmt.getConnection();
            localConnection.setAutoCommit(false);
            CallableStatement cst = localConnection.prepareCall("{call GET_SHOWS_OWNERDETAILS(?,?,?,?,?, ?,?,?,?,?)}");
            cst.setString(1,"");
            cst.setString(2,"");
            cst.setString(3,"");
            cst.setString(4,"");
            cst.setString(5,strAssigned_Top);

            cst.setString(6,strYouthRider_DOB_Top);
            cst.setString(7,strGender_Top);
            cst.setString(8,strEventSeq);
            cst.setString(9,"");
            cst.setInt(10,2);
           

        ResultSet rs1 = cst.executeQuery();

        Map MpHorseDetails = new TreeMap();
        while (rs1.next())
        {
                MpHorseDetails = new TreeMap();
                MpHorseDetails.put("Seq",rs1.getString("EntitySeq"));
                MpHorseDetails.put("NAME",rs1.getString("Name"));
                MpHorseDetails.put("ASSIGNED#",rs1.getString("AssignedNum"));
                MpHorseDetails.put("AGE",rs1.getString("Age"));
                MpHorseDetails.put("DOB",rs1.getString("DOB"));
                MpHorseDetails.put("GENDER",rs1.getString("Gender"));
                
               
                YouthRiderList.add(MpHorseDetails);
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
                                       System.out.println("release:");
					localConnection.rollback();
					dbcmt.releaseConnection(localConnection);
				}
                                catch(SQLException exc)
				{
					exc.printStackTrace();
				}

		}

                request.setAttribute("YouthRiderList", YouthRiderList);

       %>
                <display:table  id="Details" name="requestScope.YouthRiderList"
                            pagesize="<%=intPageSize%>"
                            class="grid"
                            defaultsort="2" defaultorder="ascending"
                            style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">

                <display:setProperty name="paging.banner.item_name" value="Rider" />
                <display:setProperty name="paging.banner.items_name" value="Riders" />
                <display:setProperty name="paging.banner.some_items_found">

                <span class="pagebanner" >{0} {1} founds,displaying {2} to {3}</span>
                <span ><input type="checkbox" onClick="ViewAll()">View All&nbsp;&nbsp;&nbsp;</span>

                </display:setProperty>
            <display:setProperty name="basic.msg.empty_list" value="No Riders found with the Search Critera "/>
             <display:column style="width:15%" property="ASSIGNED#"   sortable="true" headerClass="Grid_Header" />
            <display:column style="width:25%" title="NAME" property="NAME"  sortable="true" headerClass="Grid_Header"/>
           
            <display:column style="width:5%" property="AGE" headerClass="Grid_Header" />
            <display:column style="width:5%" property="DOB" headerClass="Grid_Header" />
            <display:column style="width:5%" property="GENDER" headerClass="Grid_Header" />
            
            
            <display:column style="width:1%" headerClass="Grid_Header">
             <img alt="" src="Images/registration_icon.gif"
                  onClick="Register_Search_Icon_Rider_Event(<%=strEventSeq%>,'${Details.Seq}')"/></display:column>

            </display:table>
<%}

           else if(strMode.equals("2")){%>
        
                  <%@ include file="frmEntityDetails_YouthRider.jsp"%>
           
            <%}
          else if(strMode.equals("6")){%>   
        
                  <%@ include file="frmEntityDetails_YouthRider_Check_Eligibility.jsp"%>
           
            <%}


%>
	
    </body>
</html>
