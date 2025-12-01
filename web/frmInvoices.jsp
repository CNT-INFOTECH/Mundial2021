<%--     Document   : frmInvoices    Created on : Dec 17, 2015, 12:47:00 PM    Author     : ruban   --%>

<%@page import="pasotracker.InsUpdInvoice"%>
<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:useBean id="login" class="login.SessionUserBean" scope="session"/>
<jsp:setProperty name="login" property="*"/>
<%@ page import = "java.util.*" %>
<html>
    <head>
        <title>PASO TRACKER</title>
        <link rel="stylesheet" href="themes/base/jquery.ui.all.css"/>
        <link href="Shows.css" rel="stylesheet" type="text/css" />
        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
        <link href="buttons.css" rel="stylesheet" type="text/css" />
        <link href="style.css" rel="stylesheet" type="text/css" />
        
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
	<script type="text/javascript" src="ui/jquery.ui.datepicker.js"></script>
        <script type="text/javascript" src="js/jquery.autocomplete.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.accordion.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.datepicker.js"></script>
        <script type="text/javascript" src="js/interface.js"></script>
        <script type="text/javascript" src="jscInvoice.js"></script>
        <script>
            $(document).ready(function(){
                $('#dock').Fisheye({
                    maxWidth: 50,
                    items: 'a',
                    itemsText: 'span',
                    container: '.dock-container',
                    itemWidth: 40,
                    proximity: 90,
                    halign : 'center'
                })
            });
        </script>
         <script type="text/javascript" >
            $(function() {
                $("#accordion").accordion({
                    collapsible: true,
                    autoHeight: false
                });
            });
        </script>
    </head>
    <body>
        <form name="Invoice">
            <%
            Calendar localCalendar = Calendar.getInstance(TimeZone.getDefault());      
            int currentDay= localCalendar.get(Calendar.DATE);
            int currentMonth = localCalendar.get(Calendar.MONTH) + 1;
            int currentYear = localCalendar.get(Calendar.YEAR);
            String strcurrentDay=""+currentDay;
            String strcurrentMonth=""+currentMonth;
            String strcurrentYear=""+currentYear;
            if(strcurrentDay.length()==1)
                strcurrentDay="0"+currentDay;
            if(strcurrentMonth.length()==1)
                strcurrentMonth="0"+currentMonth;        
            String Mdate=strcurrentMonth+"/"+strcurrentDay+"/"+strcurrentYear;
            %>
            <div id="container">
            <div id="header">
                <%@ include file="frmHeader.jsp"%>
            </div>
                <div id="content">
                <%
                    if(!bAdmin)
                        response.sendRedirect("login.jsp");
                    
                    String strMod="";
                    String strExpType="1";
                    String strTitle="";
                    
                    InsUpdInvoice iuInv = new InsUpdInvoice();
                    ArrayList alValue = new ArrayList();
                    ArrayList alRow = new ArrayList();
                    
                    String strTransDateFrom=Mdate;
                    String strTransDateTo=Mdate;
                    String strTransType="";
                    String strUnInvoice="";
                    String strIncludeType="";
                    
                    if(request.getParameter("mode")!=null)
                        strMod=request.getParameter("mode");
                    if(strMod.equalsIgnoreCase("0")){
                        strTransDateFrom="";
                        strTransDateTo="";
                        strTransDateTo="";
                    }
                    if(strMod.equalsIgnoreCase("1")){
                        if(request.getParameter("txtDateFrom")!=null)
                            strTransDateFrom=request.getParameter("txtDateFrom");
                        if(request.getParameter("txtDateTo")!=null)
                            strTransDateTo=request.getParameter("txtDateTo");
                        if(request.getParameter("txtTransType")!=null)
                            strTransType=request.getParameter("txtTransType");
                        if(request.getParameter("txtUnInvoice")!=null){
                           if(request.getParameter("txtUnInvoice").equalsIgnoreCase("on"))
                               strUnInvoice="Y";
                        }
                        if(request.getParameter("txtIncludeType")!=null)
                            strIncludeType=request.getParameter("txtIncludeType");
                    }
