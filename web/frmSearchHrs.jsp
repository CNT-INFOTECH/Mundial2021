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
  <script type="text/javascript" src="jscCommon.js"></script>
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


             if(request.getParameter("hor_name")!=null)
                    strHrsName=request.getParameter("hor_name");

             if(request.getParameter("regno")!=null)
                    strHrsRegNum=request.getParameter("regno");

             if(request.getParameter("dob")!=null)
                    strHrsDOB=request.getParameter("dob");

             if(request.getParameter("microchip_num")!=null)
                    strHrsMchip=request.getParameter("microchip_num");

             if(request.getParameter("owner")!=null)
                    strHrsOwner=request.getParameter("owner");

            %>



<div id="framecontent">
<div class="innertube">

      <table width="100%" border="0"  title="SEARCH" class="altRow">
        <th colspan="7" class="Grid_Header" >SEARCH&nbsp;REGISTRAION&nbsp;&nbsp;
        </th>
        <tr >
          <td width="120" nowrap>HORSE NAME</td>
          <td colspan="6">
            <input type="text" size="60" name="hor_name" id="hor_name" value="<%=strHrsName%>"
                           style="background-color:  #FFF8DC; border:  1px solid #000000;"
                          >
          </td>
        </tr>
        <tr >
          <td width="120">REGISTRATION#</td>
          <td width="61">
            <input type="text" size="10" name="regno" id="regno"  value="<%=strHrsRegNum%>"  style="background-color:  #FFF8DC; border:  1px solid #000000;">
          </td>
          <td width="36">DOB</td>
          <td width="57">
            <input type="text" size="8" name="dob" id="dob"   value="<%=strHrsDOB%>"  style="background-color:  #FFF8DC; border:  1px solid #000000;" >
          </td>
          <td width="96">MICROCHIP#</td>
          <td colspan="2">
            <input type="text" size="8" name="microchip_num" id="microchip_num"    value="<%=strHrsMchip%>"  style="background-color:  #FFF8DC; border:  1px solid #000000;">
          </td>
        </tr>
        <tr class="altRow_button">
          <td  align="center" width="120"> OWNER </td>
          <td  colspan="4">
            <input size="50" type="text" name="owner" id="owner"  value="<%=strHrsOwner%>"
            style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
            height: 16px;
            padding-left: 18px;" >
          </td>
          
          <td  align="center">
            <div align="left">
              <input type="button" id="Searchbtn" class="button" value="Search" onClick="SearchHorse_List('<%=strType%>','<%=strGroupType%>','<%=strEventSeq%>')" name="button"/>
            </div>
             </td>
            <td width="50">
            <input type="button" id="Searchbtn" class="button" value="New" onClick="NewHrs()" name="button2"/>
          </td>
         
        </tr>
      </table>

 </div>
</div>
<div id="maincontent">
<div class="innertube">
<br>
    
        <%@ include file="frmHrsSearchResults.jsp"%>
       


</div>
</div>
   </form>
    </body>
</html>
