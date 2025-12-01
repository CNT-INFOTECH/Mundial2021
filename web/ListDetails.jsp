
<%@ page import = "java.util.Iterator"%>
<%@ page import = "java.util.List"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>
<head>
<title>PASOTRACKER</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


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


  function goBack1()
  {
  window.history.go(-2);
  }

  function goHome1()
  {
	 
	window.location.href = 'http://www.pasotraker.com';
  }
  function RefreshResults(objValue)
  {
	      document.forms[0].method="post";
		  document.forms[0].action="ListSires.jsp"
		  document.forms[0].submit();
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

   int TotalPoints=0;
try
{
        String strShowSeq="24";
		if(request.getParameter("ShowSeq")!=null)
		{
			strShowSeq=request.getParameter("ShowSeq");
			strShowSeq=strShowSeq.substring(0,2);
		}


		
		String SelectedSeq="";
		String strHeaderCategory="";
		String showName="";
		String strAire="";
		String strCategory="";
		String SelectedSeqName="";
		int expType=1;


		if(request.getParameter("Seq")!=null)
		{
			SelectedSeq=request.getParameter("Seq");
		
		}

		if(request.getParameter("expType")!=null)
		{
			expType=Integer.parseInt(request.getParameter("expType"));
		
		}

		if(request.getParameter("Name")!=null)
		{
			SelectedSeqName=request.getParameter("Name");
		
		}

		
		



		if(request.getParameter("chkCategory")!=null)
			strCategory=request.getParameter("chkCategory");

		if(strCategory.equals(""))
			strAire="Pasofino";
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

			

			if (expType==1)
				SelectedSeqName = "Points by Sire/ Puntos por Padre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"  +SelectedSeqName;
            else if (expType==2)
				SelectedSeqName = "Points by Dam / Puntos por Madre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"  +SelectedSeqName;
			else if (expType==3)
				SelectedSeqName = "Points by Breeder/ Puntos por Criador&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"  +SelectedSeqName;
			else if (expType==4)
				SelectedSeqName = "Points by Owner/ Puntos por Expositor&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"  +SelectedSeqName;
			else if (expType==5)
				SelectedSeqName = "Points by Rider/ Puntos por Montador&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"  +SelectedSeqName;
			else if (expType==6)
				SelectedSeqName = "Points by AO/ Puntos por DUEÑOS MONTADOS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"  +SelectedSeqName;

if(strShowSeq.length() >0 )
	{
		Connection localConnection=null;
        DbConnMngr dbcmt=new DbConnMngr();

		

	if(strShowSeq.equals("24"))
		{

%>
	<table align="center" class="tPasoHead" >
	<thead>
	<th><font size="5" >11 Mundial Caballos de Paso Confepaso Miami, Florida 2013 (10/24/2013 - 10/27/2013)</font></th>
	</thead>    

	</table>
	<%}
	else if (strShowSeq.length() >0 ){

		ResultSet rs2=null;
		CallableStatement cst1=null;
		try{
		 localConnection=dbcmt.getConnection();
		 
           cst1 = localConnection.prepareCall("{call GET_SHOW_INFORMATION(?,?,?,?)}");
            cst1.setString(1,"");
            cst1.setString(2, "");
            cst1.setString(3,"");
            cst1.setString(4, strShowSeq);
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
<br>

  <table align="center" class="tPasoHead" >
	   <thead>
       <th><font size="3" ><%=SelectedSeqName%></font></th>
       </thead> 
      
     </table>


 
<br>


<table class="tPaso">
      <thead>
<th data-class="expand"  width="10%" >HORSE</th>
<!--<th  data-class="expand" >#</th>-->
<th data-class="expand"  width="20%" >EVENT NAME</th>

<th  data-class="expand" width="15%">PADRE/SIRE</th>
<th  data-class="expand" width="15%">MADRE/DAM</th>
<th  data-class="expand" width="15%">DUEÑO/OWNER</th>
<th  data-class="expand" width="15%">MONTADOR/RIDER</th>

<th data-class="expand"  width="5%" >POINTS</th>



</thead>  <%

       

      
		

        try
        {
            localConnection=dbcmt.getConnection();
            localConnection.setAutoCommit(false);
			
            CallableStatement cst = localConnection.prepareCall("{call [GET_POINTS_MODALITY_WS_DETAILS](?,?,?,?,?)}");
            cst.setString(1,strShowSeq);
            cst.setString(2,strAire);
			cst.setString(3,strCategory);
			cst.setInt(4,expType);
			 cst.setString(5,SelectedSeq);

        ResultSet rs1 = cst.executeQuery();
		
         while (rs1.next())
        {
			 int points=rs1.getInt("Points");
			 TotalPoints=TotalPoints+points;
			 %>
             <tr >
			

			
			<td style="text-transform: uppercase"><%=rs1.getString("Name")%></td> 

			<!--<td style="text-transform: uppercase"><%=rs1.getString("AssignedNum")%></td> -->
			<td style="text-transform: uppercase"><%=rs1.getString("Event_Order")%> - <%=rs1.getString("EventName")%> </td>
			<td style="text-transform: uppercase"><%=rs1.getString("SireName")%></td> 
			<td style="text-transform: uppercase"><%=rs1.getString("DamName")%></td> 
			<td style="text-transform: uppercase"><%=rs1.getString("OwnerName")%></td> 
			<td style="text-transform: uppercase"><%=rs1.getString("HRider")%></td> 
			<td style="text-transform: uppercase"><%=points%></td>

			

			
			


			
		
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
		}

}
catch(Exception Ex)
{
	 out.println("There is a problem with your Request. Please try again later");
}

  %>

	<tr>
	<td colspan=6 style="text-align:center"> <font size="5" >TOTAL</font></td>
	<td > <font size="5" ><%=TotalPoints%></font></td>
	</tr>
  </table>
 </form>
