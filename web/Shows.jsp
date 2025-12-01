
<%@ page import="beans.ShowBean" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">



<jsp:useBean id="showBean" class="beans.ShowBean" scope="session" />
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>

<html>
<head>
<title>PASO TRACKER</title>

<%@ taglib uri="/WEB-INF/tlds/Paso_tld.tld" prefix="Paso"%>
<link href="Shows.css" rel="stylesheet" type="text/css" />
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="themes/base/jquery.ui.all.css"/>
<link href="style.css" rel="stylesheet" type="text/css" />


	<script src="jquery-1.5.1.js"></script>
	<script src="external/jquery.bgiframe-2.1.2.js"></script>
	<script src="ui/jquery.ui.core.js"></script>
	<script src="ui/jquery.ui.widget.js"></script>
	<script src="ui/jquery.ui.mouse.js"></script>
	<script src="ui/jquery.ui.button.js"></script>
	<script src="ui/jquery.ui.draggable.js"></script>
	<script src="ui/jquery.ui.position.js"></script>
	<script src="ui/jquery.ui.resizable.js"></script>
	<script src="ui/jquery.ui.dialog.js"></script>
	<script src="ui/jquery.effects.core.js"></script>

	<script src="ui/jquery.ui.datepicker.js"></script>
 
        <script type="text/javascript" src="js/interface.js"></script>
         <script type="text/javascript" src="scripts/Shows_Main.js?2"></script>










</head>
<%

    String strTechDirector = "";
    String strShowDirector = "";
    if(showBean.getTechnicalDirector()!=null)
     strTechDirector=showBean.getTechnicalDirector();

    if(showBean.getShowDirector()!=null)
        strShowDirector=showBean.getShowDirector();
%>
<body>
 <form name="frmShow">
