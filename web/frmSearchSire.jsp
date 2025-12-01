<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

               <title>PASO TRACKER</title>
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="Style_Popup.css">
<link rel="stylesheet" href="frmCommonSearch.css" type="text/css" />
<link rel="stylesheet" href="Shows.css">
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

        <script type='text/javascript' src='AutoComplete/jquery.autocomplete.js'></script>
 <!--<script type="text/javascript" src="AutoComplete/jquery.js"></script>
<script type='text/javascript' src='AutoComplete/jquery.autocomplete.js'></script>
<link rel="stylesheet" type="text/css" href="AutoComplete/jquery.autocomplete.css" />-->

<script type="text/javascript" src="scripts/jscCommon_PartialSearch.js"></script>
<script type="text/javascript" src="scripts/SRegistraion.js"></script>
<style>
.ui-datepicker
{
    font-family:TimesNewRoman;
    font-size: 10px;
    margin-left:0px;
    margin-top: 0px;
    line-height: 1.0em;
}
</style>
<script type="text/javascript">
$(function() {
   $( "#dob" ).datepicker({
        changeMonth: true,
        changeYear: true
    });
    });
</script>
    </head>
    <body>
        <form>
            <%

             String strHorseSire="";
             String strRegNum="";
             String strDOB="";
             String strMCNum="";
             String strOwner="";

             String strMode="";
              String strNum="";
                if(request.getParameter("hor_name")!=null)
                    strHorseSire=request.getParameter("hor_name");

                if(request.getParameter("regno")!=null)
                    strRegNum=request.getParameter("regno");

              if(request.getParameter("dob")!=null)
                    strDOB=request.getParameter("dob");

              if(request.getParameter("microchip_num")!=null)
                    strMCNum=request.getParameter("microchip_num");

              if(request.getParameter("owner")!=null)
                    strOwner=request.getParameter("owner");




                String strType="";
                if(request.getParameter("Type")!=null)
                    strType=request.getParameter("Type");
                if(request.getParameter("mode")!=null)
                    strMode=request.getParameter("mode");

                 if(request.getParameter("Num")!=null)
                    strNum=request.getParameter("Num");

                String strHeader="";
				// added strHorseType  field by erzath for sire and dam 11/30/2011
                String strHorseType="";// this is the default value for id assigned by raju
                if(strType.equals("2"))
                {    
                    strHeader="SIRE SEARCH";
                    strHorseType="MALE";
                }    
                else if(strType.equals("3"))
                {
                    strHeader="DAM SEARCH";
                    strHorseType="FEMALE";
                }
            %>



<div id="framecontent">
<div class="innertube">

      <table width="100%" border="0"  title="SEARCH" class="altRow">
        <th colspan="9" class="Grid_Header" ><%=strHeader%>&nbsp;&nbsp; </th>
        <tr >
          <td width="120">HORSE NAME</td>
          <td colspan="6">
            <input type="text" size="40" name="hor_name" id="MALE"
                    style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
                    height: 16px;
                    padding-left: 18px;
					text-transform: uppercase;"
                           value="<%=strHorseSire%>">
          </td>
          <td width="644">&nbsp;</td>
        </tr>
        <tr >
          <td width="120">REGISTRATION#</td>
          <td width="89">
            <input type="text" size="10" name="regno" id="regno"  style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;" value="<%=strRegNum%>">
          </td>
          <td width="38"><font class="label">DOB</font></td>
          <td width="95">
            <input type="text" size="8" name="dob" id="dob"  style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"  placeholder="MM/DD/YYYY" value="<%=strDOB%>">
          </td>
          <td width="96">MICROCHIP#</td>
          <td colspan=3	>
            <input type="text" size="15" name="microchip_num" id="microchip_num"  style="background-color:  #FFF8DC; border:  1px solid #000000;
			text-transform: uppercase;" value="<%=strMCNum%>">
          </td>
        </tr>
        <tr class="altRow_button">
          <td  align="center" width="120">
            <div align="left">OWNER </div>
          </td>
          <td  colspan="4">
            <input type="text" name="owner" id="owner"   style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
                    height: 16px;
                    padding-left: 18px;
					text-transform: uppercase;" size="40" value="<%=strOwner%>">
          </td>
          <td width="96">
            <input type="button" id="Searchbtn" class="button" value="Search" onClick="Pop_Search_Sire_Dam('<%=strType%>','<%=strNum%>')" name="button"/>
          </td>
          <td width="96">
            <input type="button" id="Newbtn" class="button" value="New" onClick="OpenNew_Hrs_SireDam_Reg('<%=strType%>')" name="HrsNew"/>
          </td>
           <td width="168">
            <input type="button" id="NewCls" class="button" value="Close" onClick="self.close()" name="HrsNew"/>
          </td>
          
         
        </tr>
      </table>

 </div>
</div>
<div id="maincontent">
<div class="innertube">
<br>

 <%@ include file="frmSireDamSearchResults.jsp"%>
<%
if(strMode.equals(""))
    { %>
  <%@ include file="frmBottom_Registration.jsp"%>
  <%}%>


</div>
</div>
   </form>
    </body>
</html>
