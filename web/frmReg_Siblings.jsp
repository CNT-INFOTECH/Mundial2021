<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.DBConnection" %>
<%@ page import="pasotracker.GeneralServlet" %>

<head>
<title>SIBLINGS</title>

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

<link href="Tables_style.css" rel="stylesheet" type="text/css" />

 <link href="Registration.css" rel="stylesheet" type="text/css" />
 <link href="style.css" rel="stylesheet" type="text/css" />
 <link href="buttons.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/interface.js"></script>
<script type="text/javascript">

function Reset_Siblings()
{
    document.forms[0].method="post";
    document.forms[0].action="frmReg_Siblings.jsp?Mode=1";
    document.forms[0].target="_self";  
    document.forms[0].submit();
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
<form name="Reg_Siblings_frm">
<%@ include file="frmReg_ScreenAttributes.jsp"%>
<%       
    String REGSEQ="";        
    String strMode="";
    String SaveYN="N";
    if(request.getParameter("Mode")!=null)
        strMode=request.getParameter("Mode");

    if(strMode.equals("1"))
    {
    SaveYN="N";            
    session.removeAttribute("ses_REGSEQ");        
    }
    if(strMode.equals("2") || strMode.equals("3") )
    {
        if(request.getParameter("RegNo")!=null)
        REGSEQ =request.getParameter("RegNo");
        else
        REGSEQ="";           
    }
    else if(session.getAttribute("ses_REGSEQ")!=null)
        REGSEQ =(String) session.getAttribute("ses_REGSEQ");
    else
        REGSEQ="";                
%>
     <%@ include file="frmOwnersHistoryInclude.jsp"%>
    <div id="container">
    <div id="header">
        <%@ include file="frmHeader.jsp"%>
   </div>
<%

	if(!bRegistraion)
	response.sendRedirect("login.jsp");

    String FontColor="";
    String RegType="";

    if(strRegistration_Type.equals("R"))
    {
       FontColor="blue";
       RegType="R";
    }
    else if(strRegistration_Type.equals("P"))
    {
       FontColor="red";
       RegType="P";
    }
    else if(strRegistration_Type.equals("S"))
    {
       FontColor="green";
       RegType="S";
    }
 String Regno="";
    Regno=str_reggno;  //Regno is used in frmReg_Top.jsp
%>
    <div id="content">                
        <%@ include file="frmReg_Top.jsp"%>
		<input type="hidden" name="SavedYN" id="SavedYN" value="Y" />

             <div align="center">
                <table id="altRow" align="center">
                    <tr>
                    <td align="center" colspan="6">

                    <input type="button" id="Reg_Siblings" class="button" value="Reset" onclick="Reset_Siblings()"/>
                    <input type="button" id="Previous_Reg_Siblings" onclick="CheckSave('frmPedigree.jsp')" class="button" value="&laquo;" />
                    <input type="button" id="Next_Reg_Siblings" onclick="CheckSave('frmOwnersHistory.jsp')" class="button" value="&raquo;" />


                    </td>
                    </tr>
                </table>
            </div>

  
          <%

      
	if( !REGSEQ.equals(""))
		{

      List SiblingList = new ArrayList();
       try
        {
                String strShowSeq="";
                String strRegno="";
                String strname="";
                String strage="";
                String strGender="";
                 strSire="";
                 strDam="";
                String strOwnername="";




            GeneralServlet genn =new GeneralServlet();
RowSetFactory factory2 = RowSetProvider.newFactory();
   CachedRowSet crsGetSiblings= factory2.createCachedRowSet();
          //  CachedRowSetImpl crsGetSiblings = new CachedRowSetImpl();

            crsGetSiblings = genn.Get_Siblings(REGSEQ);

             Map MpHorseDetails = new TreeMap();
               
            while(crsGetSiblings.next())
            {
                strShowSeq="";
                strRegno="";
                strname="";
                strage="";
                strGender="";
                strSire="";
                strDam="";
                strOwnername="";



                /*if(crsGetSiblings.getString("Show_Seq")!=null)
                    strShowSeq= crsGetSiblings.getString("Show_Seq").trim();
             System.out.println("---------------------"+strShowSeq);
*/
            if(crsGetSiblings.getString("REGISTRATION_NUM")!=null)
                strRegno= crsGetSiblings.getString("REGISTRATION_NUM");
               

            if(crsGetSiblings.getString("HORSE_PRIMARYNAME")!=null)
                strname= crsGetSiblings.getString("HORSE_PRIMARYNAME").toUpperCase();

             if(crsGetSiblings.getString("Age")!=null)
                strage= crsGetSiblings.getString("Age");


            if(crsGetSiblings.getString("HORSE_GENDER")!=null)
                strGender= crsGetSiblings.getString("HORSE_GENDER");

            if(crsGetSiblings.getString("SIRE")!=null)
                strSire= crsGetSiblings.getString("SIRE").toUpperCase();

            if(crsGetSiblings.getString("DAM")!=null)
                strDam= crsGetSiblings.getString("DAM").toUpperCase();

            if(crsGetSiblings.getString("FIRSTNAME")!=null)
                strOwnername= crsGetSiblings.getString("FIRSTNAME");

                    MpHorseDetails = new TreeMap();
                    // MpHorseDetails.put("SHOWSEQ",strShowSeq);
                    MpHorseDetails.put("REGNO#",strRegno);
                    MpHorseDetails.put("NAME",strname);
                    MpHorseDetails.put("AGE",strage);
                    MpHorseDetails.put("GENDER",strGender);
                    MpHorseDetails.put("SIRE",strSire);
                    MpHorseDetails.put("DAM",strDam);
                    MpHorseDetails.put("OWNER",strOwnername);

                    SiblingList.add(MpHorseDetails);
            }
        }
        catch(Exception ex)
        {
                ex.printStackTrace();
        }
        request.setAttribute("SiblingList", SiblingList);

    if(SiblingList.size()>0)
    {
		%>
      <display:table  id="Details" name="requestScope.SiblingList"
        pagesize="100"
        class="grid" style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;" >
       <display:setProperty name="basic.msg.empty_list" value="No Shows found "/>

        <display:column style="width:10%;height:30px" title="REGNO#" property="REGNO#" sortable="true" headerClass="Grid_Header"/>
        <display:column style="width:20%" property="NAME" sortable="true" headerClass="Grid_Header"/>
        <display:column style="width:5%"   title="AGE" sortable="true" property="AGE" headerClass="Grid_Header"/>
        <display:column style="width:5%;text-align:center"  property="GENDER" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:20%" property="SIRE" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:20%" property="DAM" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:20%" property="OWNER" sortable="true" headerClass="Grid_Header" />
        </display:table>

       <% }
%>

		<%}%>
        </div>
        <div id="sidebar">
                
       <table style="border-collapse:collapse;">
  <tr>
    <td>
      <div onclick="CheckSave('index.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;width:120px;" >General</div>
    </td>
  </tr>
  <tr>
    <td>
      <div onclick="CheckSave('Images.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Images</div>
    </td>
  </tr>
  <tr>
    <td>
      <div  onclick="CheckSave('Markings.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Markings</div>
    </td>
  </tr>
  <tr>
    <td>
      <div onclick="CheckSave('frmPedigree.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Pedigree</div>
    </td>
  </tr>

  <tr>
    <td>
      <div onclick="CheckSave('frmReg_Descendants.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Descendants</div>
    </td>
  </tr>

  <tr>
    <td>
      <div onclick="CheckSave('frmReg_Siblings.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f;color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >&nbsp;&nbsp;Siblings&raquo;</div>
    </td>
  </tr>
  <tr>
    <td>
      <div onclick="CheckSave('frmOwnersHistory.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Owner's&nbsp;History</div>
    </td>
  </tr>
  <tr>
    <td>
      <div onclick="CheckSave('frmShowHistory.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f;color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Show&nbsp;History</div>
    </td>
  </tr>
  <tr>
    <td>
      <div onclick="CheckSave('frmChampionship.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style="cursor: pointer; background-color: #4e738f;color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Championship</div>
    </td>
  </tr>
  <tr>
    <td>
      <div onclick="CheckSave('frmDocuments.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f;color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Documents</div>
    </td>
  </tr>
  <tr>
    <td>
      <div onclick="CheckSave('frmObservations.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f;color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Observations</div>
    </td>
  </tr>
   <tr>
    <td>
      <div onclick="CalculatorPopUp()"  style=" cursor: pointer; background-color: #4e738f;color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Calculator</div>
    </td>
  </tr>

  <tr>
    <td>
      <div onclick="CheckSave('frmRegistrationSearch.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f;color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Search</div>
    </td>
  </tr>

  <tr>
    <td>
      <div onclick="CheckSave('frmReg_SearchHorseDetails.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f;color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Age&nbsp;Verify</div>
    </td>
  </tr>
  <tr>
    <td>
      <div onclick="CheckSave('Admn_UserProfile.jsp?ty=R&<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >User&nbsp;Profile</div>
    </td>
  </tr>

</table>
        </div>
            
            <div id="footer_Bot" align="bottom">
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