<%-- 
    Document   : Person_CommonTopDemographics
    Created on : Feb 23, 2016, 2:00:33 PM
    Author     : cntuser
--%>


<%@page import="javax.sql.rowset.CachedRowSet"%>
<%@page import="javax.sql.rowset.RowSetProvider"%>
<%@page import="javax.sql.rowset.RowSetFactory"%>
<%
String strMode="";
String EntitySeq="";
String Srch="";

if(request.getParameter("Mode")!=null)
strMode=request.getParameter("Mode");

if(request.getParameter("Enty")!=null)
EntitySeq=request.getParameter("Enty");

if(request.getParameter("Srch")!=null)
Srch=request.getParameter("Srch");


String strOWNER_TYPE = "";
String strOwnerName = "";
String strGender = "";
String strDOB = "";
String strASSIGNEDNUM = "";
String strAge="";
String strMonth="";
String strDays="";
String strMemberNum="";
String OrgName="";
String Age_Years="";

if(strMode.equals("1"))
{
    RowSetFactory factory45 = RowSetProvider.newFactory();
   CachedRowSet crsGetPerson= factory45.createCachedRowSet();
   // CachedRowSetImpl crsGetPerson = new CachedRowSetImpl();
    GeneralServlet genn = new GeneralServlet();
    if(EntitySeq.length()>0)
    crsGetPerson = genn.get_InsUpdRider(EntitySeq);
    while (crsGetPerson.next())
    {
        if (crsGetPerson.getString("OWNER_TYPE") != null) {
            strOWNER_TYPE = crsGetPerson.getString("OWNER_TYPE").trim();
        }
        else
            strOWNER_TYPE = "";
        
        if (crsGetPerson.getString("ENTITYSEQ") != null) {
            EntitySeq = crsGetPerson.getString("ENTITYSEQ").trim();
        }
        else
            EntitySeq = "";
        
        if (crsGetPerson.getString("NAME") != null) {
            strOwnerName = crsGetPerson.getString("NAME").trim();
        }
        else
            strOwnerName = "";
        
        if (crsGetPerson.getString("Gender") != null) {
            strGender = crsGetPerson.getString("Gender").trim();
        }
        else
            strGender = "";
        
        if (crsGetPerson.getString("DOB") != null) {
            strDOB = crsGetPerson.getString("DOB").trim();
        }
        else
            strDOB = "";
        
        if (crsGetPerson.getString("ASSIGNEDNUM") != null) {
            strASSIGNEDNUM = crsGetPerson.getString("ASSIGNEDNUM").trim();
        }
        else
            strASSIGNEDNUM = "";
        
        if (crsGetPerson.getString("MEMBER_NUM") != null) {
            strMemberNum = crsGetPerson.getString("MEMBER_NUM").trim();
        }
        else
            strMemberNum = "";
        
        if (crsGetPerson.getString("MONTH") != null) {
            strMonth = crsGetPerson.getString("MONTH").trim()+"M ";
        }
        else
            strMonth = "";
        
        if (crsGetPerson.getString("DAYS") != null) {
            strDays = crsGetPerson.getString("DAYS").trim()+"D";
        }
        else
            strDays = "";
        
        strAge=strMonth+strDays;  
        
        if (crsGetPerson.getString("AGEINYEARS") != null) {
            Age_Years = crsGetPerson.getString("AGEINYEARS").trim()+" YEARS";
        }
        else
            Age_Years = "";
        
        
        /*****************if owner type is org we are emptying gender,age,dob */
        if (crsGetPerson.getString("ORGANIZATION_NAME") != null) {
            OrgName = crsGetPerson.getString("ORGANIZATION_NAME").trim();
        }
        else
            OrgName = "";
        
        if((strOWNER_TYPE.equals("ORGANIZATION")||strOWNER_TYPE.equals("ORGANISATION")||strOWNER_TYPE.equals("O")
               || strOWNER_TYPE.equals("")) && !OrgName.equals("")) 
        {
            Age_Years = "";    
            strDOB = "";
            strGender = "";            
        }
        if(strOWNER_TYPE.equals("")&& !OrgName.equals(""))
            strOWNER_TYPE = "ORGANIZATION";
    }
}
String FontColor="";

if(strOWNER_TYPE.equals("INDIVIDUAL")||strOWNER_TYPE.equals("I"))
{
FontColor="blue";
}
else if(strOWNER_TYPE.equals("ORGANIZATION")||strOWNER_TYPE.equals("ORGANISATION")||strOWNER_TYPE.equals("O"))
{
FontColor="red";
}

if(strMode.equals("2"))
{
    EntitySeq = "";
    OrgName="";
    strOWNER_TYPE = "";
    strOwnerName = "";
    strGender = "";
    strDOB = "";
    strASSIGNEDNUM = "";
    strAge="";
    strMonth="";
    strDays="";
    Age_Years="";
    strMemberNum="";
}

