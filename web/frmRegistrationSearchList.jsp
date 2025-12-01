<%--
    Document   : frmRegistrationSearchList
    Created on : Jun 6, 2011, 5:05:02 PM
    Author     : veera
--%>



<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PASO TRACKER</title>
        <link rel="stylesheet" href="themes/base/jquery.ui.all.css"/>
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
<script type="text/javascript" src="js/interface.js"></script>     
   
        <link href="Table_RegSearch.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="jscRegistrationSearch.js"></script>
   
    <style type="text/css">
<!--
@import url("CommonTableStyle.css");
-->

#content_RS {
	float:right;
	width:960px;
}
#container_RS {
	width:960px;
	margin:auto;
}


</style>

<script language="text/javascript">
    
    
function ReturnPedigree(RegNo,RegSeq)
{
    $('#dialog-RegPedigree').dialog({ autoOpen: false,height: 700,width: 950, modal: true });
    $('#dialog-RegPedigree').dialog('open');

    $("#modalIFrame_PedigreeDetails").attr('src','frmPedigreeDetails.jsp?Seq='+RegSeq);

    return false;
}



function ReturnHorseDetails(RegSeq)
{
    $('#dialog-RegistryDetails').dialog({ autoOpen: false,height: 500,width: 800, modal: true });
    $('#dialog-RegistryDetails').dialog('open');

     $("#modalIFrame_RegistryDetails").attr('src','frmRegistryDetails.jsp?Mode=1&Seq='+RegSeq);

    return false;
}



</script>
         </head>


    <body>
        <%@ page import="java.util.*" %>
        <%@ page import="java.io.*" %>
        <%@ page import="java.sql.*" %>
        <%@ page import="javax.sql.rowset.*" %>
        <%@ page import="pasotracker.GeneralServlet" %>



