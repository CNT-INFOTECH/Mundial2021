<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.net.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>
<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>
<head>

<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript" src="scripts/Shows_Register.js"></script>
    <script type="text/javascript" src="scripts/jscCommon.js"></script>


    
    <script>
        
  function Register_Pop(ObjName,ObjValue)
  {

// When we select the Event from the Search List, we need to event Seq to Register

    parent.document.forms[0].EventSeq.value=ObjName;
    parent.document.forms[0].Events.value=ObjValue;
    parent.document.forms[0].Register.click();
    

  }

  function showAlert() {
        parent.document.forms[0].FlgViewAll.value='Y';
	parent.document.forms[0].Search.click();
  
}

function Events_Summary(ObjName,ObjValue)
{
    parent.document.forms[0].EventSeq.value=ObjName;
    parent.document.forms[0].Events.value=ObjValue;
    parent.document.forms[0].Summary.click();

}



  </script>
</head>
<body>

    <form>
<%

String strSearchMode=request.getParameter("mode");
String strShowSeq=request.getParameter("ShowSeq");
String strEventSeq=request.getParameter("EventSeq");
String strDate=request.getParameter("ShowDate");
String strCategory=request.getParameter("Category");
String strGender=request.getParameter("Gender");
String strAgefrom=request.getParameter("Agefrom");
String strAgeTo=request.getParameter("AgeTo");
String strRider=request.getParameter("Rider");
String strShowName=request.getParameter("Shows");
String strViewAll=request.getParameter("ViewAll");
String insAccess="";
if(request.getParameter("ins")!=null)
insAccess=request.getParameter("ins");
String vwAccess="";
if(request.getParameter("vw")!=null)
vwAccess=request.getParameter("vw");
int Counter=0;





session.setAttribute("CommonShowSeq",strShowSeq);
session.setAttribute("CommonShowName",strShowName);



