<%--
    Document   : frmPedigreeDetails
    Created on : Jun 7, 2011, 6:55:02 PM
    Author     : veera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>


        <%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.DBConnection" %>
<%@ page import="pasotracker.GeneralServlet" %>


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
<script type="text/javascript" src="jscRegistrationSearch.js"></script>

<link href="PedigreeSearchPopupStyle.css" rel="stylesheet" type="text/css" />
 <link href="Style_Popup.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/interface.js"></script>
 <script type="text/javascript">




function ReturnPedigreeDetails(RegNo)
{
    document.forms[0].method="post";
    document.forms[0].action="frmPedigreeDetails.jsp?Seq="+RegNo;
    document.forms[0].target="_self"
    document.forms[0].submit();

}
</script>

<style type="text/CSS">
    #container1 {
	width:100%;
	margin:auto;
}

#content1 {
	float:right;
	width:100%;
        margin:auto;
}

</style>


    </head>
    <body>
        <form name="frmPedigreeDetails">

            <%--<%@ include file="frmPedigreeInclude.jsp"%>--%>

            <div id="container1">

<%

try{

            String strSire="";
            String strSireSeq="";
            String strDam="";
            String strDamSeq="";
            String strSire_Name="";
            String strDam_Name="";
            String strSireAño="";
            String strDamAño="";

            String strSire_1="";
            String strSireSeq_1="";
            String strSireAño_1="";
            String strDam_1="";
            String strDamSeq_1="";
            String strDamAño_1="";
            String strSire_Name_1="";
            String strDam_Name_1="";

            String strSire_1_2="";
            String strSireSeq_1_2="";
            String strSireAño_1_2="";
            String strDam_1_2="";
            String strDamSeq_1_2="";
            String strDamAño_1_2="";
            String strSire_Name_1_2="";
            String strDam_Name_1_2="";

            String strSire_2_1="";
            String strSireSeq_2_1="";
            String strSireAño_2_1="";
            String strDam_2_1="";
            String strDamSeq_2_1="";
            String strDamAño_2_1="";
            String strSire_Name_2_1="";
            String strDam_Name_2_1="";

            String strSire_2_2="";
            String strSireSeq_2_2="";
            String strSireAño_2_2="";
            String strDam_2_2="";
            String strDamSeq_2_2="";
            String strDamAño_2_2="";
            String strSire_Name_2_2="";
            String strDam_Name_2_2="";

            String strSire_2_3="";
            String strSireSeq_2_3="";
            String strSireAño_2_3="";
            String strDam_2_3="";
            String strDamSeq_2_3="";
            String strDamAño_2_3="";
            String strSire_Name_2_3="";
            String strDam_Name_2_3="";

            String strSire_2_4="";
            String strSireSeq_2_4="";
            String strSireAño_2_4="";
            String strDam_2_4="";
            String strDamSeq_2_4="";
            String strDamAño_2_4="";
            String strSire_Name_2_4="";
            String strDam_Name_2_4="";

            String str_reggno="";
            String strRegSeq="";
            String strRegNum="";
            String strHorseName="";
            String strGender="";
            String strDOB="";
            String strColor="";
            String strModality="";
            String strAño="";
            String strAge="";
            String strOwnerName="";
            String  strPrimaryName="";
            String strSecondaryName="";
			
			String age_Months="";
		    String age_Days="";

            if(request.getParameter("Seq")!=null)
                str_reggno=request.getParameter("Seq");           

RowSetFactory factory23 = RowSetProvider.newFactory();
   CachedRowSet crsGetPedigreeDetails= factory23.createCachedRowSet();
            //CachedRowSetImpl crsGetPedigreeDetails = new CachedRowSetImpl();

            GeneralServlet gen=new GeneralServlet();

            crsGetPedigreeDetails = gen.GetPedigree(str_reggno);

            if(crsGetPedigreeDetails.next())
            {
                if(crsGetPedigreeDetails.getString("SIRE")!=null)
                    strSire=crsGetPedigreeDetails.getString("SIRE").trim();

                if(crsGetPedigreeDetails.getString("SIRESEQ")!=null)
                    strSireSeq=crsGetPedigreeDetails.getString("SIRESEQ").trim();


                if(crsGetPedigreeDetails.getString("Sire_Name")!=null)
                    strSire_Name=crsGetPedigreeDetails.getString("Sire_Name").trim();

                if(crsGetPedigreeDetails.getString("DAM")!=null)
                    strDam=crsGetPedigreeDetails.getString("DAM").trim();

                if(crsGetPedigreeDetails.getString("DAMSEQ")!=null)
                    strDamSeq=crsGetPedigreeDetails.getString("DAMSEQ").trim();

                if(crsGetPedigreeDetails.getString("Dam_name")!=null)
                    strDam_Name=crsGetPedigreeDetails.getString("Dam_name").trim();

                if(crsGetPedigreeDetails.getString("REGSEQ")!=null)
                    strRegSeq=crsGetPedigreeDetails.getString("REGSEQ").trim();

                if(crsGetPedigreeDetails.getString("REGISTRATION_NUM")!=null)
                    strRegNum=crsGetPedigreeDetails.getString("REGISTRATION_NUM").trim();


//                if(crsGetPedigreeDetails.getString("HORSENAME")!=null)
  //                  strHorseName=crsGetPedigreeDetails.getString("HORSENAME").trim();

				if(crsGetPedigreeDetails.getString("HORSE_PRIMARYNAME")!=null)
				strPrimaryName=crsGetPedigreeDetails.getString("HORSE_PRIMARYNAME").trim();


				if(crsGetPedigreeDetails.getString("HORSE_SECONDARYNAME")!=null)
				strSecondaryName=crsGetPedigreeDetails.getString("HORSE_SECONDARYNAME").trim();

				strHorseName=strPrimaryName+' '+strSecondaryName;
                           


                if(crsGetPedigreeDetails.getString("HORSE_GENDER")!=null)
                    strGender=crsGetPedigreeDetails.getString("HORSE_GENDER").trim();




                //if(crsGetPedigreeDetails.getString("HORSE_DOB")!=null)
                  //  strDOB=crsGetPedigreeDetails.getString("HORSE_DOB").trim();

                if(crsGetPedigreeDetails.getString("DOB")!=null)
                    strDOB=crsGetPedigreeDetails.getString("DOB").trim();

                //if(crsGetPedigreeDetails.getString("HORSE_COLOR")!=null)
                  //  strColor=crsGetPedigreeDetails.getString("HORSE_COLOR").trim();

                if(crsGetPedigreeDetails.getString("COLOR")!=null)
                    strColor=crsGetPedigreeDetails.getString("COLOR").trim();

                //if(crsGetPedigreeDetails.getString("HORSE_AIRE")!=null)
                  //  strModality=crsGetPedigreeDetails.getString("HORSE_AIRE").trim();

                if(crsGetPedigreeDetails.getString("MODALITY")!=null)
                    strModality=crsGetPedigreeDetails.getString("MODALITY").trim();


                if(crsGetPedigreeDetails.getString("AñO")!=null)
                    strAño=crsGetPedigreeDetails.getString("AñO").trim();

				/*
                if(crsGetPedigreeDetails.getString("Age")!=null)
                    strAge=crsGetPedigreeDetails.getString("Age").trim();
				*/
				if(crsGetPedigreeDetails.getString("MONTH")!=null)                     
					age_Months= crsGetPedigreeDetails.getString("MONTH").trim()+"M";
				else
					age_Months="";
				
				if(crsGetPedigreeDetails.getString("DAYS")!=null)                     
					age_Days= crsGetPedigreeDetails.getString("DAYS").trim()+"D";
				else
					age_Days="";
				
				strAge=age_Months+' '+age_Days;
                                
                if(crsGetPedigreeDetails.getString("OwnerName")!=null)
                    strOwnerName=crsGetPedigreeDetails.getString("OwnerName").trim();

            }


            //1st generation sire
            crsGetPedigreeDetails = gen.GetPedigree(strSireSeq);

            if(crsGetPedigreeDetails.next())
            {
                if(crsGetPedigreeDetails.getString("SIRE")!=null)
                    strSire_1=crsGetPedigreeDetails.getString("SIRE").trim();

                if(crsGetPedigreeDetails.getString("SIRESEQ")!=null)
                    strSireSeq_1=crsGetPedigreeDetails.getString("SIRESEQ").trim();

                if(crsGetPedigreeDetails.getString("Sire_Name")!=null)
                    strSire_Name_1=crsGetPedigreeDetails.getString("Sire_Name").trim();

                if(crsGetPedigreeDetails.getString("DAM")!=null)
                    strDam_1=crsGetPedigreeDetails.getString("DAM").trim();

                if(crsGetPedigreeDetails.getString("DAMSEQ")!=null)
                    strDamSeq_1=crsGetPedigreeDetails.getString("DAMSEQ").trim();

                if(crsGetPedigreeDetails.getString("Dam_name")!=null)
                    strDam_Name_1=crsGetPedigreeDetails.getString("Dam_name").trim();


            }
            

            //1st generation dam
            crsGetPedigreeDetails = gen.GetPedigree(strDamSeq);

            if(crsGetPedigreeDetails.next())
            {
                if(crsGetPedigreeDetails.getString("SIRE")!=null)
                    strSire_1_2=crsGetPedigreeDetails.getString("SIRE").trim();

                if(crsGetPedigreeDetails.getString("SIRESEQ")!=null)
                    strSireSeq_1_2=crsGetPedigreeDetails.getString("SIRESEQ").trim();

                if(crsGetPedigreeDetails.getString("Sire_Name")!=null)
                    strSire_Name_1_2=crsGetPedigreeDetails.getString("Sire_Name").trim();

                if(crsGetPedigreeDetails.getString("DAM")!=null)
                    strDam_1_2=crsGetPedigreeDetails.getString("DAM").trim();

                if(crsGetPedigreeDetails.getString("DAMSEQ")!=null)
                    strDamSeq_1_2=crsGetPedigreeDetails.getString("DAMSEQ").trim();

                if(crsGetPedigreeDetails.getString("Dam_name")!=null)
                    strDam_Name_1_2=crsGetPedigreeDetails.getString("Dam_name").trim();
            }

            

            //2nd generation 1
            crsGetPedigreeDetails = gen.GetPedigree(strSireSeq_1);

            if(crsGetPedigreeDetails.next())
            {
                if(crsGetPedigreeDetails.getString("SIRE")!=null)
                    strSire_2_1=crsGetPedigreeDetails.getString("SIRE").trim();

                if(crsGetPedigreeDetails.getString("SIRESEQ")!=null)
                    strSireSeq_2_1=crsGetPedigreeDetails.getString("SIRESEQ").trim();


                if(crsGetPedigreeDetails.getString("Sire_Name")!=null)
                    strSire_Name_2_1=crsGetPedigreeDetails.getString("Sire_Name").trim();

                if(crsGetPedigreeDetails.getString("DAM")!=null)
                    strDam_2_1=crsGetPedigreeDetails.getString("DAM").trim();

                if(crsGetPedigreeDetails.getString("DAMSEQ")!=null)
                    strDamSeq_2_1=crsGetPedigreeDetails.getString("DAMSEQ").trim();

                if(crsGetPedigreeDetails.getString("Dam_name")!=null)
                    strDam_Name_2_1=crsGetPedigreeDetails.getString("Dam_name").trim();

            }

            //2nd generation 2
            crsGetPedigreeDetails = gen.GetPedigree(strDamSeq_1);

            if(crsGetPedigreeDetails.next())
            {
                if(crsGetPedigreeDetails.getString("SIRE")!=null)
                    strSire_2_2=crsGetPedigreeDetails.getString("SIRE").trim();

                if(crsGetPedigreeDetails.getString("SIRESEQ")!=null)
                    strSireSeq_2_2=crsGetPedigreeDetails.getString("SIRESEQ").trim();


                if(crsGetPedigreeDetails.getString("Sire_Name")!=null)
                    strSire_Name_2_2=crsGetPedigreeDetails.getString("Sire_Name").trim();

                if(crsGetPedigreeDetails.getString("DAM")!=null)
                    strDam_2_2=crsGetPedigreeDetails.getString("DAM").trim();

                if(crsGetPedigreeDetails.getString("DAMSEQ")!=null)
                    strDamSeq_2_2=crsGetPedigreeDetails.getString("DAMSEQ").trim();

                if(crsGetPedigreeDetails.getString("Dam_name")!=null)
                    strDam_Name_2_2=crsGetPedigreeDetails.getString("Dam_name").trim();

            }

            //2nd generation 3
            crsGetPedigreeDetails = gen.GetPedigree(strSireSeq_1_2);

            if(crsGetPedigreeDetails.next())
            {
                if(crsGetPedigreeDetails.getString("SIRE")!=null)
                    strSire_2_3=crsGetPedigreeDetails.getString("SIRE").trim();

                if(crsGetPedigreeDetails.getString("SIRESEQ")!=null)
                    strSireSeq_2_3=crsGetPedigreeDetails.getString("SIRESEQ").trim();

                if(crsGetPedigreeDetails.getString("Sire_Name")!=null)
                    strSire_Name_2_3=crsGetPedigreeDetails.getString("Sire_Name").trim();

                if(crsGetPedigreeDetails.getString("DAM")!=null)
                    strDam_2_3=crsGetPedigreeDetails.getString("DAM").trim();

                if(crsGetPedigreeDetails.getString("DAMSEQ")!=null)
                    strDamSeq_2_3=crsGetPedigreeDetails.getString("DAMSEQ").trim();

                if(crsGetPedigreeDetails.getString("Dam_name")!=null)
                    strDam_Name_2_3=crsGetPedigreeDetails.getString("Dam_name").trim();


            }

            //2nd generation 4
            crsGetPedigreeDetails = gen.GetPedigree(strDamSeq_1_2);

            if(crsGetPedigreeDetails.next())
            {
                if(crsGetPedigreeDetails.getString("SIRE")!=null)
                    strSire_2_4=crsGetPedigreeDetails.getString("SIRE").trim();

                if(crsGetPedigreeDetails.getString("SIRESEQ")!=null)
                    strSireSeq_2_4=crsGetPedigreeDetails.getString("SIRESEQ").trim();

                if(crsGetPedigreeDetails.getString("Sire_Name")!=null)
                    strSire_Name_2_4=crsGetPedigreeDetails.getString("Sire_Name").trim();

                if(crsGetPedigreeDetails.getString("DAM")!=null)
                    strDam_2_4=crsGetPedigreeDetails.getString("DAM").trim();

                if(crsGetPedigreeDetails.getString("DAMSEQ")!=null)
                    strDamSeq_2_4=crsGetPedigreeDetails.getString("DAMSEQ").trim();


                if(crsGetPedigreeDetails.getString("Dam_name")!=null)
                    strDam_Name_2_4=crsGetPedigreeDetails.getString("Dam_name").trim();

            }

%>


<div id="content1">

<fieldset> <legend>Horse Details:</legend>

           <table class="altRow">
                <tr>
                    <td width="30px" style="font-weight:bold;">NAME:</td>
                    <td  colspan="8">
                      <label  id="Horsename"   style="text-transform:uppercase;color: #000000;  font-size: 18px;font-weight:bold;"> <%=strHorseName%></label>
                      <%--<input type="text" name="Horsename" id="Horsename" value='<%=strHorse_Name%>' style="background-color:  #FFF8DC; border:  1px solid #000000;" ReadOnly>--%>
                      <img src="Images/Find12.jpg" onClick='RegSearch()' />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="font-weight:bold;">REGISTRATION#:</td>
                    <td width="180px">
                      <label  id="reg_no"   style="text-transform:uppercase;color: #000000;  font-size: 18px;font-weight:bold;"> <%=strRegNum%></label>
                      <%--<input type="hidden" name="HdnRegNo" id="HdnRegNo" value='<%=str_reggno%>'>
                      <input type="hidden" name="HdnRegSeq" id="HdnRegSeq" value="<%=REGSEQ%>"/>--%>

                    </td>
                    <td style="font-weight:bold;">COLOR:</td>
                    <td width="180px">
                        <label  id="hor_color"   style="text-transform:uppercase;color: #000000;  font-size: 18px;font-weight:bold;"> <%=strColor%></label>
                      <%--<input type="text" name="hor_color" id="hor_color" value='<%=strHorse_Color%>' style="background-color:  #FFF8DC; border:  1px solid #000000;" ReadOnly>--%>
                    </td>
                    <td style="font-weight:bold;">DOB:</td>
                    <td width="240px">
                        <label  id="hor_dob"   style="text-transform:uppercase;color: #000000;  font-size: 18px;font-weight:bold;"> <%=strDOB%></label>
                      <%--<input type="text" name="hor_dob" id="hor_dob" value='<%=strHorse_DOB%>' style="background-color:  #FFF8DC; border:  1px solid #000000;" ReadOnly>--%>
                    </td>
                    <td style="font-weight:bold;">AGE:</td>
                    <td width="100px" nowrap>
                        <label  id="Horseage" style="text-transform:uppercase;color: #000000;  font-size: 18px;font-weight:bold;"> <%=strAge%></label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="font-weight:bold;">GENDER:</td>
                    <td >
                        <label  id="Horsegender" style="text-transform:uppercase;color: #000000;  font-size: 18px;font-weight:bold;"> <%=strGender%></label>
                    </td>
                    <td style="font-weight:bold;">MODALITY:</td>
                    <td>
                        <label  id="modality" style="text-transform:uppercase;color: #000000;  font-size: 18px;font-weight:bold;"> <%=strModality%></label>
                    </td>
                    <td style="font-weight:bold;">OWNER:</td>
                    <td colspan="3" width="100px" >
                        <label  id="Owner" style="text-transform:uppercase;color: #000000;  font-size: 18px;font-weight:bold;"> <%=strOwnerName%></label>
                    </td>
                </tr>
            </table>

</fieldset>

        <br>

        <%--<div align="center">

        <TABLE  CELLPADDING=4 align="center">
    <TR align="center">
    <TD ROWSPAN=6  height="20" width="200" align="center" class="Sire"><label id="HorseRegNum"   style="color: #000000;  font-size: 14px;">
    <a href="javaScript:void(0)" onClick="ReturnPedigreeDetails('<%=strSireSeq%>')"><%=strSire_Name%><br><%=strSire%></a></label></TD>
    </TR>

    <TR>
    <TD ROWSPAN=2 class="Sire" height="20" width="200" align="center"><label  id="HorseRegNum"   style="color: #000000;  font-size: 14px;">
                    <a href="javaScript:void(0)" onClick="ReturnPedigreeDetails('<%=strSireSeq_1%>')"><%=strSire_Name_1%><br><%=strSire_1%></a></label></TD>


    <TD class="Sire" height="20" width="200" align="center"><label  id="HorseRegNum"   style="color: #000000;  font-size: 14px;">
                <a href="javaScript:void(0)" onClick="ReturnPedigreeDetails('<%=strSireSeq_2_1%>')"><%=strSire_Name_2_1%></a></label></TD>
    </TR>

    <TR>
    <TD class="Dam" height="20" width="200" align="center"><label  id="HorseRegNum"   style="color: #000000;  font-size: 14px;">
                <a href="javaScript:void(0)" onClick="ReturnPedigreeDetails('<%=strDamSeq_2_1%>')"><%=strDam_Name_2_1%></a></label></TD>
    </TR>

    <TR>
    <TD ROWSPAN=2 class="Dam" height="20" width="200" align="center"><label  id="HorseRegNum"   style="color: #000000;  font-size: 14px;">
                    <a href="javaScript:void(0)" onClick="ReturnPedigreeDetails('<%=strDamSeq_1%>')"><%=strDam_Name_1%><br><%=strDam_1%></a></label></TD>


    <TD class="Sire" height="20" width="200" align="center"><label  id="HorseRegNum"   style="color: #000000;  font-size: 14px;">
                <a href="javaScript:void(0)" onClick="ReturnPedigreeDetails('<%=strSireSeq_2_2%>')"><%=strSire_Name_2_2%></a></label></TD>
    </TR>


    <TR>
    <TD class="Dam" height="20" width="200" align="center"><label  id="HorseRegNum"   style="color: #000000;  font-size: 14px;">
                <a href="javaScript:void(0)" onClick="ReturnPedigreeDetails('<%=strDamSeq_2_2%>')"><%=strDam_Name_2_2%></a></label></TD>
    </TR>

    <TR>
    <TD ROWSPAN=3 class="Sire" height="20" width="200" align="center"><label  id="HorseRegNum"   style="color: #000000;  font-size: 14px;">
                <a href="javaScript:void(0)" onClick="ReturnPedigreeDetails('<%=strSireSeq_1_2%>')"><%=strSire_Name_1_2%><br><%=strSire_1_2%></a></label></TD>
    </TR>

    <TR>
    <TD ROWSPAN=4 class="Dam" height="20" width="200" align="center"><label  id="HorseRegNum"   style="color: #000000;  font-size: 14px;">
                    <a href="javaScript:void(0)" onClick="ReturnPedigreeDetails('<%=strDamSeq%>')"><%=strDam_Name%><br><%=strDam%></a></label></TD>

    <TD class="Sire" height="20" width="200" align="center"><label  id="HorseRegNum"   style="color: #000000;  font-size: 14px;">
                <a href="javaScript:void(0)" onClick="ReturnPedigreeDetails('<%=strSireSeq_2_3%>')"><%=strSire_Name_2_3%></a></label></TD>
    </TR>

    <TR>
    <TD class="Dam" height="20" width="200" align="center"><label  id="HorseRegNum"   style="color: #000000;  font-size: 14px;">
                <a href="javaScript:void(0)" onClick="ReturnPedigreeDetails('<%=strDamSeq_2_3%>')"><%=strDam_Name_2_3%></a></label></TD>
    </TR>

    <TR>
    <TD ROWSPAN=4 class="Dam" height="20" width="200" align="center"><label  id="HorseRegNum"   style="color: #000000;  font-size: 14px;">
                <a href="javaScript:void(0)" onClick="ReturnPedigreeDetails('<%=strDamSeq_1_2%>')"><%=strDam_Name_1_2%><br><%=strDam_1_2%></a></label></TD>


    <TD class="Sire" height="20" width="200" align="center"><label  id="HorseRegNum"   style="color: #000000;  font-size: 14px;">
                <a href="javaScript:void(0)" onClick="ReturnPedigreeDetails('<%=strSireSeq_2_4%>')"><%=strSire_Name_2_4%></a></label></TD>
    </TR>

    <TR>
    <TD class="Dam"height="20" width="200" align="center"><label  id="HorseRegNum"   style="color: #000000;  font-size: 14px;">
                <a href="javaScript:void(0)" onClick="ReturnPedigreeDetails('<%=strDamSeq_2_4%>')"><%=strDam_Name_2_4%></a></label></TD>
    </TR>


</TABLE>
        </div>--%>

        <div align="center">

     <table cellpadding="0" cellspacing="0" class="altRow_Pedigree">
            <tr>
               <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="bottom" width="200px"><!-- 3rd generation---sire sire sire-->
                    Sire: 
                    <!--<a href="frmPedigreeDetails.jsp?Seq=<%=strSire_2_1%>"><input type="text" name="Sire_Name_2_1" size="25" value='<%=strSire_Name_2_1%>'Readonly class="Sire"></a>-->
                    <%--<font color="#000000" class="Sire" style="font-weight:bold;"><a href="frmPedigreeDetails.jsp?Seq=<%=strSire_2_1%>"><%=strSire_Name_2_1%></a></font>--%>
                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a  class="Sire" href="frmPedigreeDetails.jsp?Seq=<%=strSireSeq_2_1%>" > <%=strSire_Name_2_1%></a></font>


                </td>
            </tr>

<!-- *****************************************************11111111111111111111111111 -->
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="bottom right" width="200px"><!--2nd generation----sire sire -->
                    Sire:
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strSire_1%>"><input type="text" name="Sire_Name_1" size="20"  value='<%=strSire_Name_1%>'Readonly class="Sire"></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a  class="Sire" href="frmPedigreeDetails.jsp?Seq=<%=strSireSeq_1%>" > <%=strSire_Name_1%></a></font>

                </td>
                <td width="200px">
                    <!--#Aso <input type="text" name="Aso_Sire_2_1" size="5" >-->
                    #Reg 
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strSire_2_1%>"><input type="text" name="Sire_2_1" id="Sire_2_1"  onblur="returnHor_Name()" value='<%=strSire_2_1%>'Readonly size="10" ></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a  class="Sire" href="frmPedigreeDetails.jsp?Seq=<%=strSireSeq_2_1%>" > <%=strSire_2_1%></a></font>
                </td>
            </tr>
<!-- ******************************************************22222222222222222222 -->
            <tr>
               <td>
                    &nbsp;
                </td>
                <td class="right">
                    &nbsp;
                </td>
                <td class="right" width="200px">
                     <!--#Aso <input type="text" name="Aso_Sire_1" size="5" >-->
                    #Reg 
                    <%---<a href="frmPedigreeDetails.jsp?Seq=<%=strSire_1%>"><input type="text" name="Sire_1" id="Sire_1" onblur="returnHor_Name()" value='<%=strSire_1%>'Readonly size="10" ></a>&nbsp;--%>
                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a  class="Sire" href="frmPedigreeDetails.jsp?Seq=<%=strSireSeq_1%>" > <%=strSire_1%></a></font>


                </td>
                <td class="bottom" width="200px"><!-- 3rd generation---sire sire dam-->
                    Dam:  
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strDam_2_1%>"><input type="text" name="Dam_Name_2_1" size="25"  value='<%=strDam_Name_2_1%>'Readonly class="Dam"></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a  class="Dam" href="frmPedigreeDetails.jsp?Seq=<%=strDamSeq_2_1%>" > <%=strDam_Name_2_1%></a></font>
                </td>
            </tr>
<!-- *****************************1st generation*************************3333333333333333331 -->
            <tr>
               <td>
                    &nbsp;
                </td>
                <td class="bottom right" width="200px">
                    Sire: 
                    
                    <%--<font color="#000000" style="font-weight:bold;"><a  class="Sire" href="frmPedigreeDetails.jsp?Seq=<%=strSire%>" > <%=strSire_Name%></a></font>--%>
                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a  class="Sire" href="frmPedigreeDetails.jsp?Seq=<%=strSireSeq%>" > <%=strSire_Name%></a></font>


                </td>
                <td>
                    &nbsp;
                </td>
                <td width="200px">
                     <!--#Aso <input type="text" name="Aso_Dam_2_1" size="5" >-->
                     #Reg 
                     
                     <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strDam_2_1%>" ><input type="text" name="Dam_2_1" id="Dam_2_1" onblur="returnHor_Name()"  Readonly value='<%=strDam_2_1%>' size="10" ></a>--%>
                     <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a  class="Dam" href="frmPedigreeDetails.jsp?Seq=<%=strDamSeq_2_1%>" > <%=strDam_2_1%></a></font>
                </td>
            </tr>

<!-- ******************************************************44444444444444444444444444 -->
            <tr>
               <td>
                    &nbsp;
                </td>
                <td class="right" width="200px">
                     <!--#Aso <input type="text" name="Aso_Sire" size="5" >-->
                     #Reg 
                     
                     <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strSire%>"><input type="text" name="Sire" id="Sire" onblur="regSearch_Sire()" value='<%=strSire%>' Readonly size="10" ></a>>&nbsp;--%>

                     <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a  class="Sire" href="frmPedigreeDetails.jsp?Seq=<%=strSireSeq%>" > <%=strSire%></a></font>
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="bottom" width="200px"><!-- 3rd generation sire dam sire -->
                    Sire:  
                    
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strSire_2_2%>"><input type="text" name="Sire_Name_2_2"  size="25" value='<%=strSire_Name_2_2%>'Readonly class="Sire"></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a  class="Sire" href="frmPedigreeDetails.jsp?Seq=<%=strSireSeq_2_2%>" > <%=strSire_Name_2_2%></a></font>
                </td>
            </tr>
<!-- ******************************************************55555555555555555 -->
            <tr>
               <td>
                    &nbsp;
                </td>
                <td class="right">
                    &nbsp;
                </td>
                <td class="bottom right" width="200px"><!-- 2nd generation sire dam -->
                    Dam:  
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strDam_1%>"><input type="text" name="Dam_Name_1" size="20" value='<%=strDam_Name_1%>'Readonly class="Dam"></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a  class="Dam" href="frmPedigreeDetails.jsp?Seq=<%=strDamSeq_1%>" > <%=strDam_Name_1%></a></font>

                </td>
                <td width="200px">
                     <!--#Aso <input type="text" name="Aso_Sire_2_2" size="5" >-->
                    #Reg 
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strSire_2_2%>"><input type="text" name="Sire_2_2" id="Sire_2_2" onblur="returnHor_Name()" value='<%=strSire_2_2%>'Readonly size="10" ></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a  class="Sire" href="frmPedigreeDetails.jsp?Seq=<%=strSireSeq_2_2%>" > <%=strSire_2_2%></a></font>

                </td>
            </tr>
<!-- ******************************************************666666666666 -->
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="right" width="200px">
                     <!--#Aso <input type="text" name="Aso_Dam_1" size="5" >-->
                    #Reg 
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strDam_1%>"><input type="text" name="Dam_1" id="Dam_1" onblur="returnHor_Name()" value='<%=strDam_1%>'Readonly size="10" ></a>&nbsp;--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a  class="Dam" href="frmPedigreeDetails.jsp?Seq=<%=strDamSeq_1%>" > <%=strDam_1%></a></font>

                </td>
                <td class="bottom" width="200px"><!-- 3rd generatin sire dam dam -->
                    Dam:  
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strDam_2_2%>"><input type="text" name="Dam_Name_2_2" size="25"  value='<%=strDam_Name_2_2%>'Readonly class="Dam"></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a  class="Dam" href="frmPedigreeDetails.jsp?Seq=<%=strDamSeq_2_2%>" > <%=strDam_Name_2_2%></a></font>

                </td>
            </tr>
<!-- ******************************************************7777777777777 -->
            <tr>
               <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td width="200px">
                     <!--#Aso <input type="text" name="Aso_Dam_2_2" size="5" >-->
                    #Reg 
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strDam_2_2%>"><input type="text" name="Dam_2_2"  id="Dam_2_2" onblur="returnHor_Name()" value='<%=strDam_2_2%>'Readonly size="10" ></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a  class="Dam" href="frmPedigreeDetails.jsp?Seq=<%=strDamSeq_2_2%>" > <%=strDam_2_2%></a></font>
                </td>
            </tr>
<!-- ******************************************************888 -->
            <tr>
               <td>
                   &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="bottom" width="200px"><!-- 3rd generation dam sire sire -->
                    Sire:  
                    
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strSire_2_3%>"><input type="text" name="Sire_Name_2_3" size="25" value='<%=strSire_Name_2_3%>'Readonly class="Sire"></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a  class="Sire" href="frmPedigreeDetails.jsp?Seq=<%=strSireSeq_2_3%>" > <%=strSire_Name_2_3%></a></font>
                </td>
            </tr>
<!-- ******************************************************9999 -->
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="bottom right" width="200px"><!-- 2nd generation dam sire -->
                    Sire:  
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strSire_1_2%>"><input type="text" name="Sire_Name_1_2" size="20" value='<%=strSire_Name_1_2%>'Readonly class="Sire"></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a  class="Sire" href="frmPedigreeDetails.jsp?Seq=<%=strSireSeq_1_2%>" > <%=strSire_Name_1_2%></a></font>
                </td>
                <td width="150px">
                    <!-- #Aso <input type="text" name="Aso_Sire_2_3" size="5" >-->
                    #Reg 
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strSire_2_3%>"><input type="text" name="Sire_2_3"  id="Sire_2_3" onblur="returnHor_Name()" value='<%=strSire_2_3%>' Readonly size="10" ></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a  class="Sire" href="frmPedigreeDetails.jsp?Seq=<%=strSireSeq_2_3%>" > <%=strSire_2_3%></a></font>
                </td>
            </tr>

<!-- ******************************************************10 -->
            <tr>
               <td>
                    &nbsp;
                </td>
                <td class="right">
                    &nbsp;
                </td>
                <td class="right">
                    <!-- #Aso <input type="text" name="Aso_Sire_1_2" size="5" >-->
                    #Reg 
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strSire_1_2%>"><input type="text" name="Sire_1_2" id="Sire_1_2" onblur="returnHor_Name()" value='<%=strSire_1_2%>' Readonly size="10" ></a>&nbsp;--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a  class="Sire" href="frmPedigreeDetails.jsp?Seq=<%=strSireSeq_1_2%>" > <%=strSire_1_2%></a></font>

                </td>
                <td class="bottom" width="200px"><!-- 3rd generation dam sire dam -->

                    Dam: 
                    
                   <%-- <a href="frmPedigreeDetails.jsp?Seq=<%=strDam_2_3%>"><input type="text" name="Dam_Name_2_3" size="25" value='<%=strDam_Name_2_3%>'Readonly class="Dam"></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a  class="Dam" href="frmPedigreeDetails.jsp?Seq=<%=strDamSeq_2_3%>" > <%=strDam_Name_2_3%></a></font>
                </td>
            </tr>
<!-- ******************************************************11 -->
            <tr>
                <td>
                    &nbsp;
                </td>
                <td class="bottom right" width="200px"><!-- 1st generation dam -->

                    Dam:  
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strDam%>"><input type="text" name="Dam_Name" size="20" value='<%=strDam_Name%>' Readonly class="Dam"></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a  class="Dam" href="frmPedigreeDetails.jsp?Seq=<%=strDamSeq%>" > <%=strDam_Name%></a></font>
                </td>
                <td>
                    &nbsp;
                </td>
                <td width="200px">
                    <!-- #Aso <input type="text" name="Aso_Dam_2_3" size="5" >-->
                    #Reg 
                    
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strDam_2_3%>"><input type="text" name="Dam_2_3" id="Dam_2_3" onblur="returnHor_Name()" value='<%=strDam_2_3%>' Readonly size="10" ></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a  class="Dam" href="frmPedigreeDetails.jsp?Seq=<%=strDamSeq_2_3%>" > <%=strDam_2_3%></a></font>

                </td>
            </tr>
<!-- ******************************************************12 -->
            <tr>
               <td>
                    &nbsp;
                </td>
                <td class="right" width="200px">
                     <!--#Aso <input type="text" name="Aso_Dam" size="5" >-->
                    #Reg 
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strDam%>"><input type="text" name="Dam"  id="Dam" onblur="regSearch_Dam()" value='<%=strDam%>' size="10" Readonly ></a>&nbsp;--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a  class="Dam" href="frmPedigreeDetails.jsp?Seq=<%=strDamSeq%>" > <%=strDam%></a></font>

                </td>
                <td>
                    &nbsp;
                </td>
                <td class="bottom" width="200px"><!-- 3rd generation  dam dam sire -->
                    Sire:  
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strSire_2_4%>"><input type="text" name="Sire_Name_2_4" size="25" value='<%=strSire_Name_2_4%>' class="Sire" Readonly></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a  class="Sire" href="frmPedigreeDetails.jsp?Seq=<%=strSireSeq_2_4%>" > <%=strSire_Name_2_4%></a></font>
                </td>
            </tr>
<!-- ******************************************************13 -->
            <tr>
                <td>
                    &nbsp;
                </td>
                <td class="right">
                    &nbsp;
                </td>
                <td class="bottom right" width="200px"><!-- 2nd generation dam dam  -->
                    Dam: 
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strDam_1_2%>"><input type="text" name="Dam_Name_1_2" size="20" value='<%=strDam_Name_1_2%>' class="Dam" Readonly></a>&nbsp;--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a  class="Dam" href="frmPedigreeDetails.jsp?Seq=<%=strDamSeq_1_2%>" > <%=strDam_Name_1_2%></a></font>
                </td>
                <td width="200px">
                     <!--#Aso <input type="text" name="Aso_Sire_2_4" size="5" >-->
                    #Reg 
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strSire_2_4%>"><input type="text" name="Sire_2_4" id="Sire_2_4" onblur="returnHor_Name()" value='<%=strSire_2_4%>'Readonly size="10" ></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a  class="Sire" href="frmPedigreeDetails.jsp?Seq=<%=strSireSeq_2_4%>" > <%=strSire_2_4%></a></font>
                </td>
            </tr>
<!-- ******************************************************14 -->
            <tr>
               <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="right" width="200px">
                    <!-- #Aso <input type="text" name="Aso_Dam_1_2" size="5" >-->
                    #Reg 
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strDam_1_2%>"><input type="text" name="Dam_1_2" id="Dam_1_2" onblur="returnHor_Name()" value='<%=strDam_1_2%>'Readonly size="10" ></a>&nbsp;--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a  class="Dam" href="frmPedigreeDetails.jsp?Seq=<%=strDamSeq_1_2%>" > <%=strDam_1_2%></a></font>

                </td>
                <td class="bottom" width="200px"><!-- 3rd generation  dam dam dam -->
                    Dam:  
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strDam_2_4%>"><input type="text" name="Dam_Name_2_4" size="25"  value='<%=strDam_Name_2_4%>' Readonly class="Dam"></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a  class="Dam" href="frmPedigreeDetails.jsp?Seq=<%=strDamSeq_2_4%>" > <%=strDam_Name_2_4%></a></font>

                </td>
            </tr>
    <!-- ******************************************************14 -->
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td >
                     &nbsp;
                </td>
                <td width="200px">
                   <!--#Aso <input type="text" name="Aso_Dam_2_4" size="5" >-->
                    #Reg 
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strDam_2_4%>"><input type="text" name="Dam_2_4" id="Dam_2_4" onblur="returnHor_Name()" value='<%=strDam_2_4%>'Readonly size="10" ></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a  class="Dam" href="frmPedigreeDetails.jsp?Seq=<%=strDamSeq_2_4%>" > <%=strDam_2_4%></a></font>
                </td>
            </tr>
            </table>
</div>


<%
          }
            catch (Exception e) {
            System.err.println("Got an exception! ");
            System.err.println("++frmPedigree.jsp+++"+e);
        }
%>

        


            </div>

    </div>

<div id="dialog-Reg" title="SEARCH REGISTRATION" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  src="regsearchpopup.jsp"  id="modalIFrame_Show" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="no">
        </iframe>
    </div>

		</form>
    </body>
</html>
