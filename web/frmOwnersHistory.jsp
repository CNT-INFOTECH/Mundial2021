



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">


<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.DBConnection" %>
<%@ page import="pasotracker.GeneralServlet" %>
<html>
<head>
<title>OWNERS HISTORY</title>

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
<script type="text/javascript" src="jscRegistration.js"></script>
<script type="text/javascript" src="jscIndex.js"></script>     
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="Registration.css" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/interface.js"></script>
<script type="text/javascript">

function Reset_OwnerHistory()
{
    document.forms[0].method="post";
    document.forms[0].action="frmOwnersHistory.jsp?Mode=1";
    document.forms[0].target="_self";  
    document.forms[0].submit();
}
</script>
<style type="text/css">
<!--
@import url("CommonTableStyle.css");
-->

#footer_Bot {
	clear:both;
	text-align:center;
	/*background: #555;
	color:#fff;*/
	height:50px;
	padding:5px;
         bottom: auto;

}
</style>
</head>
<body>
    
 <form name="OwnersHistory_frm">
 <%@ include file="frmReg_ScreenAttributes.jsp"%>
<%       
    String REGSEQ="";        
    String strMode="";
    String SaveYN="N";
    if(request.getParameter("Mode")!=null)
        strMode=request.getParameter("Mode");

    if(strMode.equals("1"))
    {
    SaveYN="N";            
    session.removeAttribute("ses_REGSEQ");        
    }
    if(strMode.equals("2"))
    {
        if(request.getParameter("RegNo")!=null)
        REGSEQ =request.getParameter("RegNo");
        else
        REGSEQ="";           
    }
    else if(session.getAttribute("ses_REGSEQ")!=null)
        REGSEQ =(String) session.getAttribute("ses_REGSEQ");
    else
        REGSEQ="";                
%>
     <%@ include file="frmOwnersHistoryInclude.jsp"%>
    <div id="container">
    <div id="header">
        <%@ include file="frmHeader.jsp"%>
   </div>
<%
	if(!bRegistraion)
		response.sendRedirect("login.jsp");

    String FontColor="";
    String RegType="";

    if(strRegistration_Type.equals("R"))
    {
       FontColor="blue";
       RegType="R";
    }
    else if(strRegistration_Type.equals("P"))
    {
       FontColor="red";
       RegType="P";
    }
    else if(strRegistration_Type.equals("S"))
    {
       FontColor="green";
       RegType="S";
    }
 String Regno="";
    Regno=str_reggno;  //Regno is used in frmReg_Top.jsp
%>
    <div id="content">                
        <%@ include file="frmReg_Top.jsp"%>
        <table class="grid" align="center"  border="0" cellpadding="0" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th width="17%">Name</th>
                <th width="3%">Member</th>
                <th width="10%">Address</th>
                <th width="10%">City</th>
                <th width="10%">State</th>
                <th width="10%">Zip</th>
                <th width="10%">Country</th>
                <th width="10%">Phone</th>
                <th width="10%">Start Date</th>
                <th width="10%">End Date</th>
            </tr>
        </thead>
        <tbody>
