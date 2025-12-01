
<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

    <%@ page import="java.util.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.rowset.*" %>
    <%@ page import="pasotracker.DBConnection" %>
    <%@ page import="pasotracker.GeneralServlet" %>

<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
         <title>MEMBER SEARCH</title>
<style type="text/css">

body {  background:url("Images/trans-wood-1.png"); font: .89em "Trebuchet MS", Arial, Sans-Serif;}

</style>
 <link href="Tables_style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
 

 function returnValues(strFName,strLName,strOrgName,strPhone,strEntitySeq,strOWNERNO,strMemberNum)
{
    
   if(opener.document.forms[0].name=="frmMember")
    {
        opener.document.forms[0].target="_self";
        opener.document.forms[0].method="post";
        opener.document.forms[0].action="frmMember.jsp?Mode=1&Assigned="+strEntitySeq;
        opener.document.forms[0].submit();
    }

   else if(opener.document.forms[0].name=="frmHistory")
    {
        opener.document.forms[0].target="_self";
        opener.document.forms[0].method="post";
        opener.document.forms[0].action="frmHistory.jsp?Mode=2&Assigned="+strEntitySeq;
        opener.document.forms[0].submit();
    }
   else
    {
        opener.document.forms[0].target="_self";
        opener.document.forms[0].method="post";
        opener.document.forms[0].action="frmMember.jsp?Mode=4&FNAME="+strFName+"&LNAME="+strLName+"&ORGNAME="+strOrgName+"&PHONE="+strPhone+"&OWNERNO="+strMemberNum;
        opener.document.forms[0].submit();
    }
   window.close();
}

</script>
</head>

    <body>

