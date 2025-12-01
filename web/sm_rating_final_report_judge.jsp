
<%@ page import = "java.util.Iterator"%>
<%@ page import = "java.util.List"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>
<head>
    <title>PASOTRACKER</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">

    <style>

        .equal, .equal > div[class*='col-'] {  
            display: -webkit-box;
            display: -moz-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            display: flex;
            flex:1 1 auto;
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


        function goBack1(Show,session,Event)
        {
           window.location.href="sm_rating_final_report.jsp?"+session+"&show="+Show+"&event="+Event;
        }

        function goHome1()
        {

            window.location.href = 'sm_rating_listshows.jsp';
        }
    </script>
</head>
<%
				String strShowSeq="";
                String strEventSeq="";
				 String strJudgeSeq="";
				 String strBackNum="";
				 String strSessionID=request.getRequestedSessionId() ;
				
				if(request.getParameter("show")!=null)
                {
                        strShowSeq=request.getParameter("show");
                        strShowSeq=strShowSeq.substring(0,2);
                }

		
                if(request.getParameter("EIdent")!=null)
				{
                        strEventSeq=request.getParameter("EIdent");
                        String[] _strEventSeq=strEventSeq.split("_");
                        strEventSeq=_strEventSeq[0];
				}
				
				if(request.getParameter("JIdent")!=null)
				{
                        strJudgeSeq=request.getParameter("JIdent");
                       
				}
				if(request.getParameter("BIdent")!=null)
				{
                        strBackNum=request.getParameter("BIdent");
                       
				}

%>

<table class="bottomtype" width="200" align="center">
    <tr >

        <td valign="left" align="left" width="40%">POWERED BY&nbsp;&nbsp;
            <a href="http://www.cntinfotech.com" target="_blank" style="text-decoration: none">

                <img src="Images/cntit_small.png" align="center"  style="border-style: none"/></a> &nbsp;&nbsp;&nbsp;  ALL&nbsp;RIGHTS&nbsp;RESERVED</td>

        <td valign="left" align="left"><img src="Images/Pasologo.png" /> 


        <td valign="right" align="right">
            <a href="#" onClick="goHome1()" style="text-decoration: none"> <img   src="Images/Home.jpg" align="right"  style="border-style: none" /></a>
            <a href="#" onClick="goBack1(<%=strShowSeq%>,'<%=strSessionID%>','<%=strEventSeq%>')" style="text-decoration: none"> <img  src="Images/back.png" align="right"  style="border-style: none" /></a> </td>


    </tr>
</table>

<%
                Connection localConnection=null;
				DbConnMngr dbcmt=new DbConnMngr();
                CallableStatement cst=null;
                ResultSet rs1=null;
				String strCategory="";
               
   
try
{	   
        
                

				if(strShowSeq.length() >0 && strEventSeq.length() >0)
					{
		

                GetInterface GUI2=new GetInterface();
		
                ArrayList AlEventInfo=GUI2.GET_EVENT_INFORMATION(strShowSeq,strEventSeq);
				String strEventOrder=""+AlEventInfo.get(1);
				String strEventDate=""+AlEventInfo.get(2);
				strCategory=""+AlEventInfo.get(3);
				String strEvnName=""+AlEventInfo.get(6);
				String strEventType=""+AlEventInfo.get(7);
                 String strShowName=""+AlEventInfo.get(8);

	
	
%>

<table align="center" class="tPasoHead" >
    <thead>
    <th  align="center"> <font size="5" ><%=strShowName%></font></th>
</thead>    

</table>




<table align="center" >
    <td><span ><font><h3><font color="blue"> <%=strEventOrder %> </font> <%=strEvnName %> <font color="blue"> <%=strEventDate %> </font> </h3></font></span></td>

</td>
</table>

<%}
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


<body  >

    <div class="container-fluid">
        <div class="row equal">
            
            <!-- begin panel 2 -->
            


            <% 
             try{
							String strJudgeName="";
							String strDisplayName="";
							localConnection=dbcmt.getConnection();
                            cst = localConnection.prepareCall("{call sm_rating_get_Judges_Decision_Details(?,?,?,?)}",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                            cst.setString(1,strShowSeq);
                            cst.setString(2,strEventSeq);
                            cst.setString(3,strJudgeSeq);
							cst.setString(4,strBackNum);
							rs1 = cst.executeQuery();
							if(rs1.next()){
								strJudgeName=rs1.getString("JudgeName");
								if(strCategory.equalsIgnoreCase("EQUITATION"))
									strDisplayName=rs1.getString("RiderName");
								else
									strDisplayName=rs1.getString("HorseName");
								
							}

                                  
            %>
            <div class="col-md-4">
                <div style="text-align:center" class="panel panel-primary">
                    <div class="panel-heading">
                        <h1 class="panel-title"><%=strJudgeName%> / <%=strDisplayName%> ( <%=strBackNum%>)</h1>
                    </div>
                    <!-- end panel-heading -->
                    <div class="panel-body">
					
					
					

                        <table class="tPaso" width="100%">
                            <thead>
                            <th  data-class="expand" width="1%">#</th>
                            <th  data-class="expand" width="10%">Question</th>
							<th  data-class="expand" width="1%">Points</th>
                            <th  data-class="expand" width="1%">Score</th>
                            </thead>
							  <%
									String strGroupHeader="";
									String strChkGroupHeader="";
									rs1.first();
                                     while (rs1.next())
									{
									strChkGroupHeader=rs1.getString("question_Header_span");
								  if(!strGroupHeader.equals(strChkGroupHeader)){
									strGroupHeader=strChkGroupHeader;
								  %>
									<tr bgcolor="#D6DBDF">
										<td colspan="3" ><font size="4"><b><%=strChkGroupHeader%> (<%=rs1.getString("Total_Score_Group")%> Points)</b></font></td>
										<td><font size="4"><%=rs1.getString("Total_Score_Answers")%>/<%=rs1.getString("Total_Score_Group")%></b></font></td>
									</tr>
									<%}%>
								<tr >
                                <td class="contact"><%=rs1.getString("question_sortOrder")%></td>
                                <td class="contact"><%=rs1.getString("question_desc_span")%> (<%=rs1.getString("question_score")%> Points)</td>
								<td class="contact"><%=rs1.getString("question_ans_score")%></td>
                                <td class="contact"><%=rs1.getString("weighted_score")%></td>
                            </tr>
							  <%}%>
                        </table>

                    </div>
                    <!-- end panel-body -->
                </div>
                <!-- end panel-primary -->
            </div>

            <%
                                       
		
                }
                
                        catch(SQLException exc){
								out.println(exc.getMessage());
                                }
                                finally{
                                         rs1.close();
										 cst.close();
                                         dbcmt.releaseConnection(localConnection);
                                }
            %>
        </div>
        <!-- end row -->
    </div>

    <script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
	<script type='text/javascript' src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>



</body>

