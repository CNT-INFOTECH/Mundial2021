
<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import= "javax.naming.*" %>
<%@ page import= "javax.sql.rowset.*" %>
<%@ page import= "pasotracker.DbConnMngr" %>
<%@ page import= "pasotracker.GeneralServlet" %>
<%@ page import= "javax.servlet.http.HttpServletRequest,javax.servlet.ServletInputStream" %>
<%@ page import = "java.io.FileWriter,java.io.IOException" %>
<%@ page import= "java.io.FileInputStream"%>
<%@ page import= "org.apache.commons.fileupload.disk.*"%>
<%@ page import= "org.apache.commons.fileupload.*"%>


<html>
<head>
<title>PERSON REGISTRATION</title>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="Style_Popup.css">
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
<script src="js/jquery.autocomplete.js"></script>

<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="themes/base/jquery.ui.all.css"/>
<link href="Registration.css" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />       
<script type="text/javascript" src="jscIndex.js"></script>
<script type="text/javascript" src="jscPerson.js"></script>
<script type="text/javascript" src="jscReg_AutoComplete.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/interface.js"></script>
<script type="text/javascript" src="jscRegistration.js"></script>
  
<script type="text/javascript">

$(function() {
$( "#EFFECTIVEDATE" ).datepicker({
changeMonth: true,
changeYear: true
});
});


</script>
<style type="text/css">
.altRow1
{

}

.altRow1 td
{
	
	font-size:9pt;
	color:#000000;
	padding:5px 0 5px 5px;
	vertical-align:top;
	text-align:left;
}


.altRow1  th
{
	background:#4e738f;
	color:#fff;
	font-weight:bold;
	font-size:9pt;
	text-align:center;
}
</style>
</head>

<body >
<form name="Person_frm"  enctype="multipart/form-data"  method="post" >
<%
    String strMode="";
    String ASSIGNEDNUM="";

    if(request.getParameter("Mode")!=null)
    strMode=request.getParameter("Mode");

    if(request.getParameter("Assigned")!=null)
    ASSIGNEDNUM=request.getParameter("Assigned");
	String strHidden="disabled";
%>

    <div id="container">

        <div id="header">
            <%@ include file="frmHeader.jsp"%>
        </div>

			<%
		if(!bPersons)
		response.sendRedirect("login.jsp");

		%>

        <div id="content" width="70%">

     <fieldset>
     <legend>Person Details</legend>
     <table class="altRow1" width="70%">


