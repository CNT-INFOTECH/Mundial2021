<%-- 
    Document   : Person_HorseDetails
    Created on : Jan 31, 2012, 6:17:52 PM
    Author     : Erzath
--%>
<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.GeneralServlet" %>
<html>
    <head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">        
<link rel="stylesheet" href="Style_Popup.css">
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />
<link href="frmReg_CommonRef.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="themes/base/jquery.ui.all.css">
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
<script type='text/javascript' src='AutoComplete/jquery.autocomplete.js'></script>
<link rel="stylesheet" type="text/css" href="AutoComplete/jquery.autocomplete.css" />

<script type="text/javascript" src="js/interface.js"></script>     

<script type="text/javascript" src="jscRegistrationSearch.js"></script>  
    </head>
    <body>
        <form name="Person_HorseDetails">
<%      
    String RegSeq="";
    String str_Reg_no1="";
    String strHor_PName1="";
    String strHor_DOB1=""; 
    String strage="";
    String strViewAll="";
    String strAssignedNo="";
    int Counter=0;
    String age_Months="";
    String age_Days="";
    
    if(request.getParameter("Enty")!=null)
        strAssignedNo=request.getParameter("Enty");
    else
        strAssignedNo="";
    
    List HorseList = new ArrayList();                          
    try
    {            
        int asgno=0;      
        String strOwn_Type="";        
        GeneralServlet gen=new GeneralServlet();
 RowSetFactory factory26 = RowSetProvider.newFactory();
   CachedRowSet crsGetHorseDetails= factory26.createCachedRowSet();
       // CachedRowSetImpl crsGetHorseDetails = new CachedRowSetImpl();
        if(strAssignedNo.length()>0)
        crsGetHorseDetails = gen.GetHorseDetails("","","","","","","",strAssignedNo);

        Map MpHorseDetails = new TreeMap();

        while (crsGetHorseDetails.next())
        {   
            RegSeq="";            
            str_Reg_no1=""; 
            strHor_PName1="";
            strHor_DOB1="";
            strage="";
            Counter=0;
            age_Months="";
            age_Days="";
            
            if(crsGetHorseDetails.getString("REGSEQ")!=null)
                RegSeq= crsGetHorseDetails.getString("REGSEQ").trim();

            if(crsGetHorseDetails.getString("REGISTRATION_NUM")!=null)
                str_Reg_no1= crsGetHorseDetails.getString("REGISTRATION_NUM").trim();
                            
            if(crsGetHorseDetails.getString("HORSE_PRIMARYNAME")!=null)
                strHor_PName1= crsGetHorseDetails.getString("HORSE_PRIMARYNAME").trim();

            if(crsGetHorseDetails.getString("HORSE_DOB")!=null)
                strHor_DOB1= crsGetHorseDetails.getString("HORSE_DOB").trim();
            /*
            if(crsGetHorseDetails.getString("AGE")!=null)                  
                strage= crsGetHorseDetails.getString("AGE");
            */
            if(crsGetHorseDetails.getString("MONTH")!=null)                     
                age_Months= crsGetHorseDetails.getString("MONTH").trim()+"M";
            else
                age_Months="";
            
            if(crsGetHorseDetails.getString("DAYS")!=null)                     
                age_Days= crsGetHorseDetails.getString("DAYS").trim()+"D";
            else
                age_Days="";
            
            strage=age_Months+' '+age_Days;
            
            MpHorseDetails = new TreeMap();
            MpHorseDetails.put("REGSEQ",RegSeq);
            MpHorseDetails.put("HORSENAME",strHor_PName1);
            MpHorseDetails.put("REG",str_Reg_no1);
            MpHorseDetails.put("DOB",strHor_DOB1);                                                                                                       
            MpHorseDetails.put("AGE",strage);
            
            Counter=Counter+1;
            HorseList.add(MpHorseDetails);
        }
    }
    catch(Exception ex)
    {
            ex.printStackTrace();

    }

    request.setAttribute("HorseList", HorseList);

    if (strViewAll.equals("Y"))
    {
    out.println(Counter +" Horses founds,displaying 1 to "+ Counter);
%>

    <display:table  id="Details" name="requestScope.HorseList"         
     defaultsort="1" defaultorder="ascending" 
                        class="grid"
                        style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;overflow-x:scroll;text-transform: uppercase;">




    <display:column style="width:1%;" headerClass="Grid_Header">
    <input type="radio" name="checkedVal" onclick="returnValues('${Details.REG}','${Details.HORSENAME}','${Details.REGSEQ}')" />
    </display:column>    
    <display:column style="width:10%;"  property="REG" title="REG#" sortable="true" headerClass="Grid_Header" />        
    <display:column style="width:20%"   title="HORSE NAME" property="HORSENAME" sortable="true" headerClass="Grid_Header"/>     
    <display:column style="width:10%"  title="DOB"   sortable="true" property="DOB" headerClass="Grid_Header"/>
    <display:column style="width:3%" property="AGE"  sortable="true" headerClass="Grid_Header" />    

    </display:table>
<%  
    }
    else
    { 
%>
    <display:table  id="Details" name="requestScope.HorseList"
                            pagesize="100" defaultsort="1" defaultorder="ascending"
                            class="grid"
                            style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;overflow-x:scroll;text-transform: uppercase;">           

    <display:setProperty name="paging.banner.item_name" value="Horse" />
    <display:setProperty name="paging.banner.items_name" value="Horses" />
    <display:setProperty name="paging.banner.some_items_found">

        <span class="pagebanner" >{0} {1} founds,displaying {2} to {3}</span>
        <span ><input type="checkbox" onClick="showAlert()"> <font style="font-weight:bold;">View All&nbsp;&nbsp;&nbsp;</font></span>

    </display:setProperty>
    <display:column style="width:1%;" headerClass="Grid_Header">
    <input type="radio" name="checkedVal" onclick="returnValues('${Details.REG}','${Details.HORSENAME}','${Details.REGSEQ}')" /></display:column>
    <display:column style="width:10%;"  property="REG" title="REG#" sortable="true" headerClass="Grid_Header" />    
    <display:column style="width:20%;"   title="HORSE NAME" property="HORSENAME" sortable="true" headerClass="Grid_Header"/>    
    <display:column style="width:10%;"  title="DOB"   sortable="true" property="DOB" headerClass="Grid_Header"/>
    <display:column style="width:3%;" property="AGE"  sortable="true" headerClass="Grid_Header" />

    </display:table>
<%
    }
%>
    </body>
</html>
