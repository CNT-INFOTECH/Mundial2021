
<%@ page import = "java.util.Iterator"%>
<%@ page import = "java.util.List"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>
<head>
<title>PASOTRACKER</title>
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


  function goBack1(varShow)
  {
	window.location.href = 'frmListEvents.jsp?show='+varShow;
  }

  function goHome1()
  {
	 
	window.location.href = 'frmListShows.jsp';
  }
</script>
</head>
<%
		String strShowSeq="";
		if(request.getParameter("show")!=null)
		{
			strShowSeq=request.getParameter("show");
			strShowSeq=strShowSeq.substring(0,2);
		}
		%>

  <table class="bottomtype" width="200" align="center">
           <tr >

		    <!--<td valign="left" align="left" width="40%">POWERED BY&nbsp;&nbsp;
			<a href="http://www.cntinfotech.com" target="_blank" style="text-decoration: none">

			<img src="Images/cntit_small.png" align="center"  style="border-style: none"/></a> &nbsp;&nbsp;&nbsp;  ALL&nbsp;RIGHTS&nbsp;RESERVED</td>-->

		    <td valign="left" align="left"><img src="Images/MundialImage.png"   width='100%'/> 
            </td>
           
			 <td valign="right" align="right" nowrap width='10%'> 
			 <a href="#" onClick="goHome1()" style="text-decoration: none"> <img   src="Images/Home.jpg" align="right"  style="border-style: none" /></a>
			 <a href="#" onClick="goBack1('<%=strShowSeq%>')" style="text-decoration: none"> <img  src="Images/back.png" align="right"  style="border-style: none" /></a> </td>
			
            
        </tr>
    </table>