<%
            String strOWNER_TYPE = "";
            String strFIRSTNAME = "";
            String strMIDNAME = "";
            String strLASTNAME = "";
            String strOrganizationName = "";
            String strGender = "";
            String strdatepicker_DOB = "";
            String strAddress1 = "";
            String strAddress2 = "";
            String strCity = "";
            String strState = "";
            String strZip = "";
            String strCountry = "";
            String strPhone = "";
            String strEmail = "";
            String strASSIGNEDNUM = "";
            int strEntitySeq=0;
            String strpath="";

            String strImageSize="";
            InputStream in = null;
            String str="";
            String strIndividual="";
			String strSchool="";
			String strSchoolValue="";

            String strSample="";

           if(request.getParameter("OWNER_TYPE")!=null )
		 
            strOWNER_TYPE=request.getParameter("OWNER_TYPE");

             if(request.getParameter("FIRSTNAME")!=null )
            strFIRSTNAME=request.getParameter("FIRSTNAME");

             if(request.getParameter("MIDNAME")!=null )
            strMIDNAME=request.getParameter("MIDNAME");

             if(request.getParameter("LASTNAME")!=null )
            strLASTNAME=request.getParameter("LASTNAME");

             if(request.getParameter("OrganizationName")!=null )
            strOrganizationName=request.getParameter("OrganizationName");

             if(request.getParameter("Gender")!=null )
            strGender=request.getParameter("Gender");

             if(request.getParameter("datepicker_DOB")!=null )
            strdatepicker_DOB=request.getParameter("datepicker_DOB");

             if(request.getParameter("Address1")!=null )
            strAddress1=request.getParameter("Address1");

             if(request.getParameter("Address2")!=null )
            strAddress2=request.getParameter("Address2");

             if(request.getParameter("CITY")!=null )
            strCity=request.getParameter("CITY");

             if(request.getParameter("STATE")!=null )
            strState=request.getParameter("STATE");

             if(request.getParameter("ZIP")!=null )
            strZip=request.getParameter("ZIP");

             if(request.getParameter("COUNTRY")!=null )
            strCountry=request.getParameter("COUNTRY");

             if(request.getParameter("PHONE")!=null )
            strPhone=request.getParameter("PHONE");

             if(request.getParameter("Email")!=null )
            strEmail=request.getParameter("Email");

             if(request.getParameter("ASSIGNEDNUM")!=null )
            strASSIGNEDNUM=request.getParameter("ASSIGNEDNUM");

         //added by ramani   
			if(request.getParameter("school")!=null )
            strSchool=request.getParameter("school");

			if(request.getParameter("schoolValue")!=null )
            strSchoolValue=request.getParameter("schoolValue");

 RowSetFactory factory12 = RowSetProvider.newFactory();
   CachedRowSet crsGetPerson= factory12.createCachedRowSet();
       ///    CachedRowSetImpl crsGetPerson = new CachedRowSetImpl();

            if (strMode.equals("2")||strMode.equals("3")) {

            try {
                GeneralServlet genn = new GeneralServlet();


                if(ASSIGNEDNUM.length()>0 && ASSIGNEDNUM!=null)
                {crsGetPerson = genn.get_InsUpdRider(ASSIGNEDNUM);


                while (crsGetPerson.next())
                {

                    strOWNER_TYPE ="";
                    strFIRSTNAME ="";
                    strMIDNAME ="";
                    strLASTNAME ="";
                    strOrganizationName ="";
                    strGender ="";
                    strdatepicker_DOB ="";
                    strAddress1 ="";
                    strAddress2 ="";
                    strCity ="";
                    strState ="";
                    strZip ="";
                    strCountry ="";
                    strPhone ="";
                    strEmail ="";
                    strASSIGNEDNUM ="";
                    strEntitySeq=0;
                    strImageSize="";
                    strSample="";
					strSchool="";
					strSchoolValue="";

                   if (crsGetPerson.getString("OWNER_TYPE") != null) {
                        strOWNER_TYPE = crsGetPerson.getString("OWNER_TYPE").trim(); 
						if(strOWNER_TYPE.equals("YOUTH RIDER") || strOWNER_TYPE.equals("ORGANIZATION"))
						{
							strHidden="enable";
						}
                    }

                    if (crsGetPerson.getString("ENTITYSEQ") != null) {
                        strEntitySeq = Integer.parseInt(crsGetPerson.getString("ENTITYSEQ").trim());

                    }

                    if (crsGetPerson.getString("FIRSTNAME") != null) {
                        strFIRSTNAME = crsGetPerson.getString("FIRSTNAME").trim();
                    }


                    if (crsGetPerson.getString("SUFFIX") != null) {
                        strMIDNAME = crsGetPerson.getString("SUFFIX").trim();
                    }

                    if (crsGetPerson.getString("LASTNAME") != null) {
                        strLASTNAME = crsGetPerson.getString("LASTNAME").trim();
                    }

                    if (crsGetPerson.getString("Organization_Name") != null) {
                        strOrganizationName = crsGetPerson.getString("Organization_Name").trim();
                    }

                    if (crsGetPerson.getString("Gender") != null) {
                        strGender = crsGetPerson.getString("Gender").trim();
                    }

                    if (crsGetPerson.getString("DOB") != null) {
                        strdatepicker_DOB = crsGetPerson.getString("DOB").trim();
                    }

                    if (crsGetPerson.getString("Address1") != null) {
                        strAddress1 = crsGetPerson.getString("Address1").trim();
                    }

                    if (crsGetPerson.getString("Address2") != null) {
                        strAddress2 = crsGetPerson.getString("Address2").trim();
                    }

                    if (crsGetPerson.getString("City") != null) {
                        strCity = crsGetPerson.getString("City").trim();
                    }


                    if (crsGetPerson.getString("State") != null) {
                        strState = crsGetPerson.getString("State").trim();
                    }

                    if (crsGetPerson.getString("Zip") != null) {
                        strZip = crsGetPerson.getString("Zip").trim();
                    }

                    if (crsGetPerson.getString("Country") != null) {
                        strCountry = crsGetPerson.getString("Country").trim();
                    }

                    if (crsGetPerson.getString("Phone") != null) {
                        strPhone = crsGetPerson.getString("Phone").trim();
                    }

                    if (crsGetPerson.getString("Email") != null) {
                        strEmail = crsGetPerson.getString("Email").trim();
                    }

                     if (crsGetPerson.getString("ASSIGNEDNUM") != null) {
                        strASSIGNEDNUM = crsGetPerson.getString("ASSIGNEDNUM").trim();
                    }

                        if (crsGetPerson.getString("ImageSize") != null) {
                        strImageSize = crsGetPerson.getString("ImageSize");

                        in = crsGetPerson.getBinaryStream("ImageDet");
                    }
					   if (crsGetPerson.getString("school") != null) {
                        strSchool = crsGetPerson.getString("school").trim();
                    }
					 if (crsGetPerson.getString("schoolValue") != null) {
                        strSchoolValue = crsGetPerson.getString("schoolValue").trim();
                    }


                    }
                 if(in!=null)
                 {
                   ServletContext sc = this.getServletContext();
                   int len = strImageSize.length();
                   byte [] b = new byte[len];
                   int index = in.read(b, 0, len);
                    OutputStream outImej = new FileOutputStream(sc.getRealPath(File.separator)+"TempFiles"+"/"+strASSIGNEDNUM+".JPG");
                    while (index != -1)
                    {
                        outImej.write(b, 0, index);
                        index = in.read(b, 0, len);

                    }
                    outImej.close();
                    FileInputStream fis=new FileInputStream(sc.getRealPath(File.separator)+"TempFiles"+"/"+strASSIGNEDNUM+".JPG");
                    b= new byte[fis.available()+1];
                    fis.read(b);

                    str="TempFiles"+"/"+strASSIGNEDNUM+".JPG";

                    strSample=strASSIGNEDNUM+".JPG";
                 }
                }
                } catch (Exception e) {
                        System.err.println("Got an exception! ");
                        System.err.println("++frmPerson.jsp+++" + e);
                    }
            }
  %>



               <tr>
                   <td nowrap>ID#</td>
                   <td >
                       <label id="ASSIGNEDNUM" name="ASSIGNEDNUM"  > <%=strASSIGNEDNUM%></label>
                        <img src="Images/Find1.jpg" name="orgSearch" id="orgSearch"  onClick='PersonSearch()' />
                    </td>
              </tr>
            <tr>
                <td nowrap> PERSON TYPE </td>
                 <td colspan="6">
                  <select name="OWNER_TYPE" onchange="FNSchool(this)"  id="OWNER_TYPE"  style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;width:157px;" >
                  <option value=''>Select</option>

                  <%
                        String strSelected_Individual="";
                        String strSelected_Organization="";
                        String strSelected_YouthRider="";
                   
              if(strOWNER_TYPE.equals("INDIVIDUAL"))
                  strSelected_Individual="SELECTED";
                if(strOWNER_TYPE.equals("ORGANIZATION"))
                  strSelected_Organization="SELECTED";
                   else  if(strOWNER_TYPE.equals("YOUTH RIDER"))
                  strSelected_YouthRider="SELECTED";
                 
              %>
                  <option value='INDIVIDUAL' <%=strSelected_Individual%>>INDIVIDUAL</option>
                  <option value='ORGANIZATION' <%=strSelected_Organization%>>ORGANIZATION</option>
                  <option value='YOUTH RIDER' <%=strSelected_YouthRider%>>YOUTH RIDER</option>
                 </select>
                   
                 </td>
				
               
                 <td rowspan="6" >
                     <table border="1" width="100%"  bordercolor="#ffffff" align="center" cellpadding="0" cellspacing="0">
                     <tr >
                         <td >
                            <img src="<%=str%>" width="200" height="130"/>
                              
                        </td>
                     </tr>
                     <tr>
                         <td width="90%">
                             <input type="file" name="upload" id="upload"    onclick="ImageEmpty()" />
                             <input type="hidden" name="upload1" id="upload1" value="<%=strSample%>" />
                          
                         </td>
                    </tr>

                    </table>

                  </td>

                </tr>
            
            <tr>
            <td>NAME(F,L)</td>
            <td>
                <input type="text" name="FIRSTNAME" id="FIRSTNAME" value='<%=strFIRSTNAME%>' onKeyUp="SaveMode()"    style="width:155px;background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;">
            </td>
           
              <input type="hidden" name="MIDNAME" size="8" id="MIDNAME" value='<%=strMIDNAME%>' onKeyUp="SaveMode()"    style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;width:100px;">
           
            <td colspan="5">
              <input type="text" name="LASTNAME" id="LASTNAME" onKeyUp="SaveMode()"  value='<%=strLASTNAME%>'  style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;width:233px;">
            </td>

     </tr>
             <tr>
		
		   
            <td><lable id="ORGNAME"><%if(strOWNER_TYPE.equals("YOUTH RIDER")) 
			{
			out.println("SCHOOL");
			}%><%else
			{%>
			<%out.println("ORG NAME");
			}%>
			
			</lable></td>
			
	<%if(strOWNER_TYPE.equals("YOUTH RIDER"))
	{%>
            <td  colspan="6">
                <input type="text" maxlength="50"  size="58" name="OrganizationName" id="OrganizationName" disabled="disabled"  value="<%=strSchool%>"  <%=strHidden%> style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" />
				<img src="Images/dropdown_icon4.gif" id="image"   onClick="OpenCommonRef1('SCHOOL','OrgSeq','Horsecolor_Lbl','OrganizationName')" />
            </td>
			<td>
                   <input type="Hidden" name="OrgSeq"  id="OrgSeq" value="<%=strSchoolValue%>"  style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"  / >
                   
                     <label id="Horsecolor_Lbl"  style="font-size:9pt;font-weight:bold;text-transform: uppercase;visibility:Hidden;"><%=strSchoolValue%></label> 
                </td> 
	<%}else
			{%>
	<td  colspan="6" >
                <input type="text" maxlength="50"  size="61" name="OrganizationName" id="OrganizationName"  value="<%=strOrganizationName%>"    <%=strHidden%> style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" />
				
            		<img src="Images/dropdown_icon4.gif"  id="image"  style="font-size:9pt;font-weight:bold;text-transform: uppercase;visibility:Hidden;"   onClick="OpenCommonRef1('SCHOOL','OrgSeq','Horsecolor_Lbl','OrganizationName')" />
			</td>
			<td>
                   <input type="Hidden" name="OrgSeq"  id="OrgSeq" value="<%=strSchool%>" style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"   >
                   
                     <label id="Horsecolor_Lbl"  style="font-size:9pt;font-weight:bold;text-transform: uppercase;visibility:Hidden;"><%=strSchoolValue%></label> 
                </td>  
			<%			}%>

        </tr>
           <tr>
                 <tr>
            <td>GENDER</td>
            <td >
              <select name="Gender"  onchange="SaveMode()"  style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;width:157px;" >
                <option value=''>Select</option>
                <%
                    String strSelected_Male="";
                    String strSelected_Female="";
              if(strGender.equals("MALE"))
                  strSelected_Male="SELECTED";
              else  if(strGender.equals("FEMALE"))
                  strSelected_Female="SELECTED";
              %>
                <option value='MALE' <%=strSelected_Male%> >MALE</option>
                <option value='FEMALE'<%=strSelected_Female%>>FEMALE</option>
              </select>        
            </td>
            <td >DOB</td>
            <td colspan="6">
                    <input type="text" id="datepicker_DOB" name="datepicker_DOB" size="10" 
                    value="<%=strdatepicker_DOB%>" placeholder="MM/DD/YYYY" onchange="CheckDate('datepicker_DOB','')"
                    style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;width:126px">
            </td>
        </tr>
        </tr>
        <tr>
            <td>ADDRESS1</td>
            <td colspan="7">
                <input type="text" maxlength="40"  name="Address1" id="Address1" value="<%=strAddress1%>"  style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;width:400px;" />
            </td>
        </tr>
        <tr>
            <td>ADDRESS2</td>
            <td colspan="7">
                <input type="text" maxlength="50"   name="Address2" id="Address2" value="<%=strAddress2%>"  style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;width:400px;" />
            </td>
        </tr>
        <tr>
            <td   >CITY</td>
            <td >
             <!--   <input type="text"   name="City" onblur="CityStateZipDetails('CITY','STATE','ZIP','COUNTRY',CITY.value,'PHONE')"    id="City" size="20" value="<%=strCity%>"  style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" />-->
               <input type="text" class="input_city"   name="CITY"     id="CITY" 
               value="<%=strCity%>"  onkeyup="Empty_CityDetails(this.value,'CITY','STATE','ZIP','COUNTRY')"
               style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;width:136px;"/>
               </td>
            <td> STATE  </td>
            <td >
              <!--  <input type="text" name="State"  onblur="CityStateZipDetails('CITY','STATE','ZIP','COUNTRY',STATE.value,'PHONE')"  maxlength="10" id="State" size="5"  value="<%=strState%>"   style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" />-->
                <input type="text" name="STATE"   maxlength="10" id="STATE" size="5"  value="<%=strState%>"   style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;"/>
            </td>
            <td >ZIP</td>
            <td>
             <!--   <input type="text" maxlength="6" class="input_zip" onblur="CityStateZipDetails('CITY','STATE','ZIP','COUNTRY',ZIP.value,'PHONE')"  name="Zip" id="Zip" size="5" value="<%=strZip%>"   style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" />-->
                 <input type="text" maxlength="6" onchange="CityStateZipDetails('CITY','STATE','ZIP','COUNTRY',ZIP.value,'PHONE')" 
                 name="ZIP" id="ZIP" size="5" value="<%=strZip%>" onkeyup="Empty_CityDetails(this.value,'CITY','STATE','ZIP','COUNTRY')"  
                 style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;" />
            </td>
            <td>COUNTRY </td>
            <td>
              <!--  <input type="text" name="Country"  size="7" value="<%=strCountry%>" id="Country"    style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000; width:60px; "  />-->
                 <input type="text" name="COUNTRY"  value="<%=strCountry%>" id="COUNTRY"    style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000; width:82px; "  />
            </td>
        </tr>
        <tr>
            <td>PHONE</td>
            <td >
               <!-- <input type="text" maxlength="11"  value="<%=strPhone%>" size="20" name="Phone" id="Phone"   style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;"  />-->
                 <input type="text" maxlength="100"  value="<%=strPhone%>" name="PHONE" id="PHONE"   
                 style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;width:155px;"  />
            </td>
            <td>EMAIL</td>
            <td colspan="5">
                <input type="text"  value="<%=strEmail%>"  size="50" name="Email" id="Email"   style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;width:305px" />
            </td>
        </tr>
         <input type="hidden" name="PAGEID" id="PAGEID" value="Person" />
          <input type="hidden"  size="4" name="HDNENTITYSEQ" id="HDNENTITYSEQ" value="<%=strEntitySeq%>"  />
      </table>
         </fieldset>
   <div align="center">
       <table class="altRow1" >
            <tr>
                <td>
					<%--

					if(crsGetUserAccess.size()>0)
					{
					String [] ScreenList = (String[])ArScreenName.toArray(new String[ArScreenName.size()]);
					String [] ScreenStatus = (String[])Screen_InsUpd.toArray(new String[Screen_InsUpd.size()]);

					for(int i=0;i<ScreenList.length;i++)
					{
					if( ScreenList[i].equalsIgnoreCase("PERSONS") && ScreenStatus[i].equalsIgnoreCase("InsUpd") )
					{

					--%>
                    <input type="button" id="Save" class="button" value="Save" onclick="Save_Person()"/>   
                    <input type="button" class="button" id="BtnMemberShip"  value="Membership" 
                    onclick="Ajax_CheckMember('<%=strASSIGNEDNUM%>','button','<%=strEntitySeq%>')"/>
					<%--}}}--%>
					<input type="button" class="button" id="BtnReset"  value="Reset" onclick="Reset_Person()"/>
                    <input type="button" class="button" id="Previous_person" value="&laquo;"
                    <%if(strEntitySeq!=0){%>
                    onclick="Person_BottomNavigation('Person_Observations.jsp?Mode=1&Enty=<%=strEntitySeq%>')"
                    <%}else{%>
                    onclick="Person_BottomNavigation('Person_Observations.jsp')"
                    <%}%> />
                    <input type="button" class="button" id="Next_person" value="&raquo;" 
                    onclick="Ajax_CheckMember('<%=strASSIGNEDNUM%>','button_Next','<%=strEntitySeq%>')"/>
                </td>
            </tr>
        </table><input type="hidden" name="SavedYN" id="SavedYN" value="Y"/>
        </div>
        <br/>
      </div>


    <div id="sidebar">
        <%@ include file="Person_Side.jsp"%>
    </div>

    <div id="footer_Bot" align="bottom">
    <jsp:include page="/frmBottom_Registration.jsp"/>
    </div>
    <div id="dialog-Reg" title="Search Registration" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  src="regsearchpopup.jsp"  id="modalIFrame_Show" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="no">
        </iframe>
    </div>

    

    <div id="dialog-Calculator" style="display:none; background:url('Images/trans-wood-1.png')" >
        <iframe src="frmCalculator.jsp" id="modalIFrame_Calculator" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" >
        </iframe>
    </div>
	<div id="dialog-CmmnRef" style="display:none; background:url('Images/trans-wood-1.png')" >
        <iframe id="modalIFrame_CmmnRef" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" >
        </iframe>
    </div>

   </form>

</body>
</html>
