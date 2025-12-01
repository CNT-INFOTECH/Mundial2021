<%-- 
    Document   : frmReg_PlaceOfBirthSearchList
    Created on : Jul 11, 2011, 1:15:12 PM
    Author     : Erzath
--%>
<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>

<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SEARCH PLACE</title>
        <script type="text/javascript">
function returnPlaceValues(strCity,strState,strZip,strCountry)
{   
     val = strCity+", "+strState;
     
     window.parent.document.getElementById("place").value=val;  
     
     window.parent.jQuery('#dialog-PlaceOfBirth').dialog('close')
}           
        </script>
        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
    </head>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.GeneralServlet" %>   
    <body>
       <%                                              
         List AllDetails = new ArrayList();
        try
        {            
            GeneralServlet gen=new GeneralServlet();
 RowSetFactory factory22 = RowSetProvider.newFactory();
   CachedRowSet crsGetDetails= factory22.createCachedRowSet();
           // CachedRowSetImpl crsGetDetails = new CachedRowSetImpl();
            
            if(strSearch.length()>0)
            crsGetDetails = gen.GET_CountryDetails(cityVal, stateVal, zipVal, countryVal);
            
             Map MpAllDetails = new TreeMap();
             
             
            while (crsGetDetails.next())
            {

                cityVal="";
                stateVal="";
                zipVal="";
                countryVal="";
                

                if(crsGetDetails.getString("CITY")!=null)
                    cityVal= crsGetDetails.getString("CITY");

                if(crsGetDetails.getString("STATE")!=null)
                    stateVal= crsGetDetails.getString("STATE");

                if(crsGetDetails.getString("ZIP")!=null)
                    zipVal= crsGetDetails.getString("ZIP");

                if(crsGetDetails.getString("COUNTRY")!=null)
                    countryVal= crsGetDetails.getString("COUNTRY");
         
                    
                
                    MpAllDetails = new TreeMap();
                    MpAllDetails.put("CITY",cityVal);
                    MpAllDetails.put("STATE",stateVal);
                    MpAllDetails.put("ZIP",zipVal);
                    MpAllDetails.put("COUNTRY",countryVal);
                

                    AllDetails.add(MpAllDetails);

            }
        }
        catch(Exception ex)
        {
                ex.printStackTrace();

        }
           request.setAttribute("AllDetails", AllDetails);
           if(strSearch.length()>0 && strType.equals("1"))
        {
        %>
         <display:table  id="Details" name="requestScope.AllDetails"
                        pagesize="100" defaultsort="1" defaultorder="ascending"
                        class="grid"
                        style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">                
    <display:setProperty name="paging.banner.item_name" value="Place" />
    <display:setProperty name="paging.banner.items_name" value="Places" />
    <display:setProperty name="paging.banner.some_items_found">
        <span class="pagebanner" >{0} {1} founds,displaying {2} to {3}</span>        
    </display:setProperty>
    <display:setProperty name="basic.msg.empty_list" value="No Place found with the Search Critera "/>
        <display:column style="width:25%"   title="CITY" sortable="true" headerClass="Grid_Header">
            <a href="javaScript:void(0)" onclick="returnPlaceValues('${Details.CITY}','${Details.STATE}','${Details.ZIP}','${Details.COUNTRY}')">${Details.CITY}</a> </display:column>
        <display:column style="width:10%"  property="STATE" sortable="true" headerClass="Grid_Header" />        
        <display:column style="width:10%" property="ZIP"  sortable="true" headerClass="Grid_Header" />
        <display:column style="width:10%" property="COUNTRY" headerClass="Grid_Header" />
        
        </display:table>
<%}%>
    </body>
</html>