<%
        int Counter=0;               
        
        String strRegSeq="";
        String strRegNo="";
        String MicroChipNo="";
        String Name="";
        String DOB="";
        String Gender="";
        String Modality="";
        String Owner="";
        String Breeder="";
        String Año="";
        String AGE="";
        String DOBAGE="";
        String strSireNameList="";
        String strDamNameList="";
        String OwnerFirstName="";
        String OwnerLastName="";

        if(strMode.equals("1")) // Search Mode is 1 list the horses
         {
            %>
     <div id="container_RS">
        <div id="content_RS">

            <%
         List HorseList = new ArrayList();
        try
        {

            GeneralServlet gen=new GeneralServlet();
 RowSetFactory factory21 = RowSetProvider.newFactory();
   CachedRowSet crsGetREGISTRATIONSEARCH= factory21.createCachedRowSet();
          //  CachedRowSetImpl crsGetREGISTRATIONSEARCH = new CachedRowSetImpl();

            
            crsGetREGISTRATIONSEARCH = gen.GET_REGISTRATIONSEARCH(strHdnRegistrationSeq,strRegistrationNo,strRegistrationName.replace("\'","''"),strMicroChipNo,strTypeofReg, strDateRegisteredFrom, strDateRegisteredTo, strDOBFrom,strDOBTo,strAgeFrom,strAgeTo,strGender,EmbryoTransfer,strAño,DNACertified,strSireSeq, strDamSeq, strModality,strBreeder,strOwner,strPedigreeSeq,strObservationType,strDDFrom,strDDTo,strPlaceName,strStatus,strRegistration_Type,strcaso_num);
            


        Map MpHorseDetails = new TreeMap();
        
        while (crsGetREGISTRATIONSEARCH.next())
        {
                strRegSeq="";
                strRegNo="";
                MicroChipNo="";
                Name="";
                DOB="";
                Gender="";
                Modality="";
                Owner="";
                Breeder="";
                Año="";
                AGE="";
                DOBAGE="";
                strSireNameList="";
                strDamNameList="";
                OwnerFirstName="";
                OwnerLastName="";

               
                MpHorseDetails = new TreeMap();

                if(crsGetREGISTRATIONSEARCH.getString("REGSEQ")!=null)
                strRegSeq=crsGetREGISTRATIONSEARCH.getString("REGSEQ").trim();

            if(crsGetREGISTRATIONSEARCH.getString("REG#")!=null)
                strRegNo=crsGetREGISTRATIONSEARCH.getString("REG#").trim();


            if(crsGetREGISTRATIONSEARCH.getString("MC#")!=null)
                strMicroChipNo= crsGetREGISTRATIONSEARCH.getString("MC#").trim();


            if(crsGetREGISTRATIONSEARCH.getString("NAME")!=null)
                Name= crsGetREGISTRATIONSEARCH.getString("NAME").trim();


            if(crsGetREGISTRATIONSEARCH.getString("DOB")!=null)
                DOB= crsGetREGISTRATIONSEARCH.getString("DOB").trim();

            if(crsGetREGISTRATIONSEARCH.getString("AGE")!=null)
                AGE= crsGetREGISTRATIONSEARCH.getString("AGE").trim();


                //String DOBAGE=DOB+" / "+AGE+ "M";


                if(!DOB.equals("")&& !AGE.equals(""))
                    {
                        DOBAGE=DOB+" / "+AGE+ "M";
                    }
                else
                    {
                        DOBAGE="";
                    }


            if(crsGetREGISTRATIONSEARCH.getString("GENDER")!=null)
                {
                    Gender= crsGetREGISTRATIONSEARCH.getString("GENDER").trim();

                    if(Gender.equalsIgnoreCase("Select"))
                        Gender="";
                }


            //if(crsGetREGISTRATIONSEARCH.getString("MODALITY")!=null)
              //  Modality= crsGetREGISTRATIONSEARCH.getString("MODALITY");

                if(crsGetREGISTRATIONSEARCH.getString("Modality_Value")!=null)
                    {
                        Modality= crsGetREGISTRATIONSEARCH.getString("Modality_Value").trim();
                        
                        if(Modality.equalsIgnoreCase("Select"))
                            Modality="";
                    }

                

            //if(crsGetREGISTRATIONSEARCH.getString("OWNER")!=null)
              //  Owner= crsGetREGISTRATIONSEARCH.getString("OWNER");
                

            //if(crsGetREGISTRATIONSEARCH.getString("OWNERNAME")!=null)
             //  Owner= crsGetREGISTRATIONSEARCH.getString("OWNERNAME").trim();


             /*if(crsGetREGISTRATIONSEARCH.getString("OWNERFIRSTNAME")!=null)
               OwnerFirstName= crsGetREGISTRATIONSEARCH.getString("OWNERFIRSTNAME").trim();
*/

             if(crsGetREGISTRATIONSEARCH.getString("OWNERLASTNAME")!=null)
               OwnerLastName= crsGetREGISTRATIONSEARCH.getString("OWNERLASTNAME").trim();

              // Owner=OwnerFirstName+' '+OwnerLastName;

                Owner=OwnerLastName;
                
             //if(crsGetREGISTRATIONSEARCH.getString("BREEDER")!=null)
            //Breeder= crsGetREGISTRATIONSEARCH.getString("BREEDER");

                if(crsGetREGISTRATIONSEARCH.getString("Breeder_Value")!=null)
                    Breeder= crsGetREGISTRATIONSEARCH.getString("Breeder_Value").trim();


          //if(crsGetREGISTRATIONSEARCH.getString("SIRENAME")!=null)
            //strSireNameList= crsGetREGISTRATIONSEARCH.getString("SIRENAME");

            if(crsGetREGISTRATIONSEARCH.getString("SIREPrimaryNAME")!=null)
            strSireNameList = crsGetREGISTRATIONSEARCH.getString("SIREPrimaryNAME");


         if(crsGetREGISTRATIONSEARCH.getString("DamPrimaryName")!=null)
            strDamNameList= crsGetREGISTRATIONSEARCH.getString("DamPrimaryName");

               
            if(crsGetREGISTRATIONSEARCH.getString("Año")!=null)
                Año= crsGetREGISTRATIONSEARCH.getString("Año").trim();


                MpHorseDetails.put("REG",strRegNo);
                MpHorseDetails.put("MCHIP",strMicroChipNo);
                MpHorseDetails.put("NAME",Name);                
                MpHorseDetails.put("DOB/AGE",DOBAGE);
                MpHorseDetails.put("GENDER",Gender);
                MpHorseDetails.put("MODALITY",Modality);
                MpHorseDetails.put("OWNER",Owner);
                MpHorseDetails.put("BREEDER",Breeder);                
                MpHorseDetails.put("REGSEQ",strRegSeq);
                MpHorseDetails.put("SIRE",strSireNameList);
                MpHorseDetails.put("DAM",strDamNameList);

                MpHorseDetails.put("Pedigree","Select");
                HorseList.add(MpHorseDetails);
                Counter=Counter+1;
                
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


<%--<div style="width:840px; height:400px; overflow-x:hidden; overflow-y:auto">--%>


            <display:table  id="Details" name="requestScope.HorseList"
                            class="grid" 
                            style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;overflow-x:scroll;">                
            <%--<display:setProperty name="basic.msg.empty_list" value="No Horses found with the Search Critera "/>--%>
                <%--<display:column style="width:2%"headerClass="Grid_Header">
            <input type="radio" name="checkedVal" onClick="ReturnHorseDetails('${Details.REG}')" ></display:column>--%>

                <display:column style="width:2%" headerClass="Grid_Header">
            <input type="radio" name="checkedVal" onClick="ReturnHorseDetails('${Details.REGSEQ}')" ></display:column>

            <display:column style="width:15%;Height:40px;text-transform:uppercase;" title="NAME" property="NAME" sortable="true"  headerClass="Grid_Header" />
            <display:column style="width:10%;Height:30px;text-transform:uppercase;" property="REG" title="REG#" sortable="true"  headerClass="Grid_Header" />
            <display:column style="width:10%;Height:30px;text-transform:uppercase;" property="MCHIP"  sortable="true" headerClass="Grid_Header" />
            <display:column style="width:10%;Height:30px;text-transform:uppercase;" property="DOB/AGE" sortable="true" headerClass="Grid_Header" />
            <display:column style="width:10%;Height:30px;text-transform:uppercase;" property="GENDER" sortable="true" headerClass="Grid_Header" />
            <display:column style="width:10%;Height:30px;text-transform:uppercase;" property="MODALITY" sortable="true" headerClass="Grid_Header" />
            <display:column style="width:10%;Height:30px;text-transform:uppercase;" property="OWNER" sortable="true" headerClass="Grid_Header" />
            <display:column style="width:10%;Height:30px;text-transform:uppercase;" property="BREEDER"  sortable="true" headerClass="Grid_Header" />
            <display:column style="width:10%;Height:30px;text-transform:uppercase;" property="SIRE"  sortable="true" headerClass="Grid_Header" />
            <display:column style="width:10%;Height:30px;text-transform:uppercase;" property="DAM"  sortable="true" headerClass="Grid_Header" />
            <display:column style="width:3%;Height:30px;text-transform:uppercase;" title="Pedigree" headerClass="Grid_Header_Right">
            <a href="javaScript:void(0)" onClick="ReturnPedigree('${Details.REG}','${Details.REGSEQ}')">${Details.Pedigree}</a></display:column>

        </display:table>
        
    <%--</div>--%>
<%}else
      {out.println(".");%>
      
      <%--<div style="width:840px; height:400px; overflow-x:hidden; overflow-y:auto">--%>

      
            <display:table  id="Details" name="requestScope.HorseList"
                            pagesize="10" 
                            class="grid" 
                            style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;overflow-x:scroll;">                
            <%--<display:setProperty name="basic.msg.empty_list" value="No Horses found with the Search Critera "/>--%>
                <%--<display:column style="width:2%"headerClass="Grid_Header">
            <input type="radio" name="checkedVal" onClick="ReturnHorseDetails('${Details.REG}')" ></display:column>--%>

    <display:setProperty name="paging.banner.item_name" value="Horse" />
    <display:setProperty name="paging.banner.items_name" value="Horses" />
    <display:setProperty name="paging.banner.some_items_found">
     
        <span class="pagebanner" >{0} {1} founds,displaying {2} to {3}</span>
        <span ><input type="checkbox" onClick="showAlert()"> <font style="font-weight:bold;">View All&nbsp;&nbsp;&nbsp;</font></span>
     
    </display:setProperty>

            <display:column style="width:2%" headerClass="Grid_Header">
            <input type="radio" name="checkedVal" onClick="ReturnHorseDetails('${Details.REGSEQ}')" ></display:column>

            <display:column style="width:15%;Height:40px;text-transform:uppercase;" title="NAME" property="NAME" sortable="true"  headerClass="Grid_Header" />
            <display:column style="width:10%;Height:30px;text-transform:uppercase;" property="REG" title="REG#" sortable="true"  headerClass="Grid_Header" />
            <display:column style="width:10%;Height:30px;text-transform:uppercase;" property="MCHIP"  sortable="true" headerClass="Grid_Header" />
            <display:column style="width:10%;Height:30px;text-transform:uppercase;" property="DOB/AGE" sortable="true" headerClass="Grid_Header" />
            <display:column style="width:10%;Height:30px;text-transform:uppercase;" property="GENDER" sortable="true" headerClass="Grid_Header" />
            <display:column style="width:10%;Height:30px;text-transform:uppercase;" property="MODALITY" sortable="true" headerClass="Grid_Header" />
            <display:column style="width:10%;Height:30px;text-transform:uppercase;" property="OWNER" sortable="true" headerClass="Grid_Header" />
            <display:column style="width:10%;Height:30px;text-transform:uppercase;" property="BREEDER"  sortable="true" headerClass="Grid_Header" />
            <display:column style="width:10%;Height:30px;text-transform:uppercase;" property="SIRE"  sortable="true" headerClass="Grid_Header" />
            <display:column style="width:10%;Height:30px;text-transform:uppercase;" property="DAM"  sortable="true" headerClass="Grid_Header" />
            <display:column style="width:3%;Height:30px;text-transform:uppercase;" title="Pedigree" headerClass="Grid_Header_Right">
            <a href="javaScript:void(0)" onClick="ReturnPedigree('${Details.REG}','${Details.REGSEQ}')">${Details.Pedigree}</a></display:column>

        </display:table>

<%--</div>--%>
<%}
                }%>
                
</div>
</div>
<br/><br/><br/>
 <%--<%@ include file="frmBottom_Registration.jsp"%>--%>
        
        
<div id="dialog-RegPedigree" title="HORSE PEDIGREE DETAILS" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  id="modalIFrame_PedigreeDetails" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes">
        </iframe>
    </div>
<div id="dialog-RegistryDetails" title="HORSE REGISTRY DETAILS" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe id="modalIFrame_RegistryDetails" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="no">
        </iframe>
    </div>    
    
</body>
</html>
