<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="frmCommonSearch.css" type="text/css" />
<link rel="stylesheet" href="Shows.css">


<script type="text/javascript" src="scripts/SRegistraion.js"></script>
    </head>
    <body>
        <form>
            <%

                String strLastname="";
                String strFirstname="";
                String strType="";
                String strSearch="";
                String strNum="";

                    if(request.getParameter("LName")!=null)
                        strLastname=request.getParameter("LName");

                    if(request.getParameter("FName")!=null)
                        strFirstname=request.getParameter("FName");
                    
                 if(request.getParameter("Type")!=null)
                        strType=request.getParameter("Type");
                 if(request.getParameter("srch")!=null)
                        strSearch=request.getParameter("srch");
                 if(request.getParameter("Num")!=null)
                        strNum=request.getParameter("Num");
            %>



<div id="framecontent">
<div class="innertube">

      <table width="100%" border="0"  title="SEARCH" class="altRow">
        <!--    <tr >
          <td width="88">TYPE</td>
          <td colspan="2">
            <Select style="background-color:  #FFF8DC; border:  1px solid #000000;">
                <option Value="1">INDIVIDUAL</option>
                <option Value="2">ORGANIZATION</option>
            </Select>
          </td>
          <td width="115">&nbsp;</td>
          <td width="133">&nbsp;</td>
          <td width="130">&nbsp;</td>
          <td>&nbsp;</td>
        </tr> -->
        <tr >
          <td width="92">LAST&nbsp;NAME</td>
          <td width="325">
            <input type="text" size="40" name="LName"  style="background-color:  #FFF8DC; border:  1px solid #000000;"
               VALUE="<%=strLastname%>">
          </td>
          <td width="912">&nbsp; </td>
        </tr>
        <tr >
          <td width="92" nowrap>FIRST&nbsp;NAME</td>
          <td colspan="2">
            <input type="text" size="40" name="FName"  style="background-color:  #FFF8DC; border:  1px solid #000000;"
                   value="<%=strFirstname%>">
            <input type="button" id="Searchbtn" class="button" value="Search" onClick="Pop_Search_Rider('<%=strNum%>')" name="button"/>
          </td>
        </tr>
       
      </table>

 </div>
</div>
<div id="maincontent">
<div class="innertube">
<br>

 <%@ include file="frmListRiderResults.jsp"%>




</div>
</div>
   </form>
    </body>
</html>
