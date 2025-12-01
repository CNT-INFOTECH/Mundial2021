


<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<html>
<head>

<title>PERSON SEARCH</title>
<link rel="stylesheet" href="Style_Popup.css">
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />
<link href="frmReg_CommonRef.css" rel="stylesheet" type="text/css" />                
<link href="Registration.css" rel="stylesheet" type="text/css" /> 
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
              

<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.GeneralServlet" %>
<%          
    List PersonList = new ArrayList();                          
    int Counter=0;
    try
    {            
        int asgno=0;      
        String PersonDOB="";
        String strOutBalance="";
        String strDueDate="";
        String Dob_Age="";
                
        GeneralServlet gen=new GeneralServlet();


 RowSetFactory factory31 = RowSetProvider.newFactory();
   CachedRowSet crsPersonDetails= factory31.createCachedRowSet();
      //  CachedRowSetImpl crsPersonDetails = new CachedRowSetImpl();
        System.out.println("---Search Bottom List---");
        
        crsPersonDetails = gen.GET_PersonSearch(Member_id,strName,strGender,strJoinPeriod,strJoining_From,
                strJoining_To,strMemberType,strMemberStatus,strPersonType,strDob_From,strDob_To,strAge_Val,
                strAge_Type,strAge_Opr,strMemPart_Show,strMemPart_From,strMemPart_To,
                strMemStatus_Val,strMemStatus_Type,strMemStatus_Opr,
                strBestVal,strBest_Show,strBest_Type,strBest_From,strBest_To,strMemPart_Type,ExpType);

        Map MpPersonDetails = new TreeMap();
        
        System.out.println("crs"+crsPersonDetails.size());

        while (crsPersonDetails.next())
        {               
            if(crsPersonDetails.getString("NAME")!=null)
                strName= crsPersonDetails.getString("NAME").trim();
            else
                strName="";
            
            if(crsPersonDetails.getString("ID#")!=null)
             {
                  Member_id= crsPersonDetails.getString("ID#").trim();
                  asgno=Integer.parseInt(Member_id);                  
            }
            else
            {
                Member_id="";
                asgno=0;
            }
            
            if(crsPersonDetails.getString("ENTITYSEQ")!=null)
                strEntitySeq= crsPersonDetails.getString("ENTITYSEQ").trim();
            else
                strEntitySeq="";
            
            if(crsPersonDetails.getString("DOB")!=null)
                PersonDOB= crsPersonDetails.getString("DOB").trim();
            else
                PersonDOB="";
            
            if(crsPersonDetails.getString("MONTH")!=null)
                strAge_Months= crsPersonDetails.getString("MONTH").trim()+"M";
            else
                strAge_Months="";
            
            if(crsPersonDetails.getString("DAYS")!=null)
                strAge_Days= crsPersonDetails.getString("DAYS").trim()+"D";
            else
                strAge_Days="";
            
           if(crsPersonDetails.getString("YEARS")!=null)
                Age_Years= crsPersonDetails.getString("YEARS").trim();
            else
                Age_Years="";
            
            //if(!PersonDOB.equals("") && (!strAge_Months.equals("")  || !strAge_Days.equals("")))
            
            if(!PersonDOB.equals("") && !Age_Years.equals("") )
                Dob_Age=PersonDOB+" / "+Age_Years;
            else
                Dob_Age="";
                                
            if(crsPersonDetails.getString("GENDER")!=null)
                strGender= crsPersonDetails.getString("GENDER").trim();
            else
                strGender="";
            
            if(crsPersonDetails.getString("OUTSTANDINGBALANCE")!=null)
                strOutBalance= crsPersonDetails.getString("OUTSTANDINGBALANCE").trim()+"$";
            else
                strOutBalance="";
            
            if(crsPersonDetails.getString("DUEDATE")!=null)
                strDueDate= crsPersonDetails.getString("DUEDATE").trim();
            else
                strDueDate="";
                        
            MpPersonDetails = new TreeMap();
            MpPersonDetails.put("NAME",strName);            
            MpPersonDetails.put("DOB",Dob_Age);
            MpPersonDetails.put("GENDER",strGender);
            
            if(asgno!=0)              
                MpPersonDetails.put("ASSIGNEDNUM",asgno); 
            else
                MpPersonDetails.put("ASSIGNEDNUM",null); 
            
            MpPersonDetails.put("ENTITYSEQ",strEntitySeq);   
            MpPersonDetails.put("OUTSTANDINGBALANCE",strOutBalance);                                                                                                       
            MpPersonDetails.put("DUEDATE",strDueDate);
            
            Counter=Counter+1;
            PersonList.add(MpPersonDetails);
        }
    }
    catch(Exception ex)
    {
            ex.printStackTrace();

    }

    request.setAttribute("PersonList", PersonList);

    if (strViewAll.equals("Y"))
    {
    out.println(Counter +" Persons founds,displaying 1 to "+ Counter);
%>   
    <display:table  id="Details" name="requestScope.PersonList"        
     defaultsort="1" defaultorder="ascending" 
                        class="grid" pagesize="10"
                        style="border-color:Black;border-width:0px;border-style:None;width:100%;
                        border-collapse:collapse;overflow-x:scroll;text-transform: uppercase;">

    <display:column style="width:1%;Height:25px;" headerClass="Grid_Header">
    <input type="radio" name="checkedVal" onclick="return_OwnerHorseDetails('${Details.ASSIGNEDNUM}')" />
    </display:column>    
    <display:column style="width:25%"  sortable="true" property="NAME"  headerClass="Grid_Header" />        
    <display:column style="width:5%"  sortable="true" property="ASSIGNEDNUM"  title="ID#"  headerClass="Grid_Header" />     
    <display:column style="width:10%"  sortable="true" property="DOB" title="DOB/AGE"  headerClass="Grid_Header" />
    <display:column style="width:5%"   sortable="true" property="GENDER" headerClass="Grid_Header" />
    <display:column style="width:5%"   sortable="true" property="OUTSTANDINGBALANCE" title="OUTSTANDING BALANCE"  headerClass="Grid_Header" />
    <display:column style="width:10%"  sortable="true" property="DUEDATE"  title="DUE DATE" headerClass="Grid_Header" />
    </display:table>
<%  }
    else
    {
%>
    <display:table  id="Details" name="requestScope.PersonList"        
     defaultsort="1" defaultorder="ascending" 
                        class="grid" pagesize="100"
                        style="border-color:Black;border-width:0px;border-style:None;width:100%;
                        border-collapse:collapse;overflow-x:scroll;text-transform: uppercase;">
                        
    <display:setProperty name="paging.banner.item_name" value="Persons" />
    <display:setProperty name="paging.banner.items_name" value="Persons" />
    <display:setProperty name="paging.banner.some_items_found">

        <span class="pagebanner" >{0} {1} founds,displaying {2} to {3}</span>
        <span ><input type="checkbox" onClick="showViewAll()"> <font style="font-weight:bold;">View All&nbsp;&nbsp;&nbsp;</font></span>

    </display:setProperty>
    
    <display:column style="width:1%;Height:25px;" headerClass="Grid_Header">
    <input type="radio" name="checkedVal" onclick="return_OwnerHorseDetails('${Details.ASSIGNEDNUM}')" />
    </display:column>    
    <display:column style="width:25%"  sortable="true" property="NAME"  headerClass="Grid_Header" />        
    <display:column style="width:5%"  sortable="true" property="ASSIGNEDNUM"  title="ID#"  headerClass="Grid_Header" />     
    <display:column style="width:10%"  sortable="true" property="DOB" title="DOB/AGE"  headerClass="Grid_Header" />
    <display:column style="width:5%"   sortable="true" property="GENDER" headerClass="Grid_Header" />
    <display:column style="width:5%"   sortable="true" property="OUTSTANDINGBALANCE" title="OUTSTANDING BALANCE"  headerClass="Grid_Header" />
    <display:column style="width:10%"  sortable="true" property="DUEDATE"  title="DUE DATE" headerClass="Grid_Header" />
    </display:table>
<%   
    }
%>    
<div id="dialog-HorseDetails" title="HORSE DETAILS" style="display:none; background:url('Images/trans-wood-1.png')" >
    <iframe id="modalIFrame_OwnerHorseDetails" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes">
    </iframe>
</div>
</body>
</html>
