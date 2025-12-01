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
<%@ page import = "model.GetInterface" %>
<%@ page import = "java.util.*" %>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
     <link rel="stylesheet" href="frmCommonRef.css" type="text/css" />
   
    <script type="text/javascript" src="scripts/jscCommon.js"></script>

 <link rel="stylesheet" href="windowfiles/dhtmlwindow.css" type="text/css" />
 <script type="text/javascript" src="windowfiles/dhtmlwindow.js">
/***********************************************
* DHTML Window Widget- © Dynamic Drive (www.dynamicdrive.com)
* This notice must stay intact for legal use.
* Visit http://www.dynamicdrive.com/ for full source code
***********************************************/

</script>
<link rel="stylesheet" href="modalfiles/modal.css" type="text/css" />
<script type="text/javascript" src="modalfiles/modal.js"></script>


    </head>

    <%
            String strRefType="";
            String strReturnID="";
            String strReturnVal="";
           
            if (request.getParameter("RefType")!=null)
                strRefType=request.getParameter("RefType");

            if (request.getParameter("ReturnID")!=null)
                strReturnID=request.getParameter("ReturnID");
            else
                strReturnID=(String)session.getAttribute("ReturnID");

             session.setAttribute("ReturnID",strReturnID);


            if (request.getParameter("ReturnVal")!=null)
                strReturnVal=request.getParameter("ReturnVal");
              else
                strReturnVal=(String)session.getAttribute("ReturnVal");

             session.setAttribute("ReturnVal",strReturnVal);


            GetInterface GUI=new GetInterface();
            List LiValues= GUI.GetCommonRefValues(strRefType,null,null);

    %>
    <body>
<form name="frmCommonRef">
<div id="framecontent">
<div class="innertube">

<table width="100%">

<TR><td><div align="right" >
<input class="button" type="button" name="SelectedVal" Value="Select" 
       onclick="ReturnVal('<%=strRefType%>',Desc.value,RefSeq.value,'<%=strReturnID%>','<%=strReturnVal%>')">

<input class="button" type="button" name="AddVal" Value="New"
       onclick="OpenPop('<%=strRefType%>','Add','','0')">

<input class="button" type="button" name="ModifyVal" Value="Edit"
       onClick="OpenPop('<%=strRefType%>','Modify',Desc.value,RefSeq.value)">

<input class="button" type="button" name="DelVal" Value="Delete"
       onClick="Delete('<%=strRefType%>','Delete',Desc.value,RefSeq.value)"></div>


</td></TR>
                </table>
</div>
</div>


<div id="maincontent">
<div class="innertube">

<table class="grid" width="100%" style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">
  <tbody>
  <th width="10%"class="Grid_Header">&nbsp;</th>
  <th class="Grid_Header">Name</th>
  <%
            for (int i=0;i < LiValues.size(); i++)
            {
                ArrayList ArRow=new ArrayList();
                ArRow=(ArrayList)LiValues.get(i);
                String strClass="";
                if( i%2 ==0 )
                strClass="even";
                else
                strClass="odd"; // 0 -- Seq and 2--Description
            %>
            <tr id="<%=i%>"class="<%=strClass%>"
            onclick="SelectRow(this,'<%=ArRow.get(2)%>','<%=ArRow.get(0)%>')"
            ondblclick="ReturnVal('<%=strRefType%>','<%=ArRow.get(2)%>','<%=ArRow.get(0)%>','<%=strReturnID%>','<%=strReturnVal%>')">
            <td ><%=(i+1)%></td>
            <td ><%=ArRow.get(2).toString().toUpperCase()%></td>
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

   </form>
    </body>
</html>
