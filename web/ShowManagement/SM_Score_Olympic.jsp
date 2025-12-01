<%-- 
    Document   : SM_Score_Olympic
    Created on : Oct 1, 2014, 11:32:36 AM
    Author     : CNT
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Shows.ScoringOlympic"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SCORING -FIVE JUDGES SCORING SYSTEM</title>
        <link rel="stylesheet" href="menu.css" type="text/css" media="screen" />
        <link href="Styles/menu.css" rel="stylesheet" type="text/css" />
        <script src="Scripts/SM_Score_Olympic.js" type="text/javascript"></script>
        <link href="DynamicTable/jquery-ui-1.10.2.custom.css" rel="stylesheet"/>
        <script src="DynamicTable/jquery-1.9.1.min.js"></script>
        <script src="DynamicTable/jquery-ui-1.10.2.custom.min.js"></script>
    </head>


    <body>
        <form>
             
            <%@ include file="SM_Score_Olympic_F2_Include.jsp"%>
            
              
            <%   ArrayList AlAssigned_Num = new ArrayList();
                HashMap hmCallingJudge = new HashMap();
                try {

                    DBConnection dbcmt= new DBConnection(strUserID,strDBName);
                    localConnection = dbcmt.getConnection();
                    cst = localConnection.prepareCall("{call SM_ASSIGINED_LIST(?,?,?)}");
                    cst.setString(1, null);
                    cst.setString(2, strEventSeq);
                    cst.setString(3, "2");

                    rs2 = cst.executeQuery();
                    while (rs2.next()) {
                        if (rs2.getString("AssignedNum") != null) {
                            AlAssigned_Num.add(rs2.getString("AssignedNum"));
                        }
                    }
                } catch (Exception ex) {

                } finally {
                    if (rs2 != null) {
                        rs2.close();
                    }
                    if (cst != null) {
                        cst.close();
                    }
                    if (localConnection != null) {
                        localConnection.close();
                    }
                }

                String[] ArAssignedNum = (String[]) AlAssigned_Num.toArray(new String[AlAssigned_Num.size()]);
                int intClngJudge = 0;
                if (session.getAttribute("strCallingJudge") != null) {
                    intClngJudge = Integer.parseInt(session.getAttribute("strCallingJudge").toString());
                }

                String strAssignedNums = "";
                for (int i = 0; i < ArAssignedNum.length; i++) {
                    strAssignedNums += ArAssignedNum[i] + ",";
                }

                if (request.getParameter("R") != null) {
                    AlActualValues = new ArrayList();
                    EachJudgeRow = new ArrayList();
                    for (int i = 1; i <= intNumberofJudges; i++) {
                        EachJudgeRow = new ArrayList();
                        for (int j = 1; j <= intNumberofPositions; j++) {
                            EachJudgeRow.add("");
                        }
                        AlActualValues.add(EachJudgeRow);
                    }

                }

            %>
            <table>
                <tr>
                    <td colspan="2">Call&nbsp;Judge</td>
                   
                    <% for (int j = 1; j <= intNumberofPositions; j++) {%>
                    <td><font size="6"><b><%=j%></b></font></td>
                            <% }%>
                    <td colspan="3"><input type="checkbox"  onclick="toggleAutoRefresh(this);" id="reloadCB" checked >Auto&nbsp;Refresh</td> 

                </tr>
                <% for (int i = 0; i < AlActualValues.size(); i++) {
                        EachJudgeRow = (ArrayList) AlActualValues.get(i);
                        String strJudgeAllValues = "";
                        String strhdnJudgeNum = "hdnJudgeNum" + (i + 1);
                        String strhdnJudgeSeq = "hdnJudgeSeq" + (i + 1);
                        String strCallingJudge = "CallingJudge" + (i + 1);

                %>
                <tr>
                    <td><input type="checkbox" name="<%=strCallingJudge%>" value="<%=(i + 1)%>" disabled
                               <% if (JudgeCalling[i].equals("Y")) {%> checked <%}%> /></td>
                    <td><input type='hidden' size="1" name="<%=strhdnJudgeSeq%>" value="<%=JudgeSeq[i]%>"> <%=JudgeNames[i]%>
                        <input type='hidden' size="1" name="<%=strhdnJudgeNum%>" value="<%=(i + 1)%>"> </td>
                        <%

                            for (int j = 0; j < 7; j++) {
                                String strJudgeTxt = "txtRow" + (i + 1) + "Column" + (j + 1);
                                String strJudgeTxtValue = "";

                                strJudgeTxtValue = (String) EachJudgeRow.get(j);
                                strJudgeAllValues += strJudgeTxtValue + ",";


                        %>
                    <!-- onChange="CheckValue('<%=j%>', <%=strJudgeTxt%>, Judge<%=(i + 1)%>)"  -->
                    <td><input type='text' size="4" autocomplete='off' name=<%=strJudgeTxt%> value='<%=strJudgeTxtValue%>'
                               > </td>
                        <%}%>
                    <td><input type='hidden' id='Judge<%=(i + 1)%>' value='<%=strJudgeAllValues%>'> </td>
                     <% if(i==0) {%><td><input type="button" value="Process F2" onClick='ProcessResults()'> </td><%}%>
                     <% if(i==1) {%><td><input type="button" value="Reset Page" onClick='ResetResults()'> </td> <%}%>
                     <% if(i==2) {%><td><input type="button" value="Remove F2 Results" onClick='Delete_F2_Results()'></td><%}%>
                     <% if(i==3) {%><td><input type="button" value="Save" onClick='SaveResults()'> </td> <%}%>
                     <% if(i==4) {%><td><input type="button" value="Refresh" onClick="location.reload();"> </td><%}%>
                </tr>       
                <%}%>
                <tr>
                    <td align="center" valign="middle" colspan='5'>
                        <input type='hidden' size="15" autocomplete='off' value='<%=strAssignedNums%>' name="AssignedNums"></td>

                    <td><input type='hidden' size="2"  value='<%=intNumberofJudges%>' name="NumOfJudg"></td>
                    <td><input type='hidden' size="2" value='<%=intNumberofPositions%>' name="NumOfPos"></td>
                    <td><input type='hidden' size="2" value='<%=strEventSeq%>' name="hdnEventSeq"></td>
                </tr>

                </tr>
            </table>    

  <!--  ************************************************************************************************************************* 
  
                                                 F2_RESULTS
  
         ************************************************************************************************************************* -->

            <%

                if (Al.size() >= 0) {
                    String strSelectedCount = "";
            %>
            <table class="Events">

                <th>BACK#</th>
                <th><%=JudgeNames[0]%></th>
                <th><%=JudgeNames[1]%></th>
                <th><%=JudgeNames[2]%></th>
                <th><%=JudgeNames[3]%></th>
                <th><%=JudgeNames[4]%></th>
                <th>TOTAL</th>
                <th>Plcmnt</th>
                <th>Final Plcmnt</th>
                <th>Tie</th>
                    <%
                      
                        ArrayList AlMissingBackNum = new ArrayList();
                        for (int i = 0; i < Al.size(); i++) {
                            ArrayList AlRow = (ArrayList) Al.get(i);
                            
                            
                       
                            String strBackTxt_Tie = "txtBackTieRow" + (i + 1);
                            strSelectedCount = strSelectedCount + ",";

                    %>
                <tr>

                    <td align="center" valign="middle">
                        <input type='text' style='border:none' size="2" readonly="true" name="txtRsltBack<%=(i + 1)%>" value="<%=AlRow.get(0)%>"> </td>
                    <%
                        List AlRowJudge = (List) AlRow.get(1);
                        for (int j = 0; j < AlRowJudge.size(); j++) {
                            String strJudgeVal_Tie = "";
                            if (AlRowJudge.get(j) != null && AlRowJudge.get(j).equals("8")) {
                                strJudgeVal_Tie = "X";
                            } else {
                                strJudgeVal_Tie = "" + AlRowJudge.get(j);
                            }

                    %>
                    <td  align="center" valign="middle"><%=strJudgeVal_Tie%></td>

                    <%}%>
                    <td align="center" valign="middle"><%=AlRow.get(2)%></td>
                    <td align="center" valign="middle"><input type='text' readonly name="Plcmt<%=(i + 1)%>" value='<%=(i + 1)%>' size="2" style='border:none'> </td>
                    <td align="center" valign="middle"><input type='text' name="FinalPlcmt<%=(i + 1)%>" value='<%=AlRow.get(4)%>' size="2" style='border:none'> </td>
                    

                    <td align="center" valign="middle">
                        <% if (AlRow.get(3).toString().trim().equals("T")) {%>
                        <input type='checkbox' name="<%=strBackTxt_Tie%>" value="<%=AlRow.get(0)%>" 
                               onClick="CheckBoxSelect(<%=strBackTxt_Tie%>,<%=i%>, SelectedTies)"> 
                        <%}%>
                    </td>
                    
                 


                </tr>


                <%
                    }%>

                <tr>
                   
                        <input type='hidden' name="SelectedTies" value="<%=strSelectedCount%>" > </td>
                </tr>
            </table>
                 <input type='hidden' name="TotalBackNumber_Rows" value="<%=strSelectedCount%>" > </td>
            <%} %>



            <br>
            <font color="blue" size="4">Tie Breaker for Postion</font>
                    <Select onChange="LoadTB()" id="TBreak" name="TBreakCurrentSelected">
                        <%                              
                               
                                Iterator iterator = AlTiedPositions.iterator();
                                while(iterator.hasNext()){
                                  String element = (String) iterator.next();%>
                                        <option value="<%=element%>" <% if(strCurrTieBreaker.equals(element)){%> Selected <%}%> ><%=element%></option>
                                <%
                                   
                                }%>
                    </Select>

            <table id="table_Wo">
                <tr>
                    <td>&nbsp;</td>
                   
                    <% for (int j = 1; j <= intNumberofPositions; j++) {%>
                    <td><font size="6"><b><%=j%></b></font></td>
                            <% }%>


                </tr>
                <% for (int i = 0; i < AlActualValues_TieBreaker_Mobile_Value.size(); i++) {
                        EachJudgeRow = (ArrayList) AlActualValues_TieBreaker_Mobile_Value.get(i);
                        String strJudgeAllValues = "";
                        String strhdnJudgeNum = "hdnJudgeNum" + (i + 1);
                        String strhdnJudgeSeq = "hdnJudgeSeq" + (i + 1);
                        String strCallingJudge = "CallingJudge" + (i + 1);
                           

                %>
                <tr>

                    <td><%=JudgeNames[i]%> 
                        <input type='hidden' size="1" name="<%=strhdnJudgeSeq%>" value="<%=JudgeSeq[i]%>"> 
                        <input type='hidden' size="1" name="<%=strhdnJudgeNum%>" value="<%=(i + 1)%>"> </td>
                        <%

                            for (int j = 0; j < EachJudgeRow.size(); j++) {
                                String strJudgeTxt = "txtWORow" + (i + 1) + "Column" + (j + 1);
                                String strJudgeTxtValue = "";

                                strJudgeTxtValue = (String) EachJudgeRow.get(j);
                                strJudgeAllValues += strJudgeTxtValue + ",";
                        %>
                  
                    <td><input type='text' size="4" autocomplete='off' name=<%=strJudgeTxt%> value='<%=strJudgeTxtValue%>'></td>
                        <%}%>
                    <td><input type='hidden' id='Judge<%=(i + 1)%>' value=''> </td>
                </tr>       
                <%}%>
                <tr>
                    <td colspan="3"><input type="button" value="Process Tie Break" onClick='Process_WorkOff()'> </td>

                    </tr>
                </table>    
                
                
                <%

                if (Al_WO.size() >= 0) {

                    String strSelectedCount = "";
            %>
            
            
            <table class="Events">
                <tr><td>Tie Breaker</td></tr>
                <th>BACK#</th>
                <th><%=JudgeNames[0]%></th>
                <th><%=JudgeNames[1]%></th>
                <th><%=JudgeNames[2]%></th>
                <th><%=JudgeNames[3]%></th>
                <th><%=JudgeNames[4]%></th>
                <th>TOTAL</th>
                <th>Plcmnt</th>
                <th>Final Plcmnt</th>
                <th>Tie</th>
                    <%
                 
                        for (int i = 0; i < Al_WO.size(); i++) {
                            ArrayList AlRow = (ArrayList) Al_WO.get(i);
                            String strBackTxt_Tie = "txtBackTieRow" + (i + 1);
                            strSelectedCount = strSelectedCount + ",";

                    %>
                <tr>

                    <td align="center" valign="middle"><%=AlRow.get(0)%></td>
                    <%
                        List AlRowJudge = (List) AlRow.get(1);
                        for (int j = 0; j < AlRowJudge.size(); j++) {
                            String strJudgeVal_Tie = "";
                            if (AlRowJudge.get(j) != null && AlRowJudge.get(j).equals("8")) {
                                strJudgeVal_Tie = "X";
                            } else {
                                strJudgeVal_Tie = "" + AlRowJudge.get(j);
                            }

                    %>
                    <td  align="center" valign="middle"><%=strJudgeVal_Tie%></td>

                    <%}%>
                    <td align="center" valign="middle"><%=AlRow.get(2)%></td>
                    <td align="center" valign="middle"><input type='text' value='<%=(i + 1)%>' size="2" style='border:none'> </td>
                    <td align="center" valign="middle"><input type='text' value='<%=(i + 1)%>' size="2" style='border:none'> </td>

                    <td align="center" valign="middle">
                        <% if (AlRow.get(3).toString().trim().equals("T")) {%>
                        <input type='checkbox' name="<%=strBackTxt_Tie%>" value="<%=AlRow.get(0)%>" 
                               onClick="CheckBoxSelect(<%=strBackTxt_Tie%>,<%=i%>, SelectedTies)"> 
                        <%}%>
                    </td>


                </tr>


                <%
                    }%>

                
            </table>
            <%} %>

        </form>
    </body>
</html>