//                    System.out.println("strUnInvoice "+strUnInvoice);
                %>
                    <fieldset><legend style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; 
                                    border-top:  1px solid #5D92B1;
                                    border-left:  1px solid #5D92B1;
                                    border-right:  1px solid #5D92B1;
                                    padding: 4px;">Invoice:</legend>
                        <table>
                            <tr>
                                <td>TRANSACTION DATE </td>
                                <td>&nbsp;&nbsp;<font class="dateStyleBody" align="top" >FROM</font></td>
                                <td>
                                    <input type="text" name="txtDateFrom" id="txtDateFrom" value='<%=strTransDateFrom%>' size="10" maxlength="10" 
                                           onblur="return compToDate('txtDateFrom','txtDateTo','From Date','To Date'),chkToFutureDate(this.id,'From date')" 
                                           onkeypress="return maskme(this.value,this,'2,5','/',10,event)"
                                           style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" placeholder="MM/DD/YYYY"></td>
                                <td>&nbsp;<font class="dateStyleBody" align="top" >TO</font>
                                    <input type="text" name='txtDateTo' id='txtDateTo' value='<%=strTransDateTo%>' size="10" maxlength="10" 
                                           onblur="return compToDate('txtDateFrom','txtDateTo','From Date','To Date'),chkToFutureDate(this.id,'To date')" onkeypress="return maskme(this.value,this,'2,5','/',10,event)"
                                           style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" placeholder="MM/DD/YYYY"></td>
                                <td width="50px"></td>
                                <td>TYPE&nbsp;&nbsp;</td>                                
                                <td>
                                    <select name="txtTransType" id="txtTransType" style="width:185px;background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;">
                                        <!--<option value='' < % //if(strTransType.equalsIgnoreCase("")){%>selected < % }%> >SELECT</option>-->
                                        <option value='3' <%if(strTransType.equalsIgnoreCase("3")){%>selected <%}%> >BOTH</option>
                                        <option value='1' <%if(strTransType.equalsIgnoreCase("1")){%>selected <%}%> >CERTIFICATE</option>
                                        <option value='2' <%if(strTransType.equalsIgnoreCase("2")){%>selected <%}%> >TRANSFER OF OWNER</option>
                                    </select>
                                </td>
<!--                                <td>
                                    UN INVOICED&nbsp;&nbsp;<input type="checkbox" id='txtUnInvoice' name='txtUnInvoice' <%if(strUnInvoice.equalsIgnoreCase("Y")){%>checked<%}%> />
                                </td>-->
                            </tr>
                            <tr>
                                <td colspan="2">STATUS&nbsp;&nbsp;</td>                                
                                <td colspan="2">
                                    <select name="txtIncludeType" id="txtIncludeType" style="width:215px;background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;">
                                        <option value='3' <%if(strIncludeType.equalsIgnoreCase("3")){%>selected <%}%> >BOTH</option>
                                        <option value='1' <%if(strIncludeType.equalsIgnoreCase("1")){%>selected <%}%> >INVOICED</option>
                                        <option value='2' <%if(strIncludeType.equalsIgnoreCase("2")){%>selected <%}%> >NOT INVOICED</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7" align="center"><br>
                                    <input type="button" class="button" value='Search' onclick="fnClickAction('Search')" >&nbsp;
                                    <input type="button" class="button" value='Reset' onclick="fnClickAction('Reset')" >
                                    <input type="button" class="button" value='Export Summary' onclick="fnClickAction('ExlSummary')" >
                                    <input type="button" class="button" value='Export Details' onclick="fnClickAction('ExlDetail')" >
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                    <%
                        HashMap HmDetails = new HashMap();
                        HmDetails.put("CERTIFICATE", "1");
                        HmDetails.put("TRANSFER OF OWNER", "2");
                        if(strMod.equalsIgnoreCase("1")){
                            alRow = iuInv.getTransCount_Certificate_TransOwner(strExpType,strTransType, strTransDateFrom, strTransDateTo,strIncludeType);
                    %>
                    <table class="grid" width="100%">
                        <tr><th width="330" align="center" >Type</th><th width="330" align="center" >Count</th></tr>
                    </table>
                    <div id="accordion" >
                        <%
                            alValue = null;
                            for (int i = 0; i < alRow.size(); i++) {
                                alValue = new ArrayList();
                                alValue = (ArrayList) alRow.get(i);
                        %>
                        <h3 onClick="getRecordDetails('<%=HmDetails.get("" + alValue.get(1))%>','<%=alValue.get(0)%>')">
                            <table>
                                <tr align="center" style="height: 8px" >
                                    <td width="405" align="center"><p style="text-indent: 2em;" ><%=alValue.get(1)%></p></td>
                                    <td width="330" align="center">
                                        <p><a href="#" onClick="getRecordDetails('<%=HmDetails.get("" + alValue.get(1))%>','<%=alValue.get(0)%>')"  >
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <lable id='txtCount' name='txtCount'><%=alValue.get(2)%></lable>
                                        </a></p>
                                    </td>
                                </tr>
                            </table>
                        </h3>
                            <div style="background:url('Images/trans-wood-1.png')" >
                                <div id="<%=HmDetails.get("" + alValue.get(1))%>" >
                                </div>
                            </div>
                            <%}%>
                    </div>
                    <%}%>
                </div>
                    
                    
                    
