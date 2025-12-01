<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="themes/base/jquery.ui.all.css">

	<script type="text/javascript" src="jquery-1.5.1.js"></script>
	<script type="text/javascript" src="external/jquery.bgiframe-2.1.2.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.core.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.widget.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.mouse.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.button.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.draggable.js"></script>
	<script type="text/javascript"src="ui/jquery.ui.position.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.resizable.js"></script>
	<script type="text/javascript"src="ui/jquery.ui.dialog.js"></script>
	<script type="text/javascript" src="ui/jquery.effects.core.js"></script>

	<script type="text/javascript" src="ui/jquery.ui.datepicker.js"></script>

 <script type="text/javascript" src="AutoComplete/jquery.js"></script>
<script type='text/javascript' src='AutoComplete/jquery.autocomplete.js'></script>
<link rel="stylesheet" type="text/css" href="AutoComplete/jquery.autocomplete.css" />


<link rel="stylesheet" href="frmCommonSearch.css" type="text/css" />
<link rel="stylesheet" href="Shows.css">


  <script type="text/javascript" src="scripts/jscShortRegistration_Off.js"></script>
    </head>
    <body>
        <form name="HrsSearch">
            <%


             String strMode="";
             String strType="";
             String strGroupType="";
             String strEventSeq="";

             String strHrsName="";
             String strHrsRegNum="";
             String strHrsDOB="";
             String strHrsMchip="";
             String strHrsOwner="";



                  if(request.getParameter("mode")!=null)
                    strMode=request.getParameter("mode");

             if(request.getParameter("Type")!=null)
                    strType=request.getParameter("Type");
              if(request.getParameter("Group")!=null)
                    strGroupType=request.getParameter("Group");
              if(request.getParameter("ES")!=null)
                    strEventSeq=request.getParameter("ES");


          
            %>



      <table width="100%" border="0" class="altRow">
        <th colspan="7" class="Grid_Header" >WINNING&nbsp;DESCENDANTS&nbsp;&nbsp;
        </th>
      
       
      </table>

        <%@ include file="frmSearchHrsSearchResults_Desc.jsp"%>
   </form>
    </body>
</html>
