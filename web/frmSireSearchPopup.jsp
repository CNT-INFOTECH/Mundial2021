<%--
    Document   : regsearchpopup
    Created on : Apr 28, 2011, 1:07:52 PM
    Author     : Veera
--%>
<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
        <%--<script src="jscIndex.js"></script>--%>
        
        <script type='text/javascript' src='AutoComplete/jquery.autocomplete.js'></script>
        
        <%--<link rel="stylesheet" type="text/css" href="AutoComplete/jquery.autocomplete.css" />--%>
        <script type="text/javascript" src="js/interface.js"></script>    
         
        <style type="text/CSS">

div#wrapper1 {

background:url("Images/trans-wood-1.png");
width: 100%;
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

.altRow_button
{

}

.altRow_button td
{
	border-bottom:1px dotted #ffffff;
	font-size:9pt;
	color:#000000;
	padding:5px 0 5px 5px;
	vertical-align:top;
	text-align:left;
}


.altRow_button  th
{
	background:#4e738f;
	color:#fff;
	font-weight:bold;
	font-size:9pt;
	text-align:center;
}
.altRow_button td
{
	border-bottom:1px dotted #ffffff;
	font-size:9pt;
	color:#000000;
	padding:5px 0 5px 5px;
	vertical-align:top;
	text-align:center;
}
.ui-datepicker
{
    font-family:TimesNewRoman;
    font-size: 10px;
    margin-left:0px;
    margin-top: 0px;
    line-height: 1.0em;
}
fieldset { padding:20px;  }
input, textarea, select {font:12px/12px Arial, Helvetica, sans-serif; padding:0;}
fieldset.action {background:#9da2a6; border-color:#e5e5e5 #797c80 #797c80 #e5e5e5; margin-top:-20px;}
</style>

<script language="javascript">

  $(function() {
       $( "#dob" ).datepicker({
            changeMonth: true,
            changeYear: true
        });

        $( "#view" )
        .click(function(){

        document.forms[0].regno.value="";
        document.forms[0].dob.value="";
        document.forms[0].owner.value="";
        document.forms[0].microchip_num.value="";
        document.forms[0].hor_name.value="";
        document.forms[0].Registration_Type.value="";


        document.forms[0].method="post";
        //document.forms[0].action="frmSireSearch_ViewAll.jsp";
        document.forms[0].action="frmSireSearchPopup.jsp?Mode=2";
        document.forms[0].target="_self";
        document.forms[0].submit();
      });
      
      function formatItem(row) {
		 finalVal_formatItem=row[0].split('#@#')
		 return finalVal_formatItem[0] ;
	}
	         
	function formatResult_O(row) {
		 finalVal_formatResult=row[0].split('[ID:]')
		return finalVal_formatResult[0].replace(/(<.+?>)/gi, '');
	}
	function formatResult(row) {
		 finalVal_formatResult=row[0].split('[REG:]')
		return finalVal_formatResult[0].replace(/(<.+?>)/gi, '');
	}
	

    
  
        $("#hor_name").autocomplete("frmAutoSireDamNameList.jsp?ExpType=1", {
		width: 500,
		matchContains: true,
		formatItem: formatItem,
		formatResult: formatResult
	});
         
         
         $("#hor_name").result(function(event, data, formatted) {
            /*
            //var hiddenRegSeq = $("#HdnRegSeq");
            var value = data.toString().split('#@#');
            // hiddenRegSeq.val(value[1]);
            */
            
            //var hiddenSeq = $("#TxtSireSeq");
            var RegNum = $("#regno");
            var value = data.toString().split('[REG:]');            
            var seq= value[1].split('#@#');
            //hiddenSeq.val(trimRegister(seq[1]));
            RegNum.val(trimRegister(seq[0]));
            
           });
    
      
      $("#owner").autocomplete("frmAutoOwnerBreederNameList.jsp", {
		width: 250,
		matchContains: true,
		formatItem: formatItem,
		formatResult: formatResult_O
	});
         
         
         $("#owner").result(function(event, data, formatted) {            
            var value = data.toString().split('#@#');           
			var value1 = value[0].toString().split('[ID:]');   
			var id = $("#Assigned_Num");
			id.val(trimRegister(value1[1]));
             });
      
      
  });
  
function showAlert()
{    
        if(document.forms[0].ViewAll_Sire.checked==true)
        {            
            document.forms[0].HdnViewAll_Sire.value='Y';
	    document.forms[0].SireSearchbtn.click();
        }     
}
</script>
       
<script type="text/javascript" src="jscRegistrationSearch.js"></script>

</head>

<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import= "javax.naming.*" %>
<%@ page import= "javax.sql.rowset.*" %>
<%@ page import= "pasotracker.DBConnection" %>
<%@ page import= "pasotracker.GeneralServlet" %>


<body >
  <form name="frmSireSearchPopup" method="post">
 
      <%
        String str_Reg_no ="";
        String strHor_PName ="";
        String strHor_DOB = "";
        String strmem_name = "";
        String strmicro_num = "";
        String strRegistration_Type="";
        String AssignedNum="";
        String strMode="";
        int Counter=0;
        
        String strViewAll=request.getParameter("ViewAll");

        
        if(request.getParameter("Mode")!=null)
             strMode=request.getParameter("Mode");
                
        if(request.getParameter("regno")!=null)
            str_Reg_no=request.getParameter("regno");

        if(request.getParameter("hor_name")!=null)
            strHor_PName=request.getParameter("hor_name");

        if(request.getParameter("dob")!=null)
            strHor_DOB=request.getParameter("dob");

        if(request.getParameter("owner")!=null)
            strmem_name=request.getParameter("owner");

        if(request.getParameter("microchip_num")!=null)
            strmicro_num=request.getParameter("microchip_num");
        
        if(request.getParameter("Registration_Type")!=null)
                strRegistration_Type=request.getParameter("Registration_Type").trim();
        
        if(request.getParameter("Assigned_Num")!=null)
                AssignedNum=request.getParameter("Assigned_Num").trim();
        
%>

<div id="framecontent">
    <div class="innertube">
        <table width="100%" border="0"  title="SEARCH" class="altRow">
            <tr >
                <td width="10%" style="padding-top: 12px;" nowrap>HORSE NAME</td>
                <td colspan="7">
                    <input type="text" size="77" name="hor_name" id="hor_name" value="<%=strHor_PName%>" style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
            height: 16px;
            padding-left: 18px;text-transform: uppercase;">
                    <input type="button" id="SireSearchbtn" class="button" value="Search"/>

                    <input type="button" id="SireSearchResetbtn" class="button" value="Reset"/>

                    <input type="button" id="SireSearchSelectbtn" class="button" value="OK"/>
                </td>
            </tr>
            <tr >
                <td width="10%">REGISTRATION#</td>
                <td width="8%">
                    <input type="text" size="7" name="regno" id="regno"  value="<%=str_Reg_no%>" style="background-color:  #FFF8DC; border:  1px solid #000000; text-transform: uppercase;">
                </td>
                
                <td nowrap width="10%">REGISTRATION TYPE</td>
                <td width="11%">
                    <select name="Registration_Type" id="Registration_Type" style="background-color:  #FFF8DC; border:  1px solid #000000;width:114px; text-transform: uppercase;" >
                        <option value=''>Select</option>
                        <%
            if (strRegistration_Type != null) {%>
                        <option
                            <%if (strRegistration_Type.trim().equals("REGISTRATION")) {
                            %> selected <%}%> >REGISTRATION</option>
                        <option
                            <% if (strRegistration_Type.trim().equals("PEDIGREE")) {
                            %> selected <%}%> >PEDIGREE</option>
                        <option
                            <% if (strRegistration_Type.trim().equals("SHOW")) {
                            %> selected <%}%> >SHOW</option>
                    </select>
                </td><%}%>
                
                <td width="4%">DOB</td>
                <td width="7%">
                    <input type="text" size="9" name="dob" id="dob" placeholder="mm/dd/yyyy" value="<%=strHor_DOB%>" style="background-color:  #FFF8DC; border:  1px solid #000000; text-transform: uppercase;"/>
                </td>

                <td width="7%">MICROCHIP#</td>
                <td width="4%">
                    <input type="text" size="5" name="microchip_num" id="microchip_num" value="<%=strmicro_num%>" style="background-color:  #FFF8DC; border:  1px solid #000000; text-transform: uppercase;">
                </td>
            </tr>                                   
            <tr>
                <td width="10%">ID#</td>
                <td width="8%">
                    <input type="text" size="7" name="Assigned_Num" id="Assigned_Num" value="<%=AssignedNum%>" style="background-color:  #FFF8DC; border:  1px solid #000000; text-transform: uppercase;">
                </td>
                
                <td width="10%" nowrap> OWNER NAME</td>
                <td colspan="5">
                    <input type="text" name="owner" id="owner"  size="55" value="<%=strmem_name%>" style=" background:  #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
                    height: 16px;
                    padding-left: 18px;text-transform: uppercase;">
                </td>
                
                <%--<td colspan="" valign="center">

        <input type="radio" name="view" id="view" />   VIEW  ALL
                </td>--%>
                
            </tr>
        </table>        
    </div>
</div>


     <%
if(strMode.equals("1"))
{
        String RegSeq="";
        String str_Reg_no1="";
        String strHor_PName1="";
        String strHor_DOB1="";
        String strmem_mname = "";
        String strmem_lname = "";
        String strOwnerName="";

        String REGSEQ="";
        String strOrgName="";
        String strOwn_Type="";


        /*RegSeq="";
        str_Reg_no1="";
        strHor_PName1="";
        strHor_DOB1="";
        strmem_mname = "";
        strmem_lname = "";
        strOwnerName="";

        String REGSEQ="";*/

         List HorseList = new ArrayList();
        try
        {
            GeneralServlet gen=new GeneralServlet();
 RowSetFactory factory14 = RowSetProvider.newFactory();
   CachedRowSet crsGetHorseDetails= factory14.createCachedRowSet();
           // CachedRowSetImpl crsGetHorseDetails = new CachedRowSetImpl();

            crsGetHorseDetails = gen.GET_SIRE(REGSEQ,str_Reg_no,strHor_PName.replace("\'","''"),strHor_DOB,strmem_name,strmicro_num,strRegistration_Type,AssignedNum);

            Map MpHorseDetails = new TreeMap();
           
            
           
            while (crsGetHorseDetails.next())
            {
                RegSeq="";

                str_Reg_no1="";
                strHor_PName1="";
                strHor_DOB1="";
                strmem_name="";
                strmicro_num="";
                strmem_mname = "";
                strmem_lname = "";
				strOrgName="";
                strOwn_Type="";

                if(crsGetHorseDetails.getString("REGSEQ")!=null)
                    RegSeq= crsGetHorseDetails.getString("REGSEQ").trim();

                if(crsGetHorseDetails.getString("REGISTRATION_NUM")!=null)
                    str_Reg_no1= crsGetHorseDetails.getString("REGISTRATION_NUM").trim();

                if(crsGetHorseDetails.getString("HORSE_PRIMARYNAME")!=null)
                    strHor_PName1= crsGetHorseDetails.getString("HORSE_PRIMARYNAME").trim();

                if(crsGetHorseDetails.getString("DOB")!=null)
                    strHor_DOB1= crsGetHorseDetails.getString("DOB").trim();

                if(crsGetHorseDetails.getString("FIRSTNAME")!=null)
                    strmem_name= crsGetHorseDetails.getString("FIRSTNAME").trim();

                if(crsGetHorseDetails.getString("LASTNAME")!=null)
                    strmem_lname= crsGetHorseDetails.getString("LASTNAME").trim();

                if(crsGetHorseDetails.getString("SUFFIX")!=null)
                    strmem_mname= crsGetHorseDetails.getString("SUFFIX").trim();

                if(crsGetHorseDetails.getString("MICROCHIP_NUM")!=null)
                    strmicro_num= crsGetHorseDetails.getString("MICROCHIP_NUM").trim();
				
				if(crsGetHorseDetails.getString("ORGANIZATION_NAME")!=null)
                    strOrgName= crsGetHorseDetails.getString("ORGANIZATION_NAME").trim();

                if(crsGetHorseDetails.getString("OWNER_TYPE")!=null)
                    strOwn_Type=crsGetHorseDetails.getString("OWNER_TYPE").trim();

                if(strOwn_Type.equalsIgnoreCase("INDIVIDUAL") || strOwn_Type.equalsIgnoreCase("YOUTH RIDER")
                    ||(strOwn_Type.equalsIgnoreCase("YOUTH RIDER") && strOrgName.equals("") ))
                    strOwnerName=strmem_name+" "+strmem_lname;
                else
                    strOwnerName=strOrgName;

                 //strOwnerName=strmem_name+" "+strmem_lname;

                String strList=strHor_PName1+"@#@"+str_Reg_no1+"@#@"+strHor_DOB1+"@#@"+strOwnerName+"@#@"+strmicro_num+"@#@"+RegSeq;

                String steCheckBox="ChkSelected";

                    MpHorseDetails = new TreeMap();
                    MpHorseDetails.put("HORSENAME",strHor_PName1);
                    MpHorseDetails.put("REG",str_Reg_no1);
                    MpHorseDetails.put("DOB",strHor_DOB1);
                    MpHorseDetails.put("OWNER",strOwnerName);
                    MpHorseDetails.put("MCHIP",strmicro_num);
                    MpHorseDetails.put("REGSEQ",RegSeq);
                    MpHorseDetails.put("Check",strList);
                    
                    Counter=Counter+1;

                    HorseList.add(MpHorseDetails);

                    //HorseList.add(strList);
            }
        

        request.setAttribute("HorseList", HorseList);
        
    //if(HorseList.size()>0)
           if (strViewAll.equals("Y"))
    {
               %>
               <div id="maincontent">
                   <%
        out.println(Counter + " Horses founds,displaying 1 to " + Counter);
                   %>
                   
                   
                   
                   <display:table  id="Details" name="requestScope.HorseList"
                                   class="grid"
                                   style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;text-transform:uppercase;">
                       
                       <display:column style="width:1%" headerClass="Grid_Header">
                       <input type="Checkbox" name="ChkSelected" value='${Details.Check}' /></display:column>
                       
                       <display:column style="width:17%"   title="HORSE NAME" property="HORSENAME" sortable="true" headerClass="Grid_Header"/>
                       <display:column style="width:10%"  property="REG" sortable="true" headerClass="Grid_Header" />
                       <display:column style="width:10%" property="DOB"  sortable="true" headerClass="Grid_Header" />
                       <display:column style="width:13%" property="OWNER" headerClass="Grid_Header" />
                       <display:column style="width:5%" property="MCHIP" headerClass="Grid_Header" />
                   </display:table>
                   
               </div>

    <%
    }else
        {            
            %>
        
        <div id="maincontent">
            
            <display:table  id="Details" name="requestScope.HorseList"
                            pagesize="100"
                            class="grid"
                            style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;overflow-x:scroll;text-transform:uppercase;">
                
                <display:setProperty name="paging.banner.item_name" value="Horse" />
                <display:setProperty name="paging.banner.items_name" value="Horses" />
                <display:setProperty name="paging.banner.some_items_found">
                
                    <span class="pagebanner" >{0} {1} founds,displaying {2} to {3}</span>
                    <span ><input type="checkbox" name="ViewAll_Sire" id="ViewAll_Sire" onClick="showAlert()"> 
                    <font style="font-weight:bold;">View All&nbsp;&nbsp;&nbsp;</font></span>
                    
                </display:setProperty>
                
                
                <display:column style="width:1%" headerClass="Grid_Header">
                <input type="Checkbox" name="ChkSelected" value='${Details.Check}' /></display:column>
                
                <display:column style="width:17%"   title="HORSE NAME" property="HORSENAME" sortable="true" headerClass="Grid_Header"/>
                <display:column style="width:10%"  property="REG" sortable="true" headerClass="Grid_Header" />
                <display:column style="width:10%" property="DOB"  sortable="true" headerClass="Grid_Header" />
                <display:column style="width:13%" property="OWNER" headerClass="Grid_Header" />
                <display:column style="width:5%" property="MCHIP" headerClass="Grid_Header" />
            </display:table>
            
        </div>
        
    <%  } 
        }
        
        catch(Exception ex)
        {
                ex.printStackTrace();

        }
         
         }%>
   
    

<input type="hidden" name="HdnViewAll_Sire" id="HdnViewAll_Sire" value='N' />
</form>
</body>
</html>
