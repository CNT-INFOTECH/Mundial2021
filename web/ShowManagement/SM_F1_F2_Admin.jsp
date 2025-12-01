<%-- 
    Document   : SM_F1_F2_Admin
    Created on : Jul 8, 2015, 11:44:28 AM
    Author     : cntuser
--%>

<%@page import="Shows.F1F2AdminJudge"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>PasoKey - F1/F2 Admin</title>


      <link rel="stylesheet" href="menu.css" type="text/css" media="screen" />
      <link href="Styles/menu.css" rel="stylesheet" type="text/css" />

      <link href="DynamicTable/jquery-ui-1.10.2.custom.css" rel="stylesheet"/>
      <script src="DynamicTable/jquery-1.9.1.min.js"></script>
      <script src="DynamicTable/jquery-ui-1.10.2.custom.min.js"></script>

      <script type="text/javascript" src="Scripts/SM_jscF1_F2.js"></script>         
      <script src="Scripts/shortcut.js" type="text/javascript"></script>   
      <script src="Scripts/SM_ShortCut.js" type="text/javascript"></script> 
       <script src="Scripts/SM_Common.js" type="text/javascript"></script>
      <script src="Scripts/SM_jscF1F2Admin.js" type="text/javascript"></script>
      <link href="Styles/f2ResultBanner.css" rel="stylesheet"/>
       <script src="Scripts/SM_Placements.js?4"></script>
       <script src="js/Alerts/eModal.min.js"></script>
        <script>
            
           $(window).load(function(){
				$("#checkAll").change(function () {
					$("input:checkbox").prop('checked', $(this).prop("checked"));
				});
                                
                                initSM_SKeys;
			});
        
                 

              function fnPrint_Placements(ShwVal,EventSeq) { // Print F2 Placements

               var randomVal = randomString();
               document.forms[0].method = "post";
               document.forms[0].action = "../SMReports?" + randomVal + "&PageID=RptF2Placements&SIdent=" + ShwVal+"&EvnIdent="+EventSeq;
               document.forms[0].target = "_blank";
               document.forms[0].submit();
            }
        </script>      
