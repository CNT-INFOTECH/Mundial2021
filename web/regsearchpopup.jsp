<%--
    Document   : regsearchpopup
    Created on : Apr 28, 2011, 1:07:52 PM
    Author     : Erzath
--%>
<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>

<html >
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>SEARCH</title>
        <link rel="stylesheet" href="Style_Popup.css">
        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
        <link href="buttons.css" rel="stylesheet" type="text/css" />
        <link href="frmReg_CommonRef.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="themes/base/jquery.ui.all.css">
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
        <script src="jscIndex.js"></script>
<!--<script src="js/jquery.autocomplete.js"></script>-->
<script type='text/javascript' src='AutoComplete/jquery.autocomplete.js'></script>
        <script type="text/javascript" src="js/interface.js"></script>
        <script type="text/javascript" src="jscReg_AutoComplete.js"></script>

<style type="text/CSS">

div#wrapper1 {

background:url("Images/trans-wood-1.png");
width: 100;
/*height:100%;*/
margin-top:0px;
margin-bottom: 0px;
margin-left: auto;
margin-right: auto;
padding: 0px;
/*border: thin solid #000000;*/

}

#contents {

/*background:  url("Images/logo_apccpfa_oficial_no_back4.png") no-repeat center;*/
background:url("Images/trans-wood-1.png");
/*align : center;*/
top : 1px;
color : #000000;
width : 100%;
/*height: 100%;*/
border : 1px solid #ccc;
}

.altRow
{

}

.altRow td
{
	border-bottom:1px dotted #ffffff;
	font-size:9pt;
	color:#000000;
	padding:5px 0 5px 5px;
	vertical-align:top;
	text-align:left;
}


.altRow  th
{
	background:#4e738f;
	color:#fff;
	font-weight:bold;
	font-size:9pt;
	text-align:center;
}
.ui-datepicker
{
    font-family:TimesNewRoman;
    font-size: 10px;
    margin-left:7px;
    margin-top: 0px;
    line-height: 1.0em;
}
fieldset { padding:20px;  }
input, textarea, select {font:12px/12px Arial, Helvetica, sans-serif; padding:0;}
fieldset.action {background:#9da2a6; border-color:#e5e5e5 #797c80 #797c80 #e5e5e5; margin-top:-20px;}
</style>
</head>
<body >
  <form name="frm_regsearchpopup" >
<div id="framecontent_RegSearch">
<div class="innertube">
<%
String REGSEQ="";
String str_Reg_no ="";
String strHor_PName ="";
String strHor_DOB = "";
String strmem_name = "";
String strmicro_num = "";
String strRegistration_Type="";
String strViewAll="";
String strAssignedNo="";

if(request.getParameter("hor_name")!=null)
     strHor_PName=request.getParameter("hor_name");

if(request.getParameter("regno")!=null)
     str_Reg_no=request.getParameter("regno").trim();

if(request.getParameter("dob")!=null)
    strHor_DOB=request.getParameter("dob").trim();

if(request.getParameter("owner")!=null)
    strmem_name=request.getParameter("owner").trim();

if(request.getParameter("microchip_num")!=null)
    strmicro_num=request.getParameter("microchip_num").trim();

if(request.getParameter("Registration_Type")!=null)
    strRegistration_Type=request.getParameter("Registration_Type").trim();

if(request.getParameter("Pop_viewall")!=null)
    strViewAll=request.getParameter("Pop_viewall").trim();

if(request.getParameter("Assigned_Num")!=null)
    strAssignedNo=request.getParameter("Assigned_Num").trim();
%>

      <table width="100%" class="altRow" title="SEARCH">
        <tr>
            <td nowrap width="10%" style="padding-top: 12px;">HORSE NAME</td>
          <td colspan="7">
            <input type="text" value="<%=strHor_PName%>" size="77" name="hor_name" id="hor_name" onchange="EmptyAll_Autocomplete('hor_name','regno','RegSeqHidden')"
                    style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
                    height: 16px;padding-left: 18px;text-transform:uppercase;">
            <input type="button" id="Searchbtn" class="button" value="Search" name="button"/>
            <input type="button" id="Resetbtn" class="button" value="Reset" name="button2"/>
          </td>
          <td width="2%">&nbsp; </td>
        </tr>
        <tr>
          <td width="10%">REGISTRATION#</td>
          <td width="8%">
            <input type="text" size="7" name="regno" id="regno" value="<%=str_Reg_no%>" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;">
            <input type="hidden" size="7" name="RegSeqHidden" id="RegSeqHidden" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;">
          </td>
          <td nowrap width="10%">REGISTRATION TYPE</td>
          <td width="11%">
            <select name="Registration_Type" id="Registration_Type" style="background-color:  #FFF8DC; border:  1px solid #000000;width:114px" >
              <option value=''>Select</option>
              <%
                        String strSelectedR="";
                        String strSelectedP="";
                        String strSelectedS="";
                  if(strRegistration_Type.equals("R"))
                      strSelectedR="SELECTED";
                  else  if(strRegistration_Type.equals("P"))
                      strSelectedP="SELECTED";
                  else  if(strRegistration_Type.equals("S"))
                      strSelectedS="SELECTED";
                    %>
              <option value='R' <%=strSelectedR%> >REGISTRATION</option>
              <option value='P'<%=strSelectedP%>>PEDIGREE</option>
              <option value='S'<%=strSelectedS%>  >SHOW</option>
            </select>
          </td>
          <td width="4%">DOB</td>
          <td width="7%">
            <input type="text" size="9" name="dob" placeholder="MM/DD/YYYY" id="dob" value="<%=strHor_DOB%>" style="background-color:  #FFF8DC; border:  1px solid #000000;">
          </td>
          <td width="7%">MICROCHIP#</td>
          <td width="4%">
            <input type="text" size="5" name="microchip_num" value="<%=strmicro_num%>" id="microchip_num"  style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;">
          </td>
          <td width="2%">&nbsp;</td>
        </tr>
        <tr>
          <td width="10%">ID#</td>
          <td width="8%">
            <input type="text" size="7" name="Assigned_Num" value="<%=strAssignedNo%>" id="Owner_No"  style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;">
          </td>
          <td width="10%">OWNER NAME</td>
          <td colspan="5">
            <input type="text" name="owner" size="55" value="<%=strmem_name%>" id="Org_Name" style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
    height: 16px;
    padding-left: 18px;text-transform:uppercase;">
          </td>
          <td width="2%">&nbsp; </td>
        </tr>
      </table>
  </div>
  </div>

  </form>
</body>
</html>
