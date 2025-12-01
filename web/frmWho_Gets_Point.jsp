
<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.naming.*" %>
<%@ page import = "javax.sql.rowset.*" %>
<%@ page import = "pasotracker.DBConnection" %>
<%@ page import = "pasotracker.GeneralServlet" %>

<head>
<title>PASO TRACKER</title>
<link href="Registration.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="Style_Popup.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="themes/base/jquery.ui.all.css" />
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
<script type="text/javascript" src="jscRegistration.js"></script>
<script type="text/javascript" src="jscIndex.js"></script>
<script type="text/javascript" src="instantedit.js"></script>

<script type="text/javascript" src="js/interface.js"></script>

<script type="text/javascript" src="jscPointSystem.js"></script>
<link rel="stylesheet" src="master.css" media="screen"></link>

 <script type="text/javascript">





function Point_Edit(Elem_Span,Elem_Lbl,Elem_txt_span,Elem_txt)
{
    document.getElementById(Elem_Span).style.display='none';
    document.getElementById(Elem_txt_span).style.visibility='';
    document.getElementById(Elem_txt_span).style.display='block';
    
}

function Checkload(Elem_Span,Elem_Lbl,Elem_txt_span,Elem_txt)
{
    document.getElementById(Elem_txt_span).style.display='none';
    document.getElementById(Elem_Span).style.visibility='';
    document.getElementById(Elem_Span).style.display='block';
    document.getElementById(Elem_Lbl).innerHTML=document.getElementById(Elem_txt).value;
}

</script>



<style type="text/css">
<!--
@import url("CommonTableStyle.css");
-->

#footer_Bot {
	clear:both;
	text-align:center;
	/*background: #555;
	color:#fff;*/
	height:50px;
	padding:5px;
         bottom: auto;

}
</style>
</head>
<body>

    <%

String strMode="";
String strShowType="";

if(request.getParameter("Mode")!=null)
    strMode=request.getParameter("Mode");

if(request.getParameter("Show_type")!=null)
    strShowType=request.getParameter("Show_type");



%>

    <form name="Who_PointSystem">
   
    <div id="container">
    <div id="header">
        <%@ include file="frmHeader.jsp"%>
   </div>

    <div id="content">
        <table class="altRow">

            <tr>
                <td>SHOW TYPE</td>
              <td colspan="3">
                <select name="Show_type" id="Show_type" onchange="Sample(this.value)" style="background-color:  #FFF8DC; border:  1px solid #000000;width:120px" >

                <option value=''>Select</option>
                <option value='R'>Regular</option>
                <option value='I'>International</option>
                <option  value='W'>World Cup</option>
                </select>
              </td>

             <%
     if(strShowType != null && !strShowType.equals(""))  { %>
        <script language="javascript">
         var select = document.Who_PointSystem.Show_type;
            for (var option = 0; option < select.options.length; option++) {
                if (select.options[option].value == '<%= strShowType.trim() %>') {
                select.selectedIndex = option;
                break;   }   }
        </script>
    <%}%>

     <td>Category</td>

        <td> <img src="Images/add.png" onClick="addRowToTable_who_gets_PointSystem()" /></td>
         <input type="hidden" value="0" id="theValue" />
             </tr>
   </table>

            <table class="grid" align="center"  border="0" cellpadding="0" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th >Category</th>
                <th >Breeder</th>
                <th >Owner</th>
                <th >Rider</th>
            </tr>
        </thead>
        
</table>
         <table class="grid"  id="tblSample"   border="0" cellpadding="0" cellspacing="0" width="100%">
     <%
 RowSetFactory factory2 = RowSetProvider.newFactory();
   CachedRowSet crsWho_GetPointSystem= factory2.createCachedRowSet();
            
           // CachedRowSetImpl crsWho_GetPointSystem = new CachedRowSetImpl();

