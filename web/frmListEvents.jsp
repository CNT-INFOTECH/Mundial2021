
<%@ page import = "java.util.Iterator"%>
<%@ page import = "java.util.List"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>

 
<title>PASOTRACKER</title>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <style>
 
 
 #New-Paso {
    background-image: url('Images/PasoTracker_Image_10.png');
    background-repeat: no-repeat;
    z-index: 0;
    background-position: center;
	background-size: 1000px;
}
@media only screen and (max-width: 980px) and (min-width: 768px) {
#New-Paso {
    background-size: 600px;
}
}
@media only screen and (max-width: 767px) and (min-width: 480px) {
#New-Paso {
    background-size: 300px;
}
}
@media only screen and (max-width: 479px) and (min-width: 360px) {
#New-Paso {
    background-size: 200px;
}
}
#content {
    z-index:1;
    position:relative;
}
.tPaso > thead > tr > th,.tPaso > thead > tr > td {
  position: relative;
}

.tPaso {
  border-spacing: 0;
  width: 100%;
  border: solid #ccc 1px;
  -moz-border-radius: 6px;
  -webkit-border-radius: 6px;
  border-radius: 6px;
  font-family: 'trebuchet MS' , 'Lucida sans' , Arial;
  font-size: 12px;
  font-weight:bold;
  color: #444;
}

.tPaso.breakpoint > tbody > tr > td.expand {
  background: url('img/plus.png') no-repeat 5px center;
  padding-left: 10px;
}

.tPaso.breakpoint > tbody > tr.tPaso-detail-show > td.expand {
  background: url('img/minus.png') no-repeat 5px center;
}

.tPaso.breakpoint > tbody > tr.tPaso-row-detail {
  background: #eee;
}

.tPaso > tbody > tr:hover {
  background: #2E9AFE;
}

.tPaso.breakpoint > tbody > tr:hover:not(.tPaso-row-detail) {
  cursor: pointer;
}

.tPaso > tbody > tr > td, .tPaso > thead > tr > th {
  border-left: 1px solid #ccc;
  border-top: 1px solid #ccc;
  padding: 5px;
  text-align: left;
}

