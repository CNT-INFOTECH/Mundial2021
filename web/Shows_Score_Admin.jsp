<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>
<html xmlns="http://www.w3.org/1999/xhtml">
 <%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>

<html>
<head>
<title>PASO TRACKER</title>




<link href="Shows.css" rel="stylesheet" type="text/css" />
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
    <link href="buttons.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="themes/base/jquery.ui.all.css"/>
    <link href="style.css" rel="stylesheet" type="text/css" />


        <script type="text/javascript" src="scripts/Shows_Placement.js"></script>
        <script type="text/javascript" src="scripts/jscCommon.js"></script>


<script>



function moveCurrent(){
    
		var counter = 0;
        counter = document.forms[0].Class_Number.value;        
       
        document.forms[0].method = "post";
        document.forms[0].action = "Shows_Score_Admin.jsp?DmdCde="+counter;
        document.forms[0].target = "_self";
        document.forms[0].submit();
}

function moveNext(varTotalRecs){

       var counter = 0;
        counter = parseInt(document.forms[0].hidden.value) + 1;
         
        if(varTotalRecs == counter){
            alert('This is the last Class in the show')
            return false;
            
        }
            
        
        document.forms[0].hidden.value = counter;
        document.forms[0].method = "post";
        document.forms[0].action = "Shows_Score_Admin.jsp"; 
		 document.forms[0].target = "_self";
          document.forms[0].submit();
}

 function movePrevious(){
     var counter = 0;
        counter = parseInt(document.forms[0].hidden.value) - 1;
        if(counter < 0){
            alert('This is the First Class for this Show')
            return false;
        }
        
        document.forms[0].hidden.value = counter;
        document.forms[0].method = "post";
        document.forms[0].action = "Shows_Score_Admin.jsp"; 
        document.forms[0].target = "_self";
        document.forms[0].submit();
}

 function fnReset_Show_Admin(){

		document.forms[0].hidden.value = 0;
        document.forms[0].method = "post";
        document.forms[0].action = "Shows_Score_Admin.jsp"; 
        document.forms[0].target = "_self";
        document.forms[0].submit();
}


</script>
<style>
.center {
    text-align: center;
}

.pagination {
    display: inline-block;
}

.pagination a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color .3s;
    border: 1px solid #ddd;
    margin: 0 4px;
	font-size: 22px;
}

.pagination a.active {
    background-color: #4CAF50;
    color: white;
    border: 1px solid #4CAF50;
}


