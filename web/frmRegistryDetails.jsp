<%--
    Document   : frmRegistryDetails
    Created on : Jun 7, 2011, 8:08:15 PM
    Author     : veera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>




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
<script type="text/javascript" src="jscRegistration.js"></script>
<script type="text/javascript" src="jscIndex.js"></script>

 <link href="PedigreeSearchPopupStyle.css" rel="stylesheet" type="text/css" />
 <link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/interface.js"></script>
 

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
        <%@ taglib uri="/WEB-INF/tlds/Reference.tld" prefix="Reference"%>

        <%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.DBConnection" %>
<%@ page import="pasotracker.GeneralServlet" %>

 <form name="frmRegistryDetails">


    <%

    String strRefType="";
    String strcmbLocSeqId="";

    String search_val = "";
    String strreg_num="";
    String strreg_type="";
    String strdna="";
    String strinf_emp="";
    String strdate="";
    String strreg_place="";
    String strreg_user="";
    String strhor_name="";
    String strhor_gender="";
    String strhor_gelding_date="";
    String strhor_dob="";
    String strhor_age="";
    String strhor_deathdate="";
    String strhor_color="";
    String strhor_aire="";
    String strorg="";
    String strmicro_num="";
    String strcaso_num="";
    String strhor_breeder="";
    String strmem_num="";
    String strmem_name="";
    String strmem_add1="";
    String strmem_add2="";
    String strmem_city="";
    String strmem_state="";
    String strmem_zip="";
    String strmem_country="";
    String strmem_phone="";
    String strmem_email="";
    String strAño="";

    String strHdnRegSeq="";
    String strHdnSeqNo_Mem="";
    String strEmb_Transfer="";
    String strObservations="";

    String str_reggno="";
    String strMode="";
    String strhor_color_Value="";
    String strhor_palce_Value="";

    String strhor_Modality_Value="";
    String strhor_Org_Value="";
    String strOwn_Type="";
    String strOrg_Name="";

    String strhor_Place_Value="";
    String strhor_breeder_Value="";
	
	String age_Months="";
    String age_Days="";

    if(request.getParameter("Mode")!=null)
    strMode=request.getParameter("Mode");


    if(strMode.equals("1"))
    {


    try
    {
            strHdnRegSeq="";
            String str_Reg_no="";
            //String str_Reg_no = request.getParameter("Seq");

            strHdnRegSeq= request.getParameter("Seq");
            String strHor_PName = "";
            String strHor_DOB = "";

            GeneralServlet gen=new GeneralServlet();
 RowSetFactory factory2 = RowSetProvider.newFactory();
   CachedRowSet crsGetHorseDetails= factory2.createCachedRowSet();
    RowSetFactory factory22 = RowSetProvider.newFactory();
   CachedRowSet crs_Color= factory22.createCachedRowSet();
           // CachedRowSetImpl crsGetHorseDetails = new CachedRowSetImpl();
          //  CachedRowSetImpl crs_Color = new CachedRowSetImpl();
            //strHdnRegSeq
            //crsGetHorseDetails = gen.GetHorseDetails(strHdnRegSeq,str_Reg_no,strHor_PName,strHor_DOB);

            crsGetHorseDetails = gen.GET_PASODETAILS_SEARCH(strHdnRegSeq,str_Reg_no);


            while(crsGetHorseDetails.next())
            {

            strHdnRegSeq="";
            strreg_num="";
            strreg_type="";
            strdna="";
            strinf_emp="";
            strdate="";
            strreg_place="";
            strreg_user="";
            strhor_name="";
            strhor_gender="";
            strhor_gelding_date="";
            strhor_dob="";
            strhor_age="";
            strhor_deathdate="";
            strhor_color="";
            strhor_aire="";
            strorg="";
            strAño="";
            strEmb_Transfer="";
           // strObservations="";
            strmicro_num="";
            strcaso_num="";
            strhor_breeder="";
            strmem_num="";
            strmem_name="";
            strmem_add1="";
            strmem_add2="";
            strmem_city="";
            strmem_state="";
            strmem_zip="";
            strmem_country="";
            strmem_phone="";
            strmem_email="";
            strOwn_Type="";
            strOrg_Name="";
			age_Months="";
            age_Days="";

            if(crsGetHorseDetails.getString("REGSEQ")!=null)
            {
                strHdnRegSeq= crsGetHorseDetails.getString("REGSEQ");
                }

            if(crsGetHorseDetails.getString("REGISTRATION_NUM")!=null)
            {
                strreg_num= crsGetHorseDetails.getString("REGISTRATION_NUM");
                }

            if(crsGetHorseDetails.getString("REGISTRY_TYPE")!=null)
            {
                strreg_type= crsGetHorseDetails.getString("REGISTRY_TYPE");
                }

            if(crsGetHorseDetails.getString("DNA")!=null)
                {
                strdna= crsGetHorseDetails.getString("DNA");
            }

            if(crsGetHorseDetails.getString("INF_EMP")!=null)
                {
                strinf_emp= crsGetHorseDetails.getString("INF_EMP");

            }


            if(crsGetHorseDetails.getString("REGISTRY_DATE")!=null)
                {
                strdate= crsGetHorseDetails.getString("REGISTRY_DATE");

            }

            if(crsGetHorseDetails.getString("PLACE")!=null)
               {
                strhor_Place_Value= crsGetHorseDetails.getString("PLACE");
                }


            if(crsGetHorseDetails.getString("REGISTRY_USER")!=null)
                {
                strreg_user= crsGetHorseDetails.getString("REGISTRY_USER");

            }

            if(crsGetHorseDetails.getString("HORSE_PRIMARYNAME")!=null)
               {
                strhor_name= crsGetHorseDetails.getString("HORSE_PRIMARYNAME");

            }

            if(crsGetHorseDetails.getString("HORSE_GENDER")!=null)
               {
                strhor_gender= crsGetHorseDetails.getString("HORSE_GENDER");

            }

            if(crsGetHorseDetails.getString("HORSE_GELDING_DATE")!=null)
                {
                strhor_gelding_date= crsGetHorseDetails.getString("HORSE_GELDING_DATE");
            }

            if(crsGetHorseDetails.getString("HORSE_DOB")!=null)
                {
                strhor_dob= crsGetHorseDetails.getString("HORSE_DOB");
            }
			/*
            if(crsGetHorseDetails.getString("AGE")!=null)
                {
                strhor_age= crsGetHorseDetails.getString("AGE") +"  Months";

            }
			*/
            if(crsGetHorseDetails.getString("MONTH")!=null)                     
                age_Months= crsGetHorseDetails.getString("MONTH").trim()+"M";
            else
                age_Months="";
            
            if(crsGetHorseDetails.getString("DAYS")!=null)                     
                age_Days= crsGetHorseDetails.getString("DAYS").trim()+"D";
            else
                age_Days="";
            
            strhor_age=age_Months+' '+age_Days;

            if(crsGetHorseDetails.getString("HORSE_DEATHDATE")!=null)
                {
                strhor_deathdate= crsGetHorseDetails.getString("HORSE_DEATHDATE");

            }


            if(crsGetHorseDetails.getString("COLORVALUE")!=null)
                {
                strhor_color_Value= crsGetHorseDetails.getString("COLORVALUE");
                }

            if(crsGetHorseDetails.getString("MODALITYVALUE")!=null)
                {
                strhor_Modality_Value= crsGetHorseDetails.getString("MODALITYVALUE");
                }

            if(crsGetHorseDetails.getString("ORGVALUE")!=null)
                {
                strhor_Org_Value= crsGetHorseDetails.getString("ORGVALUE");
                }


            if(crsGetHorseDetails.getString("MICROCHIP_NUM")!=null)
                {
                strmicro_num= crsGetHorseDetails.getString("MICROCHIP_NUM");
            }

            if(crsGetHorseDetails.getString("MODALITYVALUE")!=null)
                {
                strhor_Modality_Value= crsGetHorseDetails.getString("MODALITYVALUE");
                }

            if(crsGetHorseDetails.getString("CASODNA_NUM")!=null)
                {
                strcaso_num= crsGetHorseDetails.getString("CASODNA_NUM");
            }


            /*if(crsGetHorseDetails.getString("BREEDERVALUE")!=null)
                {
                strhor_breeder_Value= crsGetHorseDetails.getString("BREEDERVALUE");
                }*/


            if(crsGetHorseDetails.getString("HORSE_BREEDER")!=null)
                 strhor_breeder_Value= crsGetHorseDetails.getString("HORSE_BREEDER");                
                

            if(crsGetHorseDetails.getString("Año")!=null)
             {
                strAño= crsGetHorseDetails.getString("Año");

            }

            if(crsGetHorseDetails.getString("EMB_TRANSFER")!=null)
                {
                strEmb_Transfer= crsGetHorseDetails.getString("EMB_TRANSFER");
            }

            if(crsGetHorseDetails.getString("OWNERNUM")!=null)
            {
                strmem_num= crsGetHorseDetails.getString("OWNERNUM");
            }

            if(crsGetHorseDetails.getString("NAME")!=null)
            {
                strmem_name= crsGetHorseDetails.getString("NAME");
            }

            if(crsGetHorseDetails.getString("ADDRESS1")!=null)
            {
                strmem_add1= crsGetHorseDetails.getString("ADDRESS1");
            }

            if(crsGetHorseDetails.getString("ADDRESS2")!=null)
            {
                strmem_add2= crsGetHorseDetails.getString("ADDRESS2");
            }

            if(crsGetHorseDetails.getString("CITY")!=null)
            {
                strmem_city= crsGetHorseDetails.getString("CITY");
            }

            if(crsGetHorseDetails.getString("STATE")!=null)
            {
                strmem_state= crsGetHorseDetails.getString("STATE");
            }

            if(crsGetHorseDetails.getString("ZIP")!=null)
            {
                strmem_zip= crsGetHorseDetails.getString("ZIP");
            }

            if(crsGetHorseDetails.getString("COUNTRY")!=null)
            {
                strmem_country= crsGetHorseDetails.getString("COUNTRY");
            }

            if(crsGetHorseDetails.getString("PHONE")!=null)
            {
                strmem_phone= crsGetHorseDetails.getString("PHONE");
            }

            if(crsGetHorseDetails.getString("EMAIL")!=null)
            {
                strmem_email= crsGetHorseDetails.getString("EMAIL");
            }
            }

          }
            catch (Exception e) {
            System.err.println("Got an exception! ");
            System.err.println("+++++"+e);
        }

}
    %>

            <div id="container1">

            <div id="content1">