<%
    List OwnerList = new ArrayList();

    GeneralServlet gen=new GeneralServlet();
 RowSetFactory factory2 = RowSetProvider.newFactory();
   CachedRowSet crsGetOwnerDetails= factory2.createCachedRowSet();
    //CachedRowSetImpl crsGetOwnerDetails = new CachedRowSetImpl();
    int size_all = 0;
    int asgno=0;

    if(!strOrgName.equals(""))
        strType="3";

    if(strSearch.length()>0)
    crsGetOwnerDetails = gen.GET_MbmberSearch(strFName,strPhone,strMemberNum);
    size_all= crsGetOwnerDetails.size();
    Map MpOwnerDetails = new TreeMap();
    int Counter=0;

    while (crsGetOwnerDetails.next())
    {
     strFName="";
     strLName="";
     strOrgName="";
     strPhone="";
     strEntitySeq="";
     strOwnerNo="";
     asgno=0;
     strOwnerName="";
     strMName="";
     strAddress="";
     strAddress1="";
     strAddress2="";
     city="";
     state="";
     zip="";
     country="";
     strMemberNum="";
     strOwn_Type="";     
     
     if(crsGetOwnerDetails.getString("OWNER_TYPE")!=null)                  
        strOwn_Type=crsGetOwnerDetails.getString("OWNER_TYPE").trim();

    if(crsGetOwnerDetails.getString("FIRSTNAME")!=null)
        strFName= crsGetOwnerDetails.getString("FIRSTNAME").trim();

    if(crsGetOwnerDetails.getString("LASTNAME")!=null)
        strLName= crsGetOwnerDetails.getString("LASTNAME").trim();

    /* SUFFIX is used as the middle name in the database */
    if(crsGetOwnerDetails.getString("SUFFIX")!=null)
        strMName= crsGetOwnerDetails.getString("SUFFIX").trim();

    if(crsGetOwnerDetails.getString("ORGANIZATION_NAME")!=null)
        strOrgName= crsGetOwnerDetails.getString("ORGANIZATION_NAME").trim();

    if(crsGetOwnerDetails.getString("PHONE")!=null)
        strPhone= crsGetOwnerDetails.getString("PHONE").trim();

    if(crsGetOwnerDetails.getString("ENTITYSEQ")!=null)
        strEntitySeq= crsGetOwnerDetails.getString("ENTITYSEQ").trim();

    if(crsGetOwnerDetails.getString("ASSIGNEDNUM")!=null)
    {
       strOwnerNo= crsGetOwnerDetails.getString("ASSIGNEDNUM").trim();
       asgno=Integer.parseInt(strOwnerNo);
    }

    if(crsGetOwnerDetails.getString("ADDRESS1")!=null)
        strAddress1= crsGetOwnerDetails.getString("ADDRESS1").trim();
    else
        strAddress1="";

    if(crsGetOwnerDetails.getString("ADDRESS2")!=null)
        strAddress2= crsGetOwnerDetails.getString("ADDRESS2").trim();
    else
        strAddress2="";

    if(crsGetOwnerDetails.getString("CITY")!=null)
        city= crsGetOwnerDetails.getString("CITY").trim();

    if(crsGetOwnerDetails.getString("STATE")!=null)
        state= crsGetOwnerDetails.getString("STATE").trim();

    if(crsGetOwnerDetails.getString("ZIP")!=null)
        zip= crsGetOwnerDetails.getString("ZIP").trim();

    if(crsGetOwnerDetails.getString("COUNTRY")!=null)
        country= crsGetOwnerDetails.getString("COUNTRY").trim();

     if(crsGetOwnerDetails.getString("MEMBER_NUM")!=null)
        strMemberNum= crsGetOwnerDetails.getString("MEMBER_NUM").trim();


     strOwnerName=strFName+"  "+strLName;
     strAddress =strAddress1+" "+strAddress2+" "+city+" "+state+" "+zip+" "+country;

        MpOwnerDetails = new TreeMap();
        MpOwnerDetails.put("FNAME",strFName);
        MpOwnerDetails.put("LNAME",strLName);        
        MpOwnerDetails.put("ORGNAME",strOrgName);
        
        if(strOwn_Type.equals("INDIVIDUAL") ||(strOwn_Type.equals("") && strOrgName.equals("") ))           
            MpOwnerDetails.put("OWNERNAME",strOwnerName);  
        else
            MpOwnerDetails.put("OWNERNAME",strOrgName);
        
        MpOwnerDetails.put("PHONE",strPhone);
        MpOwnerDetails.put("ENTITYSEQ",strEntitySeq);
        //MpOwnerDetails.put("OWNERNO",strMemberNum);
        if(asgno!=0)              
                MpOwnerDetails.put("OWNERNO",asgno);        
        else
             MpOwnerDetails.put("OWNERNO",null);        
        
        if(strAddress.trim().equals("Null"))
            strAddress="";
        
        MpOwnerDetails.put("ADDRESS",strAddress);

        OwnerList.add(MpOwnerDetails);
        Counter=Counter+1;
    }

    request.setAttribute("OwnerList",OwnerList);
    if(strSearch.length()>0 && strType.equals("1"))
    {
%>


  <display:table  id="Details" name="requestScope.OwnerList"
                        pagesize="100" 
                        class="grid"
                        style="border-color:Black;border-width:0px;
                        text-transform: uppercase;border-style:None;width:100%;border-collapse:collapse;">
    <display:setProperty name="paging.banner.item_name" value="Member" />
    <display:setProperty name="paging.banner.items_name" value="Members" />
    <display:setProperty name="paging.banner.some_items_found">

        <span class="pagebanner" >{0} {1} founds,displaying {2} to {3}</span>
        <span ><input type="checkbox" name="ownername" value="OWNER_NAME" onClick="ViewAll_Member()"> <font style="font-weight:bold;">View All&nbsp;&nbsp;&nbsp;</font></span>

    </display:setProperty>
    <display:setProperty name="basic.msg.empty_list" value="No Member found with the Search Critera "/>
        <display:column style="width:1%" headerClass="Grid_Header">
        <input type="radio" name="checkedVal" onClick="returnValues('${Details.FNAME}','${Details.LNAME}','${Details.ORGNAME}','${Details.PHONE}','${Details.ENTITYSEQ}','${Details.OWNERNO}')" />
        </display:column>
        <display:column style="width:5%;Height:30px;"   title="ID#" property="OWNERNO" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:15%" property="OWNERNAME" title="NAME" sortable="true" headerClass="Grid_Header"/>
        <display:column style="width:25%"  property="ADDRESS" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:5%" property="PHONE" sortable="true" headerClass="Grid_Header" />
        </display:table>
<%}
  else if(strSearch.length()>0 && strType.equals("2"))
    {  out.println(Counter +" Members founds,displaying 1 to "+ Counter);%>
    <display:table  id="Details" name="requestScope.OwnerList"
    class="grid"
    style="border-color:Black;text-transform: uppercase;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">
    
    <display:setProperty name="basic.msg.empty_list" value="No Member found with the Search Critera "/>
    <display:column style="width:1%" headerClass="Grid_Header">
    <input type="radio" name="checkedVal" onClick="returnValues('${Details.FNAME}','${Details.LNAME}','${Details.ORGNAME}','${Details.PHONE}','${Details.ENTITYSEQ}','${Details.OWNERNO}')" />
    </display:column>
    <display:column style="width:5%;Height:30px;"   title="ID#" property="OWNERNO" sortable="true" headerClass="Grid_Header" />
    <display:column style="width:15%" property="OWNERNAME" title="NAME" sortable="true" headerClass="Grid_Header"/>
    <display:column style="width:25%"  property="ADDRESS" sortable="true" headerClass="Grid_Header" />
    <display:column style="width:5%" property="PHONE" sortable="true" headerClass="Grid_Header" />
    </display:table>
<%}%>
<br/>
<br/>
<jsp:include page="/frmBottom_Registration.jsp"/>
    </body>

</html>