<!--   Side bar    -->
                <div id="sidebar">
                    <table style="border-collapse:collapse;">
                        <tr>
                            <td>
                                <div onclick="location.href='createuser.jsp';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
                                    border-top:  1px solid #5D92B1;
                                    border-left:  1px solid #5D92B1;
                                    border-right:  1px solid #5D92B1;
                                    padding: 4px;" >User SetUp&nbsp;&nbsp;&nbsp;&nbsp;</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div onclick="location.href='user_role.jsp';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
                                    border-top:  1px solid #5D92B1;
                                    border-left:  1px solid #5D92B1;
                                    border-right:  1px solid #5D92B1;
                                    padding: 4px;" >Role SetUp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div  onclick="location.href='frmAccessScreen.jsp';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
                                    border-top:  1px solid #5D92B1;
                                    border-left:  1px solid #5D92B1;
                                    border-right:  1px solid #5D92B1;
                                    padding: 4px;" >Screen Access&nbsp;&nbsp;&nbsp;&nbsp;</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div onclick="location.href='frmPointSystem.jsp';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
                                    border-top:  1px solid #5D92B1;
                                    border-left:  1px solid #5D92B1;
                                    border-right:  1px solid #5D92B1;
                                    padding: 4px;" >Point System&nbsp;&nbsp;&nbsp;&nbsp;</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div  onclick="location.href='frmWho_Gets_Point.jsp';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
                                    border-top:  1px solid #5D92B1;
                                    border-left:  1px solid #5D92B1;
                                    border-right:  1px solid #5D92B1;
                                    padding: 4px;" >Who Gets Points&nbsp;&nbsp;</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div  onclick="location.href='frmInvoices.jsp';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
                                    border-top:  1px solid #5D92B1;
                                    border-left:  1px solid #5D92B1;
                                    border-right:  1px solid #5D92B1;
                                    padding: 4px;" >Invoice&raquo;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div  onclick="location.href='frmAdmn_Others.jsp';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
                                    border-top:  1px solid #5D92B1;
                                    border-left:  1px solid #5D92B1;
                                    border-right:  1px solid #5D92B1;
                                    padding: 4px;" >Others&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
<!--            <div id="dialog-Invoice" title="" style="display:none; background:url('Images/trans-wood-1.png');" >
                <iframe  src=""  id="modalIFrame_Invoice" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes"></iframe>
            </div>            -->
        </form>
    </body>
</html>
