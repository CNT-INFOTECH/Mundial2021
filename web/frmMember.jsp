
<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display" %>

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
<title>MEMBER REGISTRATION</title>
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
        <script type="text/javascript" src="jscRegistration.js"></script>
        <script type="text/javascript" src="jscReg_AutoComplete.js"></script>
         
        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="themes/base/jquery.ui.all.css"/>
        <link href="Registration.css" rel="stylesheet" type="text/css" />
        <link href="style.css" rel="stylesheet" type="text/css" />
        <link href="buttons.css" rel="stylesheet" type="text/css" />

         <script type="text/javascript" src="jscIndex.js"></script>
         <script type="text/javascript" src="jscPerson.js"></script>
         
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/interface.js"></script>
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
<form name="frmMember"  enctype="multipart/form-data"  method="post" >
<%
    String strMode = "";
    String EntitySeq = "";

    if (request.getParameter("Mode") != null) {
    strMode = request.getParameter("Mode");
    } else {
    strMode = "";
    }

    

    Calendar c = Calendar.getInstance();
    int day = c.get(Calendar.DATE);
    int mon = c.get(Calendar.MONTH);
    int month = mon + 1;
    int year = c.get(Calendar.YEAR);
    String date = day + "" + month + "" + year;
    //int date = day+month+year;

    int hr = c.get(Calendar.HOUR);
    int mn = c.get(Calendar.MINUTE);
    int sec = c.get(Calendar.SECOND);
    String time = hr + "" + mn + "" + sec;
    String CurrentDate="";

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
        <legend>Member Details</legend>
        <table class="altRow1" width="70%">

<%

    String strOWNER_TYPE ="";
    String strFIRSTNAME ="";
    String strLASTNAME ="";
    String strOrganizationName ="";
    String strGender ="";
    String strdatepicker_DOB ="";
    String strAddress1 ="";
    String strAddress2 ="";
    String strCity ="";
    String strState ="";
    String strZip ="";
    String strCountry ="";
    String strPhone ="";
    String strEmail ="";
    String strASSIGNEDNUM ="";
    String strEntitySeq="";
    String strpath="";

    String strImageSize="";
    InputStream in = null;
    String str="";
    String strIndividual="";
    String strSample="";

    String strMembernum="";
    String strMembership="";
    String strMembetype="";
    String strstatus="";
    String strjoingdate="";
    String strPaymentdate="";
    String AMOUNTPAID="";

    String strBALANCE="";
    String strDUEDATE="";
    strjoingdate= month +"/"+day +"/"+ year;

    String ent="";
    
    if(request.getParameter("ent")!=null )
        ent=request.getParameter("ent");
    
    
    if(request.getParameter("MEMBER_TYPE")!=null )
        strMembetype=request.getParameter("MEMBER_TYPE");

    if(request.getParameter("STATUS")!=null )
        strstatus=request.getParameter("STATUS");

    if(request.getParameter("Joiningdate")!=null )
        strjoingdate=request.getParameter("Joiningdate");

    if(request.getParameter("Membership")!=null )
        strMembership=request.getParameter("Membership");

    if(request.getParameter("HDNPerson_Type")!=null )
        strOWNER_TYPE=request.getParameter("HDNPerson_Type");

    if(request.getParameter("FIRSTNAME")!=null )
        strFIRSTNAME=request.getParameter("FIRSTNAME");

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

    if(request.getParameter("ASSIGNED_NUM")!=null )
        strASSIGNEDNUM=request.getParameter("ASSIGNED_NUM");
    
    if(request.getParameter("BalanceAmount")!=null )
        strBALANCE=request.getParameter("BalanceAmount");
    
    if(request.getParameter("duedate")!=null )
        strDUEDATE=request.getParameter("duedate");
    
    if(request.getParameter("HDNENTITYSEQ")!=null )
        EntitySeq=request.getParameter("HDNENTITYSEQ");

    RowSetFactory factorycrsGetMember = RowSetProvider.newFactory();
