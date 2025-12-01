

<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>
<html>
<head></head>
<script type="text/javascript">
function returnOrganizationValue(OrganizationName,orgseqno)
{    
     //window.parent.document.getElementById("breeder").value=varHrsName
    if(window.parent.document.forms[0].name=="Registrationform")
    {
    window.parent.document.getElementById("org").value=OrganizationName;
    window.parent.document.getElementById("org_Lbl").innerHTML=OrganizationName;
    window.parent.document.getElementById("orgSeq").value=orgseqno;
    window.parent.document.getElementById("SavedYN").value='N';                
    }
    window.parent.jQuery('#dialog-Org').dialog('close')
}
</script>
    <%@ page import="java.util.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.rowset.*" %>
    <%@ page import="pasotracker.DBConnection" %>
    <%@ page import="pasotracker.GeneralServlet" %>
<body>
    <form name="OrganizationPopup_RegList">
        <%@ include file="OrganisationPopup_Reg.jsp" %>
     <div id="maincontent_Breeder">
         <div class="innertube">
<%
    
    List OrganizationList = new ArrayList();
     try
        {      
           
            GeneralServlet gen=new GeneralServlet();
             RowSetFactory factory11 = RowSetProvider.newFactory();
   CachedRowSet crs= factory11.createCachedRowSet();
            //CachedRowSetImpl crs = new CachedRowSetImpl();
            
            crs = gen.GetCommonDetails(RefType,strOrgName);

            Map MpHorseDetails = new TreeMap();
                      
            while (crs.next())
            {
                strOrgName="";               
    
                if(crs.getString("VALUE")!=null)                  
                    strOrgName= crs.getString("VALUE").trim();   
                else
                    strOrgName="";
                
                if(crs.getString("SEQNO")!=null)                  
                    Seqno= crs.getString("SEQNO").trim();   
                else
                    Seqno="";
                            
               
                    MpHorseDetails = new TreeMap();
                    MpHorseDetails.put("ORGANIZATIONNAME",strOrgName);
                    MpHorseDetails.put("SEQNO",Seqno);                                                             
                   
                    OrganizationList.add(MpHorseDetails);
            }
			out.println(crs.size()+" items found");

        }
        catch(Exception ex)
        {
                ex.printStackTrace();	

        }

        request.setAttribute("OrganizationList", OrganizationList);
%>
    
        <display:table  id="Details" name="requestScope.OrganizationList" 
        defaultsort="2" defaultorder="ascending"
        class="grid"
        style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">

        <display:column style="width:1%" headerClass="Grid_Header">
        <input type="radio" name="checkedVal" onclick="returnOrganizationValue('${Details.ORGANIZATIONNAME}','${Details.SEQNO}')" /></display:column>
        <display:column style="width:25%;Height:30px;"   title="ORGANIZATION NAME" property="ORGANIZATIONNAME" sortable="true" headerClass="Grid_Header" />       
        

        </display:table>
        </div>
     </div>
    </form>
</body>
</html>
    
    