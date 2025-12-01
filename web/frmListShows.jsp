
<%@ page import = "java.util.Iterator"%>
<%@ page import = "java.util.List"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
  <title>PASOTRACKER</title>

<head>
<style>
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
  background: #fbf8e9;
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

</style>

<script>
function Navigate(Show,session)
{
	
	window.location.href="frmListEvents.jsp?"+session+"&show="+Show;
}

  function goBack1()
  {
  window.history.go(-2);
  }

  function goHome1()
  {
	 
	window.location.href = 'http://www.pasotraker.com';
  }
</script>
</head>

 <table class="bottomtype" width="200" align="center">
           <tr >

		    <!--<td valign="left" align="left" width="40%">POWERED BY&nbsp;&nbsp;
			<a href="http://www.cntinfotech.com" target="_blank" style="text-decoration: none">

			<img src="Images/cntit_small.png" align="center"  style="border-style: none"/></a> &nbsp;&nbsp;&nbsp;  ALL&nbsp;RIGHTS&nbsp;RESERVED</td>-->

		    <td valign="left" align="left"><img src="Images/WorldCup_Report_Center.png"   width='100%'/> 
            </td>
           
			 <td valign="right" align="right" nowrap width='10%'> 
			 <a href="#" onClick="goHome1()" style="text-decoration: none"> <img   src="Images/Home.jpg" align="right"  style="border-style: none" /></a>
			 <a href="#" onClick="goBack1()" style="text-decoration: none"> <img  src="Images/back.png" align="right"  style="border-style: none" /></a> </td>
			
            
        </tr>
    </table>

	

<br><br>
<table class="tPaso">
<thead>

<th  data-class="expand" width="50%">SHOW NAME</th><th  data-class="expand" width="10%">SHOW PLACE</th>
<th  data-class="expand" width="10%">SHOW PERIOD</th>
  </thead> <%

       Connection localConnection=null;
        DbConnMngr dbcmt=new DbConnMngr();

         String strShow="";
		 String strSessionID=request.getRequestedSessionId() ;
		      


        try
        {
            localConnection=dbcmt.getConnection();
            localConnection.setAutoCommit(false);
            CallableStatement cst = localConnection.prepareCall("{call GET_SHOW_INFORMATION(?,?,?,?)}");
            cst.setString(1,"");
            cst.setString(2, "");
            cst.setString(3,"");
            cst.setString(4, "");
           


//		Map obj=new LinkedHashMap();
        ResultSet rs1 = cst.executeQuery();
	    while (rs1.next())
        {
			if(rs1.getString("Show_From_Date") !=null )
			{
				String strDate=rs1.getString("Show_From_Date");
				String[] _strDate=strDate.split("/");
				strDate=_strDate[2];
					if(strDate.equals("2012") || strDate.equals("2011"))
						continue;
			}
			 strShow=rs1.getString("Show_Seq") ;
			%>

			 <tr style="cursor: pointer;" onClick="Navigate( <%=strShow%>,'<%=strSessionID%>') " >

			
			 <td class="contact"><%=rs1.getString("Show_Name") %></td>
			 <td class="contact"><%=rs1.getString("Show_Place") %></td>
			 <td class="contact"><%=rs1.getString("Show_From_Date") %> - <%=rs1.getString("Show_To_Date") %></td>
			  
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
					localConnection.rollback();
					dbcmt.releaseConnection(localConnection);
				}
                                catch(SQLException exc)
				{
					exc.printStackTrace();
				}

		}

    %>
	</table>
	<table class="bottomtype" width="200" style='text-align:center;' >
           <tr >

		    <td  width="40%"><br><br>POWERED BY&nbsp;&nbsp;
			<a href="http://www.cntinfotech.com" target="_blank" style="text-decoration: none">

			<img src="Images/cntit_small.png" align="center"  style="border-style: none"/></a> &nbsp;&nbsp;&nbsp;  ALL&nbsp;RIGHTS&nbsp;RESERVED</td>
        </tr>
    </table>
