<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>

<html>
<head>
<title>PASO TRACKER</title>
 <link rel="stylesheet" href="themes/base/jquery.ui.all.css"/>
<link href="Shows.css" rel="stylesheet" type="text/css" />
 <link href="Tables_style.css" rel="stylesheet" type="text/css" />
 <link href="buttons.css" rel="stylesheet" type="text/css" />
 
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
         <script type="text/javascript" src="ui/jquery.ui.accordion.js"></script>
         <script type="text/javascript" src="ui/jquery.ui.datepicker.js"></script>
         <script type="text/javascript" src="js/interface.js"></script>
         <script type="text/javascript" src="scripts/jscShows_Points.js"></script>









<script type="text/javascript">

/*$(function() {
		 $('#dock').Fisheye(
				{
					maxWidth: 50,
					items: 'a',
					itemsText: 'span',
					container: '.dock-container',
					itemWidth: 40,
					proximity: 90,
					halign : 'center'
				}
			);
	});*/


$(function() {
		$( "#accordion" ).accordion({
			collapsible: true,
                         autoHeight: false
		});
	});




</script>

</head>
<%
String strCategory="";
String strYear="";
String strFrom="";
String strTo="";
String strReset="N";
strReset=request.getParameter("HdnReset");


if(request.getParameter("HdnReset")!=null && strReset.equals("N"))
{
    if(request.getParameter("Category")!=null)
        strCategory=request.getParameter("Category");
     if(request.getParameter("year")!=null)
        strYear=request.getParameter("year");
    if(request.getParameter("txtFrom")!=null)
        strFrom=request.getParameter("txtFrom");
    if(request.getParameter("txtTo")!=null)
        strTo=request.getParameter("txtTo");

}
 String[] _strCategory=strCategory.split(";");
%>
<body>
 <form name="frmShow">
