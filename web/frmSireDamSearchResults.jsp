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
<%@ page import =  "model.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
    </head>
    <body>
        <%
               

                List LiDamValues=new ArrayList();
                List LiSireValues=new ArrayList();

                GetInterface GUI=new GetInterface();
                //if(strHorseSire.length()>0)
                    LiSireValues= GUI.GET_SHOWS_PASODETAILS(strHorseSire.replace("\'","''"),strRegNum,strDOB,strOwner,strMCNum,strType,"");

                 request.setAttribute("SireList", LiSireValues);



        if(strMode.equals("1") && strType.equalsIgnoreCase("2"))
        {
            
        %>


          <display:table  id="Details" name="requestScope.SireList"
                           class="grid"  defaultsort="1" defaultorder="ascending"
                            style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">

                <display:setProperty name="paging.banner.item_name" value="Event" />
                <display:setProperty name="paging.banner.items_name" value="Events" />
                <display:setProperty name="paging.banner.some_items_found">

                <span class="pagebanner" >{0} {1} founds,displaying {2} to {3}</span>
                <span ><input type="checkbox" >View All&nbsp;&nbsp;&nbsp;</span>

                </display:setProperty>
            <display:column style="width:1%" headerClass="Grid_Header" >
                <input type="radio" name="chkSire" onClick="SireList('${Details.Seq}','${Details.Name}','<%=strNum%>','${Details.Reg}')">
            </display:column>

            <display:column style="width:25%" title="Horse Name" property="Name" sortable="true" headerClass="Grid_Header"/>

            <display:column style="width:10%" property="Reg"  sortable="true" headerClass="Grid_Header" />
            <display:column style="width:10%" property="DOB"  sortable="true" headerClass="Grid_Header" />
            <display:column style="width:5%" property="Age" headerClass="Grid_Header" />
            <display:column style="width:5%" property="Sex" headerClass="Grid_Header" />
            <display:column style="width:18%" property="Owner" headerClass="Grid_Header" />
            <display:column style="width:18%" property="Sire" headerClass="Grid_Header" />
            <display:column style="width:18%" property="Dam" headerClass="Grid_Header" />
        </display:table>

          <%}else if (strMode.equals("1") && strType.equalsIgnoreCase("3")){%>
        <display:table  id="Details" name="requestScope.SireList"
                           class="grid"
                            style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">

            <display:column style="width:1%" headerClass="Grid_Header" >
                <input type="radio" name="chkSire" onClick="DamList('${Details.Seq}','${Details.Name}','<%=strNum%>','${Details.Reg}')">
            </display:column>

            <display:column style="width:25%" title="Horse Name" property="Name" sortable="true" headerClass="Grid_Header"/>

            <display:column style="width:10%" property="Reg"  sortable="true" headerClass="Grid_Header" />
            <display:column style="width:10%" property="DOB"  sortable="true" headerClass="Grid_Header" />
            <display:column style="width:5%" property="Age" headerClass="Grid_Header" />
            <display:column style="width:5%" property="Sex" headerClass="Grid_Header" />
            <display:column style="width:18%" property="Owner" headerClass="Grid_Header" />
            <display:column style="width:18%" property="Sire" headerClass="Grid_Header" />
            <display:column style="width:18%" property="Dam" headerClass="Grid_Header" />
        </display:table>
          <%}%>
    </body>
</html>