String strEventFrom="";
String strYear="";
String strEventTo="";
if(request.getParameter("TxtShowYear")!=null)
    strYear=request.getParameter("TxtShowYear");

if(request.getParameter("TxtEventFrom")!=null)
    strEventFrom=request.getParameter("TxtEventFrom");

if(request.getParameter("TxtEventTo")!=null)
    strEventTo=request.getParameter("TxtEventTo");
%>

		
        
        
      <table class="altRow" width="100%">
        <tr> 
          <td width="44" style="font-weight:bold;">NAME:</td>
          <td colspan="5" > 
            <label  id="LblOwnerName"  style="color: <%=FontColor%>;  text-transform: uppercase;font-size: 18px;font-weight:bold;"> <%=strOwnerName%></label>
            <input type="hidden" name="Enty" id="Enty" value="<%=EntitySeq%>" size="5" />
            <img src="Images/Find1.jpg" name="orgSearch" id="orgSearch"  onClick='PersonSearch()' />
          </td>
          <td colspan="2" style="font-weight:bold;">PERSON TYPE:</td>
          <td width="218"> <label  id="LblOwnerType"  style="color: <%=FontColor%>;  text-transform: uppercase;font-size: 18px;font-weight:bold;"> 
            <%=strOWNER_TYPE%></label> </td>
        </tr>
        <tr> 
          <td width="44" style="font-weight:bold;">ID#:</td>
          <td width="153"> <label  id="LblAssignedNum"  style="color: <%=FontColor%>;  text-transform: uppercase;font-size: 18px;font-weight:bold;"> 
            <%=strASSIGNEDNUM%></label> </td>
          <td width="57" style="font-weight:bold;">GENDER:</td>
          <td width="164" > <label  id="LblGender"  style="color: <%=FontColor%>;  text-transform: uppercase;font-size: 18px;font-weight:bold;"> 
            <%=strGender%></label> </td>
          <td width="100" style="font-weight:bold;">DOB:</td>
          <td width="131"> <label  id="Lbldob"  style="color: <%=FontColor%>;  text-transform: uppercase;font-size: 18px;font-weight:bold;"> 
            <%=strDOB%></label> </td>
          <td colspan="2" style="font-weight:bold;">AGE:</td>
          <td width="218"> <label  id="LblAge"  style="color: <%=FontColor%>;  text-transform: uppercase;font-size: 18px;font-weight:bold;"> 
            <%=Age_Years%></label> </td>
        </tr>       
        <tr>               
            
          <td style="font-weight:bold;" width="44">YEAR:</td>
            
          <td width="153"> 
            <input type="text"  name="TxtShowYear" id="TxtShowYear" size="10" value="<%=strYear%>"  
            style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"/>
            </td>
            <td colspan="2" style="font-weight:bold;"></td>
            
          <td style="font-weight:bold;" nowrap width="100">EVENT DATE :</td>
            
          <td nowrap width="131" ><font class="dateStyleBody" align="top" >FROM</font> 
            <input type="text" id="TxtEventFrom" name="TxtEventFrom" size="10" value="<%=strEventFrom%>" 
            placeholder="MM/DD/YYYY"
            onchange="CheckDate('TxtEventFrom','TxtEventTo')"
            style="background-color:  #FFF8DC; border:  1px solid #000000;text-transform: uppercase;"/>
            </td>
            <td nowrap colspan="2">
                <font class="dateStyleBody" align="top" >TO</font>&nbsp;&nbsp;
                <input type="text" id="TxtEventTo" name="TxtEventTo" size="10" value="<%=strEventTo%>" 
                placeholder="MM/DD/YYYY"
                onchange="CheckDate('TxtEventFrom','TxtEventTo')"
                style="background-color:  #FFF8DC; border:  1px solid #000000;"/>
            </td>              
            <%
            if(strMemberNum!=null && !strMemberNum.equals(""))
            {    
            %>
            
          <td width="218"> <img src="Images/Member.png"  alt="M" align="right" /> 
          </td>
            <%}else{%>
            
          <td width="2"></td>
            <%}%>            
        </tr>
        <tr>
            <td colspan="9" id="BtnStyle">  
                <input type="button" id="Search_PersonHistory" class="button" value="Search" onclick="Show_PersonHistory('<%=EntitySeq%>')" />
                <input type="button" id="Person_HistoryReset" class="button" value="Reset" onclick="Reset_PersonHistory()"/>                
                <input type="button" id="Previous_History" class="button" value="&laquo;"
                onclick="Ajax_CheckMember('<%=strASSIGNEDNUM%>','button_Previous','<%=EntitySeq%>')" />
                <input type="button" id="Next_History" class="button" value="&raquo;" 
                <%if(EntitySeq.length()>0){%>
                onclick="Person_BottomNavigation('Person_Observations.jsp?Mode=1&Enty=<%=EntitySeq%>')"
                <%}else{%>
                onclick="Person_BottomNavigation('Person_Observations.jsp')" 
                <%}%> />
            </td>
        </tr>
      </table>