if(strMode.equals("2"))
{
       try
        {
            GeneralServlet genn =new GeneralServlet();
            crsWho_GetPointSystem = genn.get_who_getpoints(strShowType);

                int i=0;
                String strCategory="";
                String strBreeder="";
                String strOwner="";
                String strRider="";
                String strSequence="";
                
                String Labelid1="";
                String txtLabelid1="";
                String Labelid2="";
                String txtLabelid2="";
                String Labelid3="";
                String txtLabelid3="";

            String txtLabelid0="";
            String txtLabelid4="";
            
            
            
            while(crsWho_GetPointSystem.next())
            {
                 i=i+1;

                strCategory="";
                strBreeder="";
                strOwner=""; 
                strRider="";
                strSequence="";
                
                Labelid1="LblPos"+i+"1";
                Labelid2="LblPos"+i+"2";
                Labelid3="LblPos"+i+"3";

                txtLabelid1="TxtPos"+i+"1";
                txtLabelid2="TxtPos"+i+"2";
                txtLabelid3="TxtPos"+i+"3";

                txtLabelid0="TxtHdnSeq"+i;
                txtLabelid4="TxtHdnCategory"+i;

            if(crsWho_GetPointSystem.getString("Sequence")!=null)
                strSequence= crsWho_GetPointSystem.getString("Sequence");

            if(crsWho_GetPointSystem.getString("Category")!=null)
                strCategory= crsWho_GetPointSystem.getString("Category");

            if(crsWho_GetPointSystem.getString("Breeder")!=null)
                strBreeder= crsWho_GetPointSystem.getString("Breeder");
          
            if(crsWho_GetPointSystem.getString("Owner")!=null)
                strOwner= crsWho_GetPointSystem.getString("Owner");

            if(crsWho_GetPointSystem.getString("Rider")!=null)
                strRider= crsWho_GetPointSystem.getString("Rider");

    %>

      <tr class="grid_OwnerHis" >

            <td width="210">
                 <% out.println(strCategory);%>
                 <input type="hidden" name="<%=txtLabelid4%>" size="5" id="<%=txtLabelid4%>" value="<%=strCategory%>"/>
                 <input type="hidden" name="<%=txtLabelid0%>" size="5" id="<%=txtLabelid0%>" value="<%=strSequence%>"/>
             </td>

            <td width="200">
                <span id="<%=Labelid1+"span"%>" class="ped" >
                        <label id="<%=Labelid1%>"   onclick="Point_Edit('<%=Labelid1+"span"%>','<%=Labelid1%>','<%=txtLabelid1+"span"%>','<%=txtLabelid1%>')" style="text-transform: uppercase;" /> <%=strBreeder%></Label>
                </span>
                 <span id="<%=txtLabelid1+"span" %>" style="visibility:hidden;" >
                     <input type="text" name="<%=txtLabelid1%>" id="<%=txtLabelid1%>" size="5"  value='<%=strBreeder%>'style="text-transform: uppercase;" onmouseout="Checkload('<%=Labelid1+"span"%>','<%=Labelid1%>','<%=txtLabelid1+"span"%>','<%=txtLabelid1%>')"/>
                </span>
                    
            </td>
            <td width="160">
                <span id="<%=Labelid2+"span"%>" class="ped" >
                        <label id="<%=Labelid2%>"   onclick="Point_Edit('<%=Labelid2+"span"%>','<%=Labelid2%>','<%=txtLabelid2+"span"%>','<%=txtLabelid2%>')" style="text-transform: uppercase;"/> <%=strOwner%></Label>
                </span>
                 <span id="<%=txtLabelid2+"span" %>" style="visibility:hidden;" >
                     <input type="text" name="<%=txtLabelid2%>" id="<%=txtLabelid2%>" size="5"  value='<%=strOwner%>' style="text-transform: uppercase;" onmouseout="Checkload('<%=Labelid2+"span"%>','<%=Labelid2%>','<%=txtLabelid2+"span"%>','<%=txtLabelid2%>')"/>
                </span>
            </td>

            <td width="130">
                <span id="<%=Labelid3+"span"%>" class="ped" >
                        <label id="<%=Labelid3%>"   onclick="Point_Edit('<%=Labelid3+"span"%>','<%=Labelid3%>','<%=txtLabelid3+"span"%>','<%=txtLabelid3%>')" style="text-transform: uppercase;"/> <%=strRider%></Label>
                </span>
                 <span id="<%=txtLabelid3+"span" %>" style="visibility:hidden;" >
                     <input type="text" name="<%=txtLabelid3%>" id="<%=txtLabelid3%>" size="5"  value='<%=strRider%>' style="text-transform: uppercase;" onmouseout="Checkload('<%=Labelid3+"span"%>','<%=Labelid3%>','<%=txtLabelid3+"span"%>','<%=txtLabelid3%>')"/>
                </span>
                <img src="Images/add.png"    style="visibility:hidden;" onClick="addRowToTable_who_gets_PointSystem()" />
            </td>
            
        </tr>
      <%
        }
      }
        catch (Exception e) {
        System.err.println("Got an exception! ");
        System.err.println("++frmOwnersHistory.jsp+++"+e);
    }
       }
  %>

        <input type="hidden" name="SavedYN" id="SavedYN" value="Y" />
        <input type="hidden" name="PAGEID" id="PAGEID" value="WHOGETS_POINTS" />
        <input type="hidden" name="HdnRecSize" id="HdnRecSize" value="<%=crsWho_GetPointSystem.size()%>"/>
        <input type="hidden" name="HdnTxtVal" id="HdnTxtVal"/>
        <input type="hidden" name="HdnMTotRow" id="HdnMTotRow"/>

  
    </table>
     <table  align="center"  border="0" cellpadding="0" cellspacing="0" width="100%">
       <tr>
            <td align="center" colspan="10">
                <BR>
                <BR>
                <input type="button" id="Save" class="button" value="Save" name="save"onclick="Save_Who_PointSystem()"/>
                <input type="button" id="PointSystem" class="button" value="Reset" onclick="Reset_Who_PointSystem()"/>

            </td>
        </tr>
     </table>

    </div>
        <div id="sidebar">

        <table style="border-collapse:collapse;">
          <tr>
            <td>
              <div onclick="location.href='createuser.jsp';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
        border-top:  1px solid #5D92B1;
        border-left:  1px solid #5D92B1;
        border-right:  1px solid #5D92B1;
        padding: 4px;" >User SetUp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
            </td>
          </tr>
          <tr>
            <td>
              <div onclick="location.href='user_role.jsp';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
        border-top:  1px solid #5D92B1;
        border-left:  1px solid #5D92B1;
        border-right:  1px solid #5D92B1;
        padding: 4px;" >Role SetUp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
            </td>
          </tr>
          <tr>
            <td>
              <div  onclick="location.href='frmAccessScreen.jsp';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
        border-top:  1px solid #5D92B1;
        border-left:  1px solid #5D92B1;
        border-right:  1px solid #5D92B1;
        padding: 4px;" >Screen Access&nbsp;&nbsp;&nbsp;&nbsp;</div>
            </td>
          </tr>
          <tr>
            <td>
              <div onclick="location.href='frmPointSystem.jsp';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
        border-top:  1px solid #5D92B1;
        border-left:  1px solid #5D92B1;
        border-right:  1px solid #5D92B1;
        padding: 4px;" >Point System&nbsp;&nbsp;&nbsp;&nbsp;</div>
            </td>
          </tr>
          <tr>
            <td>
              <div  onclick="location.href='frmWho_Gets_Point.jsp';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
        border-top:  1px solid #5D92B1;
        border-left:  1px solid #5D92B1;
        border-right:  1px solid #5D92B1;
        padding: 4px;" >Who Gets Points&raquo;</div>
            </td>
          </tr>
		  <tr>
    <td>
      <div  onclick="location.href='frmAdmn_Others.jsp';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;" >Others&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
    </td>
  </tr>
        </table>

        </div>

            <div id="footer_Bot" align="bottom">
            <br/>
            <jsp:include page="/frmBottom_Registration.jsp"/>
            </div>
    </div>
   <div id="dialog-Reg" title="Search Registration" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  src="regsearchpopup.jsp"  id="modalIFrame_Show" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes">
        </iframe>
    </div>
</form>

</body>
</html>