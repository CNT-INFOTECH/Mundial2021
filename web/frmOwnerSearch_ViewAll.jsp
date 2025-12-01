<%--
    Document   : regsearchpopup_include
    Created on : Apr 28, 2011, 3:46:48 PM
    Author     : Veera
--%>

<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
<!--
@import url("CommonTableStyle.css");
-->

#contents {

/*background:  url("Images/logo_apccpfa_oficial_no_back4.png") no-repeat center;*/
background:url("Images/trans-wood-1.png");
/*align : center;*/
top : 1px;
color : #000000;
width : 100%;
border : 1px solid #ccc;
}
</style>
<script type="text/javascript">
    function ListEvents(RegNum)
{
        document.forms[0].target="_self";
       // window.parent.document.getElementById(‘ShowName’).value=SelValue
        document.forms[0].method="post";
        document.forms[0].action="index.jsp?mode=2&RegNo="+RegNum;
        document.forms[0].submit();
 }

 function returnValues(strFName,strLName,strOrgName,strPhone,strEntitySeq)
{
   if(window.parent.document.forms[0].name=="Reg_OwnerInformation")
    {
        window.parent.document.forms[0].target="_self";
        window.parent.document.forms[0].method="post";
        window.parent.document.forms[0].action="frmReg_OwnerInformation.jsp?Mode=4&FNAME="+strFName+"&LNAME="+strLName+"&ORGNAME="+strOrgName+"&PHONE="+strPhone;
        window.parent.document.forms[0].submit();
    }
    else if(window.parent.document.forms[0].name=="frmRegistrationSearch")
    {
        var strValues=strFName+' '+strLName;
        window.parent.document.getElementById('Owner').value=strEntitySeq;
        window.parent.document.getElementById('OwnerName').value=strValues;

         window.parent.jQuery('#dialog-OwnerSearch').dialog('close')
    }

   window.parent.document.getElementById('MEMBER_NAME').value=strValues;
   window.parent.jQuery('#dialog-OwnerSearch').dialog('close')
}
</script>


<link href="Tables_style.css" rel="stylesheet" type="text/css" />

    <body>

        <%@ page import="java.util.*" %>
        <%@ page import="java.io.*" %>
        <%@ page import="java.sql.*" %>
        <%@ page import="javax.sql.rowset.*" %>
        <%@ page import="pasotracker.DBConnection" %>
        <%@ page import="pasotracker.GeneralServlet" %>

      <form name="frmReg_OwnerSearchPopup_Include" method="post">

        <%@ include file="frmReg_OwnerSearchPopup.jsp" %>
        <div id="maincontent">
        <div class="innertube">

<%


         List OwnerList = new ArrayList();
        try
        {

            GeneralServlet gen=new GeneralServlet();
RowSetFactory factory2 = RowSetProvider.newFactory();
   CachedRowSet crsGetHorseDetails= factory2.createCachedRowSet();
           // CachedRowSetImpl crsGetOwnerDetails = new CachedRowSetImpl();

            crsGetOwnerDetails = gen.GET_OwnerInformation(strFName,strLName,strOrgName,strPhone);

            Map MpOwnerDetails = new TreeMap();

            while (crsGetOwnerDetails.next())
            {
                 strFName="";
                 strLName="";
                 strOrgName="";
                 strPhone="";
                 strEntitySeq="";

                if(crsGetOwnerDetails.getString("FIRSTNAME")!=null)
                    strFName= crsGetOwnerDetails.getString("FIRSTNAME").trim();

                if(crsGetOwnerDetails.getString("LASTNAME")!=null)
                    strLName= crsGetOwnerDetails.getString("LASTNAME").trim();

                if(crsGetOwnerDetails.getString("ORGANIZATION_NAME")!=null)
                    strOrgName= crsGetOwnerDetails.getString("ORGANIZATION_NAME").trim();

                if(crsGetOwnerDetails.getString("PHONE")!=null)
                    strPhone= crsGetOwnerDetails.getString("PHONE").trim();

             if(crsGetOwnerDetails.getString("ENTITYSEQ")!=null)
                    strEntitySeq= crsGetOwnerDetails.getString("ENTITYSEQ").trim();


                    MpOwnerDetails = new TreeMap();
                    MpOwnerDetails.put("FNAME",strFName);
                    MpOwnerDetails.put("LNAME",strLName);
                    MpOwnerDetails.put("ORGNAME",strOrgName);
                    MpOwnerDetails.put("PHONE",strPhone);
                    MpOwnerDetails.put("ENTITYSEQ",strEntitySeq);


                    OwnerList.add(MpOwnerDetails);
            }
        }
        catch(Exception ex)
        {
                ex.printStackTrace();

        }

        request.setAttribute("OwnerList", OwnerList);
%>


  <display:table  id="Details" name="requestScope.OwnerList"
                        pagesize="100" defaultsort="1" defaultorder="ascending"
                        class="grid"
                        style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">

        <display:column style="width:1%" headerClass="Grid_Header">
            <input type="radio" name="checkedVal" onClick="returnValues('${Details.FNAME}','${Details.LNAME}','${Details.ORGNAME}','${Details.PHONE}','${Details.ENTITYSEQ}')" /></display:column>

        <display:column style="width:15%" property="FNAME" sortable="true" headerClass="Grid_Header"/>
        <display:column style="width:15%" property="LNAME"  sortable="true" headerClass="Grid_Header" />
        <display:column style="width:25%" property="ORGNAME"  sortable="true" headerClass="Grid_Header" />
        <display:column style="width:5%" property="PHONE" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:1%;VISIBILITY:HIDDEN"><a href="#">${Details.ENTITYSEQ}</a></display:column>
        </display:table>
        </div>
        </div>
    </form>
    </body>
</html>
