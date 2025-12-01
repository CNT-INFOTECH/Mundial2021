<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.sql.rowset.*"%>
<%@page import="pasotracker.GeneralServlet"%>


 <link href="Tables_style.css" rel="stylesheet" type="text/css" />
<table class="grid" align="center"  border="0" cellpadding="0" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th width="17%">Name</th>
                <th width="3%">Member</th>
                <th width="10%">Address</th>
                <th width="10%">City</th>
                <th width="10%">State</th>
                <th width="10%">Zip</th>
                <th width="10%">Country</th>
                <th width="10%">Phone</th>
                <th width="10%">Start Date</th>
                <th width="10%">End Date</th>
            </tr>
        </thead>
        <tbody>
<%
    String regSeq="";
    if(request.getParameter("seq")!=null)
        regSeq=request.getParameter("seq");

    try{
    GeneralServlet genn =new GeneralServlet();

    CachedRowSetImpl crsGetownershistoryDetails = new CachedRowSetImpl();

    crsGetownershistoryDetails = genn.GetOwnerHistoryDetails(regSeq);

    String strmem_add="";
    String strstart_date="";
    String strend_date="";
    String strOrg_Name1="";
    String strOwnerType="";
    String strmem_num="";
    String strmem_name="";
    String strmem_city="";
    String strmem_state="";
    String strmem_zip="";
    String strmem_country="";
    String strmem_phone="";
    
    while(crsGetownershistoryDetails.next())
    {
        strmem_num="";
        strmem_name="";
        strmem_add="";
        strmem_city="";
        strmem_state="";
        strmem_zip="";
        strmem_country="";
        strmem_phone="";
        strstart_date="";
        strend_date="";
        strOrg_Name1="";
        strOwnerType="";

    if(crsGetownershistoryDetails.getString("MEMBER_NUM")!=null)
        strmem_num= crsGetownershistoryDetails.getString("MEMBER_NUM");

    if(crsGetownershistoryDetails.getString("NAME")!=null)
        strmem_name= crsGetownershistoryDetails.getString("NAME");

    if(crsGetownershistoryDetails.getString("OWNER_TYPE")!=null)
        strOwnerType= crsGetownershistoryDetails.getString("OWNER_TYPE");

    if(crsGetownershistoryDetails.getString("ORGANIZATION_NAME")!=null)
        strOrg_Name1= crsGetownershistoryDetails.getString("ORGANIZATION_NAME").trim();

    if(crsGetownershistoryDetails.getString("ADDRESS")!=null)
        strmem_add= crsGetownershistoryDetails.getString("ADDRESS");

    if(crsGetownershistoryDetails.getString("CITY")!=null)
        strmem_city= crsGetownershistoryDetails.getString("CITY");

    if(crsGetownershistoryDetails.getString("STATE")!=null)
        strmem_state= crsGetownershistoryDetails.getString("STATE");

    if(crsGetownershistoryDetails.getString("ZIP")!=null)
        strmem_zip= crsGetownershistoryDetails.getString("ZIP");

    if(crsGetownershistoryDetails.getString("COUNTRY")!=null)
        strmem_country= crsGetownershistoryDetails.getString("COUNTRY");

    if(crsGetownershistoryDetails.getString("PHONE")!=null)
        strmem_phone= crsGetownershistoryDetails.getString("PHONE");

    if(crsGetownershistoryDetails.getString("START_DATE")!=null)
        strstart_date= crsGetownershistoryDetails.getString("START_DATE");

    if(crsGetownershistoryDetails.getString("END_DATE")!=null)
        strend_date= crsGetownershistoryDetails.getString("END_DATE");

%>
        <tr class="grid_OwnerHis" >
            <td >
                <%/*if(!strOrg_Name1.equals(""))
                    out.println(strOrg_Name1);
                  else
                    out.println(strmem_name);*/
                 if(!strOrg_Name1.equals(""))
                    out.println(strOrg_Name1.trim());
                else if(!strmem_name.equals("") && strOrg_Name1.equals(""))
                    out.println(strmem_name.trim());
                %>
            </td>
            <td>
                <%
                if(strmem_num.length()>0 && !strmem_num.equals("0"))
                  out.println("YES");
                else  if(strmem_num.equals("0"))
                  out.println("NO");
                %>
            </td>
            <td>
                <% out.println(strmem_add);%>
            </td>
            <td>
                <% out.println(strmem_city);%>
            </td>
            <td>
                <% out.println(strmem_state);%>
            </td>
            <td>
                <% out.println(strmem_zip);%>
            </td>
            <td>
                <% out.println(strmem_country);%>
            </td>
            <td>
                <% out.println(strmem_phone);%>
            </td>
            <td>
                <% out.println(strstart_date);%>
            </td>
            <td>
                <% out.println(strend_date);%>
            </td>
        </tr>
<%
        }
      }
        catch (Exception e) {
        System.err.println("Got an exception! ");
        System.err.println("++frmReg_SearchHorseDetails_OwnersHistory.jsp+++"+e);
    }
        
%>
</table>