<div id="container">

            <div id="header">
            <%@ include file="frmHeader.jsp"%>
            </div>
		<%
		if(!bShows)
		response.sendRedirect("login.jsp");

		%>
 <div id="content">

      <div id="MenuHeader">
      <ul id="primary">
		<li ><span>YEARLY</span></li>
		<li><a href="frmShowPoints.jsp">SHOWS</a></li>
		<li><a href="frmEquiPoints.jsp">EQUITATION</a></li>

	</ul>
      </div>

 <fieldset>
      <table width="655" >
        <tr>
          <td width="88"><font class="label" >YEAR</font></td>
          <td width="167">
            <input class="allcaps" size="16px" id='year' name="year" value="<%=strYear%>"/>
            
          </td>
          <td width="56">DATE</td>
          <td width="67"><font class="label"> <font class="dateStyleBody" align="center">&nbsp;&nbsp;&nbsp;&nbsp;FROM</font>
            <input type="text" name="txtFrom" size="10" id="txtFrom" placeholder="MM/DD/YYYY" 
             style="background-color:  #FFF8DC; border:  1px solid #000000;" value="<%=strFrom%>"/>
            </font></td>
          <td width="62"><font class="label"><font class="dateStyleBody" align="center">&nbsp;TO</font>
            <input type="text" name="txtTo" size="10" id="txtTo" placeholder="MM/DD/YYYY" 
                   style="background-color:  #FFF8DC; border:  1px solid #000000;" value="<%=strTo%>" />
            </font></td>
          <td colspan="3"><font class="label"> <font class="dateStyleBody" align="center">&nbsp;&nbsp;&nbsp;</font></font></td>
        </tr>
        <tr>
          <td width="88"><font class="label">CATEGORY</font> </td>
          <td colspan="5">
            <input type="text" name="Category" size="72" 
                   style="background-color:  #FFF8DC; border:  1px solid #000000;"
                   value="<%=strCategory%>"/>
				   
				   
          </td>
          <td nowrap colspan="2"><img alt="" src="Images/Find.gif" onClick="SelCategories()"/></td>
        </tr>
        <tr>
          <td colspan="6"> <font class="label"> </font> </td>
          <td width="100"><font class="label">
            <input class='button' type="button" name="ListValues" value="Search" onClick="fnSearch_Yrly()"/>
            </font></td>
          <td width="71"><font class="label">
            <input class='button' type="Reset" name="Reset" value="Reset" onClick="fnReset_Yrly()"/>
             <input size=1 type="hidden" name="HdnReset" value="N"/>
            </font></td>
           <td width="71"><font class="label">
            <input class='button' type="button" name="Report" value="Report" onClick="Points_Summary()"/>
             <input size=1 type="hidden" name="PageID" value="POINTS"/>
              <input size=1 type="hidden" name="Shows" value=""/>
              <input type="hidden" id="ShowSeq" name="ShowSeq"  value="" />

            </font></td>
        </tr>
      </table>

  </fieldset>
  
  
  <%
    Connection connection1 = null;    
    ResultSet resultset1 = null;
    DbConnMngr dbcmt1 = new DbConnMngr();
    CallableStatement cst_Results= null;
    String strAwdSeq="";
	String strAwdName="";
	Map HmVals = new TreeMap();
	Map HmDetails=new TreeMap();
	ArrayList AlList = new ArrayList();
	
    try {
        
        connection1 = dbcmt1.getConnection();
        
		cst_Results = connection1.prepareCall("{call GET_HighPointAward_Category(?)}");
		cst_Results.setString(1, "1");
		
		resultset1 = cst_Results.executeQuery();
		
        while(resultset1.next()) {
			ArrayList AlRow=new ArrayList();
			AlRow.add(resultset1.getString("AwardSeq"));
			AlRow.add(resultset1.getString("AwardName"));
          	AlList.add(AlRow);
        }        
         
    } catch (SQLException Ex) {

    } finally {
        if (connection1 != null) {
            connection1.close();
        }
        if (cst_Results != null) {
            cst_Results.close();
        }
        if (resultset1 != null) {
            resultset1.close();
        }
    }
  
    

     if (request.getParameter("Category")!=null && strCategory.length() >0)
      {
			AlList=new ArrayList();
             for(int i=0; i<_strCategory.length;i++)
             {
				 String[] _strCategory_Dtl=_strCategory[i].split("#@#");
				 ArrayList AlRow=new ArrayList();
					AlRow.add(_strCategory_Dtl[0]);
					AlRow.add(_strCategory_Dtl[1]);
					AlList.add(AlRow);
				               
             }
      }
  


 %>
<div id="accordion" >
  <%
  for (int i=0; i < AlList.size(); i++)
     {
		ArrayList AlRow=(ArrayList)AlList.get(i);
    %>
    <h3 ><a href="#" onClick="getPoints('<%=AlRow.get(0)%>',year.value,txtFrom.value,txtTo.value,'','<%=AlRow.get(1)%>')"  >&nbsp;<%=AlRow.get(1)%></a></h3>

<div style="background:url('Images/trans-wood-1.png')" >
  
    <div id="<%=AlRow.get(0)%>" >
           
    </div>
</div>



 <%}%>

 </div> <!-- accordion End -->

 
			</div> <!-- Content End -->


<div id="sidebar">
<%@ include file="Shows_ListHorses_Side.jsp"%>

</div>



</div>  <!-- Container -->

<div id="dialog_Categories" style="display:none; background:url('Images/trans-wood-1.png')">
<iframe  id="modalIFrame_Categories" width="100%" height="520"
          marginwidth="0" marginheight="0" frameborder="0" >
</iframe>


<input class='button' type="button" name="Search" value="Accept" onClick="Accept_Multiple_Awards()"/>
<input class='button' type="button" name="PopClose" value="Close" onClick="Close_Multiple_Awards()"/>

</div>

<div id="dialog_Points" title="Awards"
     style="display:none; background:url('Images/trans-wood-1.png');">
<iframe   id="modalIFrame_Points" width="100%" height="100%"
          marginwidth="0" marginheight="0" frameborder="0" >
</iframe>
</div>


</form>



</body>
</html>