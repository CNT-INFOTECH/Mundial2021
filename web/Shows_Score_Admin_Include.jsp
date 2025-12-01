

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>
<head>

    <link href="Tables_style.css" rel="stylesheet" type="text/css" />
    <link href="buttons.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="themes/base/jquery.ui.all.css"/>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <script>


        function fnSave()
        {

            document.forms[0].method = "post";
            document.forms[0].action = "Shows_Score_Admin_Save.jsp"
			 document.forms[0].target = "_self";
            document.forms[0].submit();

        }
    </script>



</head>
<style>
div.timer {
    border:1px #666666 solid;
    width:190px;
    height:50px;
    line-height:50px;
    font-size:36px;
    font-family:"Courier New", Courier, monospace;
    text-align:center;
    margin:5px;
}
</style>
<body>

  	
	
	<table width="100%">

                <tr>
                  
                   <td>
                        <table align="right">
                           
                            
                            <td><span > <input type="button" onClick="OpenF1_NC1D('<%=strShowSeq_Head%>','<%=currentEventSeq%>')" value="F1 Cut"></input></span></td>
                            <td><span > <input type="button" onClick="OpenAddWork_NC1D('<%=strShowSeq_Head%>','<%=currentEventSeq%>')" value="Add'nal WO"></input></span></td>   
                            <td><span > <input type="button" onClick="OpenF2_NC1D('<%=strShowSeq_Head%>','<%=currentEventSeq%>')" value="Placements"></input></span></td>   
                          
                            <td>&nbsp;</td> <td>&nbsp;</td>
                            
                             <td><input type='button' value="Add Entries" onClick="Add_ClassEntry('SM_Pop_Add_Entry.jsp?PgID=RptCls&SIdent=<%=strShowSeq_Head%>&EvntSq=<%=currentEventSeq%>')"/></td>
                             <td><input type='button' value="Print Entries" onClick="fnCommonPageLoad_Tar('../SMReports?N2GmUsGGliFbV4RMw6X3fuWHR3EOCKVRpWMetuHXR0qcbzO6EOa5MTDUASmhCkwrUiO7cLuO2M1EDa8KnbK7zt6rhXWDWT3f4Kcp&PageID=SmPrepista&SIdent=<%=strShowSeq_Head%>&EvnIdent1=<%=currentEventSeq%>&EvnIdent2=<%=currentEventSeq%>','_blank')"/></td>
                           
                            <td><span > <input type="button"  onclick="fnPrint_Placements('<%=strShowSeq_Head%>','<%=currentEventSeq%>')" value="Print Report"></input></a></span></td> 
                            
                            <td>&nbsp;</td> <td>&nbsp;</td>
                            
                            <td style="border-width:0px;padding:0px">
                              <input type=button value="Save" onClick='fnSave()'></td>
                           
                            <td style="border-width:0px;padding:0px"><input type=button value="Reset"  onClick=" fnReset_Show_Admin()" ></td>
                        </table>    
                    </td>
                </tr>
            </table>
    <table width="100%">


        <tr>


            <td bgcolor=wheat width="20%" align="center"> 
                <input type="button" value="S t a r t" 
                       onclick="startTimer('<%=currentEventSeq%>', '<%=strEndTime%>')" style="font-weight:bold"><br>
                <LABEL  id="startTime"  style="font-weight:bold"><%=strStTime%></LABEL></td>
            <td bgcolor=wheat align="center">

                <div class="timer">
                    <label id="hours"><%=strDuration_[0]%></label>:<label id="minutes"><%=strDuration_[1]%></label>:<label id="seconds"><%=strDuration_[2]%></label>

                </div>


            </td>
            <td colspan=2 bgcolor=wheat width="20%" align="center"> 
                <input type="button" value="S t o p" onclick="stopTimer('<%=currentEventSeq%>')" style="font-weight:bold"><br>
                <LABEL  id="EndTime"  style="font-weight:bold"><%=strEndTime%></LABEL> 
            </td>


        </tr>
    </table>

    <table  width="100%"  class="grid" style="border-color:Black;border-width:1px;border-style:None;width:100%;border-collapse:collapse;cellspacing:10" >
        <tr>
            <th class="Grid_Header" scope="col"  width="40%" >Judge</th>
    <!--<th  class="Grid_Header" scope="col"  width="10%">Calling Judge</th>-->
    <th class="Grid_Header" scope="col"  width="30%">Current Judge</th>
    <th class="Grid_Header" scope="col"  width="30%">
      
        <select name="allCurntPg"  id="allCurntPg"  style='background-color:  #FFF8DC; border:  1px solid #000000;'
                onchange="applyCurntPgAllJudges(this, noOfJudge, 'curntPg')"  >                                  
            <option value="">Select</option>
            <option value="F1.jsp">F1 Cut</option>
            <option value="F1F2AdditionalWork.jsp">Additional Work Off</option>
            <option value="F2.jsp">Pin Class</option>
            <option value="F2_TieBreaker.jsp">Tie Breaker</option>
            <option value="F1F2Pending.jsp">Pending</option>

        </select>          
    </th>
