<%--
    Document   : frmSireDamSearchResults
    Created on : Jun 19, 2011, 1:03:26 PM
    Author     : CNT
--%>
<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">


<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

              List LiDetails=new ArrayList();


               GetInterface GUI=new GetInterface();
               if(strSearch.length()>0)
                    LiDetails= GUI.GET_SHOWS_BREEDER_DETAILS(strLastname,strFirstname,"","List");

                 request.setAttribute("OList", LiDetails);



        if(strSearch.equals("1"))
        {
        %>


       <display:table  id="Details" name="requestScope.OList" pagesize="100" defaultsort="1"
                           class="grid"
                            style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">

             <display:column style="width:1%" headerClass="Grid_Header" >
                 <input type="radio" name="RadRider" onClick="SetRider('${Details.Seq}','${Details.Name}','<%=strNum%>')">
            </display:column>
            <display:column style="width:25%" title="Name" property="Name" sortable="true" headerClass="Grid_Header"/>

            <display:column style="width:25%" property="Address"   headerClass="Grid_Header" />
            <display:column style="width:10%" property="Country"  headerClass="Grid_Header" />
            

        </display:table>

          <%}%>

    </body>
</html>
