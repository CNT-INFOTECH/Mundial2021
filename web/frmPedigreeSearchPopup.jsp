<%--
    Document   : regsearchpopup
    Created on : Apr 28, 2011, 1:07:52 PM
    Author     : Erzath
--%>

<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<script type="text/javascript">
 $(function() {
 $( "#dob" ).datepicker({
changeMonth: true,
changeYear: true
});
});
function SearchPedigree()
{
    document.forms[0].method="post";
    document.forms[0].action="frmPedigreeSearchPopupInclude.jsp?viewall=1";
    document.forms[0].target="_self";
    document.forms[0].submit();
}
function ResetPedigreePop()
{
    document.forms[0].method="post";
    document.forms[0].action="frmPedigreeSearchPopup.jsp?mode=1";
    document.forms[0].target="_self";
    document.forms[0].submit();
}
</script>
</head>
<body>
        <%
        String strHorName=request.getParameter("HName");
        String strHorReg = request.getParameter("HReg");
        String strLabelHor = request.getParameter("LabelHor");
        String strHorseRegSeq = request.getParameter("HorSeq");
        String strHorseType = request.getParameter("HorType");
        String strHorseOrgName=request.getParameter("HorOrgName");
        String strHorseOrgSeq=request.getParameter("HorOrgSeq");

        String REGSEQ="";
        String str_Reg_no ="";
        String strHor_PName ="";
        String strHor_DOB ="";
        String strmem_name ="";
        String strmicro_num ="";
        String strRegistration_Type="";

        String strmem_lname="";
        String strmem_mname="";
        String strOwnerName="";
        String strAssignedNo="";

        if(request.getParameter("HdnRegSeq")!=null)
            REGSEQ=request.getParameter("HdnRegSeq").trim();

        if(request.getParameter("regno")!=null)
            str_Reg_no=request.getParameter("regno").trim();

        if(request.getParameter("hor_name")!=null)
            strHor_PName=request.getParameter("hor_name").trim();

        if(request.getParameter("dob")!=null)
            strHor_DOB=request.getParameter("dob").trim();

        if(request.getParameter("owner")!=null)
            strmem_name=request.getParameter("owner").trim();

        if(request.getParameter("microchip_num")!=null)
            strmicro_num=request.getParameter("microchip_num").trim();


        if(request.getParameter("HdnHorseName")!=null)
            strHorName=request.getParameter("HdnHorseName");

        if(request.getParameter("HdnLabelHorse")!=null)
            strLabelHor=request.getParameter("HdnLabelHorse");

        if(request.getParameter("HdnHorseRegno")!=null)
            strHorReg=request.getParameter("HdnHorseRegno");

        if(request.getParameter("HdnHorseRegSeq")!=null)
            strHorseRegSeq=request.getParameter("HdnHorseRegSeq");

        if(request.getParameter("HdnHorseType")!=null)
            strHorseType=request.getParameter("HdnHorseType");

        if(request.getParameter("HdnHorseOrgName")!=null)
            strHorseOrgName=request.getParameter("HdnHorseOrgName");

        if(request.getParameter("HdnHorseOrgSeq")!=null)
            strHorseOrgSeq=request.getParameter("HdnHorseOrgSeq");

        if(request.getParameter("Registration_Type")!=null)
                strRegistration_Type=request.getParameter("Registration_Type").trim();

        if(request.getParameter("Assigned_Num")!=null)
                strAssignedNo=request.getParameter("Assigned_Num").trim();

		String strMode="";
        if(request.getParameter("mode")!=null)
                strMode=request.getParameter("mode").trim();
	
		if(strMode.equals("1"))
		{
		REGSEQ="";
        str_Reg_no ="";
        strHor_PName ="";
        strHor_DOB ="";
        strmem_name ="";
        strmicro_num ="";
        strRegistration_Type="";

        strmem_lname="";
        strmem_mname="";
        strOwnerName="";
        strAssignedNo="";
		}


        %>
<form name="frm_Pedigreesearchpopup">
    <div id="framecontent">
    <div class="innertube">

      <table width="100%" border="0" class="altRow" title="SEARCH">
        <tr>
          <td nowrap colspan="2">HORSE NAME</td>
          <td colspan="13">
            <input type="text" size="65" name="hor_name" id="<%=strHorseType%>" value="<%=strHor_PName%>"
                    style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
                    height: 16px;padding-left: 18px;text-transform:uppercase;"
                    onKeyUp="EmptyAll_Autocomplete('hor_name','regno','HdnHorseName')"/>
            <input type="hidden" name="HdnHorseName" id="HdnHorseName" value="<%=strHorName%>">
            <input type="button" id="Search_Pedigree" onClick="SearchPedigree()" class="button" value="Search" name="button"/>
            <input type="button" id="Reset_PedigreePop" onClick="ResetPedigreePop()" class="button" value="Reset" name="button2"/>
            <input type="button" id="Reg_Pedigree" class="button" onClick="newreg_Ped('<%=strHorseType%>')" value="New Horse" name="button3" />
          </td>
        </tr>
        <tr>
          <td colspan="2">REGISTRATION#</td>
          <td>
            <input type="text" size="7" name="regno" id="regno" value="<%=str_Reg_no%>" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;">
          </td>
          <td nowrap>REGISTRATION TYPE</td>
          <td>
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
          <td>DOB</td>
          <td>
            <input type="text" size="8" name="dob" id="dob"  value="<%=strHor_DOB%>" placeholder="MM/DD/YYYY" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;">
          </td>
          <td>MICROCHIP#</td>
          <td>
            <input type="text" size="3" name="microchip_num" id="microchip_num"  value="<%=strmicro_num%>" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;">
          </td>
          <td>&nbsp; </td>
        </tr>
        <tr>
          <td>ID#</td>
          <td>
            <input type="text" size="7" name="Assigned_Num" value="<%=strAssignedNo%>" id="Owner_No"  style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;">
          </td>
          <td nowrap>OWNER NAME</td>
          <td colspan="6">
            <input type="text" name="owner" size="61" id="Org_Name"  value="<%=strmem_name%>" style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
    height: 16px;
    padding-left: 18px;text-transform:uppercase;">
          </td>
          <input type="hidden" name="HdnHorseName" value="<%=strHorName%>">
          <input type="hidden" name="HdnHorseRegno" value="<%=strHorReg%>">
          <input type="hidden" name="HdnLabelHorse" value="<%=strLabelHor%>">
          <input type="hidden" name="HdnHorseRegSeq" value="<%=strHorseRegSeq%>">
          <input type="hidden" name="HdnHorseType" value="<%=strHorseType%>">
          <input type="hidden" name="HdnHorseOrgName" value="<%=strHorseOrgName%>">
          <input type="hidden" name="HdnHorseOrgSeq" value="<%=strHorseOrgSeq%>">
          <input type="hidden" name="HdnAssignedNum" value="<%=strAssignedNo%>">
          <td  align="center" colspan="3">&nbsp; </td>
        </tr>
      </table>
    </div>
    </div>
	<div id="dialog-NewReg" title="HORSE REGISTRATION" style="display:none; background:url('Images/trans-wood-1.png');" >
    <iframe   id="modalIFrame_NewReg" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes">
    </iframe>
</div>
</form>
</body>
</html>

