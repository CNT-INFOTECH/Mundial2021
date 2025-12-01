<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<html>
<head>

<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="model.Shows_Equitation_GetReports" %>  
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EQUITATION SEARCH LIST</title>
<link rel="stylesheet" href="Style_Popup.css">
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />
<link href="frmReg_CommonRef.css" rel="stylesheet" type="text/css" />                
<link href="Registration.css" rel="stylesheet" type="text/css" /> 
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
<script src="js/jquery.autocomplete.js"></script>
<script type="text/javascript" src="js/interface.js"></script>
<script type="text/javascript" src="JscEquitationReport.js"></script>

</head>
<body>
    <form name="Shows_EquitationBottomListReport">
<%

String strCountryName="";
String strCountryPoints="";

ArrayList ArRow=new ArrayList();
ArrayList LiValues=new ArrayList();
int Counter=0;

if(strHdnSrch.equals("Country"))
	strCountry="Y";
else
	strSchoolSeq="Y";



if(strSearch.equals("1"))
{
    try
    {
        Shows_Equitation_GetReports S_EGR = new Shows_Equitation_GetReports();
        

 RowSetFactory factory41 = RowSetProvider.newFactory();
   CachedRowSet getCountryPoints= factory41.createCachedRowSet();
        //CachedRowSetImpl getCountryPoints = new CachedRowSetImpl();

        getCountryPoints= S_EGR.GetEquitation_ByCountry(strShowSeq, strEventSeq, strEventFromDate, strEventToDate, strCountry, strSchoolSeq);
        
           
        while (getCountryPoints.next())
        {     
            ArRow=new ArrayList();
            
            if(getCountryPoints.getString("COUNTRY")!=null)
                ArRow.add(getCountryPoints.getString("COUNTRY").toUpperCase().trim());
            else
                ArRow.add("");

            if(getCountryPoints.getString("POINTS")!=null)
                ArRow.add(getCountryPoints.getString("POINTS").trim());
            else
                ArRow.add("");
                
            Counter=Counter+1;
            LiValues.add(ArRow);
        }
%>

    <table class="grid" width="100%" style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">
        <tbody>
        <th width="10%"class="Grid_Header">&nbsp;</th>
        <%if(strCountry.equals("Y")){%>
        <th class="Grid_Header">COUNTRY</th>
        <%}else if(strSchoolSeq.equals("Y")){%>
        <th class="Grid_Header">SCHOOL</th>
        <%}%>
        <th class="Grid_Header">TOTAL POINTS</th>
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
        onclick="fn_ShowPointDetails(this,'<%=ArRow.get(1)%>','<%=ArRow.get(0)%>', '<%=strShowSeq%>','<%=strEventSeq%>','<%=strEventFromDate%>','<%=strEventToDate%>')" >
        <td ><%=i+1%></td>
        <td ><%=ArRow.get(0)%></td>            
        <td ><%=ArRow.get(1)%></td>            
        </tr>

        <%} %>
        </tbody>
    </table>


<%
    }
    catch(Exception ex)
    {
            ex.printStackTrace();

    }
}    
%>
    </form>
</body>
</html>