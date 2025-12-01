<%--
    Document   : frmCommonRef
    Created on : May 19, 2011, 2:32:41 PM
    Author     : raju
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<link rel="stylesheet" href="Shows_Pop.css">
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />

<%@ page import = "java.util.*" %>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="frmReg_CommonRef.css" type="text/css" />
    <link rel="stylesheet" href="windowfiles/dhtmlwindow.css" type="text/css" />
    <script type="text/javascript" src="jscReg_Common.js"></script>
    <script type="text/javascript" src="jscIndex.js"></script>
    <script type="text/javascript" src="windowfiles/dhtmlwindow.js">
/***********************************************
* DHTML Window Widget- © Dynamic Drive (www.dynamicdrive.com)
* This notice must stay intact for legal use.
* Visit http://www.dynamicdrive.com/ for full source code
***********************************************/
</script>
<link rel="stylesheet" href="modalfiles/modal.css" type="text/css" />
<script type="text/javascript" src="modalfiles/modal.js"></script>

<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.DBConnection" %>
<%@ page import="pasotracker.GeneralServlet" %>    
    </head>

    <%
            String strRefType="";
            String strReturnID="";
            String strReturnVal="";
            String strValue="";
            String strReturnTxtVal="";
            
            if (request.getParameter("SrchValue")!=null)
                strValue=request.getParameter("SrchValue");
            
            if (request.getParameter("RefType")!=null)
                strRefType=request.getParameter("RefType");

            if (request.getParameter("ReturnID")!=null)
                strReturnID=request.getParameter("ReturnID");
            else{
                strReturnID=(String)session.getAttribute("ReturnID");
            }            
            session.setAttribute("ReturnID",strReturnID);

            if (request.getParameter("ReturnVal")!=null)
                strReturnVal=request.getParameter("ReturnVal");
               else{
                strReturnVal=(String)session.getAttribute("ReturnVal");
            }    
            session.setAttribute("ReturnVal",strReturnVal);
            
            if (request.getParameter("RetnTxtValue")!=null)
                strReturnTxtVal=request.getParameter("RetnTxtValue");      
                else{
                strReturnTxtVal=(String)session.getAttribute("ReturnVal");
            }    
            session.setAttribute("RetnTxtValue",strReturnTxtVal);
            
         
           // GetInterface GUI=new GetInterface();
            GeneralServlet gen = new GeneralServlet();
             RowSetFactory factory14 = RowSetProvider.newFactory();
   CachedRowSet crsCommonReferenceValues= factory14.createCachedRowSet();
          //  CachedRowSetImpl crsCommonReferenceValues = new CachedRowSetImpl();
            crsCommonReferenceValues = gen.GetCommonDetails(strRefType,strValue);
            ArrayList ArRow=new ArrayList();
            ArrayList LiValues=new ArrayList();
            while(crsCommonReferenceValues.next())
            {
                ArRow=new ArrayList();
                if(crsCommonReferenceValues.getString("SEQNO")!=null)   
                {                              
                        ArRow.add(crsCommonReferenceValues.getString("SEQNO").trim());

                }
                else 
                    ArRow.add("");


                if(crsCommonReferenceValues.getString("VALUE")!=null)     
                {                            
                    ArRow.add(crsCommonReferenceValues.getString("VALUE").trim());
                }
                 else 
                    ArRow.add("");
                
                LiValues.add(ArRow);
                }


    %>
    <body>
<form name="frmCommonRef">
<div id="framecontent_add">
<div class="innertube">

<table width="100%">

<TR><td><div align="right" >
<input class="button" type="button" name="SelectedVal" Value="Select" 
       onclick="ReturnVal('<%=strRefType%>',Desc.value,RefSeq.value,'<%=strReturnID%>','<%=strReturnVal%>','<%=strReturnTxtVal%>')">

<input class="button" type="button" name="AddVal" Value="New"
       onclick="OpenPop('<%=strRefType%>','Add','','0')">

<input class="button" type="button" name="ModifyVal" Value="Edit"
       onClick="OpenPop('<%=strRefType%>','Modify',Desc.value,RefSeq.value)">

<input class="button" type="button" name="DelVal" Value="Delete"
       onClick="Delete('<%=strRefType%>','Delete',Desc.value,RefSeq.value)">
       
<input class="button" type="button" name="DelVal" Value="Search"
       onClick="OpenPop('<%=strRefType%>','Search',Desc.value,RefSeq.value)"></div>


</td></TR>
</table>
</div>
</div>


<div id="maincontent_add">
<div class="innertube">

<table class="grid" width="100%" style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">
  <tbody>
  <th width="10%"class="Grid_Header">&nbsp;</th>
  <th class="Grid_Header">Name</th>
  <%
  
            for (int i=0;i < LiValues.size(); i++)
            {
                ArRow=new ArrayList();
                ArRow=(ArrayList)LiValues.get(i);
                String strClass="";
                if( i%2 ==0 )
                strClass="even";
                else
                strClass="odd"; // 0 -- Seq and 2--Description
            %>
            <tr id="<%=i%>"class="<%=strClass%>"
            onclick="SelectRow(this,'<%=ArRow.get(1)%>','<%=ArRow.get(0)%>')"
            ondblclick="ReturnVal('<%=strRefType%>','<%=ArRow.get(1)%>','<%=ArRow.get(0)%>','<%=strReturnID%>','<%=strReturnVal%>','<%=strReturnTxtVal%>')">
            <td ><%=i+1%></td>
            <td ><%=ArRow.get(1)%></td>            
            </tr>

            <%} %>
            </tbody>
                <input type="hidden" name="RefType" value="<%=strRefType%>" />
                <input type="hidden" name="Status" value="A" />
                <input type="hidden" name="RefSeq" />
                <input type="hidden" name="Desc" />
                
                <input type="hidden" name="PageID" value="COMMON_REF" />

            </table>


</div>
</div>
    <div id="dialog-Org" title="SEARCH ORGANIZATION" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  src="OrganisationPopup_Reg.jsp"  id="modalIFrame_OrgSearch" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes">
        </iframe>
    </div>
   </form>
    </body>
</html>
