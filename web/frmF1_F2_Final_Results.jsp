
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       

<link href="Shows_Pop.css" rel="stylesheet" type="text/css" />
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="themes/base/jquery.ui.all.css"/>
<link href="style.css" rel="stylesheet" type="text/css" />

    </head>

<%@ page import = "java.util.Iterator"%>
<%@ page import = "java.util.List"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>

<table class="altRow" align="center"  border="0" cellpadding="0" cellspacing="0" width="100%" >
        <tr align="center">
          <th>Name</th>
           <th>Number</th>
          <th>J1</th>
          <th>J2</th>
          <th>J3</th>
          <th>Total</th>
          <!--<th>&nbsp;</th> -->
          <th>Placement</th>
          <th>Final</th>
        </tr>
<%
        Connection localConnection=null;
        DbConnMngr dbcmt=new DbConnMngr();
         String strEvent="";
         boolean bChangeF2=false;

         String strEventSeq_F1_F2="";
        
         if(request.getParameter("EventSeq")!=null)
             strEventSeq_F1_F2=request.getParameter("EventSeq");

        


       if(strEventSeq_F1_F2.trim().length() >0 )
      {
        ArrayList ArEvent=new ArrayList();
        try
        {
            localConnection=dbcmt.getConnection();
            localConnection.setAutoCommit(false);
            CallableStatement cst = localConnection.prepareCall("{call GET_EVENT_PARTICIPANTS_F1F2(?)}");
            cst.setString(1, strEventSeq_F1_F2);




        ResultSet rs1 = cst.executeQuery();
        


        while (rs1.next())
        {
            bChangeF2=true;
            %>
            <tr>

           <td width="200"><%=rs1.getString("Horse_PrimaryName")%> <br><font color="blue"><%=rs1.getString("RiderName")%></font></td>
          <td width="10"><font size="3"><b> <%=rs1.getString("AssignedNum")%></b></font></td>
          <td>  <%if(rs1.getString("J1Pos")!=null) {%> <%=rs1.getString("J1Pos") %> <%}%></td>
          <td> <%if(rs1.getString("J2Pos")!=null) {%> <%=rs1.getString("J2Pos") %> <%}%></td>
          <td> <%if(rs1.getString("J3Pos")!=null) {%> <%=rs1.getString("J3Pos") %> <%}%></td>

          <td> <%if(rs1.getString("Total")!=null) {%> <%=rs1.getString("Total") %> <%}%></td>
       

          <td><%if( !rs1.getString("Placement").equals("999")) {%> <%=rs1.getString("Placement") %> <%}%></td>
          <td><%if( !rs1.getString("Placement").equals("999")) {%> <%=rs1.getString("Placement") %> <%}%></td>
         </tr>
       <% }

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



}

%>

</table>