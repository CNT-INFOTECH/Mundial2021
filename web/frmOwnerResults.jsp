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
   
    <body>
        <%

              List LiDetails=new ArrayList();
             

               GetInterface GUI=new GetInterface();
               if(strSearch.length()>0)
                    LiDetails= GUI.GET_SHOWS_OWNERDETAILS(strLastname,strFirstname,strOrgName,strPhone,strAssignedNum);

                 request.setAttribute("OList", LiDetails);

                 String strPersonType="";

                 if(strType.equals("1"))
                     strPersonType="SetOwner";
                 else if(strType.equals("2"))
                     strPersonType="SetBreeder";
                 else if(strType.equals("3"))
                     strPersonType="SetRider";



        if(strSearch.length()>0 && strPersonType.length()>0)
        {
        %>

       
            <display:table  id="Details" name="requestScope.OList" pagesize="100" defaultsort="1"
            class="grid"
            style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">

            <display:column style="width:1%" headerClass="Grid_Header" >
            <input type="radio" name="chkSire" onClick="<%=strPersonType%>('${Details.Seq}','${Details.Name}','<%=strNum%>','${Details.AssignedNum}')">
            </display:column>

            <display:column style="width:25%" title="Name" property="Name" sortable="true" headerClass="Grid_Header"/>
            <display:column style="width:5%" title="ID#" property="AssignedNum"  headerClass="Grid_Header"/>

            <display:column style="width:10%" property="Address"   headerClass="Grid_Header" />
            <display:column style="width:10%" property="Country"  headerClass="Grid_Header" />
            <display:column style="width:5%" property="Phone" headerClass="Grid_Header" />

            </display:table>

         <%}%>
        
    </body>
</html>
