<%-- 
    Document   : RptShow
    Created on : Jul 19, 2016, 10:41:07 AM
    Author     : cntuser
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <title>PasoTracker</title>

        <%@ taglib uri="/WEB-INF/tlds/Paso_tld.tld" prefix="Paso"%>
        <link href="Shows.css" rel="stylesheet" type="text/css" />
        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
        <link href="buttons.css" rel="stylesheet" type="text/css" />
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
        <script type="text/javascript" src="ui/jquery.effects.core.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.autocomplete.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.datepicker.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/interface.js"></script>
        <!--<script type="text/javascript" src="scripts/Shows_ListHorses.js"></script>-->



        <!-- <script type="text/javascript" src="AutoComplete/jquery.js"></script> -->
        <script type='text/javascript' src='AutoComplete/jquery.autocomplete.js'></script>
        <link rel="stylesheet" type="text/css" href="AutoComplete/jquery.autocomplete.css" />


        <script type="text/javascript">
    $().ready(function() {

            function formatItem(row) {
                     finalVal_formatItem=row[0].split('#@#')
                     return finalVal_formatItem[0] ;
            }
            function formatResult(row) {
                    finalVal_formatResult=row[0].split('#@#')
                    return finalVal_formatResult[0].replace(/(<.+?>)/gi, '');
            }


            $("#Shows").autocomplete('Auto_ShowsList.jsp', {
                    width: 200,
                    matchContains: true,
                    formatItem: formatItem,
                    formatResult: formatResult
            });

             $("#Shows").result(function(event, data, formatted) {
                var hiddenShowSeq = $("#ShowsSeq");
                var value = data.toString().split('#@#');
                hiddenShowSeq.val(value[1]);

                });


            $("#Events").autocomplete('Auto_EventList.jsp', {

                    width: 400,
                    matchContains: true,
                    formatItem: formatItem,
                    formatResult: formatResult


            } );

            $("#Events").result(function(event, data, formatted) {
               var hiddenEventSeq = $("#EventSeq");
               var value = data.toString().split('#@#');
               hiddenEventSeq.val(value[1]);

            });

                                
        });
        function btnRepShowClick(url,type,rptFormat,shwSq){

                if(type=='report'){                    
                    
                    if(rptFormat=='pdf')
                        url="Participants?PageID=AlphaHrsList&ShowSeq="+shwSq;
                    else
                        url="frmCommonExcel.jsp?PAGEID=AlphaHrsList";
                    document.forms[0].target="_blank";
                }
                else
                    document.forms[0].target="_self";
               document.forms[0].method="post";
               document.forms[0].action=url;
               document.forms[0].submit();
        }  
        function Search_Showss(fieldName,DescElement)
        {

            $('#dialog-Show').dialog({ autoOpen: false,height: 400,width: 800, modal: true,title:"Search Shows" });
            $('#dialog-Show').dialog('open');
            $("#modalIFrame_Show").attr('src','frmShows_Serach_Common.jsp?mode=0&selval='+fieldName+'&DescEl='+DescElement);

            return false;
        }
        </script>
    </head>

    <body>
        <form name="RptShow">
            <div id="container">

                <div id="header">
                    <%@ include file="frmHeader.jsp"%>
                </div>

                <%
                    if (!bShows) {
                        response.sendRedirect("login.jsp");
                    }

                %>


                <div id="content">
                    <table width="100%">
                        <tr>
                          <td width="103"><font class="label">SHOW </font> </td>
                          <td width="300" nowrap>
                            <input id='Shows' name="Shows" style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
                            height: 16px;
                            padding-left: 18px;
                            width: 250px !important;"/>
                             <img alt="" src="Images/Find.gif" onClick="Search_Showss('ShowsSeq','Shows')"/>
                            <input type="hidden" id="ShowsSeq" name="ShowsSeq"/>
                          </td>
                          <td>
                              <font class="label">REPORT FORMAT </font> 
                          </td>
                          <td>
                              <select id="rptFormat" name="rptFormat" style=" background:  #FFF8DC; border: 1px solid #000000;width:120px;">
                                  <option value="pdf">PDF</option>
                                  <option value="xl">Excel</option>                                  
                              </select>
                          </td>
                          <td>
                                <input class='button' type="button" name="xlReport" value="Report" onClick="btnRepShowClick('','report',rptFormat.value,ShowsSeq.value)"/>
                                <input class='button' type="Reset" name="Reset" value="Reset" onClick="btnRepShowClick('RptShow.jsp','reset','','')"/>
                            </td>
                        </tr>
<!--                        <tr>
                          <td width="63"><font class="label">EVENT </font> </td>
                          <td colspan="3">
                            <input size="16px" id='Events'
                                   name="Events"
                                   style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
                            height: 16px;
                            padding-left: 18px;
                            width: 430px !important;"/>
                            <input type="hidden" id="EventSeq" Name="EventSeq"/>
                          </td>
                        </tr>-->
<!--                        <tr  >
                        <td>
                              <font class="label">REPORT FORMAT </font> 
                          </td>
                          <td>
                              <select id="rptFormat" name="rptFormat" style=" background:  #FFF8DC; border: 1px solid #000000;width:120px;">
                                  <option value="xl">Excel</option>
                                  <option value="pdf">PDF</option>
                              </select>
                          </td>
                            <td colspan="2" style="text-align:right;">
                                <input class='button' type="button" name="pdfReport" value="Alpha Horse List Report"
                                       onClick="btnRepShowClick('Participants?PageID=AlphaHrsList&ShowSeq='+ShowsSeq.value,'report')"/>
                                <input class='button' type="button" name="xlReport" value="Alpha Horse List Excel"
                                       onClick="btnRepShowClick('frmCommonExcel.jsp?PAGEID=AlphaHrsList','report')"/>
                                <input class='button' type="button" name="xlReport" value="Report" onClick="btnRepShowClick('','report')"/>
                                <input class='button' type="Reset" name="Reset" value="Reset" onClick="btnRepShowClick('RptShow.jsp','reset')"/>
                            </td>
                        </tr>-->
                      </table>
                </div>


                <div id="sidebar">
                    <jsp:include page="RptShowSide.jsp">
                        <jsp:param name="cntPage" value="1" />
                    </jsp:include>                    
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
                <iframe   id="modalIFrame_Show" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0">
                </iframe>
            </div>
            <div id="dialog-CmmnRef" style="display:none; background:url('Images/trans-wood-1.png')" >
                <iframe id="modalIFrame_CmmnRef" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" >
                </iframe>
            </div>

        </form>
    </body>
</html>
