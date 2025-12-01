<%-- 
    Document   : Person_MakePayment
    Created on : Feb 7, 2012, 8:26:37 PM
    Author     : Erzath
--%>

<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>MAKE PAYMENT</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
.altRow
{

}

.altRow td
{
	border-bottom:1px dotted #ffffff;
	font-size:9pt;
	color:#000000;
	/*padding:5px 0 5px 5px;*/
	vertical-align:top;
	/*text-align:left;*/
}


.altRow  th
{
	background:#4e738f;
	color:#fff;
	font-weight:bold;
	font-size:9pt;
	/*text-align:center;*/
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
$( "#Paymentdate" ).datepicker({
changeMonth: true,
changeYear: true
});
});
function Close_Payment()
{
    window.parent.jQuery('#dialog-MakePayment').dialog('close')
}
</script>

<script type="text/javascript" src="jscIndex.js"></script>
<script type="text/javascript" src="jscPerson.js"></script>
<link href="frmReg_CommonRef.css" rel="stylesheet" type="text/css" />
        
</head>
<body>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import= "javax.sql.rowset.*" %>
<%@ page import= "pasotracker.DbConnMngr" %>
<%@ page import= "pasotracker.GeneralServlet" %>


    <form name="Person_MakePayment">
<%
   
    String strPAYMENTDATE="";
    String strAMOUNT="";    
    String strMODEOFPAYMENT="";
    String strAMOUNTPAID="";        
    String EntitySeq="";
    String MemberNum="";
    
    String strMember_Type="";
    String strMemberFees="";
    String strStatus="";
    String strJoiningDate="";
    
    Calendar c = Calendar.getInstance();
    int day = c.get(Calendar.DATE);
    int mon = c.get(Calendar.MONTH);
    int month = mon + 1;
    int year = c.get(Calendar.YEAR);
    
    //Calendar currentDate = Calendar.getInstance();
    //SimpleDateFormat formatter= new SimpleDateFormat("MM/dd/yyyy");
    //strPAYMENTDATE = formatter.format(currentDate.getTime());    
    
    strPAYMENTDATE= month +"/"+day +"/"+ year;
    
    if(request.getParameter("EntitySeq")!=null)
        EntitySeq=request.getParameter("EntitySeq");
    
    if(request.getParameter("MemberNum")!=null)
        MemberNum=request.getParameter("MemberNum");

    /*if(request.getParameter("Paymentdate")!=null)
        strPAYMENTDATE=request.getParameter("Paymentdate");

    if(request.getParameter("PendingAmount")!=null)
        strAMOUNT=request.getParameter("PendingAmount");

    if(request.getParameter("Amountpaid")!=null)
        strAMOUNTPAID=request.getParameter("Amountpaid");

    if(request.getParameter("Modeofpayment")!=null)
        strMODEOFPAYMENT=request.getParameter("Modeofpayment");
    */

    try
    {
        GeneralServlet genn = new GeneralServlet();
        RowSetFactory factory2crsGetMember = RowSetProvider.newFactory();
   CachedRowSet crsGetMember= factory2crsGetMember.createCachedRowSet();
        //CachedRowSetImpl crsGetMember = new CachedRowSetImpl();
         
        if (EntitySeq.length() > 0 && EntitySeq!=null) 
        crsGetMember = genn.get_memberDetails(EntitySeq);
        
        while (crsGetMember.next()) {
            
        if (crsGetMember.getString("MEMBER_NUM") != null) {
        MemberNum = crsGetMember.getString("MEMBER_NUM").trim();
        }
        
        if (crsGetMember.getString("STATUS") != null) {
        strStatus = crsGetMember.getString("STATUS").trim();
        }
        
        if (crsGetMember.getString("JoiningDate") != null) {
        strJoiningDate = crsGetMember.getString("JoiningDate").trim();
        }
        
        if (crsGetMember.getString("MembershipFees") != null) {
        strMemberFees = crsGetMember.getString("MembershipFees").trim()+"$";
        }
        
        if (crsGetMember.getString("MemberType") != null) {
        strMember_Type = crsGetMember.getString("MemberType").trim();
        }
        }
        //GeneralServlet genn = new GeneralServlet();
         RowSetFactory factory2crsMemberAmount = RowSetProvider.newFactory();
   CachedRowSet crsMemberAmount= factory2crsMemberAmount.createCachedRowSet();
       // CachedRowSetImpl crsMemberAmount = new CachedRowSetImpl();
        if(EntitySeq!=null && EntitySeq.length()>0)
        crsMemberAmount = genn.GET_MEMBERAMOUNT(EntitySeq);
        
        while (crsMemberAmount.next())
        {        
        strAMOUNT="";
        EntitySeq="";        
        
        if (crsMemberAmount.getString("BALANCEAMOUNT") != null) {
        strAMOUNT = crsMemberAmount.getString("BALANCEAMOUNT").trim()+"$";
        }
        
        if (crsMemberAmount.getString("ENTITYSEQ") != null) {
        EntitySeq = crsMemberAmount.getString("ENTITYSEQ").trim();
        }
        /*
        if (crsMemberAmount.getString("MEMBER_NUM") != null) {
        MemberNum = crsMemberAmount.getString("MEMBER_NUM").trim();
        }
        
        if (crsMemberAmount.getString("STATUS") != null) {
        strStatus = crsMemberAmount.getString("STATUS").trim();
        }
        
        if (crsMemberAmount.getString("JOININGDATE") != null) {
        strJoiningDate = crsMemberAmount.getString("JOININGDATE").trim();
        }
        
        if (crsMemberAmount.getString("MEMBERSHIPFEES") != null) {
        strMemberFees = crsMemberAmount.getString("MEMBERSHIPFEES").trim();
        }
        
        if (crsMemberAmount.getString("MEMBERTYPE") != null) {
        strMember_Type = crsMemberAmount.getString("MEMBERTYPE").trim();
        }
        
        */
        }
    }
    catch (Exception e)
    {
        System.err.println("Got an exception! ");
        System.err.println("++Person_MakePayment.jsp+++" + e);
    }    
