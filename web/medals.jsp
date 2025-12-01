
<%@ page import = "java.util.Iterator"%>
<%@ page import = "java.util.List"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
  <title>PASOTRACKER</title>

<head>
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
  font-size: 22px;
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

</style>

<script>
function Navigate(Show,varCountry,varCntryDesc)
{

	      document.forms[0].txtCntryValue.value=varCntryDesc;
		 document.forms[0].method="post";
		  document.forms[0].action="medaldetails.jsp?cntry="+varCountry;
		  document.forms[0].submit();
}

  function goBack1()
  {
  window.location.href = 'medals.jsp';
  }

  function goHome1()
  {
	 
	window.location.href = 'medals.jsp';
  }

  function RefreshResults(objValue)
  {
	      document.forms[0].method="post";
		  document.forms[0].action="medals.jsp"
		  document.forms[0].submit();
  }

</script>
</head>
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

 

<form>
<%


	    Connection localConnection=null;
        DbConnMngr dbcmt=new DbConnMngr();
		ResultSet rs1=null;
		CallableStatement cst=null;

    try
{     
		String showName="";
       

        String strShowSeq="24";
		if(request.getParameter("show")!=null)
		{
			strShowSeq=request.getParameter("show");
			strShowSeq=strShowSeq.substring(0,2);
		}
		
		

	%>	

	<table align="center" class="tPasoHead" >
	<thead>
	<th><font size="5" >11VA MUNDIAL DE JINETES Y AMAZONAS CONFEPASO 2016 (07/21/2016 - 07/24/2016)</font></th>
	</thead>    

	</table>
<br>
	   <table align="center" class="tPasoHead" >
	   <thead>
       <th><font size="3" >Medals</font></th>
       </thead> 
      
     </table>

<br>




    

<div id=""></div>
<div id="content">
<table class="tPaso" id="New-Paso">
<thead>
<th  data-class="expand" width="5%">&nbsp;</th>
<th  data-class="expand" width="10%">COUNTRY</th>
<th  data-class="expand" width="5%">GOLD</th>
<th  data-class="expand" width="5%">SILVER</th>
<th  data-class="expand" width="5%">BRONZE</th>
<th  data-class="expand" width="5%">TOTAL MEDALS</th>
<th  data-class="expand" width="5%">TOTAL POINTS</th>
<th  data-class="expand" width="5%">&nbsp;</th>

  </thead>
  
  <%
		    localConnection=dbcmt.getConnection();
            cst = localConnection.prepareCall("{call GET_Medals_Mundial_ByCountry_Equi(?)}");
            cst.setString(1,"24");
           
           


        rs1 = cst.executeQuery();
	    while (rs1.next())
        {%>

			 <tr style="cursor: pointer;" onClick="Navigate( <%=strShowSeq%>,'<%=rs1.getString("represent_Country") %>' ,'<%=rs1.getString("Country") %>')" >

			<td style="text-align:center;"><img src="img/<%=rs1.getString("Country")%>.jpeg" height="50%"></td>
			<td  ><%=rs1.getString("Country") %></td>
			<td style="text-align:center; vertical-align:middle;"><%=rs1.getString("GOLD") %></td>
			<td  style="text-align:center; vertical-align:middle;"><%=rs1.getString("Silver") %></td>
			<td style="text-align:center; vertical-align:middle;"><%=rs1.getString("Bronze") %></td>
			<td style="text-align:center; vertical-align:middle;"><%=rs1.getString("Total") %></td>
			<td style="text-align:center; vertical-align:middle;"><%=rs1.getString("Points") %></td>
			<td style="text-align:center; vertical-align:middle;cursor: pointer;"  ><a onClick="Navigate( <%=strShowSeq%>,'<%=rs1.getString("represent_Country") %>' ,'<%=rs1.getString("Country") %>')"><font size='2'>View Details</font></a></td>
			 </tr>

            			
			
        <%}
		}	
			catch(Exception ex)
			{
				ex.printStackTrace();
			
			}
			finally
			{
				dbcmt.releaseConnection(localConnection);
				rs1.close();
				cst.close();
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
	<td><input type="hidden" name="txtCntryValue"> </td>
</form>