<fieldset> <legend>Horse Details:</legend>

    <table  border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
        <tr>
            <td>

        <table class="altRow">

          <tr>
            <td width="100px"><b>REG#</b></td>
            <td  colspan="" width="100px">
                <label  id="HorseRegNum"   style="color: #000000;  font-size: 14px;text-transform:uppercase;"> <%=strreg_num%></label></td>

            <td nowrap width="100px"><b>HORSE NAME</b></td>

            <td nowrap width="150px">
                <label  id="HorseName"   style="color: #000000;  font-size: 14px;text-transform:uppercase;"> <%=strhor_name%></label></td>

            <td nowrap width="90px"><b>TYPE OF REGISTRY</b></td>

            <td width="150px">
                <label  id="HorseType"   style="color: #000000;  font-size: 14px;text-transform:uppercase;"> <%=strreg_type%></label> </td>
          </tr>



          <tr>
              <td nowrap><b>REGISTERED DATE</b></td>
                <td width="150">
                    <label  id="HorseType"   style="color: #000000;  font-size: 14px;text-transform:uppercase;"> <%=strdate%></label>
                </td>
                <td><b>PLACE</b></td>
                <td>
                    <label  id="HorseType"   style="color: #000000;  font-size: 14px;text-transform:uppercase;"> <%=strhor_Place_Value%></label>
                </td>

                <td nowrap><b>REGISTERED BY</b></td>
                <td>
                    <label  id="RegisteredBy"   style="color: #000000;  font-size: 14px;text-transform:uppercase;"> <%=strreg_user%></label>

                </td>
            </tr>


          <tr>
              <td nowrap><b>MICRO CHIP#</b></td>
            <td>

                <label  id="org"   style="color: #000000;  font-size: 14px;text-transform:uppercase;"> <%=strmicro_num%></label>
            </td>
            <td><b>GENDER</b></td>
            <td>
                <label  id="Gender"   style="color: #000000;  font-size: 14px;text-transform:uppercase;"> <%=strhor_gender%></label>
            </td>
            <td nowrap><b>DATE GELDED</b></td>
            <td >
                <label  id="Horsedategelded"   style="color: #000000;  font-size: 14px;text-transform:uppercase;"> <%=strhor_gelding_date%></label>
          </tr>

          <tr>
            <td nowrap><b>BIRTH DATE</b></td>

            <td>
              <label  id="Horsebirthdate"   style="color: #000000;  font-size: 14px;"> <%=strhor_dob%></label>

            <td><b>AGE</b></td>
            <td nowrap>

                <label  id="Horseage"   style="color: #000000;  font-size: 14px;text-transform:uppercase;"> <%=strhor_age%></label>
            </td>

            <td nowrap><b>DEATH DATE</b></td>
            <td>

                <label  id="Horsedeathdate"   style="color: #000000;  font-size: 14px;text-transform:uppercase;"> <%=strhor_deathdate%></label>
          </tr>


          <tr>
              <td><b>COLOR</b></td>
            <td >
                <label  id="Horsecolor"   style="color: #000000;  font-size: 14px;text-transform:uppercase;"> <%=strhor_color_Value%></label>
            </td>

            <td ><b>MODALITY</b></td>
            <td>
                <label  id="modality"   style="color: #000000;  font-size: 14px;text-transform:uppercase;"> <%=strhor_Modality_Value%></label>
            </td>
            <td><b>ORGANIZATION</b></td>
            <td>
                <label  id="org"   style="color: #000000;  font-size: 14px;text-transform:uppercase;"> <%=strhor_Org_Value%></label>
            </td>
          </tr>



          <tr>
              
            <td nowrap><b>CASO DNA#</b></td>
            <td>

                <label  id="org"   style="color: #000000;  font-size: 14px;text-transform:uppercase;"> <%=strcaso_num%></label>
            </td>
            <td><b>BREEDER</b></td>
            <td >
                <label  id="org"   style="color: #000000;  font-size: 14px;text-transform:uppercase;"> <%=strhor_breeder_Value%></label>
            </td>
            <td nowrap><b>EMBRYO TRANSFER</b></td>
              <td>
                  <label  id="org"   style="color: #000000;  font-size: 14px;text-transform:uppercase;"> <%=strEmb_Transfer%></label>
              </td>
          </tr>

          
          
        </table>
            </td></tr>
    </table>
    </fieldset>
              <br>
        <fieldset> <legend>Current Owner:</legend>

        <table class="altRow">
            <tr>
                <th  width="100px">ID#</th>
                <th  width="200px">NAME</th>
                <th  width="100px">ADDRESS1</th>
                <th  width="100px">ADDRESS2</th>
                <th  width="50px">CITY</th>
                <th  width="50px">STATE</th>
                <th  width="50px">ZIP</th>
                <th  width="50px">COUNTRY</th>
                <th  width="100px">PHONE</th>
                <th  width="100px">EMAIL</th>
            </tr>
            <tr>
                <td><label  id="MEMBER_NUM_VAL" style="color: #000000;  font-size: 14px;text-transform:uppercase;"> <%=strmem_num%></label></td>
                <td><label  id="MEMBER_NAME_VAL" style="color: #000000;  font-size: 14px;text-transform:uppercase;"> <%=strmem_name%> </label></td>
                <td><label  id="ADDRESS1_VAL" style="color: #000000;  font-size: 14px;text-transform:uppercase;"> <%=strmem_add1%> </label></td>
                <td><label  id="ADDRESS2_VAL" style="color: #000000;  font-size: 14px;text-transform:uppercase;"> <%=strmem_add2%> </label></td>
                <td><label  id="CITY_VAL" style="color: #000000;  font-size: 14px;text-transform:uppercase;"> <%=strmem_city%> </label></td>
                <td><label  id="STATE_VAL" style="color: #000000;  font-size: 14px;text-transform:uppercase;"> <%=strmem_state%> </label></td>
                <td><label  id="ZIP_VAL" style="color: #000000;  font-size: 14px;text-transform:uppercase;"> <%=strmem_zip%> </label></td>
                <td><label  id="COUNTRY_VAL" style="color: #000000;  font-size: 14px;text-transform:uppercase;" > <%=strmem_country%> </label></td>
                <td><label  id="PHONE_VAL" style="color: #000000;  font-size: 14px;text-transform:uppercase;"> <%=strmem_phone%> </label></td>
                <td ><label  id="EMAIL_VAL" style="color: #000000;  font-size: 14px;text-transform:uppercase;">  <%=strmem_email%></label></td>
            </tr>
        </table>
        </fieldset>
            </div>
        </div>

    </form>
    </body>
</html>
