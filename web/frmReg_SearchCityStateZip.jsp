<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>

<head>
    <title>SEARCH</title>
     <link rel="stylesheet" href="Style_Popup.css">
        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
        <link href="buttons.css" rel="stylesheet" type="text/css" />        
        <link rel="stylesheet" href="themes/base/jquery.ui.all.css">                                    
        <link href="Registration.css" rel="stylesheet" type="text/css" />
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
        <style type="text/css">
           #contents {

/*background:  url("Images/logo_apccpfa_oficial_no_back4.png") no-repeat center;*/
background:url("Images/trans-wood-1.png");
/*align : center;*/
top : 1px;
color : #000000;
width : 100%;
border : 1px solid #ccc;
} 
        </style>
<script type="text/javascript">
  function returnValues(strCity,strState,strZip,strCountry)
    {       
       if(parent.opener.document.forms[0].name=="Reg_OwnerInformation")
            {                
             parent.opener.document.getElementById("CITY").value=strCity;             
             parent.opener.document.getElementById("STATE").value=strState;             
             parent.opener.document.getElementById("ZIP").value=strZip;
             parent.opener.document.getElementById("COUNTRY").value=strCountry;
             
             parent.opener.document.getElementById("PHONE").focus();                          
             
             //childWindow=close("frmReg_SearchCityStateZip.jsp");
             window.close();
            }
         if(parent.opener.document.forms[0].name=="frmReg_BreederAddPopup")
            {                
             parent.opener.document.getElementById("City").value=strCity;
             parent.opener.document.getElementById("State").value=strState;
             parent.opener.document.getElementById("Zip").value=strZip;
             parent.opener.document.getElementById("Country").value=strCountry;                
             
             parent.opener.document.getElementById("Phone").focus();
             //childWindow=close("frmReg_SearchCityStateZip.jsp");
             window.close();
            }
           
         //childWindow=close("frmReg_SearchCityStateZip.jsp"); 
         //window.parent.jQuery('#dialog-StateSearch').dialog('close')
         window.close();
     
    }
    function success()
    {alert("1");
    }
    
    
</script>
    
</head>

<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.GeneralServlet" %>    

<body>
    <form name="Reg_SearchCityStateZip">
     
        <%
        String cityVal="";
        String stateVal="";
        String zipVal="";
        String countryVal="";
        String strSearch="";
        String strType="";
        
        int size_crs=0;
        
        if(request.getParameter("city")!=null)
            cityVal=request.getParameter("city");
        else
            cityVal="";
        
        if(request.getParameter("state")!=null)
            stateVal=request.getParameter("state");
        else
            stateVal="";                            
        
        if(request.getParameter("zip")!=null)
            zipVal=request.getParameter("zip");
        else
            zipVal="";
        if(request.getParameter("srch")!=null)
            strSearch=request.getParameter("srch");
        else
            strSearch="";
        if(request.getParameter("type")!=null)
            strType=request.getParameter("type");
        else
            strType="";
        
        String crssize="";

        List AllDetails = new ArrayList();
        GeneralServlet gen=new GeneralServlet();
 RowSetFactory factory2 = RowSetProvider.newFactory();
   CachedRowSet crsGetDetails= factory2.createCachedRowSet();
      //  CachedRowSetImpl crsGetDetails = new CachedRowSetImpl();
        if(cityVal!=null || stateVal!=null || zipVal!=null || countryVal!=null)
        crsGetDetails = gen.GET_CountryDetails(cityVal, stateVal, zipVal, countryVal);

        Map MpAllDetails = new TreeMap();
        try
        {
            
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
         /*if(crsGetDetails.size()>1)
        {*/
        %>
         <display:table  id="Details" name="requestScope.AllDetails"
                        pagesize="100" defaultsort="2" defaultorder="ascending"
                        class="grid"
                        style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">
        <display:setProperty name="paging.banner.item_name" value="Place" />
        <display:setProperty name="paging.banner.items_name" value="Places" />
        <display:setProperty name="paging.banner.some_items_found">
        <span class="pagebanner" >{0} {1} founds,displaying {2} to {3}</span>        
        </display:setProperty>
        <display:setProperty name="basic.msg.empty_list" value="No Place found with the Search Critera "/>
        <display:column style="width:15%"   title="CITY" sortable="true" headerClass="Grid_Header">
            <a href="javaScript:void(0)" onclick="returnValues('${Details.CITY}','${Details.STATE}','${Details.ZIP}','${Details.COUNTRY}')">${Details.CITY}</a> </display:column>
        <display:column style="width:5%"  property="STATE" sortable="true" headerClass="Grid_Header" />        
        <display:column style="width:5%" property="ZIP"  sortable="true" headerClass="Grid_Header" />
        <display:column style="width:5%" property="COUNTRY" headerClass="Grid_Header" />
        
        </display:table>
    
<%--</div>--%>
</form>          
</body>
</html>