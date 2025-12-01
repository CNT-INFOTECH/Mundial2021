<%-- 
    Document   : Person_PaymentHistoryPopUp
    Created on : Feb 8, 2012, 5:36:45 PM
    Author     : Erzath
--%>
<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>PAYMENT HISTORY</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="Style_Popup.css">
        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
        <link href="buttons.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="themes/base/jquery.ui.all.css"/>
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
        
<style type="text/css">
.altRow1
{

}

.altRow1 td
{

	font-size:9pt;
	color:#000000;
	padding:5px 0 5px 5px;
	vertical-align:top;
	text-align:left;
}


.altRow1  th
{
	background:#4e738f;
	color:#fff;
	font-weight:bold;
	font-size:9pt;
	text-align:center;
}
.ui-datepicker
{
    font-family:TimesNewRoman;
    font-size: 10px;
    margin-left:7px;
    margin-top: 0px;
    line-height: 1.0em;
}


</style>
<script type="text/javascript">
$(function() {
$( "#date_PaymentFrom" ).datepicker({
changeMonth: true,
changeYear: true
});
$( "#date_PaymentTo" ).datepicker({
changeMonth: true,
changeYear: true
});
});
function showAllMemberPayments()
{
    document.forms[0].method="post";
    document.forms[0].action="Person_PaymentHistoryPopUp.jsp?Srch=2";
    document.forms[0].target="_self";
    document.forms[0].submit();
}
function Close_PaymentHistory()
{
    window.parent.jQuery('#dialog-PaymentHistoryPopUp').dialog('close')
}
</script>
<script src="jscPerson.js" type="text/javascript"></script>
    </head>    
    <body>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import= "javax.naming.*" %>
<%@ page import= "javax.sql.rowset.*" %>
<%@ page import= "pasotracker.DbConnMngr" %>
<%@ page import= "pasotracker.GeneralServlet" %>

        <form name="Person_PaymentHistoryPopUp" >
<%
String PaymentFromDate="";
String PaymentToDate="";
String Srch="";
String EntitySeq="";
String TrasactionId="";
String strPaymentDate="";
String strPaymentAmt="";
String AmtPaid="";
String BalanceAmt="";
String ModeofPymnt="";
int Counter=0;

if(request.getParameter("EntySeq")!=null)
    EntitySeq=request.getParameter("EntySeq");

if(request.getParameter("date_PaymentFrom")!=null)
    PaymentFromDate=request.getParameter("date_PaymentFrom");

if(request.getParameter("date_PaymentTo")!=null)
    PaymentToDate=request.getParameter("date_PaymentTo");

if(request.getParameter("Srch")!=null)
    Srch=request.getParameter("Srch");

List MembersList = new ArrayList();  
int no=1;
    try
    {
        Map MpMemberDetails = new TreeMap();
        

 RowSetFactory factory29 = RowSetProvider.newFactory();
   CachedRowSet crsMemberPaymentHistory= factory29.createCachedRowSet();
       // CachedRowSetImpl crsMemberPaymentHistory = new CachedRowSetImpl();    
        GeneralServlet gen = new GeneralServlet();
        
        if(Srch.equals("1") || Srch.equals("2"))    
        crsMemberPaymentHistory = gen.GET_MemberPaymentHistory(EntitySeq, PaymentFromDate, PaymentToDate);


        while (crsMemberPaymentHistory.next())
        {             
           
            if(crsMemberPaymentHistory.getString("TRANSACTIONSEQ")!=null)                  
                TrasactionId=crsMemberPaymentHistory.getString("TRANSACTIONSEQ").trim();
            else
                TrasactionId="";
            
            if(crsMemberPaymentHistory.getString("ENTITYSEQ")!=null)                  
                EntitySeq=crsMemberPaymentHistory.getString("ENTITYSEQ").trim();
            else
                EntitySeq="";
            
            if(crsMemberPaymentHistory.getString("DATE")!=null)                  
                strPaymentDate=crsMemberPaymentHistory.getString("DATE").trim();
            else
                strPaymentDate="";
            
            if(crsMemberPaymentHistory.getString("AMOUNTPAID")!=null)                  
                strPaymentAmt=crsMemberPaymentHistory.getString("AMOUNTPAID").trim();
            else
                strPaymentAmt="";
            
            if(crsMemberPaymentHistory.getString("MODEOFPAYMENT")!=null)                  
                ModeofPymnt=crsMemberPaymentHistory.getString("MODEOFPAYMENT").trim();
            else
                ModeofPymnt="";
            
            if(crsMemberPaymentHistory.getString("BALANCEAMOUNT")!=null)                  
                BalanceAmt=crsMemberPaymentHistory.getString("BALANCEAMOUNT").trim();
            else
                BalanceAmt="";
            
            MpMemberDetails = new TreeMap();
            MpMemberDetails.put("TRANSACTIONSEQ",TrasactionId);
            MpMemberDetails.put("ENTITYSEQ",EntitySeq);
            MpMemberDetails.put("DATE",strPaymentDate);
            MpMemberDetails.put("AMOUNTPAID",strPaymentAmt);
            MpMemberDetails.put("MODEOFPAYMENT",ModeofPymnt);
            MpMemberDetails.put("BALANCEAMOUNT",BalanceAmt);
            MpMemberDetails.put("Counter",no);
            
            no=no+1;
            Counter=Counter+1;
            MembersList.add(MpMemberDetails);
        }
    }
    catch(Exception ex)
    {
            ex.printStackTrace();

    }
