<%--
    Document   : regsearchpopup_include
    Created on : Apr 28, 2011, 3:46:48 PM
    Author     : Erzath
--%>

<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>

<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SEARCH</title>
        <link rel="stylesheet" href="Style_Popup.css">
        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
        <link href="buttons.css" rel="stylesheet" type="text/css" />
        <link href="frmReg_CommonRef.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="themes/base/jquery.ui.all.css">
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
        <script src="jscIndex.js"></script>
		<script src="js/jquery.autocomplete.js"></script>
		<script type="text/javascript" src="jscReg_AutoComplete.js"></script>

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
       // window.parent.document.getElementById(?ShowName?).value=SelValue
        document.forms[0].method="post";
        document.forms[0].action="index.jsp?mode=2&RegNo="+RegNum;
        document.forms[0].submit();
 }

 function returnValues(strValues,strHorseName,strREGSEQ,strASSIGNEDNUM)
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
        window.parent.document.forms[0].action="frmShowHistory.jsp?Mode=2&RegNo="+strREGSEQ;
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
           window.parent.document.getElementById("HorseName").value=strHorseName.replace('%27','\'');
           window.parent.document.getElementById("HdnRegSeq").value=strREGSEQ;
        }

        else if(window.parent.document.getElementById("HdnRegSearchType").value=="PedigreeReg")
        {                   
           window.parent.document.getElementById("InPedigree").value=strValues;
           window.parent.document.getElementById("InPedigreeName").value=strHorseName.replace('%27','\'');
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
    //////Ramani------start
    else if(window.parent.document.forms[0].name=="Reg_Siblings_frm")
    {
        window.parent.document.forms[0].target="_self";
        window.parent.document.forms[0].method="post";
        window.parent.document.forms[0].action="frmReg_Siblings.jsp?Mode=2&RegNo="+strREGSEQ;
        window.parent.document.forms[0].submit();
    }
    /////Ramani----End
	else if(window.parent.document.forms[0].name=="Reg_Descendants")
    {
        window.parent.document.forms[0].target="_self";
        window.parent.document.forms[0].method="post";
        window.parent.document.forms[0].action="frmReg_Descendants.jsp?Mode=2&RegNo="+strREGSEQ;//frmReg_Descendants
        window.parent.document.forms[0].submit();
    }
}

function showAlert()
{
    document.forms[0].method="post";
    document.forms[0].action="regsearchpopup_include.jsp?Pop_viewall=Y";
    document.forms[0].target="_self";
    document.forms[0].submit();
}
</script>
 <link href="Tables_style.css" rel="stylesheet" type="text/css" />

    <%@ page import="java.util.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.Date" %>
    <%@ page import="java.text.ParseException" %>
    <%@ page import="java.text.SimpleDateFormat" %>
    <%@ page import="javax.sql.rowset.*" %>    
    <%@ page import="pasotracker.GeneralServlet" %>    
    
    

    <body>
        
      <form name="frm_regsearchpopup_include" method="post">

<%      
    String RegSeq="";
    String str_Reg_no1="";
    String strHor_PName1="";
    String strHor_DOB1="";
    String strmem_lname="";
    String strmem_mname="";
    String strOwnerName="";  
    String strOrgName="";
    int Counter=0;          
    String strage="";
%>
        <%@ include file="regsearchpopup.jsp" %>
        <div id="maincontent">
        <div class="innertube">
        
