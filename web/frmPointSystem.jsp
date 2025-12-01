
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
<script type="text/javascript" src="jscPointSystem.js"></script>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script type="text/javascript" src="jquery.inlineedit.js"></script>

<script type="text/javascript" src="js/interface.js"></script>
<link rel="stylesheet" src="master.css" media="screen"></link>


<style type="text/css">
    .ui-state-hover { background-color: #ffC }
    .inlineEdit-placeholder { font-style: italic; color: #555; }
</style>


<script type="text/javascript">


$(function(){
    $('.editable').inlineEdit({

    });
});


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
    <form name="PointSystem">
   <%--<%@ include file="frmOwnersHistoryInclude.jsp"%>--%>
    <div id="container">
    <div id="header">
        <%@ include file="frmHeader.jsp"%>
   </div>

    <div id="content">

        <table class="altRow">
          <tr>
                <td>SHOW TYPE</td>
              <td colspan="3">
                <select name="Show_type" id="Show_type" onchange="Sample1(this.value)" style="background-color:  #FFF8DC; border:  1px solid #000000;width:130px" >

                <option value=''>Select</option>
                <option value="R">REGULAR</option>
                <option value="I">INTERNATIONAL</option>
                <option value="W">WORLD CUP</option>
				<option value="Exp Equ Gr A JNP">Exp Equ Gr A JNP</option>
				<option value="Exp Equ Gr B">Exp Equ Gr B</option>
				<option value="Exp Nal Equ">Exp Nal Equ</option>
				<option value="Exp Nal Equ JNP">Exp Nal Equ JNP</option>
             </select>
                      
            </td>

            <%
     if(strShowType != null && !strShowType.equals(""))  { %>
        <script language="javascript">
         var select = document.PointSystem.Show_type;
            for (var option = 0; option < select.options.length; option++) {
                if (select.options[option].value == '<%= strShowType.trim() %>') {
                select.selectedIndex = option;
                break;   }   }
        </script>
    <%}%>
                   
     <td>Category</td>

        <td> <img src="Images/add.png" onClick="addRowToTablePointSystem()" /></td>
         <input type="hidden" value="0" id="theValue" />
             </tr>
   </table>
  <table class="grid"  id="tblSample"    border="0" cellpadding="0" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th width="330" align="center">Category</th>
                <th >Position1</th>
                <th >Position2</th>
                <th >Position3</th>
                <th >Position4</th>
                <th >Position5</th>
               
            </tr>

        </thead>
    

    
        

     <%
 RowSetFactory factorycrsGetPointSystem = RowSetProvider.newFactory();
   CachedRowSet crsGetPointSystem= factorycrsGetPointSystem.createCachedRowSet();
 //CachedRowSetImpl crsGetPointSystem = new CachedRowSetImpl();

if(strMode.equals("2"))
{    
     
       try
        {
                String strCategory="";
                String strCategorySeq="";
                String strPosition1="";
                String strPosition2="";
                String strPosition3="";
                String strPosition4="";
                String strPosition5="";

               
            GeneralServlet genn =new GeneralServlet();

            crsGetPointSystem = genn.get_PointsSystem(strShowType);
            int i=0;
            String Labelid1="";
            String Labelid2="";
            String Labelid3="";
            String Labelid4="";
            String Labelid5="";
            
            
            String txtLabelid0="";
            String txtLabelid1="";
            String txtLabelid2="";
            String txtLabelid3="";
            String txtLabelid4="";
            String txtLabelid5="";
            String txtLabelid6="";
         
            while(crsGetPointSystem.next())
            {
                i=i+1;
                strCategory="";
                strPosition1="";
                strPosition2="";
                strPosition3="";
                strPosition4="";
                strPosition5="";

            Labelid1="LblPos"+i+"1";
            Labelid2="LblPos"+i+"2";
            Labelid3="LblPos"+i+"3";
            Labelid4="LblPos"+i+"4";
            Labelid5="LblPos"+i+"5";

            txtLabelid1="TxtPos"+i+"1";
            txtLabelid2="TxtPos"+i+"2";
            txtLabelid3="TxtPos"+i+"3";
            txtLabelid4="TxtPos"+i+"4";
            txtLabelid5="TxtPos"+i+"5";

            txtLabelid0="TxtHdnSeq"+i;
            txtLabelid6="TxtHdnCategory"+i;

            if(crsGetPointSystem.getString("Category")!=null)
                strCategory= crsGetPointSystem.getString("Category");

            if(crsGetPointSystem.getString("Cat_Sequence")!=null)
                strCategorySeq= crsGetPointSystem.getString("Cat_Sequence");


            if(crsGetPointSystem.getString("Position1")!=null)
                strPosition1= crsGetPointSystem.getString("Position1");

             if(crsGetPointSystem.getString("Position2")!=null)
                strPosition2= crsGetPointSystem.getString("Position2");

            if(crsGetPointSystem.getString("Position3")!=null)
                strPosition3= crsGetPointSystem.getString("Position3");

            if(crsGetPointSystem.getString("Position4")!=null)
                strPosition4= crsGetPointSystem.getString("Position4");

            if(crsGetPointSystem.getString("Position5")!=null)
                strPosition5= crsGetPointSystem.getString("Position5");
           
    %>
       
      <tr class="grid_OwnerHis">
          <td>
                 <% out.println(strCategory);%>
                 <input type="hidden" name="<%=txtLabelid6%>"  id="<%=txtLabelid6%>" value="<%=strCategory%>"/>
                 <input type="hidden" name="<%=txtLabelid0%>"  id="<%=txtLabelid0%>" value="<%=strCategorySeq%>"/>
            </td>
            
            <td >
                 <span id="<%=Labelid1+"span"%>" class="ped"   >
              <a class="showTip L1"> <label id="<%=Labelid1%>"  size="20"  onclick="Point_Edit('<%=Labelid1+"span"%>','<%=Labelid1%>','<%=txtLabelid1+"span"%>','<%=txtLabelid1%>')" /> <%=strPosition1%></Label></a>
                </span>
                 <span id="<%=txtLabelid1+"span" %>" style="visibility:hidden;width:1; " >
                     <input type="text" name="Position1" id="<%=txtLabelid1%>" size="5"
                            maxlength="5"
                            value='<%=strPosition1%>' onmouseout="Checkload('<%=Labelid1+"span"%>','<%=Labelid1%>','<%=txtLabelid1+"span"%>','<%=txtLabelid1%>')"/>
                </span>
               
            </td>
                <td >
                <span id="<%=Labelid2+"span"%>" class="ped"  >
                  <a class="showTip L2">  <label id="<%=Labelid2%>"  onclick="Point_Edit('<%=Labelid2+"span"%>','<%=Labelid2%>','<%=txtLabelid2+"span"%>','<%=txtLabelid2%>')" /> <%=strPosition2%></Label></a>
                </span>
                 <span id="<%=txtLabelid2+"span" %>" style="visibility:hidden;" >
                     <input type="text" name="Position2" id="<%=txtLabelid2%>" size="5" maxlength="5" value='<%=strPosition2%>' onmouseout="Checkload('<%=Labelid2+"span"%>','<%=Labelid2%>','<%=txtLabelid2+"span"%>','<%=txtLabelid2%>')"/>
                </span>
               
            </td>
            <td >
                <span id="<%=Labelid3+"span"%>" class="ped" >
                <a class="showTip L3">         <label id="<%=Labelid3%>" size="5"  onclick="Point_Edit('<%=Labelid3+"span"%>','<%=Labelid3%>','<%=txtLabelid3+"span"%>','<%=txtLabelid3%>')" /> <%=strPosition3%></Label></a>
                </span>
                 <span id="<%=txtLabelid3+"span" %>" style="visibility:hidden;" >
                     <input type="text" name="Position3" id="<%=txtLabelid3%>" size="5" maxlength="5"  value='<%=strPosition3%>' onmouseout="Checkload('<%=Labelid3+"span"%>','<%=Labelid3%>','<%=txtLabelid3+"span"%>','<%=txtLabelid3%>')"/>
                </span>
               
            </td>
            <td>
                <span id="<%=Labelid4+"span"%>" class="ped" >
               <a class="showTip L4"> <label id="<%=Labelid4%>"  size="5" onclick="Point_Edit('<%=Labelid4+"span"%>','<%=Labelid4%>','<%=txtLabelid4+"span"%>','<%=txtLabelid4%>')" /> <%=strPosition4%></Label></a>
                </span>
                 <span id="<%=txtLabelid4+"span" %>" style="visibility:hidden;" >
                     <input type="text" name="Position4" id="<%=txtLabelid4%>" size="5" maxlength="5" value='<%=strPosition4%>' onmouseout="Checkload('<%=Labelid4+"span"%>','<%=Labelid4%>','<%=txtLabelid4+"span"%>','<%=txtLabelid4%>')"/>
                </span>
             
            </td>
            <td >
                <span id="<%=Labelid5+"span"%>" class="ped" >
              <a class="showTip L5"><label id="<%=Labelid5%>"  size="5" onclick="Point_Edit('<%=Labelid5+"span"%>','<%=Labelid5%>','<%=txtLabelid5+"span"%>','<%=txtLabelid5%>')" /> <%=strPosition5%></Label></a>
                </span>
                 <span id="<%=txtLabelid5+"span" %>" style="visibility:hidden;" >
                     <input type="text" name="Position5" id="<%=txtLabelid5%>" size="5"  maxlength="5" value='<%=strPosition5%>' onmouseout="Checkload('<%=Labelid5+"span"%>','<%=Labelid5%>','<%=txtLabelid5+"span"%>','<%=txtLabelid5%>')"/>
                </span>
                <img src="Images/add.png"    style="visibility:hidden;" onClick="addRowToTablePointSystem()" />
                


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
        <input type="hidden" name="SavedLbl" id="SavedLbl" />
        <input type="hidden" name="SavedTxt" id="SavedTxt" />
        <input type="hidden" name="PAGEID" id="PAGEID" value="GETS_POINTSYSTEM" />
        <input type="hidden" name="HdnRecSize" id="HdnRecSize" value="<%=crsGetPointSystem.size()%>"/>
        <input type="hidden" name="HdnTxtVal" id="HdnTxtVal"/>
        <input type="hidden" name="HdnMTotRow" id="HdnMTotRow"/>


    
    </table>
   
        <table  align="center"  border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
           <td align="center" colspan="10">
                <BR>
                <BR>
                <input type="button" id="Save" class="button" value="Save" onclick="Save_PointSystem()"/>
                <input type="button" id="PointSystem" class="button" value="Reset" onclick="Reset_PointSystem()"/>

            </td>

        </tr>
             </table>
    </div>

 <script language="javascript">
                prntElements('PointSystem');
 </script>

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
        padding: 4px;" >Point System&raquo;&nbsp;&nbsp;</div>
            </td>
          </tr>
          <tr>
            <td>
              <div  onclick="location.href='frmWho_Gets_Point.jsp';"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
        border-top:  1px solid #5D92B1;
        border-left:  1px solid #5D92B1;
        border-right:  1px solid #5D92B1;
        padding: 4px;" >Who Gets Points&nbsp;&nbsp;</div>
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