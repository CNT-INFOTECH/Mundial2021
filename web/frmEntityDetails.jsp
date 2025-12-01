<%--
    Document   : frmRegister
    Created on : May 26, 2011, 11:11:45 PM
    Author     : CNT
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="beans.PersonBean" %>
<jsp:useBean id="personbean" class="beans.PersonBean" scope="session" />
<html>
     <title>PASO TRACKER</title>
        <head>

        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
        <link href="buttons.css" rel="stylesheet" type="text/css" />


 <link href="Shows.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript" src="scripts/SRegistraion.js"></script>
 </head>
	<body>
	<form name="frmRider">

            <%

                String strType="";
                String strReturn="";
                String strNum="";

                 if(request.getParameter("Type")!=null)
                    strType=request.getParameter("Type");

                if(request.getParameter("Num")!=null)
                    strNum=request.getParameter("Num");

                if(strType.equals("1"))
                    strReturn="SetOwner";
                else if(strType.equals("2"))
                    strReturn="SetBreeder";
                else if(strType.equals("3"))
                    strReturn="SetRider";

                System.out.println(strReturn);
        %>
  
 <%@ include file="frmRiderInclude.jsp"%>
 
  <table class="altRow">
       <th colspan="9" class="Grid_Header" > </th>
      <tr>
            <td nowrap>ASSIGNED NO.</td>

            <td  colspan="6"><font size="4" color="BLUE">
           <%= strAssignedNum.trim()%>
            </font>
            </td>

      </tr>
     <tr>
           
            <td nowrap>PERSON TYPE</td>

            <td colspan="6">
                <select name="Person_Type" id="Person_Type" style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;width:153px;"  >
                <option value=''>Select</option>
                <% String[] strGendOption={"INDIVIDUAL","ORGANIZATION"};
                for(int gen=0;gen <strGendOption.length;gen++)
                {
                    if(strGendOption[gen].equalsIgnoreCase(strOwnerType))
                        { %>
                        <option selected><%=strGendOption[gen]%></option>
                        <% }
                        else{%>
                        <option><%=strGendOption[gen]%></option>
                            <%}
                }%>
               
                </select>
            </td>
        </tr>
    <tr>
    <tr>
        <td >ORG NAME</td>
        <td colspan="6">
            <input type="text" size="69"  name="Org_Name" id="Org_Name"   value="<%= strOrgName.trim()%>"
            style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;"  />
           </td>
    </tr> 
      <td width="78"><font class="label">NAME(F,M,L)</font></td>
      <td colspan="2">
        <input type="text" size="32" maxlength="80" name="BreederFName"
          class="allcaps"
          value="<%= strFirstName.trim()%>" />
      </td>
      
      <td colspan="4">

        <input type="hidden" size="4"  name="BreederMName"
               class="allcaps"
                value="<%= strMidName.trim()%>" />

        <input type="text" size="30" maxlength="70" name="BreederLName"
               class="allcaps"
               value="<%= strLastName.trim()%>" />
      </td>
    </tr>
    <tr>
      <td width="78"><font class="label">ADDRESS1</font></td>
      <td  colspan="6">
        <input type="text" maxlength="50"size="55" name="ADDRESS1" id="ADDRESS1"
              class="allcaps"
                value="<%= strAddress1.trim()%>" />
      </td>
    </tr>
    <tr>
      <td width="78"  ><font class="label">ADDRESS2</font></td>
      <td colspan="6">
        <input type="text" maxlength="50" size="55" name="ADDRESS2" id="ADDRESS2"
               class="allcaps"
               value="<%= strAddress2.trim()%>"/>
      </td>
    </tr>
    <tr align="left">
      <td  width="78" align="left" ><font class="label">CITY</font></td>
      <td width="146" >
        <input type="text"  name="CITY"  maxlength="20" size="13"  id="CITY"
               class="allcaps"
                value="<%= strCity.trim()%>"
                onChange="CityStateZipDetails('CITY','STATE','ZIP','COUNTRY',CITY.value,'CITY')"/>
        <font class="label">STATE</font></td>
      <td width="70">
        <input type="text" name="STATE" maxlength="10" size="7" id="STATE"
                class="allcaps"
               value="<%= strState.trim()%>"
               onChange="CityStateZipDetails('CITY','STATE','ZIP','COUNTRY',STATE.value,'STATE')"/>
      </td>
      <td   width="64" ><font class="label">ZIP</font>
      <td   width="75" >
        <input type="text" maxlength="6" name="ZIP" id="ZIP" size="5"
               style="background-color:  #FFF8DC; border:  1px solid #000000;"
               value="<%= strZip.trim()%>"
               onChange="CityStateZipDetails('CITY','STATE','ZIP','COUNTRY',ZIP.value,'ZIP')" />


      <td   width="100" ><font class="label">COUNTRY</font>
      <td width="148">
        <input type="text" name="COUNTRY" size="5"  id="COUNTRY"
                class="allcaps"
                value="<%= strCountry.trim()%>"/>
      </td>
    </tr>
    <tr>
      <td width="78"><font class="label">PHONE</font></td>
      <td width="146" >
        <input type="text" maxlength="20"  size="20" name="PHONE" id="PHONE"
               style="background-color:  #FFF8DC; border:  1px solid #000000;"
               value="<%= strPhone.trim()%>" />
      </td>
     <td><font class="label">EMAIL</font></td>
            <td colspan="4">
                <input type="text"  size="37" name="EMAIL" id="EMAIL"   value="<%=strEmail%>"
                       style="text-transform: uppercase;background-color:  #FFF8DC; border:  1px solid #000000;"  />


         <input type="hidden" name="txtGender"/>
        <input type="hidden" size="10" maxlength="10" name="txtDOB"/>
        </td> 
    </tr>
    <tr>
      <td colspan="7" align="center">
        <input type="button" id="SaveOwner" class="button" value="Save" onclick="SaveRider()" />
        <input type="button" id="CancelOwner" class="button" value="Close" onclick="<%=strReturn%>('<%=strEntitySeq%>','<%=strCompleteName%>','<%=strNum%>','<%=strAssignedNum%>')"/>
        <input type="button" id="Reset" class="button" value="Reset" onclick="ResetPerson_EntityDetails('<%=strType%>','<%=strNum%>')"/>
        <input type="button" id="Print" class="button" value="Print" onclick="PrintPerson()"/>
        <input type="button" id="Back" class="button" value="Back" onclick="GoBack()"/>

        <input type="hidden" name="Type"  value="<%=strType%>" />
        <input type="hidden" name="Num"   value="<%=strNum%>" />

             
        <input type="hidden" value="PERSON" name="PageID"/>
        <input type="hidden" name="HdnEntitySeq" id="HdnEntitySeq" value="<%=strEntitySeq%>"
                 >


       
      </td>
    </tr>
  </table>

<%@ include file="frmBottom_Registration.jsp"%>
        </form>
    </body>
</html>
