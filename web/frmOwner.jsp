
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">



<html>
    <title>PASO TRACKER</title>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />

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

 <script type="text/javascript" src="AutoComplete/jquery.js"></script>
<script type='text/javascript' src='AutoComplete/jquery.autocomplete.js'></script>
<link rel="stylesheet" type="text/css" href="AutoComplete/jquery.autocomplete.css" />

<script type="text/javascript" src="scripts/jscCommon_PartialSearch.js"></script>


<script type="text/javascript" src="scripts/SRegistraion.js"></script>
    </head>
    <body>
        <form>
            <%

                String strLastname="";
                String strFirstname="";
                String strOrgName="";
                String strPhone="";
                String strAssignedNum="";
                String strOwnerSeq="";

                String strType="";
                String strSearch="";
                String strNum="";

                    if(request.getParameter("LName")!=null)
                        strLastname=request.getParameter("LName");

                    if(request.getParameter("FName")!=null)
                        strFirstname=request.getParameter("FName");
                    if(request.getParameter("Phone")!=null)
                        strPhone=request.getParameter("Phone");
                    if(request.getParameter("OrgName")!=null)
                        strOrgName=request.getParameter("OrgName");


                 if(request.getParameter("Type")!=null)
                        strType=request.getParameter("Type");
                 if(request.getParameter("srch")!=null)
                        strSearch=request.getParameter("srch");
                if(request.getParameter("Num")!=null)
                        strNum=request.getParameter("Num");

                 if(request.getParameter("txtAssignedNum")!=null)
                        strAssignedNum=request.getParameter("txtAssignedNum");

               

                if(session.getAttribute("personbean")!=null)
                 session.removeAttribute("personbean");

                 String strHeader="";
                if(strType.equals("1"))
                    strHeader="OWNER SEARCH";
                else if(strType.equals("2"))
                    strHeader="BREEDER SEARCH";
                 else if(strType.equals("3"))
                    strHeader="RIDER SEARCH";
            %>



<div id="framecontent">
<div class="innertube">

      <table width="100%" border="0"  title="SEARCH" class="altRow">
        <th colspan="9" class="Grid_Header" ><%=strHeader%>&nbsp;&nbsp; </th>
        <tr >
          <td width="61" nowrap>ID#</td>
          <td width="69">
            <input type="text" name="txtAssignedNum"    id="OwnerSeq"  style="background-color:  #FFF8DC; border:  1px solid #000000;"
                    VALUE="<%=strAssignedNum%>" size="9      ">
          </td>
          <td width="61"><font class="label">NAME</font></td>
          <td colspan="4" nowrap>
              
            <input type="text" size="45" name="OrgName" id="owner"
                    style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
                    height: 16px;
                    padding-left: 18px;"
                           value="<%=strOrgName%>">
          </td>
          <td width="150">
            <input type="hidden" size="10" name="LName"  style="background-color:  #FFF8DC; border:  1px solid #000000;"
               VALUE="<%=strLastname%>">
          </td>
          <td width="214">
            <input type="hidden" size="8" name="FName"  style="background-color:  #FFF8DC; border:  1px solid #000000;"
                   VALUE="<%=strFirstname%>">
          </td>
        </tr>
        <tr >
          <td width="61">PHONE#</td>
          <td colspan="2">
            <input type="text" name="Phone"   style="background-color:  #FFF8DC; border:  1px solid #000000;"
                    VALUE="<%=strPhone%>">
          </td>
          <td width="76">
            <input type="button" id="Searchbtn" class="button" value="Search" onClick="Pop_Search_Owner('<%=strType%>','<%=strNum%>')" name="button2"/>
          </td>
          <td width="58">
            <input type="button" id="Newbtn" class="button" value="New" onClick="Pop_Add_Owner('<%=strType%>','<%=strNum%>')" name="button"/>
          </td>
          <td width="58">
            <input type="button" id="Clsbtn" class="button" value="Close" onClick="self.close()" name="button"/>
          </td>
          <td width="559">&nbsp;</td>
          <td width="57">&nbsp;</td>
          <td width="150">&nbsp;</td>
          <td width="214">&nbsp;</td>
        </tr>
      </table>

 </div>

        
</div>
<div id="maincontent">
<div class="innertube">
<br>

 <%@ include file="frmOwnerResults.jsp"%>
<%
 if(strSearch.equals(""))
    { %>
  <%@ include file="frmBottom_Registration.jsp"%>
  <%}%>


</div>
</div>
   </form>
    </body>
</html>