if(strSearchMode!=null && strSearchMode.equals("0") )
 {



 Connection localConnection=null;
 DbConnMngr dbcmt=new DbConnMngr();
 List AlEvents=new ArrayList();
try {
        localConnection=dbcmt.getConnection();
	localConnection.setAutoCommit(false);
        CallableStatement cst = localConnection.prepareCall("{call GET_EVENT_INFORMATION(?,?,?,?,?, ?,?,?)}");
        cst.setString(1, strShowSeq);
        cst.setString(2, strEventSeq);
        cst.setString(3, strDate);
        cst.setString(4, strCategory);
        cst.setString(5, strGender);
        cst.setString(6, strAgefrom);
        cst.setString(7, strAgeTo);
        cst.setString(8, strRider);
        
        ResultSet rs2 = cst.executeQuery();

       
       
        Map MpRows = new TreeMap();
      

        while(rs2.next())
        {

            MpRows = new TreeMap();

            String strEvent_Order="";
            MpRows.put("Show_Name",rs2.getString("Show_Name"));
            MpRows.put("Name",rs2.getString("Name"));
            MpRows.put("Event_Date",rs2.getString("Event_Date"));
            MpRows.put("Place","Place");
            MpRows.put("Event_Seq",rs2.getString("Event_Seq"));
            if(rs2.getString("Event_Order")!=null)
                strEvent_Order=rs2.getString("Event_Order");
            
            if(!strEvent_Order.equals(""))
                MpRows.put("Event_Order",Integer.parseInt(strEvent_Order));
            else
                MpRows.put("Event_Order",null);


            AlEvents.add(MpRows);
            Counter=Counter+1;

         }

       

         rs2.close();
         cst.close();

        localConnection.commit();
        dbcmt.releaseConnection(localConnection);
        }

        catch(Exception ex)
        {
            ex.printStackTrace();
            try
            {
                localConnection.rollback();
                dbcmt.releaseConnection(localConnection);
            }
            catch(SQLException exc)
            {
            exc.printStackTrace();
            }

        }
        request.setAttribute("AlEvents", AlEvents);

        if (strViewAll.equals("Y"))
            { out.println(Counter +" Events found,displaying "+Counter +" to "+ Counter);
            %>

         <display:table  id="EventDetails" name="requestScope.AlEvents"
                             defaultsort="1" defaultorder="ascending"
                            class="grid"
                            style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">
         
   
    
    <display:setProperty name="paging.banner.item_name" value="Event" />
    <display:setProperty name="paging.banner.items_name" value="Events" />
    <display:setProperty name="paging.banner.some_items_found">
     
        <span class="pagebanner" >{0} {1} founds,displaying {2} to {3}</span>
        <span ><input type="checkbox" onClick="showAlert()">View All&nbsp;&nbsp;&nbsp;</span>
     
    </display:setProperty>
   

            <display:column style="width:10%" title="EVENT NO" property="Event_Order"  headerClass="Grid_Header" />
            <display:column style="width:35%" title="EVENT NAME" property="Name"  sortable="true" headerClass="Grid_Header" />
            <display:column style="width:10%" title="DATE" property="Event_Date"  sortable="true" headerClass="Grid_Header" />
            <%if(insAccess.equals("Y")){%>
			<display:column style="width:1%;" title="REG.&nbsp;|"   headerClass="Grid_Header">
             <img alt="" src="Images/registration_icon.gif" onClick="Register_Pop('${EventDetails.Event_Seq}','${EventDetails.Name}')"/></display:column>
			<%}%>
              <display:column style="width:1% ;" title="SUMM.&nbsp;|" headerClass="Grid_Header">
                  <a href="#" onClick="Events_Summary('${EventDetails.Event_Seq}','${EventDetails.Name}')"><img alt="" src="Images/summary_icon_6.jpg" /></a></display:column>

              <display:column style="width:1%" title="PREP." headerClass="Grid_Header">
                  <img alt="" src="Images/Roster2.png" onClick="Events_Summary_Placement('${EventDetails.Event_Seq}','${EventDetails.Name}')"/></display:column>


        </display:table>

<% }
  else
      {%>
      <display:table  id="EventDetails" name="requestScope.AlEvents"
                              pagesize="50" defaultsort="1" defaultorder="ascending"
                            class="grid"
                            style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">


   
    <display:setProperty name="paging.banner.item_name" value="Event" />
    <display:setProperty name="paging.banner.items_name" value="Events" />
    <display:setProperty name="paging.banner.some_items_found">

        <span class="pagebanner" >{0} {1} found {2} to {3}</span>
        <span ><input type="checkbox" onClick="showAlert()">View All&nbsp;&nbsp;&nbsp;</span>

    </display:setProperty>


            <display:column style="width:10%" title="EVENT NO" property="Event_Order"  headerClass="Grid_Header" />
            <display:column style="width:35%" title="EVENT NAME" property="Name"  sortable="true" headerClass="Grid_Header" />
            <display:column style="width:10%" title="DATE" property="Event_Date"  sortable="true" headerClass="Grid_Header" />
<%if(insAccess.equals("Y")){%>
            <display:column style="width:1%;" title="REG.&nbsp;|"   headerClass="Grid_Header">
             <img alt="" src="Images/registration_icon.gif" onClick="Register_Pop('${EventDetails.Event_Seq}','${EventDetails.Name}')"/></display:column>
<%}%>
              <display:column style="width:1% ;" title="SUMM.&nbsp;|" headerClass="Grid_Header">
                  <a href="#" onClick="Events_Summary('${EventDetails.Event_Seq}','${EventDetails.Name}')"><img alt="" src="Images/summary_icon_6.jpg" /></a></display:column>

              <display:column style="width:1%" title="PREP."  headerClass="Grid_Header">
                  <img alt="" src="Images/Roster2.png" onClick="Events_Summary_Placement('${EventDetails.Event_Seq}','${EventDetails.Name}')"/></display:column>


        </display:table>

<%}
  }%>
<input type="hidden" name="PageID" value="PARTICIPANTS"/>
<input type="hidden" name="ShowSeq" value="<%=strShowSeq%>"/>
<input type="hidden" name="EventSeq" value=""/>
</form>
</body>