</tr>

<%
    CallableStatement cst_Judge_Info = null;
    ResultSet rs_Judge_Info = null;
    DbConnMngr dbcmt1 = new DbConnMngr();
     connection1 = null;
    ArrayList alJudges = new ArrayList();
    ArrayList arJudRw = new ArrayList();
    int jNum = 1;
    try {

        connection1 = dbcmt1.getConnection();

        cst_Judge_Info = connection1.prepareCall("{call GET_Admin_JudgeDet(?,?)}");
        cst_Judge_Info.setString(1, strShowSeq_Head);
        cst_Judge_Info.setString(2, currentEventSeq);
        rs_Judge_Info = cst_Judge_Info.executeQuery();

        while (rs_Judge_Info.next()) {
            arJudRw = new ArrayList();
            arJudRw.add(rs_Judge_Info.getString("JudgeSeq"));
            arJudRw.add(rs_Judge_Info.getString("JudgeNum"));
            arJudRw.add(rs_Judge_Info.getString("SM_Official_Name"));

            arJudRw.add(rs_Judge_Info.getString("CallingJudge"));
            arJudRw.add(rs_Judge_Info.getString("CurrentJudge"));
            arJudRw.add(rs_Judge_Info.getString("CurrentPage"));
            alJudges.add(arJudRw);
        }
    } catch (Exception ex) {

    } finally {

        if (connection1 != null) {
            connection1.close();
        }

        if (cst_Judge_Info != null) {
            cst_Judge_Info.close();
        }

        if (rs_Judge_Info != null) {
            rs_Judge_Info.close();
        }
    }

    if (alJudges.size() > 0) {
        for (int j = 0; j < alJudges.size(); j++) {
            arJudRw = new ArrayList();
            arJudRw = (ArrayList) alJudges.get(j);
%>
<tr>
    <td style="text-align:left;" >
        <h2><%=jNum++%>
        <input type=hidden name='judSeq<%=j%>' id='judSeq<%=j%>' value='<%=arJudRw.get(0)%>'  size="3" />
        <input type=hidden size="3" name='judgeNum<%=j%>' id='judgeNum<%=j%>' value='<%=arJudRw.get(1)%>' />
        <label id='judName<%=j%>'  ><%=":" + arJudRw.get(2)%><label></h2>
                </td>
               <!-- <td>
                    <input type=radio name='CallingJudge<%=j%>' id="CallingJudge<%=j%>"  onclick="fnRadioAction(this, '<%=alJudges.size()%>', 'CallingJudge')"
                           <%if (arJudRw.get(3).toString().trim().equalsIgnoreCase("Y")) {
                                 out.println("checked");
                             }%> />
                </td>    -->              
                <td>
                    <input type=checkbox  name='CurrentJudge<%=j%>' id="CurrentJudge<%=j%>"  onclick="fnChkBoxEdit(this, CallingJudge<%=j%>)"
                           <%if (arJudRw.get(4).toString().equalsIgnoreCase("Y")) {
                                 out.println("checked");
                             }%>/>
                </td>
                <td>
                    <select name="curntPg<%=j%>"  id="curntPg<%=j%>"  style='background-color:  #FFF8DC; border:  1px solid #000000;' >                                  
                        <option value="">Select</option>
                        <option value="F1.jsp" <%if (arJudRw.get(5).toString().equalsIgnoreCase("F1.jsp")) {
                              out.println("selected");
                          } %>  >F1 Cut</option>
                        <option value="F1F2AdditionalWork.jsp" <%if (arJudRw.get(5).toString().equalsIgnoreCase("F1F2AdditionalWork.jsp")) {
                               out.println("selected");
                           } %>  >Additional Work Off</option>
                        <option value="F2.jsp" <%if (arJudRw.get(5).toString().equalsIgnoreCase("F2.jsp")) {
                              out.println("selected");
                          } %> >Pin Class</option>
                        <option value="F2_TieBreaker.jsp" <%if (arJudRw.get(5).toString().equalsIgnoreCase("F2_TieBreaker.jsp")) {
                             out.println("selected");
                         } %> >Tie Breaker</option>
                        <option value="F1F2Pending.jsp" <%if (arJudRw.get(5).toString().equalsIgnoreCase("F1F2Pending.jsp")) {
                            out.println("selected");
                        } %> >Pending</option>
                    </select>                        
                </td>
                </tr>
                <%

                        }
                    }

                %>
                </table>
                </body>