CachedRowSet crsGetMember = factorycrsGetMember.createCachedRowSet();

    if (strMode.equals("1")) {
        
        if (request.getParameter("Assigned") != null) {
        EntitySeq = request.getParameter("Assigned");
        } else {
        EntitySeq = "";
        }
        
    try {
        GeneralServlet genn = new GeneralServlet();
        if (EntitySeq.length() > 0 && EntitySeq!=null) 
        crsGetMember = genn.get_memberDetails(EntitySeq);
        
        while (crsGetMember.next()) {
            strOWNER_TYPE = "";
            strFIRSTNAME = "";
            strLASTNAME = "";
            strOrganizationName = "";
            strGender = "";
            strdatepicker_DOB = "";
            strAddress1 = "";
            strAddress2 = "";
            strCity = "";
            strState = "";
            strZip = "";
            strCountry = "";
            strPhone = "";
            strEmail = "";
            strASSIGNEDNUM = "";
            strMembernum = "";
            EntitySeq = "";
            strImageSize = "";
            strSample = "";

            strMembership = "";
            strMembetype = "";
            strstatus = "";
            strjoingdate = "";
            strPaymentdate = "";
            ent="";
            if (crsGetMember.getString("STATUS") != null) {
            strstatus = crsGetMember.getString("STATUS").trim();
            }

            if (crsGetMember.getString("ENTITYSEQ") != null) {
            //strEntitySeq = Integer.parseInt(crsGetMember.getString("ENTITYSEQ").trim());
            EntitySeq = crsGetMember.getString("ENTITYSEQ").trim();                
            }

            if (crsGetMember.getString("OWNER_TYPE") != null) {
            strOWNER_TYPE = crsGetMember.getString("OWNER_TYPE").trim();
            }

            if (crsGetMember.getString("FIRSTNAME") != null) {
            strFIRSTNAME = crsGetMember.getString("FIRSTNAME").trim();
            }

            if (crsGetMember.getString("ORGANIZATION_NAME") != null) {
            strOrganizationName = crsGetMember.getString("ORGANIZATION_NAME").trim();
            }

            if (crsGetMember.getString("LastName") != null) {
            strLASTNAME = crsGetMember.getString("LastName").trim();
            }

            if (crsGetMember.getString("Gender") != null) {
            strGender = crsGetMember.getString("Gender").trim();
            }

            if (crsGetMember.getString("MEMBER_DOB") != null) {
            strdatepicker_DOB = crsGetMember.getString("MEMBER_DOB").trim();
            }

            if (crsGetMember.getString("Address1") != null) {
            strAddress1 = crsGetMember.getString("Address1").trim();
            }

            if (crsGetMember.getString("Address2") != null) {
            strAddress2 = crsGetMember.getString("Address2").trim();
            }

            if (crsGetMember.getString("City") != null) {
            strCity = crsGetMember.getString("City").trim();
            }

            if (crsGetMember.getString("State") != null) {
            strState = crsGetMember.getString("State").trim();
            }

            if (crsGetMember.getString("Zip") != null) {
            strZip = crsGetMember.getString("Zip").trim();
            }

            if (crsGetMember.getString("Country") != null) {
            strCountry = crsGetMember.getString("Country").trim();
            }

            if (crsGetMember.getString("Phone") != null) {
            strPhone = crsGetMember.getString("Phone").trim();
            }

            if (crsGetMember.getString("Email") != null) {
            strEmail = crsGetMember.getString("Email").trim();
            }

            if (crsGetMember.getString("ASSIGNEDNUM") != null) {
            strASSIGNEDNUM = crsGetMember.getString("ASSIGNEDNUM").trim();
            }

            if (crsGetMember.getString("MEMBER_NUM") != null) {
            strMembernum = crsGetMember.getString("MEMBER_NUM").trim();
            }

            if (crsGetMember.getString("MemberType") != null) {
            strMembetype = crsGetMember.getString("MemberType").trim();
            }
            if (crsGetMember.getString("JoiningDate") != null) {
            strjoingdate = crsGetMember.getString("JoiningDate").trim();
            }

            /*if (crsGetMember.getString("PaymentDate") != null) {
            strPaymentdate = crsGetMember.getString("PaymentDate").trim();
            }*/
            if (crsGetMember.getString("MembershipFees") != null) {
            strMembership = crsGetMember.getString("MembershipFees").trim();//+"$";
            }

            if (crsGetMember.getString("ImageSize") != null) {
            strImageSize = crsGetMember.getString("ImageSize");
            }

            if (crsGetMember.getString("ImageDet") != null) {
            in = crsGetMember.getBinaryStream("ImageDet");
            }

            if (in != null) {

            ServletContext sc = this.getServletContext();
            int len = strImageSize.length();
            byte[] b = new byte[len];
            int index = in.read(b, 0, len);
            OutputStream outImej = new FileOutputStream(sc.getRealPath(File.separator) + "TempFiles" + "/" + strASSIGNEDNUM + ".JPG");
            while (index != -1) {
            outImej.write(b, 0, index);
            index = in.read(b, 0, len);

            }
            outImej.close();
            FileInputStream fis = new FileInputStream(sc.getRealPath(File.separator) + "TempFiles" + "/" + strASSIGNEDNUM + ".JPG");
            b = new byte[fis.available() + 1];
            fis.read(b);

            str = "TempFiles" + "/" + strASSIGNEDNUM + ".JPG";

            strSample = strASSIGNEDNUM + ".JPG";
            }
        }               

    } 
    catch (Exception e) {
        System.err.println("Got an exception! ");
        System.err.println("++frmMember.jsp1+++" + e);
    }

    RowSetFactory factory = RowSetProvider.newFactory();
CachedRowSet crsGetMemberBalanceamount = factory.createCachedRowSet();    
    if(EntitySeq.length()>0)
    try {
        GeneralServlet genn = new GeneralServlet();

        crsGetMemberBalanceamount = genn.GET_MEMBERAMOUNT(EntitySeq);

        while (crsGetMemberBalanceamount.next()) {

        strBALANCE = "";
        strDUEDATE = "";

        if (crsGetMemberBalanceamount.getString("BALANCEAMOUNT") != null) {
        strBALANCE = crsGetMemberBalanceamount.getString("BALANCEAMOUNT").trim()+"$";
        }

        if (crsGetMemberBalanceamount.getString("DUEDATE") != null) {
        strDUEDATE = crsGetMemberBalanceamount.getString("DUEDATE").trim();
        }
        }
    } 
    catch (Exception e) {
        System.err.println("Got an exception! ");
        System.err.println("++frmMember.jsp2+++" + e);
    }
    }    
    else if(strMode.equals("2"))
    {
        if (request.getParameter("Assigned") != null) {
        EntitySeq = request.getParameter("Assigned");
        } else {
        EntitySeq = "";
        }
        try
        {
            GeneralServlet genn = new GeneralServlet();
            RowSetFactory factory = RowSetProvider.newFactory();
CachedRowSet crsGetPerson = factory.createCachedRowSet();
            
            if (EntitySeq.length() > 0 && EntitySeq!=null)
            crsGetPerson = genn.get_InsUpdRider(EntitySeq);


            while (crsGetPerson.next())
            {

                strOWNER_TYPE = "";
                strFIRSTNAME = "";
                strLASTNAME = "";
                strOrganizationName = "";
                strGender = "";
                strdatepicker_DOB = "";
                strAddress1 = "";
                strAddress2 = "";
                strCity = "";
                strState = "";
                strZip = "";
                strCountry = "";
                strPhone = "";
                strEmail = "";
                strASSIGNEDNUM = "";
                EntitySeq="";
                strImageSize="";
                strSample="";

                if (crsGetPerson.getString("OWNER_TYPE") != null) {
                    strOWNER_TYPE = crsGetPerson.getString("OWNER_TYPE").trim();                           
                }

                if (crsGetPerson.getString("ENTITYSEQ") != null) {
                    EntitySeq = crsGetPerson.getString("ENTITYSEQ").trim();

                }

                if (crsGetPerson.getString("FIRSTNAME") != null) {
                    strFIRSTNAME = crsGetPerson.getString("FIRSTNAME").trim();
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

        } catch (Exception e) {
            System.err.println("Got an exception! ");
            System.err.println("++frmMember.jsp?Mode=2+++" + e);
        }
    }
    
%>
            <tr>
                <td nowrap>ID#</td>
                <td>
                     <label id="ASSIGNEDNUM"> <%=strMembernum%></label>                     
                     <input type="hidden" id="HDNPerson_Type" name=="HDNPerson_Type" value="<%=strOWNER_TYPE%>" />
                      <img src="Images/Find1.jpg" name="orgSearch" id="orgSearch"  onClick='MemberSearch()' />
                </td>
                <td>
                 STATUS
                </td>
                <td>
                    <select name="STATUS" id="STATUS" style="background-color:  #FFF8DC; border:  1px solid #000000;
                    text-transform: uppercase;width:140px;" >
                    <!--<option value=''>Select</option>-->
                    <%
                        if(strstatus!=null)
                        {
                    %>
                    <option
                    <%
                        if (strstatus.trim().equals("ACTIVE")) {
                    %> selected <%}%> >ACTIVE </option>
                    <option
                    <% 
                        if (strstatus.trim().equals("INACTIVE")) {
                    %> selected <%}%> >INACTIVE</option>

                    <option
                    <% 
                        if (strstatus.trim().equals("DELINQUENT")) {
                    %> selected <%}%> >DELINQUENT</option>
                    </select>
                    <%}%>
               </td>
               <td rowspan="7" colspan="2" >
                 <table border="1" width="100%"  bordercolor="#ffffff" align="center" cellpadding="0" cellspacing="0">
                     <tr >
                         <td >
                            <img src="<%=str%>" width="200" height="130"/>
                        </td>
                     </tr>
                     <tr>
                         <td>
                             <input type="file" name="upload" id="upload"  size="10"  onclick="ImageEmpty()"/>
                             <input type="hidden" name="upload1" id="upload1" value="<%=strSample%>" />
                         </td>
                    </tr>
                 </table>
               </td>
            </tr>
            <tr>
                 <td nowrap> MEMBER TYPE </td>
                <td colspan="1" >
                    <select name="MEMBER_TYPE" onchange="GenerateMemberShipFees('MEMBER_TYPE')" id="MEMBER_TYPE" 
                    style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;
                    width:153px;" >
                    <option value=''>Select</option>

                    <%
                    if(strMembetype!=null)
                    {
                    %>
                    <option
                    <%
                    if (strMembetype.trim().equalsIgnoreCase("Fundador")) {
                    %> selected <%}%> >Fundador</option>
                    <option
                    <% if (strMembetype.trim().equalsIgnoreCase("Regular")) {
                    %> selected <%}%> >Regular</option>

                    </select>
                    <%}%>

                </td>
                <td nowrap>JOINING DATE</td>
                <td>
                    <input type="text" id="Joiningdate"  placeholder="MM/DD/YYYY" name="Joiningdate" 
                    value="<%=strjoingdate%>" onchange="CheckDate('Joiningdate','')"
                    style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;
                    width:140px;">
                </td>
              </tr>
            <tr>
            <td>NAME(F,L)</td>
            <td>
                <input type="text" name="FIRSTNAME" id="FIRSTNAME" value='<%=strFIRSTNAME%>'   
                style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;width:153px;">
            </td>                               

            <td colspan="7">
              <input type="text" name="LASTNAME" id="LASTNAME"  value='<%=strLASTNAME%>'  
              style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;width:223px;">
            </td>            
         </tr>         
         <tr>
            <td>ORG NAME</td>
            <td  colspan="7">
                <input type="text" maxlength="50"  name="OrganizationName" id="OrganizationName" 
                value="<%=strOrganizationName%>"  
                style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;width:385px;" />
            </td>
        </tr>
        <tr>
            <td>GENDER</td>
            <td >
                <select name="Gender"  style="background-color:  #FFF8DC; border:  1px solid #000000;
                text-transform: uppercase;width:153px;" id="Gender" >
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
                    <input type="text" id="datepicker_DOB"  placeholder="MM/DD/YYYY" name="datepicker_DOB" 
                    size="10" value="<%=strdatepicker_DOB%>" style="background-color:  #FFF8DC; 
                    border:  1px solid #000000;text-transform: uppercase;width:140px;"
                    onchange="CheckDate('datepicker_DOB','')">
                    </td>
                </tr>
            
              <tr>
            <td>ADDRESS1</td>
            <td colspan="6">
                <input type="text" maxlength="40"  size="70" name="Address1" id="Address1" 
                value="<%=strAddress1%>"  style="text-transform: uppercase;background-color:  #FFF8DC; 
                border:  1px solid #000000;width:385px;" />
            </td>
        </tr>
        <tr>
            <td>ADDRESS2</td>
            <td colspan="6">
                <input type="text" maxlength="50"  size="70" name="Address2" id="Address2" 
                value="<%=strAddress2%>"  style="text-transform: uppercase;background-color:  #FFF8DC; 
                border:  1px solid #000000;width:385px" />
            </td>
        </tr>
        <tr>
            <td >CITY</td>
            <td >
                <input type="text" class="input_city"   name="CITY" id="CITY" size="12" value="<%=strCity%>"  
                onkeyup="Empty_CityDetails(this.value,'CITY','STATE','ZIP','COUNTRY')"
                style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;"/>
               </td>
            <td> STATE</td>
            <td >
               <input type="text" name="STATE" maxlength="10" id="STATE" size="5"  value="<%=strState%>"   
               style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;width:100px"/>
                ZIP
            </td>           
            <td nowrap>
                <input type="text" maxlength="6"  onblur="CityStateZipDetails('CITY','STATE','ZIP','COUNTRY',ZIP.value,'PHONE')"  
                name="ZIP" id="ZIP" size="5" value="<%=strZip%>"   
                onkeyup="Empty_CityDetails(this.value,'CITY','STATE','ZIP','COUNTRY')"
                style="text-transform:uppercase;background-color:#FFF8DC;border:1px solid #000000;width:60px" />
                COUNTRY 
            </td>
            <td>
                <input type="text" name="COUNTRY"  value="<%=strCountry%>" id="COUNTRY"    
                style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000; 
                width:86px; " />
            </td>
        </tr>
        <tr>
            <td>PHONE</td>
            <td >
                <input type="text" maxlength="100"  value="<%=strPhone%>" size="20" name="PHONE" id="PHONE"   
                style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;"  />
            </td>
            <td>EMAIL</td>
            <td colspan="5">
                <input type="text"  value="<%=strEmail%>"  size="50" name="Email" id="Email"   
                style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;width:395px" />
            </td>
        </tr>
        <tr>
            <td nowrap >MEMBERSHIP FEES</td>
            <td >
                <input type="text"  value="<%=strMembership%>"  size="20" name="Membership" id="Membership"  
                style="text-transform: uppercase;background-color:  #FFF8DC; 
                border:  1px solid #000000;" />
                    
            </td>  
            <td nowrap>
                 BALANCE DUE               
            </td>
            <td nowrap>
                <input type="text"  value="<%=strBALANCE%>"  size="20" name="BalanceAmount" readonly 
                id="BalanceAmount"   style="text-transform: uppercase;background-color:  #FFF8DC; 
                border:  1px solid #000000;width:100px" />
                DUE DATE
            </td>
           <td >
                <input type="text" id="duedate" value="<%=strDUEDATE%>" placeholder="MM/DD/YYYY" name="duedate" 
                size="10" readonly value="" style="background-color:  #FFF8DC; border:  1px solid #000000;
                text-transform: uppercase;width:100px">                
            </td>
        </tr>
           <input type="hidden" name="PAGEID" id="PAGEID" value="Member" />
           <input type="hidden"  size="4" name="HDNENTITYSEQ" id="HDNENTITYSEQ" value="<%=EntitySeq%>"  />           
           <input type="hidden"  size="4" name="ASSIGNED_NUM" id="ASSIGNED_NUM" value="<%=strASSIGNEDNUM%>" />
           <input type="hidden"  size="4" name="MemberNum" id="MemberNum" value="<%=strMembernum%>" />

      </table>
                   <input type="hidden" name="SavedYN" id="SavedYN" value="Y" />
      </fieldset>
         
      <div align="center">
           <table class="altRow1" >
                <tr>
                    <td>
                       <!-- <input type="button" id="Horses Owned" class="button" value="Horses Owned" onclick="HorsesOwned('<%=EntitySeq%>','<%=strMembernum%>')" />-->
                        <input type="button" id="Member_MakePayment" class="button" value="Make Payment" onclick="Member_MakePayments('<%=EntitySeq%>','<%=strMembernum%>')" />
                        <input type="button" id="Payment History" class="button" value="Payment History" onclick="PaymentHistory('<%=EntitySeq%>','<%=strMembernum%>')"/>
                        <input type="button" id="Save" class="button" value="Save" onclick="Save_Member()"/>
                        <input type="button" class="button" id="BtnReset"  value="Reset" onclick="Reset_Member()"/>
                        <input type="button" id="Previous_Member" class="button" value="&laquo;"                         
                        <%if(EntitySeq.length()>0){%>
                        onclick="Person_BottomNavigation('frmPerson.jsp?Mode=2&Assigned=<%=EntitySeq%>')"
                        <%}else{%>
                        onclick="Person_BottomNavigation('frmPerson.jsp')"
                        <%}%> />
                        <input type="button" id="Next_Member" class="button" value="&raquo;" 
                        <%if(EntitySeq.length()>0){%>
                        onclick="Person_BottomNavigation('Person_ShowHistory.jsp?Mode=1&Enty=<%=EntitySeq%>')"
                        <%}else{%>
                        onclick="Person_BottomNavigation('Person_ShowHistory.jsp')" 
                        <%}%> />
                    </td>
                </tr>

            </table>
        </div>
        <br/>
      </div>
    <div id="sidebar">
        <%@ include file="Member_Side.jsp"%>
    </div>

                    <div id="footer_Bot" align="bottom">    
    <jsp:include page="/frmBottom_Registration.jsp"/>
    </div>

    
    <div id="dialog-HorsesOwned" title="HORSES OWNED" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  id="modalIFrame_HorsesOwned" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes">
        </iframe>
    </div>
    <div id="dialog-MakePayment" title="MAKE PAYMENT" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  id="modalIFrame_MakePayment" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="no">
        </iframe>
    </div>
    <div id="dialog-PaymentHistoryPopUp" title="PAYMENT HISTORY" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  id="modalIFrame_PaymentHistoryPopUp" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes">
        </iframe>
    </div>
   </form>

</body>
</html>