<%--
    Document   : regsearchpopup_include
    Created on : Apr 28, 2011, 3:46:48 PM
    Author     : Erzath
--%>

<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    
   
<style type="text/css">
<!--
@import url("CommonTableStyle.css");
-->

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
function ListEvents(RegNum)
{
        document.forms[0].target="_self";
       // window.parent.document.getElementById(‘ShowName’).value=SelValue
        document.forms[0].method="post";
        document.forms[0].action="index.jsp?mode=2&RegNo="+RegNum;
        document.forms[0].submit();
 }

  function returnValues(strValues,strHorseName,strREGSEQ)
       {            
            
            if(window.parent.document.forms[0].name=="Registrationform")
            {
                window.parent.document.forms[0].target="_self";
                window.parent.document.forms[0].method="post";
                window.parent.document.forms[0].action="index.jsp?Mode=2&RegNo="+strREGSEQ;
                window.parent.document.forms[0].submit();
            }
            else if(window.parent.document.forms[0].name=="images_frm")
            {
                window.parent.document.forms[0].target="_self";
                window.parent.document.forms[0].method="post";
                window.parent.document.forms[0].action="Images.jsp?Mode=2&RegNo="+strREGSEQ;
                window.parent.document.forms[0].submit();
            }
            else if(window.parent.document.forms[0].name=="Head_frm")
            {
                window.parent.document.forms[0].target="_self";
                window.parent.document.forms[0].method="post";
                window.parent.document.forms[0].action="Markings.jsp?Mode=2&RegNo="+strREGSEQ;
                window.parent.document.forms[0].submit();
            }
            else if(window.parent.document.forms[0].name=="ForeLeg_frm")
            {
                window.parent.document.forms[0].target="_self";
                window.parent.document.forms[0].method="post";
                window.parent.document.forms[0].action="frmForeLeg.jsp?Mode=2&RegNo="+strREGSEQ;
                window.parent.document.forms[0].submit();
            }
            else if(window.parent.document.forms[0].name=="HindLeg_frm")
            {
                window.parent.document.forms[0].target="_self";
                window.parent.document.forms[0].method="post";
                window.parent.document.forms[0].action="frmHindLeg.jsp?Mode=2&RegNo="+strREGSEQ;
                window.parent.document.forms[0].submit();
            }
            else if(window.parent.document.forms[0].name=="OtherMarkings_frm")
            {
                window.parent.document.forms[0].target="_self";
                window.parent.document.forms[0].method="post";
                window.parent.document.forms[0].action="frmOtherMarkings.jsp?Mode=2&RegNo="+strREGSEQ;
                window.parent.document.forms[0].submit();
            }
            else if(window.parent.document.forms[0].name=="pedigree_frm")
            {
                window.parent.document.forms[0].target="_self";
                window.parent.document.forms[0].method="post";
                window.parent.document.forms[0].action="frmPedigree.jsp?Mode=2&RegNo="+strREGSEQ;
                window.parent.document.forms[0].submit();
            }
            else if(window.parent.document.forms[0].name=="OwnersHistory_frm")
            {
                window.parent.document.forms[0].target="_self";
                window.parent.document.forms[0].method="post";
                window.parent.document.forms[0].action="frmOwnersHistory.jsp?Mode=2&RegNo="+strREGSEQ;
                window.parent.document.forms[0].submit();
            }
            else if(window.parent.document.forms[0].name=="ShowHistory_frm")
            {
                window.parent.document.forms[0].target="_self";
                window.parent.document.forms[0].method="post";
                window.parent.document.forms[0].action="frmRegistration.jsp?Mode=2&RegNo="+strREGSEQ;
                window.parent.document.forms[0].submit();
            }
            else if(window.parent.document.forms[0].name=="Championship_frm")
            {
                window.parent.document.forms[0].target="_self";
                window.parent.document.forms[0].method="post";
                window.parent.document.forms[0].action="frmChampionship.jsp?Mode=2&RegNo="+strREGSEQ;
                window.parent.document.forms[0].submit();
            }
            else if(window.parent.document.forms[0].name=="Documents_frm")
            {
                window.parent.document.forms[0].target="_self";
                window.parent.document.forms[0].method="post";
                window.parent.document.forms[0].action="frmDocuments.jsp?Mode=2&RegNo="+strREGSEQ;
                window.parent.document.forms[0].submit();
            }
            /////Veera Begin
            else if(window.parent.document.forms[0].name=="frmRegistrationSearch")
            {
                if(window.parent.document.getElementById("HdnRegSearchType").value=="HorseReg")
                {
                   window.parent.document.getElementById("regno").value=strValues;
                   window.parent.document.getElementById("HorseName").value=strHorseName;
                   window.parent.document.getElementById("HdnRegSeq").value=strREGSEQ;
                }
                
                else if(window.parent.document.getElementById("HdnRegSearchType").value=="PedigreeReg")
                {                   
                   window.parent.document.getElementById("InPedigree").value=strValues;
                   window.parent.document.getElementById("InPedigreeName").value=strHorseName;
                   window.parent.document.getElementById("InPedigreeSeq").value=strREGSEQ;
                }
                window.parent.jQuery('#dialog-Reg').dialog('close')
            }
            //////////////Veera End

            else if(window.parent.document.forms[0].name=="Observations_frm")
            {
                window.parent.document.forms[0].target="_self";
                window.parent.document.forms[0].method="post";
                window.parent.document.forms[0].action="frmObservations.jsp?Mode=1&RegSeq="+strREGSEQ;
                window.parent.document.forms[0].submit();
            }

			///////////////Veera Begin

            else if(window.parent.document.forms[0].name=="frmPedigreeDetails")
            {
                window.parent.document.forms[0].target="_self";
                window.parent.document.forms[0].method="post";
                window.parent.document.forms[0].action="frmPedigreeDetails.jsp?Seq="+strREGSEQ;
                window.parent.document.forms[0].submit();
            }
			/////////////VeeraEnd
       }