%>
<table class="altRow1" style="width:100%;">
    <tr style="text-align:center;">
        <td width="18%"></td>
        <td>FROM</td>
        <td>
            <input type="text" id="date_PaymentFrom" name="date_PaymentFrom" placeholder="MM/DD/YYYY"
            onchange="CheckDate('date_PaymentFrom','date_PaymentTo')" value="<%=PaymentFromDate%>"
            style="background-color:  #FFF8DC; border:  1px solid #000000;
            text-transform: uppercase;width:100px;"/>
        </td>
        <td>TO</td>
        <td>
            <input type="text" id="date_PaymentTo" name="date_PaymentTo" placeholder="MM/DD/YYYY"
            onchange="CheckDate('date_PaymentFrom','date_PaymentTo')" value="<%=PaymentToDate%>"
            style="background-color:  #FFF8DC; border:  1px solid #000000;
            text-transform: uppercase;width:100px;" />
        </td>                   
        <td>
            <input type="button" class="button" id="SrchPaymentHistory" name="SrchPaymentHistory" 
            onclick="DisplayPaymentHistory()" value="Search"/>
        </td>
        <td>
            <input type="button" class="button" id="ClosePaymentHistory" name="ClosePaymentHistory" 
            onclick="Close_PaymentHistory()" value="Close"/>
        </td>
        <td width="18%"></td>
    </tr>
</table>   
                
    <input type="hidden" id="EntySeq" name="EntySeq" value="<%=EntitySeq%>" 
    style="background-color:  #FFF8DC; border:  1px solid #000000;
    text-transform: uppercase;"/>
                
<%      
    request.setAttribute("MemberList", MembersList);

    if (Srch.equals("2") )
    {
    out.println(Counter +" Transactions founds,displaying 1 to "+ Counter);
%>
        <display:table  id="Details" name="requestScope.MemberList"        
        defaultsort="1" defaultorder="ascending" 
        class="grid"
        style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;overflow-x:scroll;text-transform: uppercase;">
  
        <display:column style="width:10%;padding-left:2%;"  property="Counter" title="S.NO" sortable="true" headerClass="Grid_Header" />        
        <display:column style="width:10%;padding-left:2%;"   title="TRANS ID#" property="TRANSACTIONSEQ" sortable="true" headerClass="Grid_Header"/>     
        <display:column style="width:15%"  title="DATE"   sortable="true" property="DATE" headerClass="Grid_Header"/>
        <display:column style="width:25%;padding-left:5%;" property="AMOUNTPAID"  title="AMOUNT PAID" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:20%;padding-left:3%;" property="MODEOFPAYMENT"  title="PAYMENT TYPE" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:20%;padding-left:5%;"   title="BAL AMOUNT" property="BALANCEAMOUNT" sortable="true" headerClass="Grid_Header"/>        

        </display:table>
<%  
    }
    else if(Srch.equals("1"))
    { 
%>
        <display:table  id="Details" name="requestScope.MemberList"
        pagesize="100" defaultsort="1" defaultorder="ascending"
        class="grid" 
        style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;overflow-x:scroll;text-transform: uppercase;">           

        <display:setProperty name="paging.banner.item_name" value="Transaction" />
        <display:setProperty name="paging.banner.items_name" value="Transactions" />
        <display:setProperty name="paging.banner.some_items_found">

        <span class="pagebanner" >{0} {1} founds,displaying {2} to {3}</span>
        <span ><input type="checkbox" onClick="showAllMemberPayments()"> <font style="font-weight:bold;">View All&nbsp;&nbsp;&nbsp;</font></span>

        </display:setProperty>
        <display:column style="width:10%;padding-left:2%;"  property="Counter" title="S.NO" sortable="true" headerClass="Grid_Header" />       
        <display:column style="width:15%;padding-left:3%;"   title="TRANS ID#" property="TRANSACTIONSEQ" sortable="true" headerClass="Grid_Header"/>     
        <display:column style="width:15%"  title="DATE"   sortable="true" property="DATE" headerClass="Grid_Header"/>
        <display:column style="width:20%;padding-left:5%;" property="AMOUNTPAID"  title="AMOUNT PAID" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:22%;padding-left:4%;" property="MODEOFPAYMENT"  title="PAYMENT TYPE" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:25%;padding-left:5%;"   title="BAL AMOUNT" property="BALANCEAMOUNT" sortable="true" headerClass="Grid_Header"/>        

        </display:table>
<%
    }
%>        
        </form>
    </body>
</html>