<div id="container">

            <div id="header">
                     <%@ include file="frmHeader.jsp"%>
                    
            </div>

		<%
		if(!bShows)
		response.sendRedirect("login.jsp");

		%>


            <div id="content">
            <table style="border-collapse:collapse;" width="712" >
            <tr>
            <td>
              <div align="right"><fieldset> <legend>SHOW DETAILS:</legend>

              <table class="altRow">
                <tr>
                  <td width="115"><font class="label">SHOW NAME</font></td>
                  <td nowrap >
                    <input type="hidden" name="showSeq"
                               value=<% if(showBean.getShowSeq()!=null){ out.println( showBean.getShowSeq()); }%> />
                    <input type="text"  name="showName" class="allcaps"
		    value="<% if(showBean.getShowName()!=null){ out.println( showBean.getShowName()); }%>" />
                  </td>
                  <td nowrap ><img src="Images/Find.gif" onClick="OpenShowSearch()"/></td>
                  <td width="97"><font class="label">PLACE</font></td>
                  <td width="141" colspan="2">
                    <input type="text"  class="allcaps" name="place"
                            value="<% if(showBean.getPlace()!=null){ out.println( showBean.getPlace()); }%>" />
                  </td>
                  <td width="29"><font class="label">DATE</font></td>
                  <td width="60"  >
                    <input type="text"  class="allcaps" name="fromDate" size="6"
                           placeholder="START"
                             value='<% if(showBean.getFromDate()!=null){ out.println( showBean.getFromDate()); }%>'
                             id="datepicker" /><!--<font class="dateStyleBody">&nbsp;START</font>-->
                  </td>
                  <td width="60">
                    <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;" name="toDate" size="6"
                           placeholder="END"
                           value='<% if(showBean.getToDate()!=null){ out.println( showBean.getToDate()); }%>'
                             id="datepickerTo"/><!--<font class="dateStyleBody">END</font>-->
                  </td>
                </tr>
                <tr>
                  <td width="115" ><font class="label">TECHNICAL&nbsp;DIRECTOR</font>
                  </td>
                  <td width="185" >

                      <input type="hidden" id="TechDirectorSeq"
                           name="TechDirectorSeq"  value="<%=strTechDirector%>"
                            />

                    <input type="text" id="Technical Director"  
                           name="technicalDirector"  value="<%=strTechDirector%>"
                           class="allcaps" style="width:163px" />
                 </td>
                  <td width="51" ><img alt="" src="Images/dropdown_icon4.gif" 
                            onClick="OpenCommonRef('Technical Director','TechDirectorSeq','Technical Director')"/></td>
                  <td width="97" ><font class="label">SHOW&nbsp;DIRECTOR</font></td>
                  <td width="69" >

                      <input type="hidden" id="ShowDirSeq"
                           name="ShowDirSeq"  value="<%=strShowDirector%>"
                          />

                    <input type="text" id="Show Director" 
                           name="showDirector"  value="<%=strShowDirector%>"
                           class="allcaps" style="width:143px" />
                       
                  </td>
                  <td width="70" ><img alt="" src="Images/dropdown_icon4.gif" 
                         onClick="OpenCommonRef('Show Director','ShowDirSeq','Show Director')"/></td>
                  <td width="51" ><font class="label">SHOW&nbsp;TYPE</font> </td>
                  <td colspan="2" >
                    <select name="ShowType"  class="allcaps" style="width:133px" id="ShowType" onchange="fnCheckShowType(this)"
                          >
                      <% if(showBean.getShowType()!=null){%>
                      <option Selected> <%=showBean.getShowType()%> </option>
                      <% }%>
                      <option value="">Select</option>
                      <option>Regular</option>
                      <option>International</option>
                      <option>Mundial</option>
					  <option>Exp Equ Gr A JNP</option>
					  <option>Exp Equ Gr B</option>
					  <option>Exp Nal Equ</option>
					  <option>Exp Nal Equ JNP</option>
                    </select>
                  </td>
                  <td >&nbsp;</td>
                </tr>
                <tr>
                  <td width="115"><font class="label">TEMPLATE&nbsp;NAME</font></td>
                  <td>
                    <input type="text"  class="allcaps"
                           name="TemplateName"
                           value="<% if(showBean.getTemplateName()!=null){ out.println( showBean.getTemplateName()); }%>"/>
                  </td>
                  <td colspan="3" style="text-align:left">
                    <input type="checkbox" name="chkDefaultTemplate" <% if(showBean.getDefaultTemplate()!=null && showBean.getDefaultTemplate().equals("A")) {%>Checked<%}%> />
                    Make this as Template for this show  type </td>

                    <td colspan="3"><font class="label">NO.&nbsp;OF&nbsp;JUDGES</font> </td>
                   <td >
                    <input type="text" name="judges" id="judges" class="allcaps" size="1"
                           value="<% if(showBean.getJudges()!=null){ out.println( showBean.getJudges()); }%>"/>
                    </td>
                </tr>
                <tr>
                   
                  <td colspan="9" style="text-align:left">Copy event details from
                    this template
                   
                    <select  name="Template" style="width:163px"  class="allcaps">
                    <option value='0'>Select</option>
                    <Paso:Templates  showType='<%=showBean.getShowType()%>'/>
                    </select>
               
                  </td>

                </tr>
              </table>

            <img alt="Add/View Judges" width="35" height="35" src="Images/Judge.png" onClick="AddJudges('<%=showBean.getShowSeq()%>',judges.value)"
			<% if(Shw_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> />
            <input class="button" type="button" name="Event" value="Add Event" onClick="return AddEvent('<%=showBean.getShowSeq()%>','0','1')"
			<% if(Shw_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%>  />
            <input class="button" type="submit" name="save" value="Save" onClick="fnSubmit('A')"
			<% if(Shw_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> />
            <input class="button" type="button" name="Reset" value="Reset" onClick="fnReset()"/>
            
            <input class="button" type="button" name="Delete" value="Delete Show" onClick="return fnSubmit('I')"
			<% if(Shw_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> />
			
			<input class="button" type="button" name="Print Entries Count" value="Print Entries Count" onClick="PrintEntries()"
			<% if(Shw_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> />
			
			
            <input size="2" type="hidden" name="hdnDeleteYN" value="A"/>
            <input type="hidden" name="PageID" value="SHOWS"/>







				</fieldset> </div>


                            <%
                            ArrayList AlEvent=(ArrayList)session.getAttribute("Events");
                            if (AlEvent == null) {
                                AlEvent = new ArrayList();

                            }
if(AlEvent.size()>0)
 {
                            %>

<table id="grid" class="grid" style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;" >
<thead>
<tr>
<th class="Grid_Header" scope="col" width="100px">NUMBER&nbsp;&nbsp;</th>
<th class="Grid_Header" scope="col" width="100px">DATE</th>
<th class="Grid_Header" scope="col" width="600px">NAME</th>
<th class="Grid_Header" scope="col" width="70px"></th>
</tr>
</thead>

        <tbody>
            <% for(int i=0;i <AlEvent.size();i++)
            {
                String strClass="";
                if( i%2 ==0 )
                    strClass="even";
                else
                    strClass="odd";
            ArrayList AlGetRows=(ArrayList)AlEvent.get(i);
%>
            <tr class="<%=strClass%>">
                <td><%= AlGetRows.get(1)%></td>

                <td><%= AlGetRows.get(2)%></td>

                <td><%= AlGetRows.get(3)%></td>
                <td><img src="Images/pencil_icon.gif" onClick="return AddEvent('<%=showBean.getShowSeq()%>','<%= AlGetRows.get(0)%>','0')">&nbsp;&nbsp;<img src="Images/delete.png" onclick="removeRow(this,'<%= AlGetRows.get(0)%>')"></td>

            </tr>
            <%
            }%>
        </tbody>
</table>
         <%} %>

 </table>
				</div>


				<div id="sidebar">
				<table style="border-collapse:collapse;">
					<tr>
					<td >
					<div onclick="location.href='Shows.jsp?<%=Calendar.getInstance().getTimeInMillis()%>';"  style="Cursor: pointer;background-color: #4e738f; color: #FFFFFf; font-weight: bold;
					
					border-top:  1px solid #5D92B1;
					border-left:  1px solid #5D92B1;
					border-right:  1px solid #5D92B1;
					padding: 4px;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Create&nbsp;Show&nbsp;&nbsp;&nbsp;&nbsp;&raquo;
					</div>
						</td>
					</tr>
					<% if(Shw_ScrnRegShwStatus_Ins.equals("Y") || Shw_ScrnRegShwStatus_View.equals("Y"))  {%> 
					<tr>
					<td>
					<div onclick="location.href='Shows_Register.jsp?<%=Calendar.getInstance().getTimeInMillis()%>';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFf; font-weight: bold;
					
					border-top:  1px solid #5D92B1;
					border-left:  1px solid #5D92B1;
					border-right:  1px solid #5D92B1;
					padding: 4px;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Register&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
						</td>
					</tr>
					
					<%}if(Shw_ScrnPlacementStatus_Ins.equals("Y") || Shw_ScrnPlacementStatus_View.equals("Y"))  {%> 
					 <tr>
					<td>
					<div onclick="location.href='Shows_Placement.jsp?<%=Calendar.getInstance().getTimeInMillis()%>';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFf; font-weight: bold;
					
					border-top:  1px solid #5D92B1;
                                        border-left:  1px solid #5D92B1;
					border-right:  1px solid #5D92B1;

					padding: 4px;" >&nbsp;&nbsp;&nbsp;&nbsp;Placement&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
						</td>
					</tr>
<% }if(Shw_ScrnPlacementStatus_Ins.equals("Y") || Shw_ScrnPlacementStatus_View.equals("Y"))  {%> 
					 <tr>
					<td>
					<div onclick="location.href='Shows_Score_Admin.jsp?<%=Calendar.getInstance().getTimeInMillis()%>';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFf; font-weight: bold;
					
					border-top:  1px solid #5D92B1;
                                        border-left:  1px solid #5D92B1;
					border-right:  1px solid #5D92B1;

					padding: 4px;" >&nbsp;&nbsp;&nbsp;&nbsp;Scorer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
						</td>
					</tr>

<% }if(Shw_ScrnPtsTblStatus_Ins.equals("Y") || Shw_ScrnPtsTblStatus_View.equals("Y"))  {%> 
                                        <tr>
					<td>
					<div onclick="location.href='frmYearlyPoints.jsp?<%=Calendar.getInstance().getTimeInMillis()%>';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFf; font-weight: bold;
					
					border-top:  1px solid #5D92B1;
					border-left:  1px solid #5D92B1;
					border-right:  1px solid #5D92B1;
					padding: 4px;" >&nbsp;&nbsp;&nbsp;&nbsp;Points&nbsp;Table&nbsp;&nbsp;&nbsp;
					</div>
						</td>
					</tr> <%}
					if(Shw_ScrnDeviationStatus_Ins.equals("Y") || Shw_ScrnDeviationStatus_View.equals("Y"))  {%> 
                                        <tr>
					<td>
					<div onclick="location.href='RepDeviation.jsp?<%=Calendar.getInstance().getTimeInMillis()%>';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFf; font-weight: bold;
					
					border-top:  1px solid #5D92B1;
					border-left:  1px solid #5D92B1;
					border-right:  1px solid #5D92B1;
					padding: 4px;" >&nbsp;&nbsp;&nbsp;&nbsp;Deviations&nbsp;&nbsp;&nbsp;
					</div>
						</td>
					</tr>
					<% } 
					if(Adm_ScrnStatus_Ins.equals("Y")){%> 
					
					<tr>
                              <td>
						<div onclick="window.open('sm_rating_listshows.jsp')"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
						border-top:  1px solid #5D92B1;
						border-left:  1px solid #5D92B1;
						border-right:  1px solid #5D92B1;
						padding: 4px;" >Judges Scores&nbsp;</div>
							</td>
							</tr>
					 <tr>
					<%}%>
                              <td>
						<div onclick="location.href='Admn_UserProfile.jsp?ty=S&<%=Calendar.getInstance().getTimeInMillis()%>';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
						border-top:  1px solid #5D92B1;
						border-left:  1px solid #5D92B1;
						border-right:  1px solid #5D92B1;
						padding: 4px;" >User Profile&nbsp;</div>
							</td>
							</tr>
					</table>
				</div>





    
				<div >
				 <%@ include file="frmBottom_Registration.jsp"%>
				</div>




</div>


<div id="dialog-modal" title="Event" style="display:none; background:url('Images/trans-wood-1.png')">
<iframe  id="modalIFrame" width="100%" height="270" marginwidth="0" marginheight="0" frameborder="0">
</iframe>
</div>

<div id="dialog-Show" title="Search Shows" style="display:none; background:url('Images/trans-wood-1.png');" >
<iframe  src="ModalPop_Show.jsp"  id="modalIFrame_Show" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0">
</iframe>
</div>
<div id="dialog-CmmnRef" style="display:none; background:url('Images/trans-wood-1.png')" >
<iframe id="modalIFrame_CmmnRef" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" >
</iframe>
</div>

<div id="dialog_Judges" title="Judges" style="display:none; background:url('Images/trans-wood-1.png')">
<iframe   id="modalIFrame_Judges" width="100%" height="520"
          marginwidth="0" marginheight="0" frameborder="0" >
</iframe>
</div>



		</form>



</body>
</html>