</script>
 <link href="Tables_style.css" rel="stylesheet" type="text/css" />

    <%@ page import="java.util.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.rowset.*" %>
    <%@ page import="pasotracker.DBConnection" %>
    <%@ page import="pasotracker.GeneralServlet" %>

    <body>
        
      <form name="frm_regsearchpopup_include" method="post">




<%
        String strMode="";
        if(request.getParameter("mode")!=null)
            strMode=request.getParameter("mode");//

        String RegSeq="";
        String str_Reg_no1="";
        String strHor_PName1="";
        String strHor_DOB1="";
        String strmem_lname="";
        String strmem_mname="";
        String strOwnerName="";
        
        int crsSize_All;                        
        
        //if(strMode.equals("1")) // Search Mode is 1 list the horses
         //{                    
%>
        <%@ include file="regsearchpopup.jsp" %>
         <div id="maincontent">
        <div class="innertube">

<%
             if(request.getParameter("hor_name")!=null)
              {
                 strHor_PName=request.getParameter("hor_name");   
                
            }
            

            if(request.getParameter("regno")!=null)
             {
                 str_Reg_no=request.getParameter("regno");
                 
            }
            

            if(request.getParameter("dob")!=null)
                strHor_DOB=request.getParameter("dob");

            if(request.getParameter("owner")!=null)
                strmem_name=request.getParameter("owner");

            if(request.getParameter("microchip_num")!=null)
                strmicro_num=request.getParameter("microchip_num");


         List HorseList = new ArrayList();
        try
        {
            REGSEQ="";
            str_Reg_no="";
            strHor_PName="";
            strHor_DOB="";
            strmem_name="";
            strmicro_num="";
            strRegistration_Type="";
            
            GeneralServlet gen=new GeneralServlet();
RowSetFactory factory12 = RowSetProvider.newFactory();
   CachedRowSet crsGetHorseDetails= factory12.createCachedRowSet();
           // CachedRowSetImpl crsGetHorseDetails = new CachedRowSetImpl();

            crsGetHorseDetails = gen.GetHorseDetails(REGSEQ,str_Reg_no,strHor_PName,strHor_DOB,strmem_name,strmicro_num,strRegistration_Type);

            Map MpHorseDetails = new TreeMap();
            
            crsSize_All = crsGetHorseDetails.size();
            
            while (crsGetHorseDetails.next())
            {

                str_Reg_no1="";
                strHor_PName1="";
                strHor_DOB1="";
                strmem_name="";
                strmicro_num="";

                if(crsGetHorseDetails.getString("REGSEQ")!=null)
                    RegSeq= crsGetHorseDetails.getString("REGSEQ");

                if(crsGetHorseDetails.getString("REGISTRATION_NUM")!=null)
                    str_Reg_no1= crsGetHorseDetails.getString("REGISTRATION_NUM");

                if(crsGetHorseDetails.getString("HORSE_PRIMARYNAME")!=null)
                    strHor_PName1= crsGetHorseDetails.getString("HORSE_PRIMARYNAME");

                if(crsGetHorseDetails.getString("HORSE_DOB")!=null)
                    strHor_DOB1= crsGetHorseDetails.getString("HORSE_DOB");

                if(crsGetHorseDetails.getString("FIRSTNAME")!=null)
                    strmem_name= crsGetHorseDetails.getString("FIRSTNAME");

                if(crsGetHorseDetails.getString("MICROCHIP_NUM")!=null)
                    strmicro_num= crsGetHorseDetails.getString("MICROCHIP_NUM");
                    
                 if(crsGetHorseDetails.getString("LASTNAME")!=null)
                    strmem_lname= crsGetHorseDetails.getString("LASTNAME").trim();
          
                if(crsGetHorseDetails.getString("SUFFIX")!=null)
                    strmem_mname= crsGetHorseDetails.getString("SUFFIX").trim();
                    
                strOwnerName = strmem_name+" "+strmem_mname+" "+strmem_lname;

                    MpHorseDetails = new TreeMap();
                    MpHorseDetails.put("REGSEQ",RegSeq);
                    MpHorseDetails.put("HORSENAME",strHor_PName1);
                    MpHorseDetails.put("REG",str_Reg_no1);
                    MpHorseDetails.put("DOB",strHor_DOB1);
                    MpHorseDetails.put("OWNER",strOwnerName);
                    MpHorseDetails.put("MCHIP",strmicro_num);

                    HorseList.add(MpHorseDetails);
            }
            out.println(crsSize_All+" items found");
        }
        catch(Exception ex)
        {
                ex.printStackTrace();

        }

        request.setAttribute("HorseList", HorseList);
        
%>


  <display:table  id="Details" name="requestScope.HorseList"
                         defaultsort="2" defaultorder="ascending"
                        class="grid"
                        style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">
        
        <display:column style="width:1%" headerClass="Grid_Header">
        <input type="radio" name="checkedVal" onclick="returnValues('${Details.REG}','${Details.HORSENAME}','${Details.REGSEQ}')" /></display:column>
        <display:column style="width:20%"   title="HORSE NAME" property="HORSENAME" sortable="true" headerClass="Grid_Header" />            
        <display:column style="width:10%"  property="REG" sortable="true" headerClass="Grid_Header" />        
        <display:column style="width:10%" property="DOB"  sortable="true" headerClass="Grid_Header" />
        <display:column style="width:15%" property="OWNER" headerClass="Grid_Header" />
        <display:column style="width:5%" property="MCHIP" headerClass="Grid_Header" />
        </display:table>

</div>
</div>
    </form>
    </body>
</html>
