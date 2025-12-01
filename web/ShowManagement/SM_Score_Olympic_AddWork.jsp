<%-- 
    Document   : SM_Score_Olympic
    Created on : Oct 1, 2014, 11:32:36 AM
    Author     : RAJU
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Shows.ScoringOlympic"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SCORING - FIVE JUDGES SCORING SYSTEM</title>
        <link rel="stylesheet" href="menu.css" type="text/css" media="screen" />
        <link href="Styles/menu.css" rel="stylesheet" type="text/css" />
        <script src="Scripts/SM_Common.js" type="text/javascript"></script>
         <script src="Scripts/SM_jscF1F2Admin.js" type="text/javascript"></script>
         <script src="Scripts/SM_Placements.js"></script>         
         
        <script>
            function ProcessResults()
            {
                document.forms[0].method = "post";
                document.forms[0].action = "../Scoring_Results?PAGEID=F2_PROCESS_ADNTL_WO";
                document.forms[0].submit();
            }
            function ResetResults() {

                var varhdnEventSeq = document.forms[0].hdnEventSeq.value
                document.forms[0].method = "post";
                document.forms[0].action = "SM_Score_Olympic_AddWork.jsp?R&7a8225d145bb1136c894b1f5dbcd7a8225d145bb1136c894b1f5dbcd&EIdent=" + varhdnEventSeq;
                document.forms[0].submit();
            }
            function WorkOffComplete(){
            
                document.forms[0].method = "post";
                document.forms[0].action = "../Scoring_Results?PAGEID=F2_PROCESS_ADNTL_WO_CMPL"
                document.forms[0].submit();
            }
            
            
            
            
            function CheckValue(varCurCol, varCurrentObj, varCurRowAllValsObj) {
              /************************************************Check for Valid Back#***********************************************/

                if (document.forms[0].backValidReq.checked) {
                    {
                        var bEditCheck = 0; // False
                        var varAssignedNums = document.forms[0].AssignedNums.value
                        var varAssignedNums_split = varAssignedNums.split(",");
                        for (var i = 0; i < varAssignedNums_split.length; i++)
                        {
                            if (varCurrentObj.value == varAssignedNums_split[i])
                                bEditCheck = 1;
                        }
                        if (bEditCheck == 0)
                        {
                            alert('Please enter a valid back Number')
                            varCurrentObj.focus();
                            varCurrentObj.value = '';
                        }

                    }

                    /************************************************Check for Duplicate Entry***********************************************/

                    var AllVals = varCurRowAllValsObj.value;
                    var AllVals_split = AllVals.split(",");

                    /* 
                     * If the current value is empty, replace this values in the All Values Text box and do nothing
                     */

                    if (varCurrentObj.value == '')
                    {
                        AllVals_split[varCurCol] = varCurrentObj.value
                        varCurRowAllValsObj.value = AllVals_split;
                        return false
                    }
                    /* 
                     * End Replcaing the Empty Value
                     */

                    var chkDupl = AllVals_split.indexOf(varCurrentObj.value)

                    if (chkDupl >= 0)
                    {
                        alert('The back# is already used by the judge')
                        varCurrentObj.focus();
                        varCurrentObj.value = '';
                        return false;
                    }


                    AllVals_split[varCurCol] = varCurrentObj.value
                    varCurRowAllValsObj.value = AllVals_split;

                }
            }
            
            function LoadWorkOff(){
                var varhdnEventSeq = document.forms[0].hdnEventSeq.value
                var varhdnShowSeq = document.forms[0].hdnShowSeq.value
                var varIdentWO = document.getElementById("awo").value;
                document.forms[0].method = "post";
                document.forms[0].action = "SM_Score_Olympic_AddWork.jsp?7a8225d145bb1136c894b1f5dbcd7a8225d145bb1136c894b1f5dbcd&SIdent="+varhdnShowSeq+"&EIdent=" + varhdnEventSeq+"&Swoc="+varIdentWO;
                document.forms[0].submit();
            }
        </script>
    </head>


    <body>
        <form>
            
           
            
            
          
            <%@ include file="SM_Score_Olympic_AddWork_Include.jsp"%>
             
            
            <select onChange="LoadWorkOff()" id="awo">
            <% for (int WO=1; WO<6; WO++){
            String strCurrentWO=""+WO; %>
            <option value="<%=WO%>" <% if(strCurrentWO.equals(strWorkOffCount)) {%> selected <%}%> >Work Off <%=WO%></option>
            <%}%>
            </select>
             
             
            <%  
             ArrayList AlAssigned_Num = new ArrayList();
           
             try {
               
                DBConnection dbcmt = new DBConnection(strUserID,strDBName);
                localConnection = dbcmt.getConnection();
                cst = localConnection.prepareCall("{call SM_ASSIGINED_LIST(?,?,?)}");
                cst.setString(1, null);
                cst.setString(2, strEventSeq);
                cst.setString(3, "1");

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
                String strAssignedNums = "";

                for (int i = 0; i < ArAssignedNum.length; i++) {
                    strAssignedNums += ArAssignedNum[i] + ",";
                }

                if (request.getParameter("R") != null) {
                    AlActualValues=new ArrayList();
                    EachJudgeRow=new ArrayList();
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
                    <td align="center" valign="middle" colspan='3'>
                        <input type='checkbox' name='backValidReq' checked>validate back#</td>
                </tr>
                <% for (int i = 0; i < AlActualValues.size(); i++) {
                        EachJudgeRow = (ArrayList) AlActualValues.get(i);
                        String strJudgeAllValues = "";
                        String strhdnJudgeNum = "hdnJudgeNum" + (i + 1);
                        String strhdnJudgeSeq = "hdnJudgeSeq" + (i + 1);
                %>

                <tr>

                    <td><%=JudgeNames[i]%>
                        <input type='hidden' size="1" name="<%=strhdnJudgeNum%>" value="<%=(i + 1)%>"> 
                        <input type='hidden' size="1" name="<%=strhdnJudgeSeq%>" value="<%=JudgeSeq[i]%>"> </td>
                        <%
                            boolean bJudgeSubmitted=false;
                            for (int j = 0; j < EachJudgeRow.size(); j++) {
                                String strJudgeTxt = "txtRow" + (i + 1) + "Column" + (j + 1);
                                String strJudgeTxtValue = "";

                                strJudgeTxtValue = (String) EachJudgeRow.get(j);
                                if(strJudgeTxtValue.length()>0)
                                    bJudgeSubmitted=true;
                                strJudgeAllValues += strJudgeTxtValue + ",";


                        %>
                    <td><input type='text' onChange="CheckValue('<%=j%>', <%=strJudgeTxt%>, Judge<%=(i + 1)%>)" 
                               size="2" autocomplete='off' autofocus='true'
                               name=<%=strJudgeTxt%> 
                               value='<%=strJudgeTxtValue%>'></td>
                        <%}%>
                    <td><input type='hidden' id='Judge<%=(i + 1)%>' value='<%=strJudgeAllValues%>'>
                    <% if(JudgeNum[i]!=null && !bJudgeSubmitted){%> None Submitted<%}%> </td>
                    
                   
                </tr>       
                <%}%>
                <tr>
                    
                    <td align="center" valign="middle">
                        <input type='hidden' size="15" autocomplete='off' value='<%=strAssignedNums%>' name="AssignedNums">
                        <input type='hidden' size="2"  value='<%=intNumberofJudges%>' name="NumOfJudg">
                        <input type='hidden' size="2" value='<%=intNumberofPositions%>' name="NumOfPos">
                        <input type='hidden' size="2" value='<%=strEventSeq%>' name="hdnEventSeq">
                        <input type='hidden' size="2" value='<%=strShowSeq%>' name="hdnShowSeq">
                        <input type='hidden' size="2" value='<%=strWorkOffCount%>' name="hdnWorkOffCount"></td>
                    <td  colspan="10" align="right" valign="middle"><input type="button" value="Refresh" onClick="location.reload();"> 
                     <input type="button" value="Process Request" onClick='ProcessResults()'></td> 
                    
                </tr>
            </table>    

             
                    
           <table class="Events">

                <th>BACK#</th>
                
                    <%
                        String strComplStatus="";
                        String strApprovalStatus="";
                        for (int i = 0; i < Al_AddWork_List.size(); i++) {
                            ArrayList AlRow = (ArrayList) Al_AddWork_List.get(i);
                            if(AlRow.size()>1 && AlRow.get(1)!=null)
                                strComplStatus=AlRow.get(1).toString();
                            if(AlRow.size()>2 && AlRow.get(2)!=null)
                                strApprovalStatus=AlRow.get(2).toString();
                            
                            if(AlRow.size()>0  && AlRow.get(0)!=null){
                    %>
               

                    <td align="center" valign="middle" width="60"><%=AlRow.get(0)%></td>
                
                <%}
                        }%>
                <td align="center" valign="middle" >
                    <input type="Checkbox" name="AdtnlWorkOff"> 
                    <input type="button" value="Work Off Completed" onClick="WorkOffComplete()">
                    <font size="4"><b><%=strComplStatus%></b></font>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <font size="4"><b><%=strApprovalStatus%></b></font>
                </td>
                
            </table>
           


        </form>
    </body>
</html>