<%

   
try
{
       

		String strEventSeq="";
		if(request.getParameter("event")!=null)
	   {
			strEventSeq=request.getParameter("event");
			String[] _strEventSeq=strEventSeq.split("_");
			strEventSeq=_strEventSeq[0];
	    }


if(strShowSeq.length() >0 && strEventSeq.length() >0)
	{
		Connection localConnection=null;
        DbConnMngr dbcmt=new DbConnMngr();

		GetInterface GUI2=new GetInterface();
		
		ArrayList AlEventInfo=GUI2.GET_EVENT_INFORMATION(strShowSeq,strEventSeq);
        String strEventOrder=""+AlEventInfo.get(1);
        String strEventDate=""+AlEventInfo.get(2);
        String strEvnName=""+AlEventInfo.get(6);
        String strEventType=""+AlEventInfo.get(7);
		 String strShowName=""+AlEventInfo.get(8);
		 String strCategory=""+AlEventInfo.get(3); 

	if(strShowSeq.equals("56"))
		{

%>
	<table align="center" class="tPasoHead" >
	<thead>
	<th><font size="5" >11 Mundial Caballos de Paso Confepaso Miami, Florida 2013 (10/24/2013 - 10/27/2013)</font></th>
	</thead>    

	</table>
	<%}
	else{
	%>

	<table align="center" class="tPasoHead" >
	<thead>
	<th><font size="5" ><%=strShowName%></font></th>
	</thead>    

	</table>
	<%}%>



  <table align="center" >
       <td><span ><font><h3><font color="blue"> <%=strEventOrder %> </font> <%=strEvnName %> <font color="blue"> <%=strEventDate %> </font> </h3></font></span></td>
       
        </td>
     </table>
 
<br>

<div id=""></div>
<div id="content">
<table class="tPaso" id="New-Paso">
      <thead>
	  <th data-class="expand" ></th>
<th data-class="expand" >POS</th>
<th  data-class="expand" >EJEMPLAR#/ENTRY#</th>
<th data-class="expand" >PADRE/SIRE</th>
<th data-class="expand" >MADRE/DAM</th>
<th data-class="expand" >ABUELO MATERNO/GRAND SIRE</th>
<th data-class="expand" >DUEÑO/OWNER</th>
<th data-class="expand" >CRIADOR/BREEDER</th>
<th data-class="expand" >MONTADOR/RIDER</th>
<th data-class="expand" >COUNTRY</th>


</thead>  <%

       

      
		

        try
        {
            localConnection=dbcmt.getConnection();
            localConnection.setAutoCommit(false);
            CallableStatement cst = localConnection.prepareCall("{call GET_EVENT_PARTICIPANTS_WS(?,?)}");
            cst.setString(1,strShowSeq);
            cst.setString(2,strEventSeq);


        ResultSet rs1 = cst.executeQuery();
		int i=0;
         while (rs1.next())
        {
			String sEventType="";
			if(rs1.getString("EventType")!=null)
				sEventType=rs1.getString("EventType");
			%>
             <tr>
			
<td style='text-align:center;'><%if (rs1.getString("RepCountry")!=null && rs1.getString("RepCountry").length()>0) {%>&nbsp;<img src="img/<%=rs1.getString("RepCountry")%>.jpeg"  width='35%'><%}%></td>
			<% if(rs1.getString("Placement")!=null)
			{ %>
					
					<td class="contact"><% if (rs1.getString("Placement")!=null) {
												//out.println(rs1.getString("Placement")); 
												String sPlacement="";
												
												if(rs1.getString("Placement")!=null)
												sPlacement=rs1.getString("Placement");
												
												if(strCategory.equalsIgnoreCase("EQUITATION")){
                                        if(sPlacement.equalsIgnoreCase("B"))
                                            out.println("C");
                                        else{
                                        out.println(sPlacement);}
                                    }else if(sEventType.equalsIgnoreCase("Championship")){
                                        if(sPlacement.equalsIgnoreCase("1"))
                                            out.println("&nbsp;&nbsp;GC");
                                        else if(sPlacement.equalsIgnoreCase("2"))
                                            out.println("GCR"); 
										else if(sPlacement.equalsIgnoreCase("NP"))
                                            out.println("NP"); 										
										else{out.println("&nbsp;&nbsp;&nbsp;&nbsp;");
                                        out.println(Integer.parseInt(sPlacement)-2);}
										
                                    }				
                                    else
                                        out.println(sPlacement);
												
												
												
												} %></td>
			<%}	else {%>

			       <td class="contact" ><% 
				   
				   if(i==5 && sEventType.equalsIgnoreCase("Championship"))
											out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4");	
				   else if (rs1.getString("Notes")!=null) {
												out.println(rs1.getString("Notes")); } %> </td>

			<%}%>


			<td style="text-transform: uppercase"><%=rs1.getString("HORSE_PRIMARYNAME")%></td> 

			<td style="text-transform: uppercase"><%=rs1.getString("SireName")%></td>

			<td style="text-transform: uppercase"><%=rs1.getString("DamName")%></td>
			<td style="text-transform: uppercase"><%=rs1.getString("Dam_SireName")%></td>
			
			<td style="text-transform: uppercase"><%=rs1.getString("OwnerName")%></td>
			<td style="text-transform: uppercase"><%=rs1.getString("BreederName")%></td>
			<td style="text-transform: uppercase"><%=rs1.getString("HRider")%></td>
			<td style="text-transform: uppercase"><%=rs1.getString("RepCountry")%></td>
			


                                
                            

			
		
			 </tr>



        <%i++;}
	

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
  </table>
  </div>
  <br><br><br>
  <table class="tPaso">
  <tr>
  <td colspan=8>EX - Excusado / Excused</td>
  </tr>
  <tr>
  <td colspan=8>NP - Fuera del Marcador / No Placement</td>
  </tr>
  <tr>
  <td colspan=8>CF1 - No entro al F1 / Cut at F1</td>
  </tr>
  <tr>
  <td colspan=8>DQ - Descalificado / Disqualified</td>
  </tr>
  </table>
	<table class="bottomtype" width="200" style='text-align:center;' >
           <tr >

		    <td  width="40%"><br><br>POWERED BY&nbsp;&nbsp;
			<a href="http://www.cntinfotech.com" target="_blank" style="text-decoration: none">

			<img src="Images/cntit_small.png" align="center"  style="border-style: none"/></a> &nbsp;&nbsp;&nbsp;  ALL&nbsp;RIGHTS&nbsp;RESERVED</td>
        </tr>
    </table>
