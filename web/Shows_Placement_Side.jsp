<table style="border-collapse:collapse;">
					<tr>
					<td>
					<div onclick="location.href='Shows.jsp?<%=Calendar.getInstance().getTimeInMillis()%>';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFf; font-weight: bold;
					
					border-top:  1px solid #5D92B1;
					border-left:  1px solid #5D92B1;
					border-right:  1px solid #5D92B1;
					padding: 4px;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Create&nbsp;Show&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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

					padding: 4px;" >&nbsp;&nbsp;&nbsp;&nbsp;Placement&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&raquo;
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
					</tr>
<%}if(Shw_ScrnDeviationStatus_Ins.equals("Y") || Shw_ScrnDeviationStatus_View.equals("Y"))  {%> 
                                        <tr>
					<td>
					<div onclick="location.href='RepDeviation.jsp?<%=Calendar.getInstance().getTimeInMillis()%>';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFf; font-weight: bold;
					
					border:  1px solid #5D92B1;
					padding: 4px;" >&nbsp;&nbsp;&nbsp;&nbsp;Deviations&nbsp;&nbsp;&nbsp;
					</div>
						</td>
					</tr><% }	
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

                                        <tr>
                                        <td>
                                        <div onclick="location.href='Admn_UserProfile.jsp?ty=S&<%=Calendar.getInstance().getTimeInMillis()%>';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
                                        border-top:  1px solid #5D92B1;
                                        border-left:  1px solid #5D92B1;
                                        border-right:  1px solid #5D92B1;
                                        padding: 4px;" >User Profile&nbsp;</div>
                                        </td>
                                        </tr>

					</table>
