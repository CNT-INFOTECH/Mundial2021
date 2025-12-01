<%-- 
    Document   : Shows_ResultBanner
    Created on : Apr 4, 2016, 3:31:39 PM
    Author     : cntuser
--%>
<%@page import="java.sql.Statement"%>
<%@page import="model.DbConnMngr"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en"> <!--<![endif]-->
    <head >
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Show Result Banner</title>
        <link rel="stylesheet" href="css/style.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
<!--        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>-->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="css/jquery.min.js"></script>
        <script src="css/bootstrap.min.js"></script>
        
        <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
        <script type="text/javascript" src="scripts/jscCommon.js"></script>
        <script type="text/javascript" src="jscCommon.js"></script>


        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="themes/base/jquery.ui.all.css"/>
        <link href="style.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="jquery-1.5.1.js"></script>
        <script type="text/javascript" src="external/jquery.bgiframe-2.1.2.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.core.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.widget.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.mouse.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.button.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.draggable.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.position.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.resizable.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.dialog.js"></script>
        <script type="text/javascript">

            function loadFinalResult() {                
                var refresh =40000; // Refresh rate in milli seconds
                //10 min =600000
                var mytime = setTimeout('openFinalResultBanner()', refresh)
            }
            function openFinalResultBanner() {

                var sSq=document.getElementById('sSq').value;
                var eSq=document.getElementById('eSq').value;
                var d = new Date();
                document.forms[0].method = "post";
                document.forms[0].action = "Shows_FinalResultBanner.jsp?sSq="+sSq+"&eSq="+eSq+"&" + d.getTime();
                document.forms[0].target = "_self";
                document.forms[0].submit();


            }
            
//            function requestFullScreen(element) {
//    // Supports most browsers and their versions.
//    var requestMethod = element.requestFullScreen || element.webkitRequestFullScreen || element.mozRequestFullScreen || element.msRequestFullscreen;
//
//    if (requestMethod) { // Native full screen.
//        requestMethod.call(element);
//    } else if (typeof window.ActiveXObject !== "undefined") { // Older IE.
//        var wscript = new ActiveXObject("WScript.Shell");
//        if (wscript !== null) {
//            wscript.SendKeys("{F11}");
//        }
//    }
//}
//
//var elem = document.body; // Make the body go full screen.
//requestFullScreen(elem);



            // Find the right method, call on correct element
            function launchIntoFullscreen(element) {
                
                if (!document.fullscreenElement &&    // alternative standard method
                    !document.mozFullScreenElement && !document.webkitFullscreenElement) {  // current working methods
                        if (element.requestFullscreen) {
                            element.requestFullscreen();
                        } else if (element.mozRequestFullScreen) {
                            element.mozRequestFullScreen();
                        } else if (element.webkitRequestFullscreen) {
                            element.webkitRequestFullscreen();
                        } else if (element.msRequestFullscreen) {
                            element.msRequestFullscreen();
                        }
                }else {
                    if (document.cancelFullScreen) {
                      document.cancelFullScreen();
                    } else if (document.mozCancelFullScreen) {
                      document.mozCancelFullScreen();
                    } else if (document.webkitCancelFullScreen) {
                      document.webkitCancelFullScreen();
                    }
                }
            }
            
            function exitFullscreen() {
//                alert();
                if(document.exitFullscreen) {
                  document.exitFullscreen();
                } else if(document.mozCancelFullScreen) {
                  document.mozCancelFullScreen();
                } else if(document.webkitExitFullscreen) {
                  document.webkitExitFullscreen();
                }
              }


            function closeBannerAutomatically() {                
                window.open('', '_parent', '');                
                window.close();
            }

            $(document).keydown(function(e) {
                // ESCAPE key pressed
                if (e.keyCode == 27) {
                    exitFullscreen();
                    closeBannerAutomatically()            
                }
            });
            



//// mozfullscreenerror event handler
//function errorHandler() {
//   alert('mozfullscreenerror');
//}
//document.documentElement.addEventListener('mozfullscreenerror', errorHandler, false);
//
//// toggle full screen
//function toggleFullScreen() {
//  if (!document.fullscreenElement &&    // alternative standard method
//      !document.mozFullScreenElement && !document.webkitFullscreenElement) {  // current working methods
//    if (document.documentElement.requestFullscreen) {
//      document.documentElement.requestFullscreen();
//    } else if (document.documentElement.mozRequestFullScreen) {
//      document.documentElement.mozRequestFullScreen();
//    } else if (document.documentElement.webkitRequestFullscreen) {
//      document.documentElement.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT);
//    }
//  } else {
//    if (document.cancelFullScreen) {
//      document.cancelFullScreen();
//    } else if (document.mozCancelFullScreen) {
//      document.mozCancelFullScreen();
//    } else if (document.webkitCancelFullScreen) {
//      document.webkitCancelFullScreen();
//    }
//  }
//}

