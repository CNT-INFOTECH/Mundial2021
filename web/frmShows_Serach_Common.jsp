<%--
    Document   : ModalPop_Show
    Created on : May 18, 2011, 3:22:48 PM
    Author     : raju
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="Shows_Pop.css">
        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
        <link href="buttons.css" rel="stylesheet" type="text/css" />

        <link rel="stylesheet" href="themes/base/jquery.ui.all.css">

        <script src="jquery-1.5.1.js"></script>
        <script src="external/jquery.bgiframe-2.1.2.js"></script>
        <script src="ui/jquery.ui.core.js"></script>
        <script src="ui/jquery.ui.widget.js"></script>
        <script src="ui/jquery.ui.mouse.js"></script>
        <script src="ui/jquery.ui.button.js"></script>
        <script src="ui/jquery.ui.draggable.js"></script>
        <script src="ui/jquery.ui.position.js"></script>
        <script src="ui/jquery.ui.resizable.js"></script>
        <script src="ui/jquery.ui.dialog.js"></script>
        <script src="ui/jquery.effects.core.js"></script>

        <script src="ui/jquery.ui.datepicker.js"></script>
         <script type="text/javascript" src="scripts/jscCommon.js"></script>

        <script>

            

    function Selected(SelValue,SelDescValue)
    {
   
        Elem0=document.forms[0].Select_Name.value
        Elem1=document.forms[0].DescriptionEl_Name.value
      

         window.parent.document.getElementById(Elem0).value=SelValue
         window.parent.document.getElementById(Elem1).value=SelDescValue

         window.parent.jQuery('#dialog-Show').dialog('close');
        
    }
     function ShowList(fieldName,DescElemen)
     {


        showName=document.forms[0].showName.value
        place=document.forms[0].place.value
        Date=document.forms[0].fromDate.value


        document.forms[0].method="post";
        document.forms[0].action="frmShows_Serach_Common.jsp?mode=1&SN="+showName+"&PL="+place+"&Dt="+Date+'&selval='+fieldName+'&DescEl='+DescElemen
        document.forms[0].submit();
       }


    $(document).ready(
    function() {
            $( "#datepicker" ).datepicker({
changeMonth: true,
        changeYear: true
        });
});
        </script>
<style>
 .ui-datepicker
{
    font-family:TimesNewRoman;
    font-size: 10px;
    margin-left:0px;
    margin-top: 0px;
    line-height: 1.0em;
}
 </style>
    </head>
    <body>
        <%
        String strShowName="";
        String strPlace="";
        String strDate="";
        String selval="";
        String DescEl
                ="";
        if(request.getParameter("SN")!=null)
            strShowName=request.getParameter("SN");
        if(request.getParameter("PL")!=null)
            strPlace=request.getParameter("PL");
        if(request.getParameter("Dt")!=null)
            strDate=request.getParameter("Dt");

        
        if(request.getParameter("selval")!=null)
            selval=request.getParameter("selval");
        if(request.getParameter("DescEl")!=null)
            DescEl=request.getParameter("DescEl");
%>
        <form>
<table class="altRow" width="100%">
  <tr>
    <td width="81"><font class="label">SHOW&nbsp;NAME</font></td>
    <td width="137" nowrap >
      <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;" name="showName" value="<%=strShowName%>"
					   >
    </td>
    <td width="42"><font class="label">PLACE</font></td>
    <td width="144">
      <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;" name="place" value="<%=strPlace%>"
                             >
    </td>
    <td width="43"><font class="label">DATE</font></td>
    <td width="60"  >
      <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;" name="fromDate" placeholder="MM/DD/YYYY" size="10" value="<%=strDate%>"

                             id="datepicker">
    </td>
    <td width="102"  >
      <input class="button" type="button" name="Search" value="Search" onClick="ShowList('<%=selval%>','<%=DescEl%>')">
      <input type="hidden" name="Select_Name" value="<%=selval%>">
      <input type="hidden" name="DescriptionEl_Name" value="<%=DescEl%>">
    </td>
  </tr>


</table>
<table  width="100%">
    <tr>
        <td>
              <%@ include file="frmShows_Search_Common_Include.jsp"%>
        </td>
    </tr>
  
</table>
            </form>
    </body>
</html>
