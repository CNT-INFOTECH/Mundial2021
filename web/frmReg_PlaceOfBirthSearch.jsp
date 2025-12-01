<%-- 
    Document   : frmReg_PlaceOfBirthSearch
    Created on : Jul 11, 2011, 12:34:23 PM
    Author     : Erzath
--%>

<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SEARCH PLACE</title>
        <link rel="stylesheet" href="Style_Popup.css">
        <link rel="stylesheet" href="themes/base/jquery.ui.all.css">
        <meta name="Description" content="How to Build a Basic CSS Layout" />
        <meta name="Keywords" content="css layout" />
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="Buttons_Style.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="jquery-1.5.1.js"></script>
        <script type="text/javascript" src="external/jquery.bgiframe-2.1.2.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.core.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.widget.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.mouse.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.button.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.datepicker.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.draggable.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.position.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.resizable.js"></script>
        <script type="text/javascript" src="ui/jquery.ui.dialog.js"></script>
        <script type="text/javascript" src="ui/jquery.effects.core.js"></script>
        <script type="text/javascript" src="jscIndex.js"></script>
        <link href="buttons.css" rel="stylesheet" type="text/css" />  
        <script type="text/javascript">
            
function SearchPlace()
{
    document.forms[0].method="post";
    document.forms[0].action="frmReg_PlaceOfBirthSearch.jsp?srch=1&typ=1"
    document.forms[0].submit();       
}            
        </script>
        <link href="frmReg_CommonRef.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
<%
        String cityVal="";
        String stateVal="";
        String zipVal="";
        String countryVal="";
        String strSearch="";
        String strType="";
        
        if(request.getParameter("city")!=null)
            cityVal=request.getParameter("city");
        else
            cityVal="";
        
        if(request.getParameter("state")!=null)
            stateVal=request.getParameter("state");
        else
            stateVal="";
        
        if(request.getParameter("srch")!=null)
            strSearch=request.getParameter("srch");

        if(request.getParameter("typ")!=null)
            strType=request.getParameter("typ");
%>
        <form>
            <div id="framecontent_Breeder">            
            <div class="innertube">
                <table class="altRow">
                    <tr>
                        <td>CITY</td>
                        <td>
                            <input type="text" name="CITY" id="CITY" onKeyUp="javascript:this.value=this.value.toUpperCase()" size="25" value="<%=cityVal%>" style=" background-color:  #FFF8DC; border:  1px solid #000000;">
                        </td>
                        <td>STATE</td>
                        <td width="100px">
                            <input type="text" name="STATE" id="STATE" onKeyUp="javascript:this.value=this.value.toUpperCase()" size="10" value="<%=stateVal%>" style=" background-color:  #FFF8DC; border:  1px solid #000000;">
                        </td>
                        <td>
                            <input type="button" value="Search" class="button" onclick="SearchPlace()"/>
                        </td>
                    </tr> 
                </table>
            </div>
            </div>
            <div id="maincontent_Breeder">
            <div class="innertube">
            <br>
             <%@ include file="frmReg_PlaceOfBirthSearchList.jsp"%>
            </div>
            </div>
        </form>            
    </body>
</html>
