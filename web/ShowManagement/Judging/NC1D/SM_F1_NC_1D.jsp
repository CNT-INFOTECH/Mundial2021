<%-- 
    Document   : SM_Score_Olympic
    Created on : Oct 1, 2014, 11:32:36 AM
    Author     : RAJU
--%>

<%@page import="Shows.DBConnection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Shows.ScoringOlympic"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SCORING - 1 Decision Non Conferring</title>
        <link rel="stylesheet" href="../../menu.css" type="text/css" media="screen" />
        <link href="../../Styles/menu.css" rel="stylesheet" type="text/css" />
        <script src="../../Scripts/SM_Common.js" type="text/javascript"></script>
         <script src="../../Scripts/SM_jscF1F2Admin.js" type="text/javascript"></script>
         <script src="../../Scripts/SM_Placements.js"></script>         
         
        <script>
            function ProcessResults()
            {
                document.forms[0].method = "post";
                document.forms[0].action = "../../../NC1D?PAGEID=F1";
                document.forms[0].submit();
            }
            function ResetResults() {

                var varhdnEventSeq = document.forms[0].hdnEventSeq.value
                document.forms[0].method = "post";
                document.forms[0].action = "SM_Score_Olympic_F1.jsp?R&7a8225d145bb1136c894b1f5dbcd7a8225d145bb1136c894b1f5dbcd&EIdent=" + varhdnEventSeq;
                document.forms[0].submit();
            }
            
            function AddHorsesIntoF1(ShowVal,EventVal)
            {
                var randomVal =11111111;
                NewWindow("../../SM_Score_Olympic_F1_More.jsp?" + randomVal + "&SIdent=" + ShowVal+ "&EIdent=" + EventVal, 'AddMore', '400', '280', 'no', 'center')
            }
            
             function PrintResults(ShowVal,EventVal) {
               document.forms[0].method = "post";
               document.forms[0].action = "../../../SMReports?PageID=RptF1List&SIdent="+ShowVal+"&EIdent=" + EventVal
               document.forms[0].target = "_blank"
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
        </script>
    </head>


    <body>
        <form>
            <meta http-equiv="refresh" content="20">

            <%@ include file="SM_F1_NC_1D_Include.jsp"%>
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
                    //AlActualValues=new ArrayList();
                    EachJudgeRow=new ArrayList();
                     for (int i = 1; i <= intNumberofJudges; i++) {
                            EachJudgeRow =(ArrayList)AlActualValues.get(i-1);
                            for (int j = 1; j <= intNumberofPositions; j++) {
                                EachJudgeRow.set(j-1,"");
                            }
                            //AlActualValues.add(EachJudgeRow);
                        }
                  
                }


            %>
            <table>
                <tr>
                    <td align="left" valign="middle" colspan='12'>
                        <input type='checkbox' name='backValidReq' checked>validate back#</td>
                </tr>
                <% for (int i = 0; i < AlActualValues.size(); i++) {
                        EachJudgeRow = (ArrayList) AlActualValues.get(i);
                        String strJudgeAllValues = "";
                        String strhdnJudgeNum = "hdnJudgeNum" + (i + 1);
                        String strhdnJudgeSeq = "hdnJudgeSeq" + (i + 1);
                %>

                <tr>

                    <td><%=EachJudgeRow.get(17)%>
                        <input type='hidden' size="1" name="<%=strhdnJudgeSeq%>" value="<%=EachJudgeRow.get(16)%>"> 
                        <input type='hidden' size="1" name="<%=strhdnJudgeNum%>" value="<%=(i + 1)%>"> </td>
                        <%

                            for (int j = 0; j < intNumberofPositions; j++) {
                                String strJudgeTxt = "txtRow" + (i + 1) + "Column" + (j + 1);
                                String strJudgeTxtValue = "";

                                strJudgeTxtValue = (String) EachJudgeRow.get(j);
                                strJudgeAllValues += strJudgeTxtValue + ",";


                        %>
                    <td><input type='text' onChange="CheckValue('<%=j%>', <%=strJudgeTxt%>, Judge<%=(i + 1)%>)" 
                               size="1" autocomplete='off' autofocus='true'
                               name=<%=strJudgeTxt%> 
                               value='<%=strJudgeTxtValue%>'></td>
                        <%}%>
                    <td><input type='hidden' id='Judge<%=(i + 1)%>' value='<%=strJudgeAllValues%>'> </td>
                    
                    
                </tr>       
                <%}%>
                <tr>
                    <td align="center" valign="middle" colspan='5'>
                        <input type='hidden' size="15" autocomplete='off' value='<%=strAssignedNums%>' name="AssignedNums"></td>

                    <td>
                        <input type='hidden' size="2"  value='<%=intNumberofJudges%>' name="NumOfJudg"></td>

                    <td align="center" valign="middle" >
                        <input type='hidden' size="2" value='<%=intNumberofPositions%>' name="NumOfPos"></td>
                    <td align="center" valign="middle" >
                        <input type='hidden' size="2" value='<%=strShowSeq%>' name="hdnShowSeq"></td>
                        <input type='hidden' size="2" value='<%=strEventSeq%>' name="hdnEventSeq"></td>
                </tr>
                
            </table>    

            <table><tr><td><input type="submit" value="Process F1" onClick='ProcessResults()'> </td>
                    <td><input type="button" value="Reset" onClick='ResetResults()'> </td>
                    <td><input type="button" value="Print" onClick="PrintResults('<%=strShowSeq%>','<%=strEventSeq%>')"> </td>
                    <td><input type="button" value="Add More Entries" onClick="AddHorsesIntoF1('<%=strShowSeq%>','<%=strEventSeq%>')"> </td>
                    <td><input type="button" value="Refresh" onClick="location.reload();"> </td>
                </tr></table>  
                    

           
            <table class="Events">

                <th>BACK#</th>
                    <%
                        for (int i = 0; i < Al_F1List.size(); i++) {
                            ArrayList AlRow = (ArrayList) Al_F1List.get(i);

                    %>
                <tr>

                    <td align="center" valign="middle"><%=AlRow.get(0)%></td>
                </tr>
                <%}%>
            </table>


        </form>
    </body>
</html>
