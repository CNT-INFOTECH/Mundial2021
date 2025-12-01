
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

		    <td valign="left" align="left" width="40%">POWERED BY&nbsp;&nbsp;
			<a href="http://www.cntinfotech.com" target="_blank" style="text-decoration: none">

			<img src="Images/cntit_small.png" align="center"  style="border-style: none"/></a> &nbsp;&nbsp;&nbsp;  ALL&nbsp;RIGHTS&nbsp;RESERVED</td>

		    <td valign="left" align="left"><img src="Images/Pasologo.png" /> 
            
           
			 <td valign="right" align="right">
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
		int TotalbyCountry=0;

    try
{     
		String showName="";
       

        String strShowSeq="61";
		if(request.getParameter("show")!=null)
		{
			strShowSeq=request.getParameter("show");
			strShowSeq=strShowSeq.substring(0,2);
		}
		
		String strAire="";
		String strCategory="";
		String strCountry="";

		if(request.getParameter("hdnCategory")!=null)
			strCategory=request.getParameter("hdnCategory");

		if(request.getParameter("cntry")!=null)
			strCountry=request.getParameter("cntry");
		
		String strCategoryToPrint=strCategory;

		if(strCategory.equals("T"))
		{
			strAire="";
			strCategoryToPrint="TOTAL";
		}
		if(strCategory.equals(""))
	   {
			strAire="";
			strCategoryToPrint="TOTAL";
	   }
		else if (strCategory.equals("Pasofino"))
			strAire="Pasofino";
		else if (strCategory.equals("Pleasure"))
			strAire="Pasofino";
		else if (strCategory.equals("Performance"))
			strAire="Pasofino";
		else if (strCategory.equals("Trocha"))
			strAire="Trocha";
		else if (strCategory.equals("Trocha y galope"))
			strAire="Trocha y galope";
		else if (strCategory.equals("Trote y galope"))
			strAire="Trote y galope";

	%>	

	<table align="center" class="tPasoHead" >
	<thead>
	<th><font size="5" >11 Mundial Caballos de Paso Confepaso Miami, Florida 2013 (10/24/2013 - 10/27/2013)</font></th>
	</thead>    

	</table>


<table align="center" >
       <td ><span ><font><h3><font color="blue"> <%=strCountry %> </font> <%=strCategoryToPrint %>  </h3></font></span></td>
       
        </td>
     </table>

<table class="tPaso">
<thead>
<th  data-class="expand" width="15%">HORSE</th>
<th  data-class="expand" width="15%">EVENT</th>
<th  data-class="expand" width="15%">PADRE/SIRE</th>
<th  data-class="expand" width="15%">MADRE/DAM</th>
<th  data-class="expand" width="15%">DUEÑO/OWNER</th>
<th  data-class="expand" width="15%">MONTADOR/RIDER</th>

<th  data-class="expand" width="5%">POS</th>
<th  data-class="expand" width="5%">POINTS</th>
  </thead>
  
  <%
		    localConnection=dbcmt.getConnection();
            cst = localConnection.prepareCall("{call GET_POINTS_ByCountry_Horses_Details(?,?,?,?,?,?)}");
            cst.setString(1,"24");
            cst.setString(2, "");
            cst.setString(3,strCountry);
            cst.setString(4, "");
			cst.setString(5, strAire);
			cst.setString(6, strCategory);
           


        rs1 = cst.executeQuery();
		
	    while (rs1.next())
        {
			int points=rs1.getInt("Points");
			TotalbyCountry=TotalbyCountry+points;
			%>

			
			 <tr>

			
			 <td class="contact"><%=rs1.getString("HName") %></td>
			 <td class="contact"><%=rs1.getString("Name") %> ( <%=rs1.getString("Event_Order") %> ) </td>
				<td class="contact"><%=rs1.getString("Sire") %></td>
				<td class="contact"><%=rs1.getString("Dam") %></td>
				<td class="contact"><%=rs1.getString("OwnerName") %></td>
				<td class="contact"><%=rs1.getString("Rider") %></td>
			  <td class="contact"><%=rs1.getString("Placement") %></td>
			    <td class="contact"><%=rs1.getString("Points") %></td>
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
	<tr>
	<td colspan=7 style="text-align:center"> <font size="5" >TOTAL</font></td>
	<td > <font size="5" ><%=TotalbyCountry%></font></td>
	</tr>
	</table>

	</form>