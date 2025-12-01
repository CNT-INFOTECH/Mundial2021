       <%--
    Document   : frmF1_F2
    Created on : May 31, 2011, 11:54:12 PM
    Author     : CNT
    --%>

    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

    <html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>F1/F2</title>


   <link rel="stylesheet" href="menu.css" type="text/css" media="screen" />
        <link href="Styles/menu.css" rel="stylesheet" type="text/css" />
  
        <link href="DynamicTable/jquery-ui-1.10.2.custom.css" rel="stylesheet"/>
        <script src="DynamicTable/jquery-1.9.1.min.js"></script>
        <script src="DynamicTable/jquery-ui-1.10.2.custom.min.js"></script>

    <script type="text/javascript" src="scripts/jscCommon.js"></script>
    <script type="text/javascript" src="Scripts/SM_jscF1_F2.js"></script>

    </head>

<%@ page import = "model.GetInterface" %>
<%@ page import = "java.util.*" %>
<form name="frmF1_F2" >

    <%
    HashMap HMShowDetails=new HashMap();
    GetInterface GUI2=new GetInterface();
    
    String strShowSeq="";
    String strResultsURL="SM_F1_F2_Final_Results.jsp";
    if(request.getParameter("ShowSeq")!=null)
        strShowSeq=request.getParameter("ShowSeq");

    String strEventSeq=request.getParameter("EventSeq");

    
    if(strShowSeq.length() > 0)
     HMShowDetails= GUI2.GET_SHOW_INFORMATION(strShowSeq);

       

    String StrNumberOfJudges="3";
    if( HMShowDetails.get("Judges")!=null)
        StrNumberOfJudges=(String)HMShowDetails.get("Judges");
    //System.out.println("frmF1_F2::StrNumberOfJudges::"+StrNumberOfJudges);

        ArrayList AlEventInfo=GUI2.GET_EVENT_INFORMATION(strShowSeq,strEventSeq);
        String strEventOrder=""+AlEventInfo.get(1);
        String strEventDate=""+AlEventInfo.get(2);
        String strEvnName=""+AlEventInfo.get(6);
        String strEventType=""+AlEventInfo.get(7);
        String strShowName=""+AlEventInfo.get(8);
        String strPosNums="5";
            if(AlEventInfo.get(12)!=null)
                strPosNums=""+AlEventInfo.get(12);
               
        String strJudgeNums_evnt=""+AlEventInfo.get(13);

    if(StrNumberOfJudges.equals("3"))
        strResultsURL="SM_F1_F2_Final_Results.jsp";
    else if(StrNumberOfJudges.equals("5"))
         strResultsURL="SM_F1_F2_Final_Results_5.jsp";

  
     
    if(StrNumberOfJudges.equals("3")) {%>

     <%@ include file="SM_F1_F2_Include.jsp" %>
    
  <table width="100%" style="border-collapse:collapse;"  >
      <tr>

<TABLE BORDER="1" WIDTH="500">
  <TR>
   <TD WIDTH=250>
    <table width="100%">
        <tr>
       
            <td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td>
        </tr>
          <tr>
            <% for(int i=1;i < 4; i++){
             String strJudgeSeq="";
             String strJudgeName="";
             if(F1Val.get("JudgeSeq"+(i))!=null)
                 strJudgeSeq=F1Val.get("JudgeSeq"+(i)).toString();
             if(F1Val.get("JudgeName"+(i))!=null)
                 strJudgeName=F1Val.get("JudgeName"+(i)).toString();


            %>
            <td colspan="8"><a href="#" onClick="OpenCommonRef('Judge','JudgeSeq<%=i%>','lblJudge<%=i%>')" >Judge<%=i%></a>

              <input type="hidden" id="JudgeSeq<%=i%>" size="2" Name="JudgeSeq<%=i%>"
                     value='<%=strJudgeSeq.trim()%>'>
              <!--<input type=text name="JUDGE<%=i%>"
                     value='<%=strJudgeName.trim()%>' ReadOnly> -->
              
              <font size="3"><b><label id="lblJudge<%=i%>"><%=strJudgeName.trim()%></label></b></font></td>
          </tr>
          <tr >
                <% for (int F1=1;F1<=7; F1++){
                    String strTxtName="J"+(i)+"_F1_"+F1;
                   
                    String strPValues="";
                    if(F1Val.get(strTxtName)!=null)
                        strPValues=F1Val.get(strTxtName).toString();

                %>


                <td >
                <input type="text" id="<%=strTxtName%>" name="<%=strTxtName%>" size="2" maxlength="5" onKeyPress="return checkIt(event)"
                 value='<%=strPValues.trim()%>' autocomplete="off"
                 onBlur="CheckDuplicateEntry('<%=i%>','<%=F1%>',<%=strTxtName%>)">
                </td>
                <%}%>
          </tr>
          <%}%>
          <td colspan="8">
           <input type =button class="button" name="CalculateF1" value='Process F1' onClick="getResults('F1')">
           <input type =button class="button" name="Print" value='Print' onClick="PrintF1('F1')">
           <input type =hidden name="hdnEventName" value='<%=strEvnName%>'>
            </td>
        </table>
   </TD>
   <TD WIDTH="250">
    <table width="100%">
       
          <tr>
           
           <%if(strPosNums.equals("6")  && !strEventType.equals("Championship")) { %>
             <td  style="text-align:center"> <font size="2">B</font></td><td  style="text-align:center">1</td>
             <td  style="text-align:center">2</td><td  style="text-align:center">3</td><td  style="text-align:center">4</td>
             <td  style="text-align:center">5</td><td  style="text-align:center">6</td>
            <%} else {%>
            <td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td>
            <%}%>
          </tr>
          <tr>
               <% for(int i=1;i < 4; i++){%>
                    <td colspan="8">&nbsp;
                    
                    </td>
                     </tr>
                    <tr>
             <%
                for (int F2=1;F2<8; F2++){
                    String strTxtName="J"+(i)+"_F2_"+F2;
                    String strPF2Values="";
                    if(F1Val.get(strTxtName)!=null)
                        strPF2Values=F1Val.get(strTxtName).toString();

                %>
                <td>
                <input type="text" name="<%=strTxtName%>" size="2" maxlength="5" onKeyPress="return checkIt(event)"
                value='<%=strPF2Values.trim()%>' >
                </td>
                <%}%>
          </tr>
          <%}%>

          <td colspan="8">
            <input type =button class="button" name="CalculateF12" value='Process F2' onClick="getResults('F2')" >
            <input type =hidden name="hdnJudgeCount" value='3'>
         
              <font size="2" color="blue">NO. OF POS. IN THIS EVENT ARE <%=strPosNums%></font>
           </td>
        </table>
   </TD>

   
  </TR>
</TABLE>
     
     
     
    </tr>
   
  </table>


<table width="700">
  <tr>
    <td colspan="5">
      <div id="F1_F2_Results" >
          <iframe  src="<%=strResultsURL%>?EventSeq=<%=strEventSeq%>"  id="iFrame_F1_F2_Results" name="iFrame_F1_F2_Results"
        width="100%" height="200" marginwidth="0" marginheight="0"
        frameborder="0">
          </iframe> </div>
      <!-- Shows_Register_List-->
    </td>
  </tr>
  <tr>
    <td>&nbsp; </td>
    <td WIDTH="33" ><img alt="SAVE" name="save" src="Images/Save1.png" onClick="Placements()" title="SAVE">
   
    
    </td>

    <td WIDTH="32"><img alt="EXIT" name="exit" src="Images/LogOut3.png" onClick="F1F2Colse()" title="EXIT"></td>
    <td WIDTH="36"><img alt="CLOSE" name="deviation" src="Images/graph3.png" onClick="Deviation(<%=strEventSeq%>)" title="DEVIATION"></td>
  </tr>
</table>








<!--
**************************************************************************************************************************************************

  5 JUDGE 


****************************************************************************************************************************************************

-->





<%} else if (StrNumberOfJudges.equals("5")) {%>

<%@ include file="SM_F1_F2_Include.jsp" %>

  <table width="100%" style="border-collapse:collapse;"  >
      <tr>

<TABLE BORDER="1" WIDTH="500">
  <TR>
   <TD WIDTH=250>
    <table width="100%">
        <tr>
            <div class="Grid_Header" style="text-align:center">F1</div>
            <td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td>
        </tr>
          <tr>
            <% for(int i=1;i < 6; i++){
             String strJudgeSeq="";
             String strJudgeName="";
             if(F1Val.get("JudgeSeq"+(i))!=null)
                 strJudgeSeq=F1Val.get("JudgeSeq"+(i)).toString();
             if(F1Val.get("JudgeName"+(i))!=null)
                 strJudgeName=F1Val.get("JudgeName"+(i)).toString();


            %>
             <td colspan="8"><a href="#" style=" cursor: pointer;"  onClick="OpenCommonRef('Judge','JudgeSeq<%=i%>','lblJudge<%=i%>')"> Judge<%=i%></a>

              <input type="hidden" id="JudgeSeq<%=i%>" size="2" Name="JudgeSeq<%=i%>"   value='<%=strJudgeSeq.trim()%>'>
              <!--<input type=text name="JUDGE<%=i%>"     value='<%=strJudgeName.trim()%>' ReadOnly> -->
              
              <font size="2" ><b><label id="lblJudge<%=i%>"><%=strJudgeName.trim()%></label></b></font>
              <img alt="" src="Images/delete.png" onClick="Delete_Judges('<%=i%>')"/>
             </td>
          </tr>
          <tr >
                <% for (int F1=1;F1<=7; F1++){
                    String strTxtName="J"+(i)+"_F1_"+F1;
                    String strPValues="";
                    if(F1Val.get(strTxtName)!=null)
                        strPValues=F1Val.get(strTxtName).toString();

                %>


                <td >
                <input type="text" name="<%=strTxtName%>" size="2" maxlength="5" onKeyPress="return checkIt(event)"
                 value='<%=strPValues.trim()%>' >
                </td>
                <%}%>
          </tr>
          <%}%>
          <td colspan="8">
           <input type =button class="button" name="CalculateF1" value='Process F1' onClick="getResults5('F1')">
           <input type =button class="button" name="Print" value='Print' onClick="PrintF1('F1')">
           <input type =button   class="button" name="refresh" value='Refresh' onClick="Refresh('F1',<%=strEventSeq%>,<%=strShowSeq%>)">
           <input type =hidden name="hdnEventName" value='<%=strEvnName%>'>
            </td>
        </table>
   </TD>
   <TD WIDTH="250">
    <table width="100%">
         <tr>
            <div class="Grid_Header" style="text-align:center">F2</div>
            <%if(strPosNums.equals("6")  && !strEventType.equals("Championship")) { %>
             <td  style="text-align:center"> <font size="2">B</font></td><td  style="text-align:center">1</td>
             <td  style="text-align:center">2</td><td  style="text-align:center">3</td><td  style="text-align:center">4</td>
             <td  style="text-align:center">5</td><td  style="text-align:center">6</td>
            <%} else {%>
            <td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td>
            <%}%>
        </tr>
         
          <tr>
         
            <% for(int i=1;i < 6; i++){%>
           <td colspan="8">&nbsp;
                  <img alt="" src="Images/delete.png" style="visibility:hidden"/>
             </td>
          </tr>
          <tr>
                <% for (int F2=1;F2<8; F2++){
                String strTxtName="J"+(i)+"_F2_"+F2;
                String strPF2Values="";
                    if(F1Val.get(strTxtName)!=null)
                        strPF2Values=F1Val.get(strTxtName).toString();

                %>
                <td>
                    
                <input type="text" name="<%=strTxtName%>" size="2" maxlength="5" onKeyPress="return checkIt(event)"
                value='<%=strPF2Values.trim()%>' >
                
                </td>
                <%}%>
          </tr>
          
          <%}%>

         <td colspan="8">
                  <input type =button class="button" name="CalculateF12" value='Process F2'onClick="getResults5('F2')" >
           
            <font size="2" color="blue">NO. OF POS. IN THIS EVENT ARE <%=strPosNums%></font>
              <input type =hidden name="hdnJudgeCount" value='5'>
           </td>
        </table>
   </TD>


  </TR>
</TABLE>



    </tr>

  </table>

            <table WIDTH="700">
                    <tr>
                        <td colspan="5">
                        <div id="F1_F2_Results" >
                        <iframe  src="<%=strResultsURL%>?EventSeq=<%=strEventSeq%>" name="iFrame_F1_F2_Results" id=iFrame_F1_F2_Results"
                        width="100%" height="200" marginwidth="0" marginheight="0"
                        frameborder="0">
                        </iframe>
                        </div> <!-- Shows_Register_List-->
                        </td>
            </tr>
              <tr>
                <td>&nbsp; </td>
                <td WIDTH="33" ><img alt="SAVE" name="save" src="Images/Save1.png" onClick="Placements()" title="SAVE">
                <td WIDTH="13"><img alt="SAVE" name="save" src="Images/spacer.gif" onClick="Placements()">

                </td>

                <td WIDTH="32"><img alt="EXIT" name="exit" src="Images/LogOut3.png" onClick="F1F2Colse()" title="EXIT"></td>
                <td WIDTH="36"><img alt="CLOSE" name="deviation" src="Images/graph3.png" onClick="Deviation(<%=strEventSeq%>)" title="DEVIATION"></td>
                </tr>
            </table>
                
          <%}%>
 <div id="dialog-CmmnRef"  name="dialog-CmmnRef" style="display:none; background:url('Images/trans-wood-1.png')">
<iframe src="blank.jsp" id="IFrame_F1F2CmnRef" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" >
</iframe>
</div>

<input type="hidden" name="hdnNumberOfPlaces" value="<%=strPosNums%>"> <!-- This is used to Establish the Best Postion -->
<input type="hidden" name="hdnEventType" value="<%=strEventType%>"><!-- This is used to Establish the no Best Position for Championsip event, event if they 6 positions -->
<input type="hidden" id="hdnRefreshYN" name="hdnRefreshYN" value="N">
</form>
    </html>