<%
   
            REGSEQ=(String) session.getAttribute("ses_REGSEQ");
            
            if(REGSEQ!=null)
            {

            try{    
            GeneralServlet genn =new GeneralServlet();
            RowSetFactory factory14 = RowSetProvider.newFactory();
   CachedRowSet crsGetownershistoryDetails= factory14.createCachedRowSet();
            //CachedRowSetImpl crsGetownershistoryDetails = new CachedRowSetImpl();
            
            crsGetownershistoryDetails = genn.GetOwnerHistoryDetails(REGSEQ);            
                                                             
                String strmem_add="";
                String strstart_date="";
                String strend_date="";
                String strOrg_Name1="";
                String strOwnerType="";
                      
            while(crsGetownershistoryDetails.next())
            {                
                strmem_num="";
                strmem_name="";
                strmem_add="";                
                strmem_city="";
                strmem_state="";
                strmem_zip="";
                strmem_country="";
                strmem_phone="";
                strstart_date="";
                strend_date="";
                strOrg_Name1="";
                strOwnerType="";
                
            if(crsGetownershistoryDetails.getString("MEMBER_NUM")!=null)                  
                strmem_num= crsGetownershistoryDetails.getString("MEMBER_NUM");   
           
            if(crsGetownershistoryDetails.getString("NAME")!=null)                  
                strmem_name= crsGetownershistoryDetails.getString("NAME");
                
            if(crsGetownershistoryDetails.getString("OWNER_TYPE")!=null)                  
                strOwnerType= crsGetownershistoryDetails.getString("OWNER_TYPE");
           
            if(crsGetownershistoryDetails.getString("ORGANIZATION_NAME")!=null)                              
                strOrg_Name1= crsGetownershistoryDetails.getString("ORGANIZATION_NAME").trim();
                            
            if(crsGetownershistoryDetails.getString("ADDRESS")!=null)                  
                strmem_add= crsGetownershistoryDetails.getString("ADDRESS");                        
           
            if(crsGetownershistoryDetails.getString("CITY")!=null)                  
                strmem_city= crsGetownershistoryDetails.getString("CITY");
           
            if(crsGetownershistoryDetails.getString("STATE")!=null)                  
                strmem_state= crsGetownershistoryDetails.getString("STATE"); 
            
            if(crsGetownershistoryDetails.getString("ZIP")!=null)                  
                strmem_zip= crsGetownershistoryDetails.getString("ZIP");
            
            if(crsGetownershistoryDetails.getString("COUNTRY")!=null)                  
                strmem_country= crsGetownershistoryDetails.getString("COUNTRY");
            
            if(crsGetownershistoryDetails.getString("PHONE")!=null)                  
                strmem_phone= crsGetownershistoryDetails.getString("PHONE");
                
            if(crsGetownershistoryDetails.getString("START_DATE")!=null)                  
                strstart_date= crsGetownershistoryDetails.getString("START_DATE");
                
            if(crsGetownershistoryDetails.getString("END_DATE")!=null)                  
                strend_date= crsGetownershistoryDetails.getString("END_DATE");
                                
%>            
        <tr class="grid_OwnerHis" >
            <td >
                <%/*if(!strOrg_Name1.equals(""))
                    out.println(strOrg_Name1);
                  else 
                    out.println(strmem_name);*/
                 if(!strOrg_Name1.equals(""))
                    out.println(strOrg_Name1.trim());
                else if(!strmem_name.equals("") && strOrg_Name1.equals(""))
                    out.println(strmem_name.trim());
                %>
            </td>
            <td>
                <%                                     
                if(strmem_num.length()>0 && !strmem_num.equals("0"))
                  out.println("YES");
                else  if(strmem_num.equals("0"))
                  out.println("NO");
                %>
            </td>
            <td>
                <% out.println(strmem_add);%>
            </td>
            <td>
                <% out.println(strmem_city);%>
            </td>
            <td>
                <% out.println(strmem_state);%>
            </td>
            <td>
                <% out.println(strmem_zip);%>
            </td>
            <td>
                <% out.println(strmem_country);%>
            </td>
            <td>
                <% out.println(strmem_phone);%>
            </td>
            <td>
                <% out.println(strstart_date);%>
            </td>
            <td>
                <% out.println(strend_date);%>
            </td>
        </tr>
<%                                                          
        }                    
      } 
        catch (Exception e) {
        System.err.println("Got an exception! ");
        System.err.println("++frmOwnersHistory.jsp+++"+e);
    } 
        }
%>
        <tr>
            <td align="center" colspan="10">
                <BR>
                <BR>
                <input type="button" id="ResetOwnersHistory" class="button" value="Reset" onclick="Reset_OwnerHistory()"/>
                <!--<input type="button" id="Close" class="button" onclick="Close_Paso('frmOwnersHistory.jsp')" value="Close" />-->
                <input type="button" id="PreviousOwn_History" class="button" value="&laquo;" onclick="CheckSave('frmReg_Siblings.jsp')" />
                <input type="button" id="NextOwn_History" class="button" value="&raquo;" onclick="CheckSave('frmShowHistory.jsp')" />     
            </td>
        </tr><input type="hidden" name="SavedYN" id="SavedYN" value="Y" />
    </tbody>
    </table>             
    </div>
        
    <div id="sidebar">
        <%@ include file="Reg_OwnersHistory_Side.jsp" %>
    </div>
            
    <div id="footer_Bot" align="bottom">
    <jsp:include page="/frmBottom_Registration.jsp"/>
    </div>
    </div>
   <div id="dialog-Reg" title="Search Registration" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  src="regsearchpopup.jsp"  id="modalIFrame_Show" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes">
        </iframe>
    </div>
		</form>



</body>
</html>