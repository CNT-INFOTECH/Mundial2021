<%-- 
    Document   : Shows_Forms
    Created on : Mar 21, 2016, 10:01:41 AM
    Author     : cntuser
--%>


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
            <script type="text/javascript" src="scripts/Shows_Main.js"></script>



        </head>
        <%

            String strTechDirector = "";
            String strShowDirector = "";
            if (showBean.getTechnicalDirector() != null) {
                strTechDirector = showBean.getTechnicalDirector();
            }

            if (showBean.getShowDirector() != null) {
                strShowDirector = showBean.getShowDirector();
            }
        %>
        <body>
            <form name="ShowForms">
                <div id="container">

                    <div id="header">
                        <%@ include file="frmHeader.jsp"%>

                    </div>

                    <%
                        if (!bShows) {
                            response.sendRedirect("login.jsp");
                        }
                        
    Connection localConn=null;
    DbConnMngr dbcnmgr=new DbConnMngr();   
    PreparedStatement preparedStatement=null;
    ResultSet rss=null;
    CallableStatement cst = null;
    ArrayList AlShwForms = new ArrayList();
    ArrayList arEachRw = new ArrayList();
    
        try{                                   
               
            localConn = dbcnmgr.getCon();
            localConn.setAutoCommit(false);
            preparedStatement=null;
             rss=null;
             String strSql = "select * from ShowForms where status='A' order by SortOrder ";
             preparedStatement = localConn.prepareStatement(strSql);
             rss = preparedStatement.executeQuery();

             while(rss.next()) {
                 arEachRw = new ArrayList();

                if(rss.getString("FormName")!=null)
                    arEachRw.add(rss.getString("FormName").trim());
                else
                    arEachRw.add("");

                if(rss.getString("FormLocation")!=null)
                    arEachRw.add(rss.getString("FormLocation").trim());
                else
                    arEachRw.add("");
                
                AlShwForms.add(arEachRw);
             }  

            
         } catch (Exception ex) {
            ex.printStackTrace();
            System.err.println("Got an exception! ");
            System.err.println("++ShowForms.jsp :::::::::" + ex);
         } finally {
            if(rss!=null)
               rss.close();
            
            if(preparedStatement!=null)               
               preparedStatement.close();           
            
            if(localConn!=null)               
               localConn.close(); 
//            dbcnmgr.releaseConnection(localConn);
         }
    
    %>

<BR>
                
                    <fieldset> <legend>FORMS:</legend>

                        <table id="grid" class="grid" style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;" >
                            <thead>
                                <tr>
                                    <th class="Grid_Header" scope="col" >Form Name&nbsp;&nbsp;</th>
                                    <th class="Grid_Header" scope="col" >Document</th>
                                </tr>
                            </thead>
                                <%                                                                                                
                                    if (AlShwForms.size() > 0) {

                                        for (int i = 0; i < AlShwForms.size(); i++) {
                                        String strClass = "";
                                        if (i % 2 == 0) {
                                            strClass = "even";
                                        } else {
                                            strClass = "odd";
                                        }
                                        ArrayList AlGetRows = (ArrayList) AlShwForms.get(i);
                                %>
                                <tr class="<%=strClass%>">
                                    <td><%= AlGetRows.get(0)%></td>

                                    <td> 
                                        <a href="<%= AlGetRows.get(1)%>" target="_blank" >
                                        <img src="Images/Roster2.png" alt="Open" /> 
                                        </a>
                                    </td>
                                </tr>
                                <%}}%>
                        </table>                                
                        <input type="hidden" name="PageID" value="ShowForms"/>
                    </fieldset>                         
                
                         



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