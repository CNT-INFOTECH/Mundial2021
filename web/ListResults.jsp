
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
  width: 500px;
  border: solid #ccc 1px;
  -moz-border-radius: 6px;
  -webkit-border-radius: 6px;
  border-radius: 6px;
  font-family: 'trebuchet MS' , 'Lucida sans' , Arial;
  font-size: 28px;
  color: #444;
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
  text-align: center;
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


<%

   
try
{
        String strShowSeq="61";
		if(request.getParameter("show")!=null)
		{
			strShowSeq=request.getParameter("show");
			strShowSeq=strShowSeq.substring(0,2);
		}

		String strEventSeq="808";
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

	if(strShowSeq.equals("24"))
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
 

<table class="tPaso" align="center">
      <thead>
<th  data-class="expand" width="10%" ><font color="blue">#&nbsp;&nbsp;&nbsp;</font></th>
<th  data-class="expand" width="10%">JUDGE1</th>
<th  data-class="expand" width="10%">JUDGE2</th>
<th  data-class="expand" width="10%">JUDGE3</th>
<th  data-class="expand" width="10%">JUDGE4</th>
<th  data-class="expand" width="10%">JUDGE5</th>
<th  data-class="expand" width="10%">TOTAL</th>
<th  data-class="expand" width="10%"  > <font color="blue" > PLC </font></th>

</thead>  <%

       

      
		

        try
        {
            localConnection=dbcmt.getConnection();
            localConnection.setAutoCommit(false);
             CallableStatement cst = localConnection.prepareCall("{call GET_DEVIATION_2(?)}");
              cst.setString(1,strEventSeq);


        ResultSet rs1 = cst.executeQuery();
		
         while (rs1.next())
        {%>
             <tr>
			

			<td class="contact" valign="center"><font color="blue"><%=rs1.getString("AssignedNum") %></font></td>
			<td class="contact" valign="center" align="center"><%=rs1.getString("J1Pos") %>
			</td>
			<td class="contact"  align="center" valign="middle" ><%=rs1.getString("J2Pos") %></td>
			<td class="contact" valign="center" align="center"><%=rs1.getString("J3Pos") %></td>
			<td class="contact" valign="center" align="center"><%=rs1.getString("J4Pos") %></td>
			<td class="contact" valign="center" align="center"><%=rs1.getString("J5Pos") %></td>

			<td class="contact" valign="center"><%=rs1.getString("Total") %></td>
			<td class="contact" valign="center"><font color="blue"><%=rs1.getString("Placement") %></font></td>
			
		
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
 
