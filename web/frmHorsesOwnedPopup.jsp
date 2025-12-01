

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>

    <%@ page import="java.util.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.rowset.*" %>
    <%@ page import="pasotracker.DBConnection" %>
    <%@ page import="pasotracker.GeneralServlet" %>

<html>
    <head>
        
         <title>HORSES OWNED</title>

 <link href="Tables_style.css" rel="stylesheet" type="text/css" />

</head>

    <body>

<%

   

   String ENTITY_SEQ="";

   if(request.getParameter("ENTITYSEQ")!=null)
       ENTITY_SEQ=request.getParameter("ENTITYSEQ");
   else
       ENTITY_SEQ="";
   
   List OwnerList = new ArrayList();
   try
            {
       
       
   String strRegistration_num="";
   String strPrimename="";
   String strsecondaryname="";
   String strdob="";
   String strMchip="";
   String strHorsename="";
   String strSireName="";
   String strDamName="";
   String age="";
   String Age_Months="";
   String Age_Days="";
   String Age_Years="";

    GeneralServlet gen=new GeneralServlet();
    RowSetFactory factory29 = RowSetProvider.newFactory();
   CachedRowSet crsGetHorseOwned= factory29.createCachedRowSet();
    //CachedRowSetImpl crsGetHorseOwned = new CachedRowSetImpl();
    if(ENTITY_SEQ.length()>0 && !ENTITY_SEQ.equals("0"))
    crsGetHorseOwned = gen.GET_HORSEOWNED(ENTITY_SEQ);
    
    Map MpHorseOwnedDetails = new TreeMap();
    int Counter=0;

    while (crsGetHorseOwned.next())
    {
     strRegistration_num="";
     strPrimename="";
     strsecondaryname="";
     strdob="";
     strMchip="";
     strHorsename="";
     strSireName="";
     strDamName="";
     age="";
     Age_Months="";
     Age_Days="";
     Age_Years="";
     
    if(crsGetHorseOwned.getString("REGISTRATION_NUM")!=null)
        strRegistration_num= crsGetHorseOwned.getString("REGISTRATION_NUM").trim();

    if(crsGetHorseOwned.getString("HORSE_PRIMARYNAME")!=null)
        strPrimename= crsGetHorseOwned.getString("HORSE_PRIMARYNAME").trim();

    /* SUFFIX is used as the middle name in the database */
    if(crsGetHorseOwned.getString("HORSE_SECONDARYNAME")!=null)
        strsecondaryname= crsGetHorseOwned.getString("HORSE_SECONDARYNAME").trim();

    if(crsGetHorseOwned.getString("HORSE_DOB")!=null)
        strdob= crsGetHorseOwned.getString("HORSE_DOB").trim();

    if(crsGetHorseOwned.getString("MICROCHIP_NUM")!=null)
        strMchip= crsGetHorseOwned.getString("MICROCHIP_NUM").trim();
     
     if(crsGetHorseOwned.getString("SIRENAME")!=null)
        strSireName= crsGetHorseOwned.getString("SIRENAME").trim();
     
     if(crsGetHorseOwned.getString("DAMNAME")!=null)
        strDamName= crsGetHorseOwned.getString("DAMNAME").trim();
     
     if(crsGetHorseOwned.getString("AGEINMONTHS")!=null)
        Age_Months= crsGetHorseOwned.getString("AGEINMONTHS").trim()+"M ";
     
     if(crsGetHorseOwned.getString("AGEINDAYS")!=null)
        Age_Days= crsGetHorseOwned.getString("AGEINDAYS").trim()+"D";
     
     if(crsGetHorseOwned.getString("AGEINYEARS")!=null)
        Age_Years= crsGetHorseOwned.getString("AGEINYEARS").trim();

     strHorsename=strPrimename+" "+strsecondaryname;
     age=Age_Months+Age_Days;
     
    MpHorseOwnedDetails = new TreeMap();
    MpHorseOwnedDetails.put("REG#",strRegistration_num);
    MpHorseOwnedDetails.put("HORSENAME",strHorsename);
    MpHorseOwnedDetails.put("DOB",strdob);  /* FULL NAME */
    MpHorseOwnedDetails.put("MCHIP",strMchip);
    MpHorseOwnedDetails.put("SIRE",strSireName);
    MpHorseOwnedDetails.put("DAM",strDamName);
    MpHorseOwnedDetails.put("AGE",age);

    OwnerList.add(MpHorseOwnedDetails);
        
        }
    }
       catch(Exception ex)
        {
                ex.printStackTrace();
        }
        request.setAttribute("OwnerList", OwnerList);
     if(OwnerList.size()>0)
    {
          %>
        <display:table  id="Details" name="requestScope.OwnerList"
                        pagesize="100" defaultsort="2" defaultorder="ascending"
                        class="grid"
                        style="border-color:Black;border-width:0px;border-style:None;width:100%;
                        text-transform:uppercase;border-collapse:collapse;">
        <display:setProperty name="basic.msg.empty_list" value="No Horses found "/>
        <display:column style="width:1%" headerClass="Grid_Header"/>
        <display:column style="width:5%;Height:30px;"   title="REG#" property="REG#" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:25%" property="HORSENAME" title="HORSE NAME" sortable="true" headerClass="Grid_Header"/>
        <display:column style="width:10%"  property="DOB" title="DOB" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:10%"  property="AGE" title="AGE" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:15%" property="SIRE" title="SIRE" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:15%" property="DAM" title="DAM" sortable="true" headerClass="Grid_Header" />
        </display:table>
<%}
  else
  {
        out.println("No Horses Owned by the Member");
  }           
%>
</body>
</html>