.pagination a:hover:not(.active) {background-color: #ddd;}
</style>

</head>

<body>
 <form name="frmShow">
<div id="container">

            <div id="header">
                 <%@ include file="frmHeader.jsp"%>
            </div>

			<%
		
			int rows = 1;
			String strCurrentClassSelected = "";
			String currentEventSeq = "0";
			String strLastClassNumber = "0";
			int hdnIncremnter = 0;
			
			String strEventOrder="";
			String strEventDate="";
			String strEvnName="";
			
			 String strStTime = "";
			String strEndTime = "";
			String strDuration = "00:00:00";
			//String[] strDuration_ = strDuration.split(":");
		  
		  
		if(!bShows)
		response.sendRedirect("login.jsp");

            String strShowSeq_Head="";
            String strShowName_Head="";

        if (session.getAttribute("CommonShowSeq")!=null)
            strShowSeq_Head=(String)session.getAttribute("CommonShowSeq");
        if (session.getAttribute("CommonShowName")!=null)
            strShowName_Head=(String)session.getAttribute("CommonShowName");
		if(strShowName_Head.trim().length() ==0)
			strShowName_Head="Please select Show";
			
			
			 Connection connection1 = null;
			 Statement statement1 = null;
			 ResultSet resultset1 = null;
			 
			 CallableStatement cst_Evn_Info = null;
			 ResultSet rs_Evn_Info = null;
			 
			try{
			 DbConnMngr dbcmt1=new DbConnMngr();
			 
			  if (request.getParameter("hidden") != null && request.getParameter("hidden").trim().length()>0) {
					hdnIncremnter = Integer.parseInt(request.getParameter("hidden"));
					strCurrentClassSelected = "0";
				}
		
			 // This is used when the Users Type in the Code in the Placements
				if(request.getParameter("DmdCde") != null && request.getParameter("DmdCde").trim().length()>0){
						strCurrentClassSelected = request.getParameter("DmdCde");
				}
			
			connection1 = dbcmt1.getConnection();
            statement1 = connection1.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            resultset1 = statement1.executeQuery("select Event_Seq,Name,Event_Order from Events "
                    + " where Show_Seq=" + strShowSeq_Head + " And isNull(EventStatus,'A')='A' Order by Cast(Event_Order As Int)");
			resultset1.last();
            rows = resultset1.getRow();
			resultset1.beforeFirst();
            if(rows==0)
                rows=1; // This is because we are using Array 
			
			 int RecordCnt = 0;
			 
			 
			String[] Arry_EventsOrder = new String[rows];
			  String[] Arry_EventsSeq = new String[rows];
			  
			  while (resultset1.next()) {
                
				 if(resultset1.getString("Event_Order").equals(strCurrentClassSelected)){
                          hdnIncremnter=RecordCnt;
                      }
                
                Arry_EventsOrder[RecordCnt] = resultset1.getString("Event_Order");
                Arry_EventsSeq[RecordCnt] = resultset1.getString("Event_Seq");
                RecordCnt += 1;
            }
			
			if (strCurrentClassSelected.equals("") || strCurrentClassSelected == null) {
                if(Arry_EventsOrder.length > 1)
                    strCurrentClassSelected = Arry_EventsOrder[0];
                if(Arry_EventsSeq.length > 1)
                    currentEventSeq = Arry_EventsSeq[0];
                 
            } 
          
            else {
               if(RecordCnt>0){
                strCurrentClassSelected = Arry_EventsOrder[hdnIncremnter];
                currentEventSeq = Arry_EventsSeq[hdnIncremnter];
               }
            }
			
			if(Arry_EventsOrder.length >1)
                strLastClassNumber = Arry_EventsOrder[rows - 1];
			
			Cookie c = new Cookie("CookieLastClass",URLEncoder.encode(strCurrentClassSelected, "UTF-8") );
            response.addCookie(c);
			
			
			cst_Evn_Info = connection1.prepareCall("{call SM_GET_EVENT_INFORMATION(?,?)}");
			cst_Evn_Info.setString(1, strShowSeq_Head);
			cst_Evn_Info.setString(2, currentEventSeq);
			rs_Evn_Info = cst_Evn_Info.executeQuery();
			
			if(rs_Evn_Info.next()){
				strEventDate = rs_Evn_Info.getString("Event_Date");
				strEvnName = rs_Evn_Info.getString("Name");
				
				if(rs_Evn_Info.getString("EventStartTime")!=null)
					strStTime=rs_Evn_Info.getString("EventStartTime");
				
				if(rs_Evn_Info.getString("EventEndTime")!=null)
					strEndTime = rs_Evn_Info.getString("EventEndTime");
				
				if(rs_Evn_Info.getString("Duration")!=null)
					strDuration = rs_Evn_Info.getString("Duration");
			
			}
			
			
			
			}
			catch(Exception ex){
				
			}
			finally{
				
				if (connection1 != null) {
                connection1.close();
            }
            if (statement1 != null) {
                statement1.close();
            }
			if(cst_Evn_Info!=null)
				cst_Evn_Info.close();
			
			 if (resultset1 != null) {
                resultset1.close();
            }
			
            if (rs_Evn_Info != null) {
                rs_Evn_Info.close();
            }
			
			}
			
			
			String strResultsURL="Shows_Score_Admin_Include.jsp?mode=0&ShowSeq="+strShowSeq_Head+"&EventSeq="+currentEventSeq;
			String[] strDuration_ = strDuration.split(":");
           
    %>


        <div id="content">
            <fieldset>


<div class="center">
<h2><span id='Shows' name="Shows" ><%=strShowName_Head%><span> &nbsp;<img alt="" src="Images/Find.gif" onClick="Search_Shows('ShowsSeq','Shows')"/></h2><br>
  <div class="pagination">
    <a href="#">&laquo;</a>
	<a href="#" onClick="movePrevious()" ><</a>
    <a href="#" ><input type="text" size=1 Name="Class_Number" VALUE="<%=strCurrentClassSelected%>" onChange="moveCurrent()">
	</a>
    <a href="#" ><input type="text" ReadOnly value=<%=rows%>  size=1></a>
  
	<a href="#" onClick="moveNext(<%=rows%>)" >> </a>
    <a href="#">&raquo;</a>
  </div>
<br>

        <h3><font color="blue"> <%=strEventOrder%> </font> <%=strEvnName%> <font color="blue"> <%=strEventDate%> </font></h3>
     
	
	</div>

            <table width="100%">
            <tr>
          
            <td width=100">
           
                <input type="hidden" id="ShowsSeq" name="ShowsSeq" value="<%=strShowSeq_Head%>" />
				<input type="hidden" id="EventSeq" Name="EventSeq" value='<%=currentEventSeq%>'/>
				
				<input type="hidden"    VALUE="<%= hdnIncremnter%>" name="hidden">
               
            </td>
            </tr>
		             
            </table>
	
			 


            </fieldset>


            
            
			<%@ include file="Shows_Score_Admin_Include.jsp"%>
    




        </div>


        <div id="sidebar">
        <%@ include file="Shows_Placement_Side.jsp"%>

        </div>


</div>

 <div id="dialog" title="F1-F2" style="display:none; background:url('Images/trans-wood-1.png')">
<iframe   src="blank.jsp"  id="F1F2" width="100%" height="550"
marginwidth="0" marginheight="0" frameborder="0" >
</iframe>
</div>


<div id="dialog-Show"  style="display:none; background:url('Images/trans-wood-1.png')">
<iframe  src="blank.jsp"  id="modalIFrame_ShowList" width="100%" height="100%" marginwidth="0" marginheight="0"
         frameborder="0"  >
</iframe>
</div>

<div id="Participant_Details"  title="Participant Details "style="display:none; background:url('Images/trans-wood-1.png')">
<iframe  src="blank.jsp"  id="IFrame_Participant_Details" width="100%" height="100%" marginwidth="0" marginheight="0"
         frameborder="0"  >
</iframe>
</div>

<div id="dialog-Notes"  style="display:none; background:url('Images/trans-wood-1.png')">
<iframe  src="blank.jsp"  id="modalIFrame_Notes" width="100%" height="100%" marginwidth="0" marginheight="0"
         frameborder="0"  >
</iframe>
</div>







</form>



</body>
</html>