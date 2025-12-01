
<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>
<%@page import="java.util.TreeMap"%>
<%@page import="javax.sql.rowset.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Map"%>
<%@ page import="pasotracker.GeneralServlet" %>
<link rel="stylesheet" href="Style_Popup.css">
        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
        <link href="buttons.css" rel="stylesheet" type="text/css" />
        <link href="frmReg_CommonRef.css" rel="stylesheet" type="text/css" />
       
<%
    List HorseList = new ArrayList();
	
    GeneralServlet gen=new GeneralServlet();
	 String showYear="";
	String strHdnRegSeq="";
	int totalPoints=0;

    
try
    {
    String ShowSeq="";
    String ShowName="";
    String ShowPlace="";
    String EventDate="";
    String strName="";
    String Placement="";
    String Points="";
   
	if(request.getParameter("rseq")!=null)
        strHdnRegSeq=request.getParameter("rseq");

	 if(request.getParameter("showYear")!=null)
        showYear=request.getParameter("showYear");

    //if(request.getParameter("sYr")!=null)
    //    showYear=request.getParameter("sYr");    
    RowSetFactory factory2 = RowSetProvider.newFactory();
   CachedRowSet crsGetShowHistory= factory2.createCachedRowSet();
  //  CachedRowSetImpl crsGetShowHistory = new CachedRowSetImpl();

    crsGetShowHistory = gen.Get_ShowHistory(strHdnRegSeq,showYear,"","");

    Map MpHorseDetails = new TreeMap();

    while (crsGetShowHistory.next())
    {
        ShowSeq="";
        ShowName="";
        ShowPlace="";
        EventDate="";
        strName="";
        Placement="";
        Points="";

        if(crsGetShowHistory.getString("Show_Seq")!=null)
            ShowSeq= crsGetShowHistory.getString("Show_Seq").trim();

        if(crsGetShowHistory.getString("Show_Name")!=null)
            ShowName= crsGetShowHistory.getString("Show_Name").trim();

        if(crsGetShowHistory.getString("Show_Place")!=null)
            ShowPlace= crsGetShowHistory.getString("Show_Place").trim();

        if(crsGetShowHistory.getString("EventDate")!=null)
            EventDate= crsGetShowHistory.getString("EventDate").trim();

        if(crsGetShowHistory.getString("Name")!=null)
            strName= crsGetShowHistory.getString("Name").trim();

        if(crsGetShowHistory.getString("Placement")!=null)
            Placement= crsGetShowHistory.getString("Placement").trim();

        if(crsGetShowHistory.getString("Points")!=null)
            Points= crsGetShowHistory.getString("Points").trim();
        else
            Points="0" ;

        totalPoints=totalPoints+Integer.parseInt(Points);

        MpHorseDetails = new TreeMap();
        MpHorseDetails.put("SHOWSEQ",ShowSeq);
        MpHorseDetails.put("SHOW",ShowName);
        MpHorseDetails.put("PLACE",ShowPlace);
        MpHorseDetails.put("DATE",EventDate);
        MpHorseDetails.put("EVENT",strName);

		if(Placement.equals("-1"))
            MpHorseDetails.put("STANDING","B");
        else
            MpHorseDetails.put("STANDING",Placement);

        if(Points.equals("0"))
            MpHorseDetails.put("POINTS","");
        else
            MpHorseDetails.put("POINTS",Points);

        HorseList.add(MpHorseDetails);

        }
    }
    catch(Exception ex)
    {
            ex.printStackTrace();

    }
    request.setAttribute("HorseList", HorseList);
%>
<!--</table>-->

<display:table  id="Details" name="requestScope.HorseList"
pagesize="100"
class="grid"
style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">
<display:setProperty name="basic.msg.empty_list" value="No Shows found "/>
 <display:setProperty name="paging.banner.item_name" value="Show" />
 <display:setProperty name="paging.banner.items_name" value="Shows" />

<display:column style="width:20%"   title="SHOW" property="SHOW" sortable="true" headerClass="Grid_Header"/>
<display:column style="width:10%"  property="PLACE" sortable="true" headerClass="Grid_Header" />
<display:column style="width:10%"  title="DATE"   sortable="true" property="DATE" headerClass="Grid_Header"/>
<display:column style="width:15%" property="EVENT" sortable="true" headerClass="Grid_Header" />
<display:column style="width:5%;text-align:center;" property="STANDING" sortable="true" headerClass="Grid_Header" />
<display:column style="width:5%;text-align:center;" property="POINTS" sortable="true"  headerClass="Grid_Header" />

</display:table>

<%
            if(totalPoints!=0)
            {
%>
<table>
            <tr>
				<td style="width:20%" ><b>TOTAL POINTS:</b></td>
				<td style="width:10%">&nbsp;</td>
				<td style="width:10%">&nbsp;</td>
				<td style="width:15%">&nbsp;</td>
				<td style="width:15%">&nbsp;</td>
				<td style="width:15%">&nbsp;</td>
				<td style="width:5%">&nbsp;</td>

				<td style="width:5%">
				<%=totalPoints%>
				</td>
            </tr>
</table>
<%
            }
%>
 <div id="footer_Bot" align="bottom">
    <jsp:include page="/frmBottom_Registration.jsp"/>
    </div>