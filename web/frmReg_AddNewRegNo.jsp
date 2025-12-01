<%-- 
    Document   : frmReg_NewRegNo
    Created on : Oct 3, 2011, 1:00:16 PM
    Author     : Erzath
--%>

<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PASO TRACKER</title>
        <link rel="stylesheet" href="themes/base/jquery.ui.all.css">
        <script type="text/javascript" src="jquery-1.5.1.js"></script>
        <script type="text/javascript" src="external/jquery.bgiframe-2.1.2.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.core.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.widget.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.mouse.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.button.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.datepicker.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.draggable.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.position.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.resizable.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.dialog.js"></script>
        <script type="text/javascript" src="ui/jquery.effects.core.js"></script>        
        <script type="text/javascript" src="jscIndex.js"></script>     
        <link href="buttons.css" rel="stylesheet" type="text/css" />        
        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/interface.js"></script>   

<link rel="stylesheet" href="Shows_Pop.css">
<link rel="stylesheet" href="frmReg_CommonRef.css" type="text/css" />            
<link rel="stylesheet" href="windowfiles/dhtmlwindow.css" type="text/css" />        
<script type="text/javascript" src="windowfiles/dhtmlwindow.js" ></script>

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

</style>
<script type="text/javascript"> 
function Add_NewRegno(seq)
{
  
    if(seq=="")
        return false;
    
    PopWin=dhtmlmodal.open('EmailBox', 'iframe', 'frmReg_NewAddRegNum_Popup.jsp?Seq='+seq+'&Action=Add','   NEW REG#','width=250px,height=110px,center=1,resize=0,scrolling=1');
    PopWin.onclose=function(){                
        var seq= this.contentDoc.getElementById("RegSeq").value       
        var valregno=this.contentDoc.getElementById("regnum").value
        if(seq!='' && valregno!='')
        {
        document.forms[0].method="post";
        document.forms[0].action="RegistrationServlet?PAGEID=ADDNEWREGNUM&seq="+seq+"&Regno="+valregno;
        document.forms[0].target="_self";
        document.forms[0].submit();
        }
        return true //allow closing of window
    }
}

</script>
<link rel="stylesheet" href="modalfiles/modal.css" type="text/css" />
<script type="text/javascript" src="modalfiles/modal.js"></script>

</head>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.GeneralServlet" %>
    <body>
<%
String RegSeq="";

if(request.getParameter("RegSeq")!=null)
    RegSeq=request.getParameter("RegSeq");

GeneralServlet gen = new GeneralServlet();
 RowSetFactory factorycrsGetOldRegnum = RowSetProvider.newFactory();
   CachedRowSet crsGetOldRegnum= factorycrsGetOldRegnum.createCachedRowSet();
//CachedRowSetImpl crsGetOldRegnum = new CachedRowSetImpl();

ArrayList regnolist = new ArrayList();
ArrayList LiValues=new ArrayList();
if(RegSeq!=null)
    crsGetOldRegnum = gen.GET_OLDREGNUM(RegSeq);

while(crsGetOldRegnum.next())
{
    regnolist=new ArrayList();
    if(crsGetOldRegnum.getString("REGISTRATION_NUM")!=null)                                   
        regnolist.add(crsGetOldRegnum.getString("REGISTRATION_NUM").trim());    
    else 
        regnolist.add("");
    
     LiValues.add(regnolist);     
}    
    
%>
        <form>
            <table class="grid" width="100%" style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">
                <tbody>                  
                    <tr>
                        <th width="10%"class="Grid_Header">&nbsp;</th>
                        <th class="Grid_Header">OLD REG#</th>
                    </tr>
                    <%  
            for (int i=0;i < LiValues.size(); i++)
            {
                regnolist=new ArrayList();
                regnolist=(ArrayList)LiValues.get(i);
                    %>    
                    <tr>
                        <td ><%=i+1%></td>
                        <td ><%=regnolist.get(0)%></td>  
                    </tr>
         <%} %>
                </tbody>
            </table>
<div id="framecontent_add">
<div class="innertube">
            <table width="100%" >
                <tr >
                    <td align="center" colspan="2">
                        <input type="button" class="button" onclick="Add_NewRegno('<%=RegSeq%>')" value="Add Reg#" >
                    </td>                    
                </tr>
            </table>
</div>
</div>
        </form>
    </body>
</html>