.tPaso > thead > tr > th, .tPaso > thead > tr > td {
  background-color: #dce9f9;
  background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc), to(#dce9f9));
  background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
  background-image: -moz-linear-gradient(top, #ebf3fc, #dce9f9);
  background-image: -ms-linear-gradient(top, #ebf3fc, #dce9f9);
  background-image: -o-linear-gradient(top, #ebf3fc, #dce9f9);
  background-image: linear-gradient(to bottom, #ebf3fc, #dce9f9);
  -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;
  -moz-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;
  box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;
  border-top: none;
  text-shadow: 0 1px 0 rgba(255,255,255,.5);
}

.tPasoHead {
  border-spacing: 0;
  width: 100%;
  border: solid #ccc 1px;
  -moz-border-radius: 6px;
  -webkit-border-radius: 6px;
  border-radius: 6px;
  font-family: 'trebuchet MS' , 'Lucida sans' , Arial;
  font-size: 12px;
  color: #444;
}



.tPasoHead > tbody > tr > td, .tPaso > thead > tr > th {
  border-left: 1px solid #ccc;
  border-top: 1px solid #ccc;
  padding: 5px;
  text-align: center;
}


.tPasoHead > thead > tr > th, .tPaso > thead > tr > td {
  background-color: #dce9f9;
  background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc), to(#dce9f9));
  background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
  background-image: -moz-linear-gradient(top, #ebf3fc, #dce9f9);
  background-image: -ms-linear-gradient(top, #ebf3fc, #dce9f9);
  background-image: -o-linear-gradient(top, #ebf3fc, #dce9f9);
  background-image: linear-gradient(to bottom, #ebf3fc, #dce9f9);
  -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;
  -moz-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;
  box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;
  border-top: none;
  text-shadow: 0 1px 0 rgba(255,255,255,.5);
}

.tPaso > tbody img {
  vertical-align:middle;
}

 .bottomtype
    {
        font-family: Lucida Sans Unicode, Lucida Grande, Sans-Serif;
	font-size: 12px;
	width: 100%;
	text-align: center;
	border-collapse: collapse;
    }
	
.tooltip {
    position: relative;
    display: inline-block;
    /*border-bottom: 1px dotted black;*/
}

.tooltip .tooltiptext {
    visibility: hidden;
    
    /*background-color: black;*/
    
    color: black;
    text-align: center;
    border-radius: 6px;
    padding: 5px 0;
	font-weight:bold;
	font-size:20px;
	
    /* Position the tooltip */
    position: absolute;
    z-index: 1;
	top: -5px;
    right: 155%;
}

.tooltip:hover .tooltiptext {
    visibility: visible;
}

</style>
<script>

  function fnBannerScreens(url,showSq,eventSq){    
    if(showSq=='' || eventSq=='')
        return false;        
    
    var d= new Date();      
    
    //window.location.href=url+".jsp?sSq="+showSq+"&eSq="+eventSq+"&"+d.getTime();      
	document.forms[0].method="post";
    document.forms[0].action=url+".jsp?sSq="+showSq+"&eSq="+eventSq+"&"+d.getTime();    
    document.forms[0].target="_blank";
    document.forms[0].submit();
}
function Navigate(Show,Event,session)
{
	window.location.href="frmListEventsParticipants.jsp?"+session+"&show="+Show+session+"&event="+Event+"_"+session;
}

  function goBack1()
  {
	window.location.href = 'frmListShows.jsp';
  }

  function goHome1()
  {
	 
	window.location.href = 'frmListShows.jsp';
  }

  
</script>
</head>
<body><form>
       <table class="bottomtype" width="200" align="center">
           <tr >

		    <!--<td valign="left" align="left" width="40%">POWERED BY&nbsp;&nbsp;
			<a href="http://www.cntinfotech.com" target="_blank" style="text-decoration: none">

			<img src="Images/cntit_small.png" align="center"  style="border-style: none"/></a> &nbsp;&nbsp;&nbsp;  ALL&nbsp;RIGHTS&nbsp;RESERVED</td>-->

		    <td valign="left" align="left"><img src="Images/MundialImage.png"   width='100%'/> 
            </td>
           
			 <td valign="right" align="right" nowrap width='10%'> 
			 <a href="#" onClick="goHome1()" style="text-decoration: none"> <img   src="Images/Home.jpg" align="right"  style="border-style: none" /></a>
			 <a href="#" onClick="goBack1()" style="text-decoration: none"> <img  src="Images/back.png" align="right"  style="border-style: none" /></a> </td>
			
            
        </tr>
    </table>
<%

		Connection localConnection=null;
        DbConnMngr dbcmt=new DbConnMngr();

 String strShow="";
		if(request.getParameter("show")!=null)
			strShow=request.getParameter("show");
	     String strSessionID=request.getRequestedSessionId() ;
       
		String showName="";

		if(strShow.equals("56"))
		{

%>
	<table align="center" class="tPasoHead" >
	<thead>
	<th><font size="5" >11 Mundial Caballos de Paso Confepaso Miami, Florida 2013 (10/24/2013 - 10/27/2013)</font></th>
	</thead>    

	</table>
	<%}
	else if (strShow.length() >0 ){

		ResultSet rs2=null;
		CallableStatement cst1=null;
		try{
		 localConnection=dbcmt.getConnection();
		 
           cst1 = localConnection.prepareCall("{call GET_SHOW_INFORMATION(?,?,?,?)}");
            cst1.setString(1,"");
            cst1.setString(2, "");
            cst1.setString(3,"");
            cst1.setString(4, strShow);
			rs2 = cst1.executeQuery();
			 while (rs2.next())
             {
				 showName=rs2.getString("Show_Name");
			 }
		}
		catch(Exception ex)
		{
			dbcmt.releaseConnection(localConnection);
		}
		finally
		{
			rs2.close();
			cst1.close();
		}

	%>

	<table align="center" class="tPasoHead" >
	<thead>
	<th><font size="5" ><%=showName%></font></th>
	</thead>    

	</table>
	<%}%>

<br><br>
<div id=""></div>
<div id="content">
<table class="tPaso" id="New-Paso">
<thead>

<th  data-class="expand" >Event Order</th><th  data-class="expand" >Event Date</th><th  data-class="expand"  >Event Name</th>
<th  data-class="expand"  ># Participants</th>
<th  data-class="expand"  >Status</th></thead> 
  
  <%


        try
        {
            localConnection=dbcmt.getConnection();
            localConnection.setAutoCommit(false);
            CallableStatement cst = localConnection.prepareCall("{call GET_EVENT_INFORMATION_WS(?,?,?,?,?, ?,?,?)}");
            cst.setString(1,strShow);
            cst.setString(2, "");
            cst.setString(3,"");
            cst.setString(4, "");
            cst.setString(5, "");
            cst.setString(6, "");
            cst.setString(7,"");
            cst.setString(8, "");


//		Map obj=new LinkedHashMap();
        ResultSet rs1 = cst.executeQuery();
	    while (rs1.next())
        {%>

			 <tr style="cursor: pointer;" >

			 <td class="contact" onClick="Navigate( <%=strShow%>,<%=rs1.getString("Event_Seq") %>,'<%=strSessionID%>') " >
			 <%=rs1.getString("Event_Order")%></td>
			 <td class="contact" onClick="Navigate( <%=strShow%>,<%=rs1.getString("Event_Seq") %>,'<%=strSessionID%>') " ><%=rs1.getString("Event_Date")%></td>
			 <td class="contact" onClick="Navigate( <%=strShow%>,<%=rs1.getString("Event_Seq") %>,'<%=strSessionID%>') " ><%=rs1.getString("Name")%></td>
			 <td class="contact" onClick="Navigate( <%=strShow%>,<%=rs1.getString("Event_Seq") %>,'<%=strSessionID%>') " ><%=rs1.getString("Cnt")%></td>
			 <td class="contact" onClick="Navigate( <%=strShow%>,<%=rs1.getString("Event_Seq") %>,'<%=strSessionID%>') " ><%=rs1.getString("EventStat")%>
							
			 </td>
		<%--	 <td>
			 <%if(Integer.parseInt(rs1.getString("Cnt"))>0){%><div class="tooltip">
			 <a href="#" onClick="fnBannerScreens('Shows_ResultBanner','<%=strShow%>','<%=rs1.getString("Event_Seq")%>')" >J</a>
			 <span class="tooltiptext">Judges' Card</span>
              </div>
			 <%}%></td>

			 <td>
			 <%if(Integer.parseInt(rs1.getString("Cnt"))>0){%><div class="tooltip">
			 <a href="#" onClick="fnBannerScreens('Shows_FinalResultBanner','<%=strShow%>','<%=rs1.getString("Event_Seq")%>')" >F</a>
			 <span class="tooltiptext">Final Placement</span>
              </div>
			 <%}%></td>--%>
			 </tr>

            			
			
        <%}


                    rs1.close();
                    cst.close();

                    //localConnection.commit();
                    dbcmt.releaseConnection(localConnection);

		}
                catch(Exception ex)
		{
			ex.printStackTrace();
                                try
				{
                                        System.out.println("release:");
				   if(localConnection != null)
					{
						localConnection.rollback();
						dbcmt.releaseConnection(localConnection);
					}
				}
                                catch(SQLException exc)
				{
					exc.printStackTrace();
				}

		}

    %>
	</table>
	</div>
	<table class="bottomtype" width="200" style='text-align:center;' >
           <tr >

		    <td  width="40%"><br><br>POWERED BY&nbsp;&nbsp;
			<a href="http://www.cntinfotech.com" target="_blank" style="text-decoration: none">

			<img src="Images/cntit_small.png" align="center"  style="border-style: none"/></a> &nbsp;&nbsp;&nbsp;  ALL&nbsp;RIGHTS&nbsp;RESERVED</td>
        </tr>
    </table>
</form></body>
</html>