<%             
    List HorseList = new ArrayList();                          
    try
    {            
        int asgno=0;      
        String strOwn_Type="";        
        GeneralServlet gen=new GeneralServlet();
 RowSetFactory factory24 = RowSetProvider.newFactory();
   CachedRowSet crsGetHorseDetails= factory24.createCachedRowSet();
       // CachedRowSetImpl crsGetHorseDetails = new CachedRowSetImpl();

        crsGetHorseDetails = gen.GetHorseDetails(REGSEQ,str_Reg_no,strHor_PName.replace("\'","''"),strHor_DOB,strmem_name,strmicro_num,strRegistration_Type,strAssignedNo);

        Map MpHorseDetails = new TreeMap();

        while (crsGetHorseDetails.next())
        {   
            RegSeq="";
            strOrgName="";
            str_Reg_no1=""; 
            strHor_PName1="";
            strHor_DOB1="";
            strmem_name="";
            strmem_mname="";
            strmem_lname="";
            strmicro_num="";
            strAssignedNo="";
            strOwn_Type="";
            strAssignedNo="";
            asgno=0;
            strage="";
     
             if(crsGetHorseDetails.getString("OWNER_TYPE")!=null)                  
                strOwn_Type=crsGetHorseDetails.getString("OWNER_TYPE").trim();
                
            if(crsGetHorseDetails.getString("REGSEQ")!=null)
                RegSeq= crsGetHorseDetails.getString("REGSEQ").trim();

            if(crsGetHorseDetails.getString("REGISTRATION_NUM")!=null)
                str_Reg_no1= crsGetHorseDetails.getString("REGISTRATION_NUM").trim();
                
            if(crsGetHorseDetails.getString("ORGANIZATION_NAME")!=null)                     
                strOrgName= crsGetHorseDetails.getString("ORGANIZATION_NAME").trim();  
            
            if(crsGetHorseDetails.getString("HORSE_PRIMARYNAME")!=null)
                strHor_PName1= crsGetHorseDetails.getString("HORSE_PRIMARYNAME").trim();

            if(crsGetHorseDetails.getString("HORSE_DOB")!=null)
                strHor_DOB1= crsGetHorseDetails.getString("HORSE_DOB").trim();

            if(crsGetHorseDetails.getString("FIRSTNAME")!=null)
                strmem_name= crsGetHorseDetails.getString("FIRSTNAME").trim();

            if(crsGetHorseDetails.getString("LASTNAME")!=null)
                strmem_lname= crsGetHorseDetails.getString("LASTNAME").trim();

            if(crsGetHorseDetails.getString("SUFFIX")!=null)
                strmem_mname= crsGetHorseDetails.getString("SUFFIX").trim();

            if(crsGetHorseDetails.getString("MICROCHIP_NUM")!=null)
                strmicro_num= crsGetHorseDetails.getString("MICROCHIP_NUM").trim();

            if(crsGetHorseDetails.getString("ASSIGNEDNUM")!=null)
             {
                  strAssignedNo= crsGetHorseDetails.getString("ASSIGNEDNUM").trim();
                  asgno=Integer.parseInt(strAssignedNo);                  
            }
            
            if(crsGetHorseDetails.getString("AGE")!=null)                  
                    strage= crsGetHorseDetails.getString("AGE");
            
            strOwnerName = strmem_name+" "+strmem_lname;

            MpHorseDetails = new TreeMap();
            MpHorseDetails.put("REGSEQ",RegSeq);
            MpHorseDetails.put("HORSENAME",strHor_PName1);
			
			strHor_PName1 = strHor_PName1.replace("\'", "%27");
            MpHorseDetails.put("HORSENAMES",strHor_PName1);

            MpHorseDetails.put("REG",str_Reg_no1);
            
            if(strOwn_Type.equalsIgnoreCase("INDIVIDUAL")  || strOwn_Type.equalsIgnoreCase("YOUTH RIDER") ||(strOwn_Type.equals("") && strOrgName.equals("") ))
                MpHorseDetails.put("OWNER",strOwnerName);  /* FULL NAME */
            else
                MpHorseDetails.put("OWNER",strOrgName);                                               
                        
            MpHorseDetails.put("MCHIP",strmicro_num);                                
            MpHorseDetails.put("DOB",strHor_DOB1);                                                                                                       
            MpHorseDetails.put("AGE",strage);
            
            if(asgno!=0)              
                MpHorseDetails.put("ASSIGNEDNUM",asgno); 
            else
                MpHorseDetails.put("ASSIGNEDNUM",null); 
            
            Counter=Counter+1;
            HorseList.add(MpHorseDetails);
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

    <display:table  id="Details" name="requestScope.HorseList"        
                        class="grid"
                        style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;overflow-x:scroll;text-transform: uppercase;">




    <display:column style="width:1%" headerClass="Grid_Header">
    <input type="radio" name="checkedVal" onclick="returnValues('${Details.REG}','${Details.HORSENAMES}','${Details.REGSEQ}')" />
    </display:column>    
    <display:column style="width:10%"  property="REG" title="REG#" sortable="true" headerClass="Grid_Header" />        
    <display:column style="width:20%"   title="HORSE NAME" property="HORSENAME" sortable="true" headerClass="Grid_Header"/>     
    <display:column style="width:10%"  title="DOB"   sortable="true" property="DOB" headerClass="Grid_Header"/>
    <display:column style="width:3%" property="AGE"  sortable="true" headerClass="Grid_Header" />
    <display:column style="width:3%"   title="ID#" property="ASSIGNEDNUM" sortable="true" headerClass="Grid_Header"/>
    <display:column style="width:15%" property="OWNER" headerClass="Grid_Header" />
    <%--<display:column style="width:5%" property="MCHIP" headerClass="Grid_Header" />--%>

    </display:table>
<%  
    }
    else
    { 
%>
    <display:table  id="Details" name="requestScope.HorseList"
                            pagesize="100" 
                            class="grid"
                            style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;overflow-x:scroll;text-transform: uppercase;">           

    <display:setProperty name="paging.banner.item_name" value="Horse" />
    <display:setProperty name="paging.banner.items_name" value="Horses" />
    <display:setProperty name="paging.banner.some_items_found">

        <span class="pagebanner" >{0} {1} founds,displaying {2} to {3}</span>
        <span ><input type="checkbox" onClick="showAlert()"> <font style="font-weight:bold;">View All&nbsp;&nbsp;&nbsp;</font></span>

    </display:setProperty>
    <display:column style="width:1%" headerClass="Grid_Header">
    <input type="radio" name="checkedVal" onclick="returnValues('${Details.REG}','${Details.HORSENAMES}','${Details.REGSEQ}')" /></display:column>
    <display:column style="width:10%"  property="REG" title="REG#" sortable="true" headerClass="Grid_Header" />    
    <display:column style="width:20%"   title="HORSE NAME" property="HORSENAME" sortable="true" headerClass="Grid_Header"/>    
    <display:column style="width:10%"  title="DOB"   sortable="true" property="DOB" headerClass="Grid_Header"/>
    <display:column style="width:3%" property="AGE"  sortable="true" headerClass="Grid_Header" />
    <display:column style="width:3%"   title="ID#" property="ASSIGNEDNUM" sortable="true" headerClass="Grid_Header"/>
    <display:column style="width:15%" property="OWNER" headerClass="Grid_Header" />
    <%--<display:column style="width:5%" property="MCHIP" headerClass="Grid_Header" />--%>

    </display:table>
<%
    }
%>
        
</div>
</div>

</form>
</body>
</html>

