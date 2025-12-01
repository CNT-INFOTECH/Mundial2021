
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search User Role</title>
         <link rel="stylesheet" href="shows_pop.css">
        <link href="Styletable.css" rel="stylesheet" type="text/css" />
        <link href="buttons.css" rel="stylesheet" type="text/css" />

        <link rel="stylesheet" href="themes/base/jquery.ui.all.css">

        <script type="text/javascript" src="jquery-1.5.1.js"></script>
        <script type="text/javascript" src="external/jquery.bgiframe-2.1.2.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.core.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.widget.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.mouse.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.button.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.draggable.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.position.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.resizable.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.dialog.js"></script>
        <script type="text/javascript" src="ui/jquery.effects.core.js"></script>


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
            $( "#datepicker" ).datepicker();
    });

        </script>
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
    <td width="81"><font class="label">ROLE&nbsp;ID</font></td>
    <td width="137" nowrap >
      <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;" name="showName" value="<%=strShowName%>"
					   >
    </td>
    <td width="42"><font class="label">ROLE NAME</font></td>
    <td width="144">
      <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;" name="place" value="<%=strPlace%>"
                             >
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
              <%@ include file="frmusers_Search_Common_Include.jsp"%>
        </td>
    </tr>

</table>
            </form>
    </body>
</html>