<style>
.AdminJudge-table
{
  width: 100%;
  margin: 0 auto;
  border-collapse: separate;
  border-spacing: 0;
  text-shadow: 0 1px 0 #fff;
  color: #2a2a2a;
  background: #fafafa;  
  background-image: -moz-linear-gradient(top, #fff, #eaeaea, #fff); /* Firefox 3.6 */
  background-image: -webkit-gradient(linear,center bottom,center top,from(#fff),color-stop(0.5, #eaeaea),to(#fff)); 
}

.AdminJudge-table th
{
  height: 20px;
  line-height: 30px;
  padding: 0 20px;
  border-bottom: 1px solid #cdcdcd;
  box-shadow: 0 1px 0 white;
  -moz-box-shadow: 0 1px 0 white;
  -webkit-box-shadow: 0 1px 0 white;
  white-space: nowrap;
  text-align: center;
  background-color: #FAFFF5;  
}
.AdminJudge-table td
{
  height: 40px;
  line-height: 40px;
  padding: 0 20px;
  border-bottom: 1px solid #cdcdcd;
  box-shadow: 0 1px 0 white;
  -moz-box-shadow: 0 1px 0 white;
  -webkit-box-shadow: 0 1px 0 white;
  white-space: nowrap;
  text-align: center;
}
.AdminJudge-table tbody td
{
  text-align: center;
  font: bold 20px Verdana, Arial, Helvetica;
  width: 150px;
}

.AdminJudge-table tbody td:first-child
{
  width: auto;
  text-align: center;
}

.AdminJudge-table td:nth-child(odd)
/*, .features-table td:nth-child(4)
,.features-table td:nth-child(5), .features-table td:nth-child(6)
,.features-table td:nth-child(7), .features-table td:nth-child(8)*/
{
  background: #efefef;
  background: rgba(144,144,144,0.15);
  border-right: 1px solid white;
}


.AdminJudge-table td:nth-child(1)
{
  background: #e7f3d4;  
  background: rgba(184,243,85,0.3);
  font: bold 20px Verdana, Arial, Helvetica;
}


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
   </head>
   <body>
   <form name="frmF1_F2_Admin">
                 
            
            <%@ include file="SM_F1F2_AdminTop.jsp"%>
            <%
                String strJudgingType="0";
                
                    String strF1_3_Judge = "button";
                    String strAddWork_3_Judge = "button";
                    String strF2_3_Judge = "button";
                    String strF2_3_Mos = "hidden";
                    
                    
                    String strF1_5_Judge = "button";
                    String strAddWork_5_Judge = "button";
                    String strF2_5_Judge = "button";
                    
                    if(strJudgingType.equals("0")){ // Traditional F1/F2
                        strF1_3_Judge = "button";
                        strAddWork_3_Judge = "button";
                        strF2_3_Judge = "button";
                    }
                    else if (strJudgingType.equals("1")){ //5 Judges High Low F1/F2
                     strF1_5_Judge = "hidden";
                     strAddWork_5_Judge = "hidden";
                     strF2_5_Judge = "hidden";
                    }
                    
                    else if (strJudgingType.equals("2")){ //3 Judge Mos
                     strF1_3_Judge = "hidden";
                     strAddWork_3_Judge = "hidden";
                     strF2_3_Mos = "hidden";
                     strF2_3_Judge = "hidden";
                    }
            %>
              
               <table width="100%">
                   
<!--                    <tr>
       
        <td>
               
                <table bgcolor="#c0c0c0" border="2" width="340" cellspacing="0">
                  <tr>
                     <td align="center">
                       <b>2 Min Warning</b>
                     </td>
                     <td>Start Time <LABEL  id="startTime_Gate"  style="font-weight:bold"><%=strStTime_Gate%></LABEL></td>
                     
                  </tr>
                  <tr>
                     <td align="center">
                      
                         <input type="text" size="12" name="stwa" value="<%=strDuration_Gate%>" style="text-align: center; background: #000000; color: #00ff00; border: 1" /><br />
                         <input type="button" name="theButton" onclick="Update2MinStart(this.value,'<%=currentEventSeq%>'), stopwatch(this.value);" value="Start" />
                         <input type="button" value="Reset" onclick="resetIt();reset();" />
                      
                     </td>
                      <td>End Time <LABEL  id="endTime_Gate"  style="font-weight:bold"><%=strEndTime_Gate%></LABEL></td>                  
                  </tr>     
                </table>
                         
                  <br />

               

        </td>
     </tr>-->
     
                   <tr>

                    
                       <td bgcolor=wheat width="20%" align="center"> 
                           <input type="button" value="S t a r t" 
                                       onclick="startTimer('<%=currentEventSeq%>','<%=strEndTime%>')" style="font-weight:bold"><br>
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
                   
            <table width="100%">

                <tr>
                  
                   <td>
                        <table align="right">
                           
                            
                            <td>
                            <input type="<%=strF1_3_Judge%>" onClick="OpenF1_NC1D('<%=strCookieShowSeq%>','<%=currentEventSeq%>')" value="F1 Cut - 3"></input></span></td>
                            <td><span > <input type="<%=strAddWork_3_Judge%>" onClick="OpenAddWork_NC1D('<%=strCookieShowSeq%>','<%=currentEventSeq%>')" value="Add'nal WO - 3"></input></span></td>   
                            <td><span > <input type="<%=strF2_3_Judge%>" onClick="OpenF2_NC1D('<%=strCookieShowSeq%>','<%=currentEventSeq%>')" value="Placements - 3"></input></span></td>   
                            <td><span > <input type="<%=strF2_3_Mos%>" onClick="OpenF2_NC1D_MOS('<%=strCookieShowSeq%>','<%=currentEventSeq%>')" value="MOS Placements"></input></span></td>   
                            
                            
                            
                            <!--
                          
                            <td><span > <input type="button"  onclick="fnJudPageAction('<%=strCookieShowSeq%>', EventNum,EventSeq,'refresh')" value="Refresh"></input></span></td> -->
                             
                            
                           
                           
                           
                            
                             
                                
                             <span >
                                                              
                             <td><input type="<%=strF1_5_Judge%>" onClick="OpenF1('<%=strCookieShowSeq%>','<%=currentEventSeq%>')" value="F1 Cut -5"></input></span></td>
                             <td><span > <input type="<%=strAddWork_5_Judge%>" onClick="OpenAddWork('<%=strCookieShowSeq%>','<%=currentEventSeq%>')" value="Add'nal WO-5"></input></span></td>
                            <td><span > <input  type="<%=strF2_5_Judge%>" onClick="OpenF2('<%=strCookieShowSeq%>','<%=currentEventSeq%>')" value="Placements-5"></input></span></td>   
                            <td>&nbsp;</td> <td>&nbsp;</td>
                            
                             <td><input type='button' value="Add Entries" onClick="Add_ClassEntry('SM_Pop_Add_Entry.jsp?PgID=RptCls&SIdent=<%=strCookieShowSeq%>&EvntSq=<%=currentEventSeq%>')"/></td>
                               <td><input type='button' value="Print Entries" onClick="fnCommonPageLoad_Tar('../Participants?PageID=PARTICIPANTS&N2GmUsGGliFbV4RMw6X3fuWHR3EOCKVRpWMetuHXR0qcbzO6EOa5MTDUASmhCkwrUiO7cLuO2M1EDa8KnbK7zt6rhXWDWT3f4Kcp&PageID=SmPrepista&ShowSeq=<%=strCookieShowSeq%>&EventSeq=<%=currentEventSeq%>','_blank')"/></td>
                           
                            <td><span > <input type="button"  onclick="fnPrint_Placements('<%=strCookieShowSeq%>','<%=currentEventSeq%>')" value="Print Report"></input></a></span></td> 
                            
                            <td>&nbsp;</td> <td>&nbsp;</td>
                             <% if(strUserID!=null && (strUserID.equalsIgnoreCase("dbrown")|| strUserID.equalsIgnoreCase("admin")|| strUserID.equalsIgnoreCase("devraju")|| strUserID.equalsIgnoreCase("41431"))){%>
                            <td style="border-width:0px;padding:0px">
                              <input type=button value="Save" onClick='fnCommonPageLoad("../ShowController?PageID=F1F2_AdminJudge")'></td>
                             <%}%>
                            <td style="border-width:0px;padding:0px"><input type=button value="Reset"  onClick=" fnCommonPageLoad('SM_F1_F2_Admin.jsp')" ></td>
                        </table>    
                    </td>
                </tr>
            </table>
             
                  
<table id="judgeDet"  class="AdminJudge-table" width="100%" >
   <tr>
      <th width="50%" ><h2>Judge</h2></th>
      <th  width="10%">Calling Judge</th>
       <th width="10%"><input type="checkbox" id="checkAll"/>Current Judge</th>
      <th width="10%">
          Select All
            <select name="allCurntPg"  id="allCurntPg"  style='background-color:  #FFF8DC; border:  1px solid #000000;'
                    onchange="applyCurntPgAllJudges(this,noOfJudge,'curntPg')"  >                                  
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
      /*String strShowSq = "";
      String strEventSq = "";

      
      if (request.getParameter("sIdent") != null) {
         strShowSq = request.getParameter("sIdent");
      }

      if (request.getParameter("eIdent") != null) {
         strEventSq = request.getParameter("eIdent");
      }*/

      
      F1F2AdminJudge f1f2AdminJud = new F1F2AdminJudge();
      //GetAdminJudgeDetails
      ArrayList alJudges = new ArrayList();
      ArrayList arJudRw = new ArrayList();
      int jNum = 1;
      alJudges = f1f2AdminJud.GetAdminJudgeDetails(strCookieShowSeq, currentEventSeq,strUserID,strDBName);//currentRow=EventSeq
      if (alJudges.size() > 0) {
         for (int j = 0; j < alJudges.size(); j++) {
            arJudRw = new ArrayList();
            arJudRw = (ArrayList) alJudges.get(j);
   %>
   <tr>
      <td style="text-align:left;">
         <%=jNum++%>
         <input type=hidden name='judSeq<%=j%>' id='judSeq<%=j%>' value='<%=arJudRw.get(3)%>'  size="3" />
         <input type=hidden size="3" name='judgeNum<%=j%>' id='judgeNum<%=j%>' value='<%=arJudRw.get(2)%>' />
         <label id='judName<%=j%>'  ><%=":" + arJudRw.get(5)%><label>
               </td>
               <td>
                  <input type=radio name='CallingJudge<%=j%>' id="CallingJudge<%=j%>"  onclick="fnRadioAction(this,'<%=alJudges.size()%>', 'CallingJudge')"
                         <%if (arJudRw.get(7).toString().trim().equalsIgnoreCase("Y")) {
                               out.println("checked");
                            }%> />
               </td>                  
               <td>
                  <input type=checkbox  name='CurrentJudge<%=j%>' id="CurrentJudge<%=j%>"  onclick="fnChkBoxEdit(this,CallingJudge<%=j%>)"
                         <%if (arJudRw.get(8).toString().equalsIgnoreCase("Y")) {
                        out.println("checked");
                     }%>/>
               </td>
               <td>
                  <select name="curntPg<%=j%>"  id="curntPg<%=j%>"  style='background-color:  #FFF8DC; border:  1px solid #000000;' >                                  
                     <option value="">Select</option>
                      <option value="F1.jsp" <%if (arJudRw.get(4).toString().equalsIgnoreCase("F1.jsp")) {out.println("selected");} %>  >F1 Cut</option>
                       <option value="F1F2AdditionalWork.jsp" <%if (arJudRw.get(4).toString().equalsIgnoreCase("F1F2AdditionalWork.jsp")) {out.println("selected");} %>  >Additional Work Off</option>
                      <option value="F2.jsp" <%if (arJudRw.get(4).toString().equalsIgnoreCase("F2.jsp")) {out.println("selected");} %> >Pin Class</option>
                     <option value="F2_TieBreaker.jsp" <%if (arJudRw.get(4).toString().equalsIgnoreCase("F2_TieBreaker.jsp")) {out.println("selected");} %> >Tie Breaker</option>
                    <option value="F1F2Pending.jsp" <%if (arJudRw.get(4).toString().equalsIgnoreCase("F1F2Pending.jsp")) {out.println("selected");} %> >Pending</option>
                  </select>                        
               </td>
               </tr>
               <%

                     }
                  }

               %>
               </table>
                   
           
         <input type="hidden" size='3' id="PageID"  name="PageID" value="F1F2_AdminJudge" />
         <input type="hidden"  name="noOfJudge" id="noOfJudge" value="<%=alJudges.size()%>" />
         
         
         
            <script language="JavaScript" type="text/javascript">
          
            function Update2MinStart(text,ValEventSeq){
               if (text == "Start"){
                   valEndTime_Gate =document.getElementById('endTime_Gate').innerHTML;
                   bContinue=true
                    if(valEndTime_Gate!=='')
                     var r = confirm("This class has already ended. Do you want to restart?");
                        if (r == false) {
                          bContinue=false;
                       }
                    if(bContinue)
                        UpdateClassStartStopTime(3,'startTime_Gate',ValEventSeq)
                }
                else if (text == "Stop "){
                    UpdateClassStartStopTime(4,'endTime_Gate',ValEventSeq)
                }
                
            }
            var sec = 0;
            var min = 0;
            var hour = 0;
            
             
            function stopwatch(text) {
                
               
            sec++;
            if (sec == 60) {
                sec = 0;
                min = min + 1; 
            }
            else {
                min = min; 
            }
            if (min == 60) {
                min = 0; 
                hour += 1; 
            }

            if (sec<=9) { sec = "0" + sec; }
            
            document.frmF1_F2_Admin.stwa.value = ((hour<=9) ? "0"+hour : hour) + " : " + ((min<=9) ? "0" + min : min) + " : " + sec;

            if (text == "Start") { document.frmF1_F2_Admin.theButton.value = "Stop "; }
            if (text == "Stop ") { document.frmF1_F2_Admin.theButton.value = "Start"; }

            if (document.frmF1_F2_Admin.theButton.value == "Start") {
            window.clearTimeout(SD);
            return true; }
        
                SD=window.setTimeout("stopwatch();", 1000);
            }

            function resetIt() {
                sec = -1;
                min = 0;
                hour = 0;
                if (document.frmF1_F2_Admin.theButton.value == "Stop ") {
                    document.frmF1_F2_Admin.theButton.value = "Start"; 
                }
                window.clearTimeout(SD);
            }
           
            </script>
         
         <script type="text/javascript">
			<!--
			/* variable setup */
			var hoursLabel = document.getElementById("hours");
                      	var minutesLabel = document.getElementById("minutes");
			var secondsLabel = document.getElementById("seconds");
			var test = document.getElementById("test");
			var totalMills = 0;
			var totalSeconds = 0;
			var totalMinutes = 0;
			var totalHours = 0;
			var startHours = 0;
			var startMinutes = 0;
			var startSeconds = 0;
			var startMills = 0;
			var counter = 0;
			var timerOn = 0;
			var htmlResets = 0;
			var dateGrab = 0;
			var timerPaused = 0;
			var dateStart = 0;
			var datePaused = 0;
			
			/* starts and pauses the timer if conditions are met */
			function startTimer(ValEventSeq ,valEndTime)
			{
                              if(valEndTime!=='')
                                 var r = confirm("This class has already ended. Do you want to restart?");
                                     if (r == false) {
                                       return;
                                    }
				if(timerOn == 1)
				{
					return;
				}
				else if(timerOn == 0 & timerPaused == 0)
				{
					/* setup the initial clock and read the time */
					dateStart = new Date();
					startHours=dateStart.getHours();
					startMinutes=dateStart.getMinutes();
					startSeconds=dateStart.getSeconds();
					startMills=dateStart.getMilliseconds();
					
					counter = setInterval(setTime, 10);
					timerOn = 1;
					htmlResets = 0;
                                        UpdateClassStartStopTime(1,'startTime',ValEventSeq)
                                        
                                        
				}
				else if(timerOn == 0 & timerPaused == 1)
				{
					/* resets the start date while making time corrections to prevent lose of place */
					dateStart = new Date();
					startHours = dateStart.getHours() - totalHours;
					startMinutes = dateStart.getMinutes() - totalMinutes;
					startSeconds = dateStart.getSeconds() - totalSeconds;
					startMills = dateStart.getMilliseconds() - totalMills;
					dateStart.setHours((dateStart.getHours()-startHours),(dateStart.getMinutes()-startMinutes),(dateStart.getSeconds()-startSeconds),(dateStart.getMilliseconds()-startMills));
					counter = setInterval(setTime, 10);
					timerOn = 1;
					htmlResets = 0;
				}
			}
			
			/* stops and resets the timer if conditions are met */
			function stopTimer(ValEventSeq)
			{
                                 UpdateClassStartStopTime(2,'EndTime',ValEventSeq)
				if(timerOn == 1)
				{
					clearInterval(counter);
					timerOn = 0;
					timerPaused = 1;
				}
				
				if(htmlResets == 1)
				{
					hoursLabel.innerHTML = "00";
					minutesLabel.innerHTML = "00";
					secondsLabel.innerHTML = "00";
					totalMills = 0;
					totalSeconds = 0;
					totalMinutes = 0;
					totalHours = 0;
					timerPaused = 0;
				}
				else
				{
					htmlResets = 1;
				}
			}
			
			function setTime()
			{
				/* setup the new clock , read the time, compare it to the start time, assign variables */
				dateGrab = new Date();
				dateGrab.setHours((dateGrab.getHours()-startHours),(dateGrab.getMinutes()-startMinutes),(dateGrab.getSeconds()-startSeconds),(dateGrab.getMilliseconds()-startMills));

				totalHours = dateGrab.getHours();
				totalMinutes = dateGrab.getMinutes();
				totalSeconds = dateGrab.getSeconds();
				totalMills = dateGrab.getMilliseconds();

				/* rolls over and resets the timer if left running too long */
				if(totalHours == 99 & totalMinutes == 59 & totalSeconds == 59)
				{
					totalHours = 0;
					totalMinutes = 0;
					totalSeconds = 0;
					totalMills = 0;
					hoursLabel.innerHTML = "00";
					minutesLabel.innerHTML = "00";
					secondsLabel.innerHTML = "00";
					clearInterval(counter);
					timerOn = 0;
				}
				
				/* format and display variables */
				secondsLabel.innerHTML = pad(totalSeconds);
				minutesLabel.innerHTML = pad(totalMinutes);
				hoursLabel.innerHTML = pad(totalHours);
			}
			
			/* formats the variables by adding leading "0"s and converting to strings for display */
			function pad(val)
			{
				var valString = val + "";
				if(valString.length < 2)
				{
					return "0" + valString;
				}
				else
				{
					return valString;
				}
			}
		//-->
		</script>
  </body>       
   </form>
</html>