%>

    <table class="altRow"> 
        <input type="hidden" name="EntitySeq" id="EntitySeq" value='<%=EntitySeq%>' >
        <input type="hidden" name="MemberNum" id="MemberNum" value='<%=MemberNum%>' >
        <tr>
            <td nowrap>CURRENT DATE</td>
            <td>
                <input type="text" name="Paymentdate" id="Paymentdate"  placeholder="MM/DD/YYYY"   
                value='<%=strPAYMENTDATE%>' onchange="CheckDate('Paymentdate')"
                style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;
                width:100px;">
            </td>
            <td>PENDING AMOUNT</td>
            <td>
                <input type="text"    name="PendingAmount" id="PendingAmount"  
                <%
                if(strAMOUNT.equals(""))
                    strAMOUNT=strMemberFees;
                %>                
                value='<%=strAMOUNT%>'
                style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;
                width:125px;" Readonly/>
            </td>
        </tr>
        <tr>
            <td nowrap>AMOUNT PAID</td>
            <td>
                <input type="text" name="Amountpaid" id="Amountpaid"   value='<%=strAMOUNTPAID%>' size="15" 
                style=" background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;
                width:100px;">
            </td>           
            <td nowrap>MODE OF PAYMENT</td>
            <td>
                <select name="Modeofpayment" id="Modeofpayment" style="background-color:  #FFF8DC; border:  1px solid #000000;
                text-transform: uppercase;" >
                <option value=''>Select</option>
                <%
                String strSelected_CC="";
                String strSelected_ATM="";
                String strSelected_CHQ="";
                String strSelected_CASH="";
                String strSelected_MO="";
                                
                if(strMODEOFPAYMENT.equals("CREDIT CARD"))
                strSelected_CC="SELECTED";
                else  if(strMODEOFPAYMENT.equals("ATM"))
                strSelected_ATM="SELECTED";
                else  if(strMODEOFPAYMENT.equals("CHEQUE"))
                strSelected_CHQ="SELECTED";
                else  if(strMODEOFPAYMENT.equals("CASH"))
                strSelected_CASH="SELECTED";
                else  if(strMODEOFPAYMENT.equals("MONEY ORDER"))
                strSelected_MO="SELECTED";
                
                %>
                <option value='CREDIT CARD' <%=strSelected_CC%> >CREDIT CARD</option>
                <option value='ATM'<%=strSelected_ATM%>>ATM</option>
                <option value='CHEQUE' <%=strSelected_CHQ%> >CHEQUE</option>
                <option value='CASH'<%=strSelected_CASH%>>CASH</option>
                <option value='MONEY ORDER' <%=strSelected_MO%> >MONEY ORDER</option>
            </td>            
        </tr>
        <input type="hidden" value="<%=strMember_Type%>" id="Member_Type" name="Member_Type" >
        <input type="hidden" value="<%=strMemberFees%>" id="MemberFees" name="MemberFees" >
        <input type="hidden" value="<%=strStatus%>" id="Status" name="Status" >
        <input type="hidden" value="<%=strJoiningDate%>" id="JoiningDate" name="JoiningDate" >       
        <tr>
            <td colspan="4" align="center">
                <input type="button" value="  Save  " class="button" onclick="Member_PaymentTransaction('Paymentdate','Modeofpayment','Amountpaid')"/>
                <input type="button" class="button" id="ClosePayment" name="ClosePayment" 
                onclick="Close_Payment()" value="Close"/>
                <input type="hidden" value="MAKEPAYMENT" name="PAGEID" id="PAGEID" >
                <%--<input type="button" id="Close" class="button" onclick="Close_Paso('Person_MalePayment.jsp')" value="Close" />-->--%>
            </td>
        </tr>
    </table>

    </form>
</body>
</html>
   