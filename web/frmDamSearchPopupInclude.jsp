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

 function returnValues(strValues,strHorseName,strRegSeq)
{
    if(window.parent.document.forms[0].name=="frmRegistrationSearch")
    {
        window.parent.document.getElementById("TxtDam").value=strValues;
        window.parent.document.getElementById("TxtDamName").value=strHorseName;
        window.parent.document.getElementById("TxtDamSeq").value=strRegSeq;
    }
    window.parent.jQuery('#dialog-DamReg').dialog('close')

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

      <form name="frmDamSearchPopupInclude" method="post">

        <%@ include file="frmDamSearchPopup.jsp" %>

       <div id="maincontent">
        <div class="innertube">


<%
        String RegSeq="";
        String str_Reg_no1="";
        String strHor_PName1="";
        String strHor_DOB1="";
        String strmem_mname = "";
        String strmem_lname = "";
        String strOwnerName="";



        String REGSEQ="";
        

         List HorseList = new ArrayList();
        try
        {

            GeneralServlet gen=new GeneralServlet();
 RowSetFactory factory96 = RowSetProvider.newFactory();
   CachedRowSet crsGetHorseDetails= factor962.createCachedRowSet();
           // CachedRowSetImpl crsGetHorseDetails = new CachedRowSetImpl();

                crsGetHorseDetails = gen.GET_DAM(REGSEQ,str_Reg_no,strHor_PName,strHor_DOB,strmem_name,strmicro_num,strRegistration_Type);

            Map MpHorseDetails = new TreeMap();

            while (crsGetHorseDetails.next())
            {

                str_Reg_no1="";
                strHor_PName1="";
                strHor_DOB1="";
                strmem_name="";
                strmicro_num="";
                strmem_mname = "";
                strmem_lname = "";

                if(crsGetHorseDetails.getString("REGSEQ")!=null)
                    RegSeq= crsGetHorseDetails.getString("REGSEQ");

                if(crsGetHorseDetails.getString("REGISTRATION_NUM")!=null)
                    str_Reg_no1= crsGetHorseDetails.getString("REGISTRATION_NUM");

                if(crsGetHorseDetails.getString("HORSE_PRIMARYNAME")!=null)
                    strHor_PName1= crsGetHorseDetails.getString("HORSE_PRIMARYNAME");

                if(crsGetHorseDetails.getString("DOB")!=null)
                    strHor_DOB1= crsGetHorseDetails.getString("DOB");

                if(crsGetHorseDetails.getString("FIRSTNAME")!=null)
                    strmem_name= crsGetHorseDetails.getString("FIRSTNAME");
                
                if(crsGetHorseDetails.getString("LASTNAME")!=null)
                    strmem_lname= crsGetHorseDetails.getString("LASTNAME").trim();
                
                if(crsGetHorseDetails.getString("SUFFIX")!=null)
                    strmem_mname= crsGetHorseDetails.getString("SUFFIX").trim();

                if(crsGetHorseDetails.getString("MICROCHIP_NUM")!=null)
                    strmicro_num= crsGetHorseDetails.getString("MICROCHIP_NUM");

                strOwnerName=strmem_name+" "+strmem_mname+" "+strmem_lname;
                    
                    MpHorseDetails = new TreeMap();
                    MpHorseDetails.put("HORSENAME",strHor_PName1);
                    MpHorseDetails.put("REG",str_Reg_no1);
                    MpHorseDetails.put("DOB",strHor_DOB1);
                    MpHorseDetails.put("OWNER",strOwnerName);
                    MpHorseDetails.put("MCHIP",strmicro_num);
                    MpHorseDetails.put("REGSEQ",RegSeq);


                    HorseList.add(MpHorseDetails);
            }
        }
        catch(Exception ex)
        {
                ex.printStackTrace();

        }

        request.setAttribute("HorseList", HorseList);
%>


  <display:table  id="Details" name="requestScope.HorseList"
                        pagesize="100" defaultsort="1" defaultorder="ascending"
                        class="grid"
                        style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">
        <display:setProperty name="basic.msg.empty_list" value="No Horses found with the Search Critera "/>
        <display:column style="width:1%" headerClass="Grid_Header">
        <input type="radio" name="checkedVal" onclick="returnValues('${Details.REG}','${Details.HORSENAME}','${Details.REGSEQ}')" /></display:column>
        <display:column style="width:20%"   title="HORSE NAME"  property="HORSENAME" sortable="true" headerClass="Grid_Header"/>
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
