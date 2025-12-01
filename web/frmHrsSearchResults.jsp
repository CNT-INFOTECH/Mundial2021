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
        <title>PASO TRACKER</title>
    </head>
    <body>
       
        <%


                List HrsValues=new ArrayList();

                GetInterface GUI=new GetInterface();
                if(strMode.length()>0)
                    HrsValues= GUI.GET_SHOWS_PASODETAILS(strHrsName,strHrsRegNum,strHrsDOB,strHrsOwner,strHrsMchip,"",strEventSeq);

                 request.setAttribute("HrsValues", HrsValues);

       if(strEventSeq.equals(""))
        {%>
            <display:table  id="Details" name="requestScope.HrsValues"
               class="grid"  pagesize="10"
                    style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">

            <display:column style="width:1%" headerClass="Grid_Header" >
            <input type="radio" name="chkSire" onClick="SearchHorse_Retn_NoRefresh('${Details.Reg}','${Details.Seq}','${Details.Name}','<%=strGroupType%>')">
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

            <%}
        else if(strMode.equals("1") && strGroupType.equals("1"))
        {

        %>


         <display:table  id="Details" name="requestScope.HrsValues"
                       class="grid"  pagesize="10"
                            style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">

            <display:column style="width:1%" headerClass="Grid_Header" >
                <input type="radio" name="chkSire" onClick="SearchHorse_Retn('${Details.Reg}','<%=strType%>','${Details.Group}')">
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

<%} 
        else if(strMode.equals("1") && strGroupType.equals("2"))
        {%>
        <display:table  id="Details" name="requestScope.HrsValues"
                       class="grid"  pagesize="10"
                            style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">

            <display:column style="width:1%" headerClass="Grid_Header" >
                <input type="radio" name="chkSire" onClick="SearchHorse_Retn_Group('${Details.Reg}','<%=strType%>','${Details.Group}')">
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
                <%}

            else if(strMode.equals("1") && strGroupType.equals("3"))
        {%>
                <display:table  id="Details" name="requestScope.HrsValues"
                class="grid"  pagesize="10"
                style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">

                <display:column style="width:1%" headerClass="Grid_Header" >
                <input type="radio" name="chkSire" onClick="SearchHorse_Retn_Desc('${Details.Reg}','<%=strType%>','${Details.Group}')">
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
                <%}

           else if(strMode.equals("1") && strGroupType.equals("4"))
        {%>
                <display:table  id="Details" name="requestScope.HrsValues"
                class="grid"  pagesize="10"
                style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">

                <display:column style="width:1%" headerClass="Grid_Header" >
                <input type="radio" name="chkSire" onClick="SearchHorse_Retn_Raza('${Details.Reg}','<%=strType%>','${Details.Group}')">
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