// keydown event handler
document.addEventListener('keydown', function(e) {
  if (e.keyCode == 13 || e.keyCode == 70) { // F or Enter key
    launchIntoFullscreen(document.documentElement);
    
  }
}, false);
        </script>
        
    </head>
    <body onload="loadFinalResult()" style="zoom:80%;" >
        <%
//            partial interface Element {
//  void requestFullscreen();
//};
//
//partial interface Document {
//  readonly attribute boolean fullscreenEnabled;
//  readonly attribute Element? fullscreenElement;
//
//  void exitFullscreen();
//};
%>        
        <form>
            <section class="" >
                <%
                    //onclick="var el = document.getElementById('sss'); el.webkitRequestFullscreen();"
                    Connection localConnection = null;
                    DbConnMngr dbcmt = new DbConnMngr();

                    CallableStatement cst = null;
                    ResultSet rs = null;
                    Statement st = null;
                    String sShowSq = "";
                    String sShowName = "";
                    String sEventName = "";
                    String strEventSeq_F1_F2 = "";
                    String sJudges = "";
                    String sEventOrder = "";
                    String sEventDate = "";
                    String sEventType = "";
                    String sShowType = "";
                    String sCategory = "";
					String sJ1Name="J1";
					String sJ2Name="J2";
					String sJ3Name="J3";
					String sJ4Name="J4";
					String sJ5Name="J5";
					
					int noOfPos=5;

                    if (request.getParameter("sSq") != null) {
                        sShowSq = request.getParameter("sSq");
                    }

                    if (request.getParameter("eSq") != null) {
                        strEventSeq_F1_F2 = request.getParameter("eSq");
                    }

                    try {
                        localConnection = dbcmt.getConnection();
                        localConnection.setAutoCommit(false);
                        if (sShowSq != null && sShowSq.length() > 0) {//regSeq is assigned#

                            st = localConnection.createStatement();
                            rs = st.executeQuery("select convert(varchar(12),event_date,101) as eventDate,b.category,* from shows a join Events b on a.Show_Seq=b.Show_Seq and b.Event_Seq='" + strEventSeq_F1_F2 + "' "
                                    + " where a.show_seq='" + sShowSq + "' ");

                            if (rs.next()) {

                                if (rs.getString("Show_Name") != null) {
                                    sShowName = rs.getString("Show_Name");
                                }
                                if (rs.getString("Name") != null) {
                                    sEventName = rs.getString("Name");
                                }
                                if (rs.getString("Judges") != null) {
                                    sJudges = rs.getString("Judges");
                                }
                                if (rs.getString("Event_Order") != null) {
                                    sEventOrder = rs.getString("Event_Order");
                                }

                                if (rs.getString("eventDate") != null) {
                                    sEventDate = rs.getString("eventDate");
                                }

                                if (rs.getString("EventType") != null) {
                                    sEventType = rs.getString("EventType");
                                }

                                if (rs.getString("Show_Type") != null) {
                                    sShowType = rs.getString("Show_Type");
                                }

                                if (rs.getString("Category") != null) {
                                    sCategory = rs.getString("Category");
                                }

                                if (rs.getString("Num_of_Positions") != null) {
                                    noOfPos = Integer.parseInt(rs.getString("Num_of_Positions"));
                                }

                            }
                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    } finally {
                        if (rs != null) {
                            rs.close();
                        }
                        if (st != null) {
                            st.close();
                        }
                    }

					//To Fetch Judges Name
					try {
						rs = null;
                        localConnection = dbcmt.getConnection();
                        localConnection.setAutoCommit(false);
                        if (strEventSeq_F1_F2 != null && strEventSeq_F1_F2.length() > 0) {
                            
								cst = null;
								cst = localConnection.prepareCall("{call Get_Event_JudgeNames(?)}");
								cst.setString(1, strEventSeq_F1_F2);

								rs = cst.executeQuery();
								if (rs.next()) {
																							
									if (rs.getString("J1") != null)
										sJ1Name = rs.getString("J1");
                                
									if (rs.getString("J2") != null)
										sJ2Name = rs.getString("J2");
									
									if (rs.getString("J3") != null)
										sJ3Name = rs.getString("J3");
									
									if (rs.getString("J4") != null)
										sJ4Name = rs.getString("J4");
									
									if (rs.getString("J5") != null)
										sJ5Name = rs.getString("J5");
                            }
                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    } finally {
                        if (rs != null) {
                            rs.close();
                        }
                        if (cst != null) {
                            cst.close();
                        }
                    }

                %>            

                <div class="col-lg-12 col-md-12 col-sm-12 tittle-bar">
                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <span class="main-tittle-top"><img src="img/paso.png"></span>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 t-class v-class">
                        <h3 onclick="launchIntoFullscreen(document.documentElement)"><%=sShowName%></h3>

                    <input type="hidden" id="sSq" name="sSq" value="<%=sShowSq%>" />
                    <input type="hidden" id="eSq" name="eSq" value="<%=strEventSeq_F1_F2%>" />

                    </div>

                    <div class="col-lg-4 col-md-4 col-sm-4 tb-left e-class">
                        <h4><%=sEventDate%><hr>
                            &nbsp;<hr><span class="event1">Event&nbsp;#&nbsp;<%=sEventOrder%>
                            </span></h4>
                    </div>
                </div>

                <div class="col-lg-12 class-bar">
                    <h4><%=sEventName%></h4>
                </div>
                <table class="table">
                    <thead class="widget-heading">
                        <tr>
                            <%if(sShowType!=null && sShowType.equalsIgnoreCase("Mundial")){%>  
                            <th style="text-transform:none;"></th>    
                            <%}%>  
                            <th style="text-transform:none;">Back#</th>                                
                            <th style="text-transform:none;"><%=sJ1Name%></th>
                            <th style="text-transform:none;"><%=sJ2Name%></th>
                            <th style="text-transform:none;"><%=sJ3Name%></th>
                            <%if(sJudges.equalsIgnoreCase("5")){%>
                            <th style="text-transform:none;"><%=sJ4Name%></th>
                            <th style="text-transform:none;"><%=sJ5Name%></th>                            
                            <%}%>
                            <th style="text-transform:none;">Total</th>
                            <th style="text-transform:none;">Position</th>
                        </tr>
                    </thead>
                    <tbody class="widget-content">
                        <%

                            String strEvent = "";
                            boolean bChangeF2 = false;
                            if (strEventSeq_F1_F2 != null && strEventSeq_F1_F2.trim().length() > 0) {
                                ArrayList ArEvent = new ArrayList();
                                ArrayList ArRow = new ArrayList();
                                try {
                                    cst = null;
                                    cst = localConnection.prepareCall("{call GET_EVENT_PARTICIPANTS_F1F2(?)}");
                                    cst.setString(1, strEventSeq_F1_F2);

                                    ResultSet rs1 = cst.executeQuery();
                                    while (rs1.next()) {
                                        bChangeF2 = true;
                                    ArRow = new ArrayList();
									
									if(rs1.getString("Placement")!=null && rs1.getString("Placement").equals("999"))
									 	break;
                                    
                                    if(rs1.getString("Placement")!=null)
                                        ArRow.add(rs1.getString("Placement"));
                                    else
                                        ArRow.add("");
                                    
                                    if(rs1.getString("AssignedNum")!=null)
                                        ArRow.add(rs1.getString("AssignedNum"));
                                    else
                                        ArRow.add("");
                                    
                                    if(rs1.getString("J1Pos")!=null)
                                        ArRow.add(rs1.getString("J1Pos"));
                                    else
                                        ArRow.add("");
                                    
                                    if(rs1.getString("J2Pos")!=null)
                                        ArRow.add(rs1.getString("J2Pos"));
                                    else
                                        ArRow.add("");
                                    
                                    if(rs1.getString("J3Pos")!=null)
                                        ArRow.add(rs1.getString("J3Pos"));
                                    else
                                        ArRow.add("");
                                    
                                    if(rs1.getString("J4Pos")!=null)
                                        ArRow.add(rs1.getString("J4Pos"));
                                    else
                                        ArRow.add("");
                                    
                                    if(rs1.getString("J5Pos")!=null)
                                        ArRow.add(rs1.getString("J5Pos"));
                                    else
                                        ArRow.add("");
                                    
                                    if(rs1.getString("Total")!=null)
                                        ArRow.add(rs1.getString("Total"));
                                    else
                                        ArRow.add("");
                                    
                                    if(rs1.getString("RepCountry")!=null)
                                        ArRow.add(rs1.getString("RepCountry"));
                                    else
                                        ArRow.add("");
                                    
                                    ArEvent.add(ArRow);
                                 }

                                rs1.close();
                                cst.close();

                                localConnection.commit();
                                dbcmt.releaseConnection(localConnection);

                            } catch (Exception ex) {
                                ex.printStackTrace();
                                try {
                                    System.out.println("release:");
                                    localConnection.rollback();
                                    dbcmt.releaseConnection(localConnection);
                                } catch (SQLException exc) {
                                    exc.printStackTrace();
                                }

                            }
                            int lpSize=0;
                            
                            if(noOfPos>5)
                                lpSize=noOfPos;
                            else if(ArEvent.size()>0 && ArEvent.size()<6)
                                lpSize=ArEvent.size();
                            else if(sEventType.equalsIgnoreCase("Championship"))
                                lpSize=6;
                            else if(ArEvent.size()>5)
                                lpSize=5;
							/* else if(noOfPos>5)
                                lpSize=noOfPos;*/
                            
                            for(int i=0;i<lpSize;i++){
                                    ArRow=(ArrayList)ArEvent.get(i);
                                        
                                        
                        %>
                        <tr>
                            <%if(sShowType!=null && sShowType.equalsIgnoreCase("Mundial")){%>    
                            <td><%if(ArRow.get(8).toString().length()>0){%><img src="img/<%=ArRow.get(8).toString()%>.jpeg" width="40%"><%}%></td>
                            <%}%>
                            <td><b><%=ArRow.get(1).toString()%></b></td>                            
                            <td><%=ArRow.get(2).toString()%></td>
                            <td><%=ArRow.get(3).toString()%></td>
                            <td><%=ArRow.get(4).toString()%></td>
                            
                            <%if(sJudges.equalsIgnoreCase("5")){%>
                            <td><%=ArRow.get(5).toString()%></td>
                            <td><%=ArRow.get(6).toString()%></td>          
                            <%}%>

                            <td><%=ArRow.get(7).toString()%></td>
                            <td><%if(i==5){out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");}else{%><img src="img/<%if(sShowType.equalsIgnoreCase("Mundial") && sCategory.equalsIgnoreCase("EQUITATION")){
                                        if(ArRow.get(0).toString().equalsIgnoreCase("B"))
                                            out.println("1");
                                        else{
                                        out.println(Integer.parseInt(ArRow.get(0).toString())+1);}
                                    }else out.println(ArRow.get(0).toString());%>.png"><%}%>
                                <%if (!ArRow.get(0).toString().equals("999")) {%> 
                                <%
                                    System.out.println(sShowType+":"+sCategory);
                                            
                                    if(sShowType.equalsIgnoreCase("Mundial") && sCategory.equalsIgnoreCase("EQUITATION")){
                                        if(ArRow.get(0).toString().equalsIgnoreCase("B"))
                                            out.println("C");
                                        else{
                                        out.println(Integer.parseInt(ArRow.get(0).toString()));}
                                    }
                                    else if(sEventType.equalsIgnoreCase("Championship")){
                                        if(ArRow.get(0).toString().equalsIgnoreCase("1"))
                                            out.println("&nbsp;&nbsp;GC");
                                        else if(ArRow.get(0).toString().equalsIgnoreCase("2"))
                                            out.println("GCR");
                                        else{out.println("&nbsp;&nbsp;&nbsp;&nbsp;");
                                        out.println(Integer.parseInt(ArRow.get(0).toString())-2);}
                                    }																		
                                    else
                                        out.println(ArRow.get(0).toString());
                                %> 
                                <%}else if(i==5 && sEventType.equalsIgnoreCase("Championship"))
                                            out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4");%>
                            </td>

                        </tr>
                        <% }                                 

                            }

                        %>

                    </tbody>
                </table>
                        
                         
                <!-- <div class="col-lg-12 tittle-bar-bottom"><h4 class="class-name">Class Name <span class="main-tittle"><h4>Powered By :</h4> <img src="img/cntit.png"></span></h4></div> -->
                <div class="col-lg-12 tittle-bar-bottom">
                    <div class="col-lg-6 b-class g-class">
                        <h4>© 2011 CNT Infotech. All Rights Reserved.
                            &nbsp;<hr><a onclick="openFinalResultBanner()">Next</a>
                            &nbsp;&nbsp;&nbsp;<a onclick="closeBannerAutomatically()">Close</a>
                            &nbsp;&nbsp;&nbsp;<a onclick="launchIntoFullscreen(document.documentElement)">Fullscreen</a>
                        </h4>
                    </div>
                    <div class="col-lg-6 tb-right">
                        <span class="main-tittle"><!-- <h4>Powered By :</h4> --><img src="img/cnt.png"></span>
                    </div>
                </div>




                <!-- <ul class="downloads">
                  <li class="download">
                    <h4 class="download-name">293</h4>
                  </li>
                  <li class="download">
                    <h4 class="download-name">525</h4>
                  </li>
                </ul> -->
            </section>
        </form>
    </body>
</html>

