


<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>


<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.net.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>


<%

String strSearchMode=request.getParameter("mode");
String strShowSeq=request.getParameter("ShowsSeq");
String strEventSeq=request.getParameter("EventSeq");
String strUserName="";


if(session.getAttribute("user")!=null)
        strUserName=(String)session.getAttribute("user");
if(strSearchMode!=null && strSearchMode.equals("0") )
 {

%>
<head>
    <script>
 

function PosAssign()
{
      
document.forms[0].method="post";
document.forms[0].action="servlet/Shows"
document.forms[0].submit();

}
    </script>
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="themes/base/jquery.ui.all.css"/>
<link href="style.css" rel="stylesheet" type="text/css" />


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
       <script type="text/javascript" src="scripts/Shows_Placement.js"></script>
   

 </head>
 <body>
     <form>
     
 
        
                   

  <%



 Connection localConnection=null;
 DbConnMngr dbcmt=new DbConnMngr();
 ArrayList AlEvents=new ArrayList();

 String strGroupSeq="";
 String strCheckGrpSeq="";
 String strStTime="";
 String strEndTime="";
 String strDuration="";
 String strType="";
 String strPublish="";
 int li=0;
try {
        localConnection=dbcmt.getConnection();
	localConnection.setAutoCommit(false);
        CallableStatement cst = localConnection.prepareCall("{call GET_EVENT_PARTICIPANTS(?,?)}");
        cst.setString(1, strShowSeq);
        cst.setString(2, strEventSeq);
        ResultSet rs2 = cst.executeQuery();


        Map map1 = new TreeMap();
        
         int Cnt=0;

        while(rs2.next())
        {
            
             map1 = new TreeMap();

            
               
                strGroupSeq=rs2.getString("GROUP_SEQ");
                
                 if(Cnt==0)
                   strCheckGrpSeq=strGroupSeq;
               
                if(!strCheckGrpSeq.equals(strGroupSeq))
                {
                    strCheckGrpSeq=strGroupSeq;

                    li=li+1;
                }

                 String strAssignNum="strAssignNum"+li;
                 String strPlacement="strPlacement"+li;
                 String strRegSeq="hdnRegNum"+li;
                 
                map1.put("Name",rs2.getString("HORSE_PRIMARYNAME"));
                map1.put("Age",rs2.getString("HAge"));
                map1.put("Sire",rs2.getString("SireName"));
                map1.put("Dam",rs2.getString("DamName"));
                map1.put("Owner",rs2.getString("OwnerName"));
                map1.put("Breeder",rs2.getString("BreederName"));
                map1.put("Rider",rs2.getString("HRider"));
                map1.put("Assigned",rs2.getString("AssignedNum"));
               
                map1.put("HDOB",rs2.getString("HDOB"));
                map1.put("Placement",rs2.getString("Placement"));
                map1.put("Points",rs2.getString("Points"));
                map1.put("GROUP_SEQ",strGroupSeq);

                 map1.put("Assigned_Name",strAssignNum);
                 map1.put("Placement_Name",strPlacement);
                 map1.put("HdnGroupSeq",strRegSeq);


                 map1.put("Event_Seq",rs2.getString("Event_Seq"));
                 map1.put("Reg_Num",rs2.getString("REGISTRATION_NUM"));
                 map1.put("Reg_Seq",rs2.getString("REGSEQ"));
                 map1.put("RiderSeq",rs2.getString("Rider"));
                 map1.put("RAGE",rs2.getString("Rider_Age"));
                 map1.put("Type",rs2.getString("Type"));

                 if(rs2.getString("OwnerID")!=null)
                    map1.put("OwnerID","("+rs2.getString("OwnerID") + ")");
                 else
                     map1.put("OwnerID","");

                 if(rs2.getString("BreederID")!=null)
                    map1.put("BreederID","("+rs2.getString("BreederID")+ ")");
                  else
                     map1.put("BreederID","");

                  if(rs2.getString("RiderID")!=null)
                     map1.put("RiderID","("+rs2.getString("RiderID")+ ")");
                  else
                     map1.put("RiderID","");

                 if(rs2.getString("EventStartDate")!=null)
                    strStTime=rs2.getString("EventStartDate");
                 if(rs2.getString("EventEndDate")!=null)
                    strEndTime=rs2.getString("EventEndDate");
                 
                  if(rs2.getString("Duration")!=null)
                    strDuration=rs2.getString("Duration");

                 if(rs2.getString("Type")!=null)
                     strType=rs2.getString("Type");

				 if(rs2.getString("PUBLISH")!=null)
					strPublish=rs2.getString("PUBLISH");


                  if(rs2.getString("OFF_REGNUM")!=null)
                      map1.put("OFF_REGNUM",rs2.getString("OFF_REGNUM"));
                

                  if(rs2.getString("OFF_HNAME")!=null)
                     map1.put("OFF_HNAME",rs2.getString("OFF_HNAME"));
                  

                
                 AlEvents.add(map1);
                 Cnt++;




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

 
            session.setAttribute("Data", AlEvents);

%>


 <fieldset>


<table width="100%">
  <tr>
    <td width="6%">
      <input class='button' type="button" value="ASSIGN" onClick="PosAssign()">
    </td>
    <td width="4%">
      <input class='button' type="button" value="START" onClick="startstop(1,'startTime','<%=strEventSeq%>');"
       >
    </td>
    <td width="20%"> <LABEL  id="startTime"  style="font-weight:bold"><%=strStTime%></LABEL></td>
    <!--<input id="clock" type="text" value="00:00:0" style="text-align: center;background-color:white;border:1px solid gray;font-weight:bold;font-size:14pt;" readonly> -->
    <td width="5%">
      <input class='button' id="resetbutton" type="button" value="STOP" onClick="startstop(2,'EndTime','<%=strEventSeq%>');">
    </td>
    <td width="20%"><LABEL  id="EndTime"  style="font-weight:bold"><%=strEndTime%></LABEL> </td>
    <td width="10%"><LABEL  style="font-weight:bold">DURATION:</LABEL> </td>
    <td width="51%"><LABEL  id="TOTAL"  style="font-weight:bold"><% if (strDuration.length() > 10 ) {out.println(strDuration.substring(10,strDuration.lastIndexOf('.'))); } %></LABEL> </td>
	 <td width="10%"><LABEL  style="font-weight:bold">PUBLISH</LABEL> </td>
    <td>
        <select id="publishFlag" name="publishFlag" style="background-color:  #FFF8DC; border:  1px solid #000000;"
                onchange="updPublish(this.value,'<%=strShowSeq%>','<%=strEventSeq%>')">
            <%
                String strSelected_Yes="";
                String strSelected_No="";
                String strNotSelected="";

                if(strPublish.equals("S"))
                  strSelected_Yes="SELECTED";
                else  if(strPublish.equals("N"))
                  strSelected_No="SELECTED";
                else
                  strNotSelected="SELECTED";
            %>
            <option value='0' <%=strNotSelected%> >SELECT</option>
            <option value='S' <%=strSelected_Yes%> >YES</option>
            <option value='N' <%=strSelected_No%> >NO</option>
        </select>
    </td>
    <input type="hidden" name="PageID" value="SHOWS_PLACEMENT"/>
 </table>




            </fieldset>


<tbody>

     <display:table  class="grid" id="Data"
                   name="sessionScope.Data"
                  
                   style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">

    <%=(li+1) +" Groups are Registered into this event" %>
    <% if(strType.equals("2"))  //Equitation
        {%>

     
      
       <display:column  style="width:1%;" headerClass="Grid_Header" group="1">
       <input  type="hidden"  size="1"  name="${Data.HdnGroupSeq}"  value="${Data.GROUP_SEQ}"
               style="background-color:  #FFF8DC; border:  1px solid #000000;"  >
       </display:column>

       <display:column style="width:10%" title="ASSIGNED#" headerClass="Grid_Header" group="2">
       <input  type="text"  size="4"   value="${Data.Assigned}"  name="${Data.Assigned_Name}"
               style="background-color:  #FFF8DC; border:  1px solid #000000; text-align:center" autocomplete='off' >
       </display:column>
       

       <display:column style="width:22%; text-transform: uppercase"   title="RIDER" property="Rider"  headerClass="Grid_Header" />
        <display:column style="width:5%; text-transform: uppercase;text-align:center"  title="AGE(YY)" property="RAGE"  headerClass="Grid_Header" />
       <display:column style="width:15%;text-transform: uppercase"    title="NAME" property="Name"  headerClass="Grid_Header"/>
      
       <display:column style="width:15%;text-transform: uppercase" title="SIRE" property="Sire"  headerClass="Grid_Header" />
      
       
       <display:column style="width:3%;text-transform: uppercase" title="Placement&nbsp;" headerClass="Grid_Header" group="3" >
       <input type="text" size="1" style="background-color:  #FFF8DC; border:  1px solid #000000;  text-align:center"
                  value="${Data.Placement}" >
       </display:column>
       <display:column style="width:3%;text-transform: uppercase" title="Points"  headerClass="Grid_Header" group="4">
           <input type="text" size="1" style="background-color:  #FFF8DC; border:  1px solid #000000;  text-align:center"
                  value="${Data.Points}" >
        </display:column>
        <display:column style="width:3%;" headerClass="Grid_Header"  >
            <img alt="" src="Images/pencil_icon.gif" onClick="Edit_Participants('${Data.Event_Seq}','${Data.Reg_Seq}','${Data.Reg_Num}','${Data.RiderSeq}','${Data.Type}')"/> </display:column>
        <% if( strUserName.equalsIgnoreCase("WILLMANRODZ")  || strUserName.equalsIgnoreCase("WILLMANRODZ@HOTMAIL.COM")   )  {
					  //strUserName.equalsIgnoreCase("R.VALCOURT69@GMAIL.COM")  ||
					  %>
            <display:column style="width:5%;" headerClass="Grid_Header"  group="6" >
            &nbsp;</display:column>
             <%} else {%>
             <display:column style="width:5%;" headerClass="Grid_Header"  group="6" >
                <img alt="" src="Images/delete.png" onClick="Delete_Participants('${Data.GROUP_SEQ}')"/> </display:column>
              <%}%>
		<display:footer>
		<tr><HR></tr>
			<tr>
				<td colspan=4><font size=5><b>TOTAL PARTICIPANTS :</b></font></td>
				<td ><font size=5><b><%=AlEvents.size()%></b></font></td>
			<tr>
		</display:footer>
       
 <%}

        else
        {%>

    
       <display:column  style="width:1%;" headerClass="Grid_Header" group="1">
       <input  type="hidden"  size="1"  name="${Data.HdnGroupSeq}"  value="${Data.GROUP_SEQ}"
                 >
       </display:column>

       <display:column style="width:5%" title="Assigned#" headerClass="Grid_Header" group="2">
       <input  type="text"  size="4"   value="${Data.Assigned}"  name="${Data.Assigned_Name}"
               style="background-color:  #FFF8DC; border:  1px solid #000000; text-align:center" autocomplete='off'>
       </display:column>


       <display:column style="width:15%;text-transform: uppercase" title="Name/Reg#"  headerClass="Grid_Header">
           <span onClick="Open_Notes('${Data.Reg_Seq}','${Data.GROUP_SEQ}')"><font color="black">${Data.Name}</font></span> <br> <span> <font color="#800080">${Data.Reg_Num}</font></span><br>
          <!-- <span><font color="black">${Data.OFF_HNAME}</font></span> <br> <span> <font color="#800080">${Data.OFF_REGNUM}</font></span> -->
       </display:column>

       <display:column style="width:10%;text-transform: uppercase; font-size:10" property="Age"  headerClass="Grid_Header" />
       <display:column style="width:15%;text-transform: uppercase;font-size:10"   property="Sire" headerClass="Grid_Header" />
        <display:column style="width:15%;text-transform: uppercase; font-size:10" property="Dam"  headerClass="Grid_Header" />
          
      
       <display:column style="width:20%;text-transform: uppercase" title="Owner"  headerClass="Grid_Header" >
       <font size="1"><span>${Data.Owner} </span> <span style="color: #800080;">${Data.OwnerID}</span> </font> </display:column>

       <display:column style="width:20%;text-transform: uppercase" title="Breeder"  headerClass="Grid_Header" >
         <font size="1"><span> ${Data.Breeder}</span> <span style="color: #800080;"> ${Data.BreederID}</span></font>
       </display:column>

       

       <display:column style="width:15%;text-transform: uppercase" title="Rider"  headerClass="Grid_Header" >
       <font size="1"><span>${Data.Rider} </span> <span style="color: #800080;">${Data.RiderID} </span></font>
        </display:column>
       <display:column style="width:5%;text-transform: uppercase" title="Pos&nbsp;" headerClass="Grid_Header" group="3" >
       <input type="text" name="${Data.Placement_Name}" size="1" style="background-color:  #FFF8DC; border:  1px solid #000000;  text-align:center"
                  value="${Data.Placement}" >
       </display:column>
       <display:column style="width:5%;text-transform: uppercase" title="Points"  headerClass="Grid_Header" group="4">
           <input type="text" size="1" style="background-color:  #FFF8DC; border:  1px solid #000000;  text-align:center"
                  value="${Data.Points}" >
        </display:column>
        <display:column style="width:5%;" headerClass="Grid_Header"   group="5" >
            <img alt="" src="Images/pencil_icon.gif"  onClick="Edit_Participants('${Data.Event_Seq}','${Data.Reg_Seq}','${Data.Reg_Num}','${Data.RiderSeq}','${Data.Type}','${Data.GROUP_SEQ}')"/> </display:column>

        <% if(strUserName.equalsIgnoreCase("WILLMANRODZ")  || strUserName.equalsIgnoreCase("WILLMANRODZ@HOTMAIL.COM")   )  {
			//strUserName.equalsIgnoreCase("R.VALCOURT69@GMAIL.COM")  || 
			%>
            <display:column style="width:5%;" headerClass="Grid_Header"  group="6" >
            &nbsp;</display:column>
             <%} else {%>
             <display:column style="width:5%;" headerClass="Grid_Header"  group="6" >
                <img alt="" src="Images/delete.png" onClick="Delete_Participants('${Data.GROUP_SEQ}')"/> </display:column>
              <%}%>

			<display:footer>
		<tr><HR></tr>
			<tr>
				<td colspan=5><font size=5><b>TOTAL&nbsp;PARTICIPANTS :</b></font></td>
				<td ><font size=5><b><%=AlEvents.size()%></b></font></td>
			<tr>
		</display:footer>

 <%}
        %>
         </display:table>
        <input type="hidden" name="EventsSize" value="<%=(li+1)%>"/>
        <input type="hidden" name="EventSeq" value="<%=strEventSeq%>"/>

 <%}
        %>

</tbody>
        </table>


 </form>

 </body>

