
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<link href="Shows_Pop.css" rel="stylesheet" type="text/css" />

<link href="buttons.css" rel="stylesheet" type="text/css" />
<link href="Tables_style.css" rel="stylesheet" type="text/css" />

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
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/interface.js"></script>



<link rel="stylesheet" href="windowfiles/dhtmlwindow.css" type="text/css" />

<script type="text/javascript" src="windowfiles/dhtmlwindow.js">

/***********************************************
* DHTML Window Widget- © Dynamic Drive (www.dynamicdrive.com)
* This notice must stay intact for legal use.
* Visit http://www.dynamicdrive.com/ for full source code
***********************************************/

</script>

<link rel="stylesheet" href="modalfiles/modal.css" type="text/css" />
<script type="text/javascript" src="modalfiles/modal.js"></script>
<script type="text/javascript" src="scripts/jscAddJudges_Show.js"></script>
<script type="text/javascript" src="scripts/jscCommon.js"></script>



    </head>
        <body>
        <form>
            <%@ include file="frmAddJudges_Show_Include.jsp"%>
        <table >
        <input type=button class="button" value='Save' Name='Save' onClick="fnSubmit()">
        </table>
        <table id="PlanTab">
        <tr id="Row0">

        <td width="16"> <img name="PlanTab"  src="Images/add.png" width="16" height="16" alt="add"
                             onClick="addPlan(this)"/></td>

        <td width="56" ><font class="label">Category</font></td>

        <td width="174">
        <select ID="Category1" name="category1" style="background-color:  #FFF8DC; border:  1px solid #000000;width:163px" >
         <option value="0">Select</option>
        <option value="All">All</option>
        <option >PasoFino</option>
        <option>Equitation</option>
        <option>Performance</option>
        <option>Pleasure</option>
        <option>Amateur Owner</option>
        <option>Trocha</option>
        <option>Trocha y galope</option>
        <option>Trote y galope</option>
        <option>Bellas Formas</option>
        <option>Cuerda</option>
        <option>Grupo de Yeguas con cria</option>
        <option>Grupo de Yeguas para cria</option>
        <option>Geldings</option>
		<option>Paso Trail</option>
		<option>Paso Western Pleasure</option>
		<option>Paso Versatility</option>
		<option>Paso Country Pleasure</option>
		<option>Amateur Owner Performance</option>
		<option>Amateur Owner Pleasure</option>

        </select>
        </td>

        <td width="37"></td>

        <td width="46"><font class="label">Judges</font></td>

       <% if(strNumberofJudges.equals("3"))
        { for(int i=1 ;i < 4; i++) {
            String strID="Seq_1_"+i;
            String strVal="Val_1_"+i;  %>
        <td><img src="Images/dropdown_icon4.gif"  onClick="OpenCommonRef('Judge','<%=strID%>','<%=strVal%>')"></td>
      <td width="161" >
        <input type="hidden" size="2" id='<%=strID%>' name='<%=strID%>' >
        <LABEL  id='<%=strVal%>' name='<%=strVal%>'> </LABEL>
                </td>

     
         
        <%}
        }
        else if(strNumberofJudges.equals("5"))
        { for(int i=1 ;i < 6; i++) {
            String strID="Seq_1_"+i;
            String strVal="Val_1_"+i;  %>
        <td><img src="Images/dropdown_icon4.gif"  onClick="OpenCommonRef('Judge','<%=strID%>','<%=strVal%>')"></td>
      <td width="161" >
        <input type="hidden" size="2" id='<%=strID%>' name='<%=strID%>' >
        <LABEL  id='<%=strVal%>' name='<%=strVal%>'> </LABEL>
        <%}
        }%>

        </tr>
        <input type=hidden name="hdnRowSize" value="1">
        <input type=hidden name="hdnColSize" value="<%=strNumberofJudges%>">
        <input type=hidden name="hdnShowSeq" value="<%=strShowSeq%>">
        <input type="hidden" name="PageID" value="SHOWS_JUDGES">
        </table>





<table style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;text-align: left;">

 <thead>
<tr>
<th class="Grid_Header" >CATEGORY</th>
<% if (strNumberofJudges.equals("3")){%>
<th colspan="6"class="Grid_Header" >JUDGE NAME</th>
<%}
 else if (strNumberofJudges.equals("5")){%>
 <th colspan="10"class="Grid_Header" >JUDGE NAME</th>
<%}%>

</tr>
</thead>
<tbody>

                    <%

                    String strCategory="";
                    String strCategoryCheck="";
                    String strValues="";
                    String strRowClass="even";

                    for (int li=0; li < AlCategories.size() ;li++ )
                    {
                    ArrayList AlGetRows=(ArrayList)AlCategories.get(li);
                    strCategory=(String)AlGetRows.get(0);
                    if(li==0)
                    {
                         strCategoryCheck=strCategory;
                    }

                    if(!strCategoryCheck.equals(strCategory))
                    {
                       if(strRowClass.equals("even"))
                            strRowClass="odd";
                        else
                            strRowClass="even";
                        %><TD width="100"><b><%=strCategoryCheck %></b></TD><%=strValues%>
                        <TR class="<%=strRowClass%>"><%
                        strCategoryCheck=strCategory;
                        strValues="";
                        
                     }
                    strValues+="<TD width=20><b>"+(String)AlGetRows.get(1)+"</b></TD><TD  width=200>"+(String)AlGetRows.get(2)+"</TD>";

                    }%>
                    <TD width="100"><b><%=strCategoryCheck%></b></TD><%=strValues%>
</tbody>
 </table>

 <div id="dialog-CmmnRef"  style="display:none; background:url('Images/trans-wood-1.png')">
<iframe id="IFrame_CmnRef" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" >
</iframe>
</div>


 </form>
 </body>
</html>

