<%-- 
    Document   : SM_F1F2_AdminTop
    Created on : Aug 10, 2015, 1:43:21 PM
    Author     : cntuser
--%>


<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>

<%@page import="Shows.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import = "Shows.GetInterface" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
 
    <%
        Cookie[] cookies = request.getCookies();
        String strCookieShowSeq = "61";
        String strCookieShowName = "XIII EXPOSICIÓN MUNDIAL CONFEPASO";
        String strCurrentClassSelected = "";
        String strUserID = "admin";
        String strDBName = "confepaso";
        for (int i = 0; i < cookies.length; i++) {
            Cookie c = cookies[i];
            if (c.getName().equals("CookieShowSeq")) {
                strCookieShowSeq = URLDecoder.decode(c.getValue(), "UTF-8");
            }
            if (c.getName().equals("CookieShowName")) {
                strCookieShowName = URLDecoder.decode(c.getValue(), "UTF-8");
            }

            if (c.getName().equals("CookieLastClass")) {
                strCurrentClassSelected = URLDecoder.decode(c.getValue(), "UTF-8");
            }
            if (c.getName().equals("username")) {
                strUserID = URLDecoder.decode(c.getValue(), "UTF-8");
            }
            if (c.getName().equals("DBName")) {
                strDBName = URLDecoder.decode(c.getValue(), "UTF-8");
            }

        } 
    
    /*
        This is used when the Show Cookie is not set, and the Users select the Show from the Popup Screen
    */    
    if(request.getParameter("param_Serv_SN")!=null)
    {
        strCookieShowSeq=request.getParameter("param_Serv_SS");
        strCookieShowName=request.getParameter("param_Serv_SN");
               
        Cookie c = new Cookie("CookieShowSeq",URLEncoder.encode(strCookieShowSeq, "UTF-8"));
            response.addCookie(c);
         c = new Cookie("CookieShowName",URLEncoder.encode(strCookieShowName, "UTF-8"));
            response.addCookie(c); 
    }
    
    
    if(strCookieShowName!=null && strCookieShowName.trim().length() >0){
    %>
    
    
    <h1 align="center"><%=strCookieShowName%>&nbsp;&nbsp;<img alt="" src="images/Find.gif" onClick="Search_Shows('frmF1_F2_Admin')"/></h1>

    <%
    }
    else 
    {%>
        
        <h1 align="center">Please select a Show&nbsp;&nbsp;<img alt="" src="images/Find.gif" onClick="Search_Shows('frmF1_F2_Admin')"/></h1>
    <%}

        GetInterface GUI2 = new GetInterface();

        /*    ---------------------------START---------------------------PREVIOUS NEXT -----------------------------  */
        int current = 1;
        int rows = 0;
        Connection connection1 = null;
        Statement statement1 = null;
        ResultSet resultset1 = null;
        DBConnection dbcmt1 = new DBConnection(strUserID, strDBName);
        ArrayList AlDrpEvents = new ArrayList();

        Connection localConnection_Judges = null;
        DBConnection dbcmt_Judges = new DBConnection(strUserID, strDBName);
        ResultSet rsJudges = null;
        CallableStatement cst_Judges = null;

        String currentEventSeq = "0";
        String strLastClassNumber = "0";
        int hdnIncremnter = 0;

    
        if (request.getParameter("hidden") != null && request.getParameter("hidden").trim().length() > 0) {
            hdnIncremnter = Integer.parseInt(request.getParameter("hidden"));
            strCurrentClassSelected = "0";
        }
        // This is used when the Users Type in the Code in the Placements
        if (request.getParameter("DmdCde") != null && request.getParameter("DmdCde").trim().length() > 0) {
            strCurrentClassSelected = request.getParameter("DmdCde");
        }

        if (request.getParameter("sIdent") != null) {
            strCookieShowSeq = request.getParameter("sIdent");
        }

       

        try {

            connection1 = dbcmt1.getConnection();
            statement1 = connection1.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            resultset1 = statement1.executeQuery("select Event_Seq,Name,Event_Order from Events where Show_Seq=" + strCookieShowSeq + " And isNull(EventStatus,'A')='A'  Order by Cast(Event_Order As Int)");

    
            resultset1.last();
            rows = resultset1.getRow();

            resultset1.beforeFirst();
            if (rows == 0) {
                rows = 1; // This is because we are using Array 
            }

            String[] Arry_EventsOrder = new String[rows];
            String[] Arry_EventsSeq = new String[rows];
            int RecordCnt = 0;


            while (resultset1.next()) {

               
                if (resultset1.getString("Event_Order").equals(strCurrentClassSelected)) {
                    hdnIncremnter = RecordCnt;
                }
              
                Arry_EventsOrder[RecordCnt] = resultset1.getString("Event_Order");
                Arry_EventsSeq[RecordCnt] = resultset1.getString("Event_Seq");
                RecordCnt += 1;
            }

            if (strCurrentClassSelected.equals("") || strCurrentClassSelected == null) {
                if (Arry_EventsOrder.length > 1) {
                    strCurrentClassSelected = Arry_EventsOrder[0];
                }
                if (Arry_EventsSeq.length > 1) {
                    currentEventSeq = Arry_EventsSeq[0];
                }

            } else {
                 if(RecordCnt>0){
                    strCurrentClassSelected = Arry_EventsOrder[hdnIncremnter];
                    currentEventSeq = Arry_EventsSeq[hdnIncremnter];
                 }
            }

            if (Arry_EventsOrder.length > 1) {
                strLastClassNumber = Arry_EventsOrder[rows - 1];
            }

            Cookie c = new Cookie("CookieLastClass",URLEncoder.encode(strCurrentClassSelected, "UTF-8"));
            response.addCookie(c);

        } catch (SQLException Ex) {
            out.println("****************************************SM_F1F2_AdminTop***********"+Ex);
        } finally {
            if (connection1 != null) {
                connection1.close();
            }
            if (statement1 != null) {
                statement1.close();
            }
            if (resultset1 != null) {
                resultset1.close();
            }
        }
        /*    ---------------------------END---------------------------PREVIOUS NEXT -----------------------------    */

        String strEventOrder = "";
        String strEventDate = "";
        String strEvnName = "";
        String strEventType = "";
        String strShowName = "";
        String strStTime="";
        
        String strEndTime="";
        String strDuration="00:00:00";
        String[] strDuration_=strDuration.split(":");
        
        String strStTime_Gate="";
        String strEndTime_Gate="";
        String strDuration_Gate="00 : 00 : 00";

        int intJudgingType = 1;
        int NumberofJudges = 0;

        try {
            localConnection_Judges = dbcmt_Judges.getConnection();
            //cst_Judges = localConnection_Judges.prepareCall("{call [SM_GET_Judge_Cards](?,?)}");
            //cst_Judges.setString(1, strCookieShowSeq);
            //cst_Judges.setString(2, currentEventSeq);

            //rsJudges = cst_Judges.executeQuery();
            //while (rsJudges.next()) {
                //NumberofJudges += 1;
            //}
            
            rsJudges=null;
            cst_Judges = localConnection_Judges.prepareCall("{call [SM_GET_EVENT_INFORMATION](?,?)}");
            cst_Judges.setString(1, strCookieShowSeq);
            cst_Judges.setString(2, currentEventSeq);
            rsJudges = cst_Judges.executeQuery();
             
            if (rsJudges.next()) {
                    strEventOrder = "" + rsJudges.getString("Event_Order");
                        strEventDate = "" + rsJudges.getString("Event_Date");
                        strEvnName = "" + rsJudges.getString("Name");
                        strEventType = "" + rsJudges.getString("EventType");
                        strShowName = "" + rsJudges.getString("Show_Name");
                        strStTime = "" + rsJudges.getString("EventStartTime");
                        strEndTime = "" + rsJudges.getString("EventEndTime");
                        strDuration = "" + rsJudges.getString("Duration");

                        strDuration_ = strDuration.split(":");
                        strStTime_Gate= "" + rsJudges.getString("Two_Min_Gate_Start_Time");
                        strEndTime_Gate= "" + rsJudges.getString("Two_Min_Gate_End_Time");
                        if(rsJudges.getString("Duration_Gate")!=null && rsJudges.getString("Duration_Gate").trim().length()>0 )
                            strDuration_Gate=rsJudges.getString("Duration_Gate");
                       
                        
            }

        } catch (SQLException ex) {
            out.println("Exception in JudgeCards/EVENT_INFORMATION::::" + ex);
        } finally {
            if (cst_Judges != null) {
                cst_Judges.close();
            }

            if (rsJudges != null) {
                rsJudges.close();
            }

            localConnection_Judges.close();
        }

       
    %>


    <table class="RecNavigation" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <!--        <td><select>
            <%
                for (int ES = 0; ES < AlDrpEvents.size(); ES++) {
            %>
            <option><%=AlDrpEvents.get(ES)%></option>
            <%}%>
            </select>
        </td>    -->

            <td style="border-width:0px;padding:0px">
                <div style="padding:0px 0px 0px 1px;cursor:default" >
                    <table cellpadding="0" cellspacing="0"  style="border-collapse:collapse;border-style:solid;height:24px;border-width:0px;cursor:default">
                        <tr>
                            <td style="border-width:0px;padding:0px">
                                <div style="width:3px"></div>
                            </td><td style="font-size:0">
                                <img  name="FirstPage" src="images/FirstPage.gif" onclick="fnJudPageAction('<%=strCookieShowSeq%>', hidden, EventSeq, 'first')"
                                      style="width:16px;height:16px;padding:0px 2px 0px 2px"></td>
                            <td style="border-width:0px;padding:0px">
                                <div style="width:3px"></div>
                            </td>
                        </tr>
                    </table>

                </div>
            </td>



            <td style="border-width:0px;padding:0px">
                <div style="padding:0px 0px 0px 1px;cursor:default" >
                    <table cellpadding="0" cellspacing="0" 
                           style="border-collapse:collapse;border-style:solid;height:24px;border-width:0px;cursor:default">
                        <tr>
                            <td style="border-width:0px;padding:0px">
                                <div style="width:3px"></div>
                            </td>
                            <% if (strCurrentClassSelected != null && strCurrentClassSelected.equals("1")) {%>

                            <td  style="font-size:0"><img  name="PrevPage" 
                                                           src="images/PrevPage.gif" 
                                                           style="width:16px;height:16px;padding:0px 2px 0px 2px">
                            </td>
                            <%} else {%>
                            <td  style="font-size:0" onclick="fnJudPageAction('<%=strCookieShowSeq%>', hidden, EventSeq, 'previous')"><img  name="PrevPage"  
                                                                                                                                            src="images/PrevPage.gif" 
                                                                                                                                            style="width:16px;height:16px;padding:0px 2px 0px 2px">
                            </td>
                            <%}%>

                            <td style="border-width:0px;padding:0px">
                                <div style="width:3px"></div>
                            </td>
                        </tr>
                    </table>

                </div>
            </td>

            <td style="border-width:0px;padding:0px">
                <table style="border-collapse:collapse;;white-space:nowrap;font-family:Arial;font-size:12px;color:#202020">
                    <tr>
                        
                        <td>&nbsp;Classes&nbsp;</td><td><input 
                                style="padding:2px;margin:0px;width:40px;font-family:Arial;font-size:12px;text-align:center" 
                                type="hidden"    VALUE="<%= hdnIncremnter%>" name="hidden">

                            <input 
                                style="padding:2px;margin:0px;width:40px;font-family:Arial;font-size:12px;text-align:center" 
                                type="hidden"    VALUE="<%= rows - 1%>" name="TotalRecs">
                            
                            
                            <input 
                                style="padding:2px;margin:0px;width:40px;font-family:Arial;font-size:12px;text-align:center" 
                                type="text"   Name="Class_Number" VALUE="<%=strCurrentClassSelected%>" onChange="fnJudPageAction_Dmd('<%=strCookieShowSeq%>',this.value)">
                            
                            
                        </td><td>&nbsp;of&nbsp;</td>

                        <td ><INPUT readOnly TYPE="text" NAME="Total" size="2" VALUE="<%=strLastClassNumber%>" id="Total"
                                    style="padding:2px;margin:0px;width:40px;font-family:Arial;font-size:12px;text-align:center" ></td>
                    </tr>
                </table>
            </td>


            <td style="border-width:0px;padding:0px">
                <div style="padding:0px 0px 0px 1px;cursor:default" >
                    <table cellpadding="0" cellspacing="0" style="border-collapse:collapse;border-style:solid;height:24px;border-width:0px;cursor:default">
                        <tr>
                            <td style="border-width:0px;padding:0px">
                                <div  style="width:3px"></div>
                            </td>


                            <% if (rows <= current) {%>

                            <td  style="font-size:0">
                                <img  name="NextPage"
                                      src="images/NextPage.gif" style="width:16px;height:16px;padding:0px 2px 0px 2px"></td>
                                <%} else {%>
                            <td  style="font-size:0" >
                                <img  name="NextPage"   onclick="fnJudPageAction('<%=strCookieShowSeq%>', hidden, EventSeq, 'next')"
                                      src="images/NextPage.gif" style="width:16px;height:16px;padding:0px 2px 0px 2px"></td>
                                <%}%>



                            <td style="border-width:0px;padding:0px">
                                <div style="width:3px"></div>
                            </td>
                        </tr>
                    </table>

                </div>
            </td>



            <td style="border-width:0px;padding:0px">
                <div style="padding:0px 0px 0px 1px;cursor:default" >
                    <table cellpadding="0" cellspacing="0" style="border-collapse:collapse;border-style:solid;height:24px;border-width:0px;cursor:default">
                        <tr>
                            <td style="border-width:0px;padding:0px">
                                <div class="stiLeftHalfButton" style="width:3px"></div>
                            </td><td class="stiMiddleHalfButton" style="font-size:0"><img name="LastPage" src="images/LastPage.gif"  onclick="fnJudPageAction('<%=strCookieShowSeq%>', hidden, EventSeq, 'last')"
                                                                                          style="width:16px;height:16px;padding:0px 2px 0px 2px"></td><td style="border-width:0px;padding:0px">
                                <div class="stiRightHalfButton" style="width:3px"></div>
                            </td>
                        </tr>
                    </table>

                </div>
            </td>
            <!--
    <td style="border-width:0px;padding:0px"><input type=button value="Reset page"  onClick=" fnCommonPageLoad('SM_F1_F2_Admin.jsp')" ></td>
           <td style="border-width:0px;padding:0px"><input type=button value="Save" onClick='fnCommonPageLoad("../ShowController?PageID=F1F2_AdminJudge")'></td>
            -->
        </tr>

    </table>
    <table align="center" >
        
        <td><span ><font><label id="EventName"   ><h3><font color="blue"> <%=strEventOrder%> </font> <%=strEvnName%> <font color="blue"> <%=strEventDate%> </font> </h3></label></font></span></td>
        <td>   <input type="hidden" id="EventSeq" Name="EventSeq" value="<%=currentEventSeq%>">
            <input type="hidden" id="ShowSeq" Name="ShowSeq" value="<%=strCookieShowSeq%>">

        </td>
    </table>                           

</html>
