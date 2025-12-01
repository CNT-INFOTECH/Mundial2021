<%--
    Document   : frmCommonRef
    Created on : May 19, 2011, 2:32:41 PM
    Author     : raju
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

        <link rel="stylesheet" href="Shows.css">
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

    
    <body>
<form name="frmDeviaton">
    <%@ include file="frmDeviationInclude.jsp"%>
<div id="framecontent">
<div class="innertube">

<table width="100%">

<TR><td><div align="right" >

<input class="button" type="button" name="DelVal" Value="Close" onClick="parent.PopDev.hide()">

        </div>


</td></TR>
                </table>
</div>
</div>


<div id="maincontent">
<div class="innertube">

<table class="grid" width="100%" style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">
<tbody>
  <table align="center">
      
        <td><span id="EventName"><font><h4><font color="blue"> <%=strEventOrder %> </font> <%=strEvnName %> <font color="blue"> <%=strEventDate %> </font> (<%=strShowName%>)  </h4></font></span>
          
        </td>
    </table>

<table align="center" width="100%" style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">
       <% for (int i=1; i<6 ;i++){%>
       <td width="20%"><font color="blue">J<%=i%></font></td>
       <%}%>
       <tr>
          <% for (int i=1; i<6 ;i++){%>
       <td width="20%"><font><h4><%=HmDetails.get(""+i)%></h4> </font></td>
       <%}%>
       </tr>
    </table>

  <table align="center" class="grid" width="100%" style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">
      <TH class="Grid_Header">NUMBER</TH>
      <TH class="Grid_Header">J1&nbsp;</TH>
      <TH class="Grid_Header">J2&nbsp;</TH>
      <TH class="Grid_Header">J3&nbsp;</TH>
      <TH class="Grid_Header">J4&nbsp;</TH>
      <TH class="Grid_Header">J5&nbsp;</TH>
      <TH class="Grid_Header">TOTAL</TH>
      <TH class="Grid_Header">PLACEMENT</TH>
      

      <%
           int DeviationJ1Pts=0;
           int DeviationJ2Pts=0;
           int DeviationJ3Pts=0;
            int DeviationJ4Pts=0;
             int DeviationJ5Pts=0;

          for (int j=0;j<LiValues2.size();j++){
           ArrayList ArRow=new ArrayList();
           ArRow=(ArrayList)LiValues2.get(j);
           String strHorName=ArRow.get(0).toString();
           String strAssigned=ArRow.get(1).toString();
           String J1=ArRow.get(2).toString();
           String J2=ArRow.get(3).toString();
           String J3=ArRow.get(4).toString();
           String J4=ArRow.get(5).toString();
           String J5=ArRow.get(6).toString();
           String strPlacement=ArRow.get(7).toString();
           String strRiderName=ArRow.get(8).toString();
           String strIDNum=ArRow.get(9).toString();

           int intFnlPlacement=0;
            int intJ1=0;
            int intJ2=0;
            int intJ3=0;
            int intJ4=0;
            int intJ5=0;
           
           if(strPlacement.length()>0)
              intFnlPlacement= Integer.parseInt(strPlacement);

            if(J1.length()>0)
              intJ1= Integer.parseInt(J1);
            if(J2.length()>0)
              intJ2= Integer.parseInt(J2);
            if(J3.length()>0)
              intJ3= Integer.parseInt(J3);
            if(J4.length()>0)
              intJ4= Integer.parseInt(J4);
            if(J5.length()>0)
              intJ5= Integer.parseInt(J5);

          

           int TotalPoints=0;
            
           TotalPoints=intJ1+intJ2+intJ3+intJ4+intJ5;
            if(intJ1>0)
               DeviationJ1Pts+=Math.abs(intFnlPlacement-intJ1);
           if(intJ2>0)
               DeviationJ2Pts+=Math.abs(intFnlPlacement-intJ2);
            if(intJ3>0)
               DeviationJ3Pts+=Math.abs(intFnlPlacement-intJ3);
            if(intJ4>0)
              DeviationJ4Pts+=Math.abs(intFnlPlacement-intJ4);
            if(intJ5>0)
              DeviationJ5Pts+=Math.abs(intFnlPlacement-intJ5);

         

            String strClass="";
                if(  j%2 ==0 )
                strClass="even";
                else
                strClass="odd";%>
                <TR class="<%=strClass%>">
                <TD><%=strHorName%>(<%=strAssigned%>)&nbsp;&nbsp;<font color="blue"><%=strRiderName%>(<%=strIDNum%>)</font></TD>
                <TD><%=J1%></TD>
                <TD><%=J2%></TD>
                <TD><%=J3%></TD>
                <TD><%=J4%></TD>
                <TD><%=J5%></TD>
                <TD><%=TotalPoints%></TD>
                <TD><%=strPlacement%>
                    <%if(strPlacement.equals("1")){%>
                    <img alt="" width="20" height="20"src="Images/winner-trophy.gif">
                    <%}%></TD>
               
                </TR>
              <%}%>
              <tr>
        <TH class="Grid_Header">DEVIATION</TH>
        <TH class="Grid_Header"><%=DeviationJ1Pts%></TH>
        <TH class="Grid_Header"><%=DeviationJ2Pts%></TH>
        <TH class="Grid_Header"><%=DeviationJ3Pts%></TH>
        <TH class="Grid_Header"><%=DeviationJ4Pts%></TH>
        <TH class="Grid_Header"><%=DeviationJ5Pts%></TH>
        <TH class="Grid_Header">&nbsp;</TH>
        <TH class="Grid_Header">&nbsp;</TH>
              </tr>
    </table>
</tbody>


</table>


</div>
</div>

   </form>
    </body>
</html>
