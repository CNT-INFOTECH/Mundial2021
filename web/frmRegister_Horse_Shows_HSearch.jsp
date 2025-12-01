<%-- 
    Document   : frmRegister_Horse_Shows_HSearch
    Created on : Jun 7, 2011, 12:16:55 PM
    Author     : CNT
--%>
<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
   
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>
 <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link href="Tables_style.css" rel="stylesheet" type="text/css" />
         
    </head>
    <body>
    <%
        String strMode="";
        if(request.getParameter("mode")!=null)
            strMode=request.getParameter("mode");//
		
		String strViewAll="";
        if(request.getParameter("view")!=null)
            strViewAll=request.getParameter("view");


       	int Counter=0;

        Connection localConnection=null;
        DbConnMngr dbcmt=new DbConnMngr();
        if(strMode.equals("1")) // Search Mode is 1 list the horses
         {
         List HorseList = new ArrayList();
        try
        {
            localConnection=dbcmt.getConnection();
            localConnection.setAutoCommit(false);
            CallableStatement cst = localConnection.prepareCall("{call GET_SHOWS_PASODETAILS(?,?,?,?,?, ?,?)}");
            cst.setString(1,strHorseName.trim());
            cst.setString(2,strRegNum_Top.trim());
            cst.setString(3,strHDOB.trim());
            cst.setString(4,strOwner.trim());
            cst.setString(5,strMchip.trim());
            cst.setString(6,"");
            cst.setString(7,strEventSeq.trim());

        ResultSet rs1 = cst.executeQuery();

        Map MpHorseDetails = new TreeMap();
        while (rs1.next())
        {
                MpHorseDetails = new TreeMap();
                MpHorseDetails.put("Name",rs1.getString("HORSE_PRIMARYNAME"));
                MpHorseDetails.put("Reg",rs1.getString("REGISTRATION_NUM"));
                MpHorseDetails.put("Seq",rs1.getString("RegSeq"));
                MpHorseDetails.put("Aire",rs1.getString("Horse_Aire"));
                MpHorseDetails.put("Age",rs1.getString("Age"));
                MpHorseDetails.put("Sex",rs1.getString("HORSE_GENDER"));
                MpHorseDetails.put("Owner",rs1.getString("Owner"));
                //MpHorseDetails.put("Sire",rs1.getString("SireName"));
                //MpHorseDetails.put("Dam",rs1.getString("DamName"));
	            Counter=Counter+1;
                HorseList.add(MpHorseDetails);
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

                request.setAttribute("HorseList", HorseList);

       
            if(strEventSeq.length()>0)
            {
            
            %>
            <display:table  id="Details" name="requestScope.HorseList" 
                            pagesize="100" 
                            class="grid"
                            style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">

            <display:setProperty name="paging.banner.item_name" value="Horse" />
			<display:setProperty name="paging.banner.items_name" value="Horses" />
			<display:setProperty name="paging.banner.some_items_found">

				<span class="pagebanner" >{0} {1} founds,displaying {2} to {3}</span>
				<span ><input type="checkbox" onClick="fnViewAll_SrchHorse()"> <font style="font-weight:bold;">View All&nbsp;&nbsp;&nbsp;</font></span>

			</display:setProperty>

            <display:column style="width:25%" title="Horse Name" property="Name"  sortable="true" headerClass="Grid_Header"/>
            <display:column style="width:10%" property="Reg"  sortable="true" headerClass="Grid_Header" />
            <display:column style="width:5%" property="Age" headerClass="Grid_Header" />
            <display:column style="width:5%" property="Sex" headerClass="Grid_Header" />
             <display:column style="width:5%" property="Aire" headerClass="Grid_Header" />

            <display:column style="width:23%" property="Owner" headerClass="Grid_Header" />
            <display:column style="width:1%" headerClass="Grid_Header">
             <img alt="" src="Images/registration_icon.gif"
                  onClick="Register_Search_Icon_Horse_Event(<%=strEventSeq%>,'${Details.Seq}','${Details.Reg}')"/></display:column>

            </display:table>
           <% }
			else if(strViewAll.equals("Y"))
            {
		    out.println(Counter +" Horses founds,displaying 1 to "+ Counter);
				%>

            <display:table  id="Details" name="requestScope.HorseList"
                            class="grid"
                            style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">

            <display:column style="width:25%" title="Horse Name"  sortable="true" headerClass="Grid_Header">
            <a href="javaScript:void(0)" onClick="ListEvents('${Details.Reg}')">${Details.Name}</a></display:column>
            <display:column style="width:10%" property="Reg"  sortable="true" headerClass="Grid_Header" />

            <display:column style="width:5%" property="Age" headerClass="Grid_Header" />
            <display:column style="width:5%" property="Sex" headerClass="Grid_Header" />
             <display:column style="width:5%" property="Aire" headerClass="Grid_Header" />
            <display:column style="width:23%" property="Owner" headerClass="Grid_Header" />
           </display:table>
           <% }
			else
            {%>

            <display:table  id="Details" name="requestScope.HorseList"
                            pagesize="100" defaultsort="0"
                            class="grid"
                            style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">
			
			<display:setProperty name="paging.banner.item_name" value="Horse" />
			<display:setProperty name="paging.banner.items_name" value="Horses" />
			<display:setProperty name="paging.banner.some_items_found">

				<span class="pagebanner" >{0} {1} founds,displaying {2} to {3}</span>
				<span ><input type="checkbox" onClick="fnViewAll_SrchHorse()"> <font style="font-weight:bold;">View All&nbsp;&nbsp;&nbsp;</font></span>

			</display:setProperty>

            <display:column style="width:25%" title="Horse Name"  sortable="true" headerClass="Grid_Header">
            <a href="javaScript:void(0)" onClick="ListEvents('${Details.Reg}')">${Details.Name}</a></display:column>
            <display:column style="width:10%" property="Reg"  sortable="true" headerClass="Grid_Header" />

            <display:column style="width:5%" property="Age" headerClass="Grid_Header" />
            <display:column style="width:5%" property="Sex" headerClass="Grid_Header" />
             <display:column style="width:5%" property="Aire" headerClass="Grid_Header" />
            <display:column style="width:23%" property="Owner" headerClass="Grid_Header" />
           </display:table>
           <% }
        
}
    else if (strMode.equals("2")) // When we click on the link, to list all the eligible Events for a horse
    {
         
          List EventList = new ArrayList();
                  
        try
        {
            localConnection=dbcmt.getConnection();
            localConnection.setAutoCommit(false);

            CallableStatement cst1 = localConnection.prepareCall("{call GET_SHOWS_PASODETAILS(?,?)}");
            cst1.setString(1,"");
            cst1.setString(2,strRegNum);

            ResultSet rs_PDetails = cst1.executeQuery();
             while (rs_PDetails.next())
            {%>
             <table class="grid" cellspacing="0" cellpadding="2" border="0"
                    style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">

                <tr class="Grid_Header" style="color:White;">
                <th class="Grid_Header" align="left" valign="middle" scope="col" style="width:25%;">Name</th>
                <th class="Grid_Header" align="left" valign="middle" scope="col" style="width:5%;">Registration</th>
                <th class="Grid_Header" align="left" valign="middle" scope="col" style="width:5%;">DOB</th>
                <th class="Grid_Header" align="left" valign="middle" scope="col" style="width:5%;">Age</th>
                <th class="Grid_Header" align="left" valign="middle" scope="col" style="width:5%;">Sex</th>
                <th class="Grid_Header" align="left" valign="middle" scope="col" style="width:20%;">Owner</th>
                
                </tr>

                <tr class="odd">
                <td align="left" valign="middle"><%=rs_PDetails.getString("HORSE_PRIMARYNAME")%></td>
                <td align="left" valign="middle"><%=rs_PDetails.getString("REGISTRATION_NUM")%></td>
                <td align="left" valign="middle"><%=rs_PDetails.getString("HORSE_DOB")%></td>
                <td align="left" valign="middle"><%=rs_PDetails.getString("Age")%></td>
                <td align="left" valign="middle"><%=rs_PDetails.getString("HORSE_GENDER")%></td>
                <td align="left" valign="middle"><%=rs_PDetails.getString("Owner")%></td>
                
                </tr>
                </table>
                <% }

            rs_PDetails.close();
            cst1.close();

            CallableStatement cst = localConnection.prepareCall("{call Get_Event_List_By_RegNum(?)}");
            cst.setString(1,strRegNum);

         ResultSet rs1 = cst.executeQuery();
         Map MpListDetails = new TreeMap();

        while (rs1.next())
        {
                MpListDetails = new TreeMap();
                MpListDetails.put("EventSeq",rs1.getString("Event_Seq"));
                MpListDetails.put("ShowName",rs1.getString("Show_Name"));
                MpListDetails.put("Event",rs1.getString("Name"));
                MpListDetails.put("Type",rs1.getString("EventType"));
                MpListDetails.put("Date",rs1.getString("Event_Date"));
                MpListDetails.put("Place",rs1.getString("Show_Place"));
                MpListDetails.put("Status",rs1.getString("Reg_Status"));
                MpListDetails.put("RegSeq",rs1.getString("Registration_Num"));

                EventList.add(MpListDetails);
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
          request.setAttribute("EventList", EventList);
%>

         <display:table  id="EventDetails" name="requestScope.EventList"
                            pagesize="10" 
                            class="grid"
                            style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">


            <display:column style="width:20%" property="ShowName" sortable="true" headerClass="Grid_Header" />
            <display:column style="width:20%" property="Event" headerClass="Grid_Header" />
            <display:column style="width:10%" property="Type" headerClass="Grid_Header" />
            <display:column style="width:5%" property="Date" headerClass="Grid_Header" />
            <display:column style="width:10%" property="Place" headerClass="Grid_Header" />
           <display:column style="width:5%" title="Register" headerClass="Grid_Header">
            <a href="javaScript:void(0)" onClick="Register_Event_horse('${EventDetails.EventSeq}','${EventDetails.RegSeq}')">${EventDetails.Status}</a> </display:column>

        </display:table>



   <% }
    else if (strMode.equals("3")) // When we click Register
             {

            String strREventSeq="";
            strREventSeq=request.getParameter("eventSeq");
            String strRegSeq="";
            strRegSeq=request.getParameter("RegNum");

             if(session.getAttribute("RiderDetails")!=null)
                  session.removeAttribute("RiderDetails");


            
            }
     else if (strMode.equals("4")) // Show the Horse Details
     {%>
          <%@ include file="frmShortRegistration.jsp"%>
    <% }

      else if (strMode.equals("6")) // Validate
     {%>
          <%@ include file="frmValidate_Seq_RegNum.jsp"%>
    <% }
 %>
    </body>
</html>
