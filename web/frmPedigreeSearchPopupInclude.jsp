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
<script src="js/jquery.autocomplete.js"></script>
<script type="text/javascript" src="jscReg_AutoComplete.js"></script>
<script type="text/javascript">
    function ListEvents(RegNum)
{
    document.forms[0].target="_self";
    // window.parent.document.getElementById(?ShowName?).value=SelValue
    document.forms[0].method="post";
    document.forms[0].action="index.jsp?mode=2&RegNo="+RegNum;
    document.forms[0].submit();
 }
 
 function returnSireDam(HName,RegName,varRegNum,varHrsName,LabelValue,varRegSeq,SeqName,varOrgName,varOrgSeq,val_Orgname,val_Orgseq,
     SireSeq,DamSeq,SireRegNo,DamRegNo,SireName,DamName,SireOrgSeq,DamOrgSeq,SireOrgName,DamOrgName)
    /* Sire_1Seq,Dam_1Seq,Sire_1RegNo,Dam_1RegNo,Sire_1Name,Dam_1Name,Sire_1OrgSeq,Dam_1OrgSeq,Sire_1OrgName,Dam_1OrgName,
     Sire_2Seq,Dam_2Seq,Sire_2RegNo,Dam_2RegNo,Sire_2Name,Dam_2Name,Sire_2OrgSeq,Dam_2OrgSeq,Sire_2OrgName,Dam_2OrgName)*/
{       
         varHrsName=varHrsName.replace("%27","\'");
		 SireName=SireName.replace("%27","\'");
		 DamName=DamName.replace("%27","\'");
		 
    window.parent.document.getElementById(HName).value=varHrsName;
    window.parent.document.getElementById(SeqName).value=varRegSeq;
    //window.parent.document.getElementById(LabelValue).innerHTML='<a href="index.jsp?Mode=2&RegNo='+varRegSeq+'" >'+varHrsName+'</a>';
    window.parent.document.getElementById(LabelValue).innerHTML=varHrsName;
    window.parent.document.getElementById(RegName).value=varRegNum;
    window.parent.document.getElementById(varOrgName).value=val_Orgname;
    window.parent.document.getElementById(varOrgSeq).value=val_Orgseq;
    window.parent.document.getElementById(varOrgName+"_L").innerHTML=val_Orgname;
    window.parent.document.getElementById(RegName+"_L").innerHTML=varRegNum;
                     
    if(RegName=="Sire"||RegName=="Dam"||RegName=="Sire_1"||RegName=="Dam_1"||RegName=="Sire_1_2"||RegName=="Dam_1_2")
    {
        if(RegName=="Sire")
        {
            SireDam_Position="1"; 
            SireDam_Position1="2_1";
            SireDam_Position2="2_2";
           
            if(SireSeq!="" || SireSeq!="null")    
            Ajax_PopulateSire(SireSeq,SireDam_Position1);

            if(DamSeq!="" || DamSeq!="null")
            Ajax_PopulateDam(DamSeq,SireDam_Position2);   
        }
        else if(RegName=="Dam")
        {    
            SireDam_Position="1_2"; 
            SireDam_Position1="2_3";
            SireDam_Position2="2_4";
            
            if(SireSeq!="" || SireSeq!="null")    
            Ajax_PopulateSire(SireSeq,SireDam_Position1);

            if(DamSeq!="" || DamSeq!="null")
            Ajax_PopulateDam(DamSeq,SireDam_Position2);   
        }
        else if(RegName=="Sire_1")
        {    
            SireDam_Position="2_1";
        }
        else if(RegName=="Dam_1")
        {    
            SireDam_Position="2_2";
        }
        else if(RegName=="Sire_1_2")
        {    
            SireDam_Position="2_3";
        }
        else if(RegName=="Dam_1_2")
        {    
            SireDam_Position="2_4";
        }                       
       
        //Sire  label      
        window.parent.document.getElementById("LSire_"+SireDam_Position).innerHTML=SireName;
        window.parent.document.getElementById("Aso_Sire_"+SireDam_Position+"_L").innerHTML=SireOrgName;
        window.parent.document.getElementById("Sire_"+SireDam_Position+"_L").innerHTML=SireRegNo;        
        //Sire  Text and hidden box
        window.parent.document.getElementById("Sire_Name_"+SireDam_Position).value=SireName;
        window.parent.document.getElementById("Aso_Sire_"+SireDam_Position+"_Seq").value=SireOrgSeq;
        window.parent.document.getElementById("Aso_Sire_"+SireDam_Position).value=SireOrgName;                
        window.parent.document.getElementById("Sire_"+SireDam_Position+"_Seq").value=SireSeq;
        window.parent.document.getElementById("Sire_"+SireDam_Position).value=SireRegNo;
        
        //Dam  label     
        window.parent.document.getElementById("LDam_"+SireDam_Position).innerHTML=DamName;
        window.parent.document.getElementById("Aso_Dam_"+SireDam_Position+"_L").innerHTML=DamOrgName;
        window.parent.document.getElementById("Dam_"+SireDam_Position+"_L").innerHTML=DamRegNo;        
        //Dam  Text and hidden box
        window.parent.document.getElementById("Dam_Name_"+SireDam_Position).value=DamName;
        window.parent.document.getElementById("Aso_Dam_"+SireDam_Position+"_Seq").value=DamOrgSeq;
        window.parent.document.getElementById("Aso_Dam_"+SireDam_Position).value=DamOrgName;                
        window.parent.document.getElementById("Dam_"+SireDam_Position+"_Seq").value=DamSeq;
        window.parent.document.getElementById("Dam_"+SireDam_Position).value=DamRegNo;
          
       }        
    window.parent.document.getElementById("SavedYN").value="N";
    window.parent.jQuery('#dialog-PedigreeSearch_Sire').dialog('close');
    window.parent.jQuery('#dialog-PedigreeSearch_Dam').dialog('close');
}
function Ajax_PopulateSire(valSireSeq,SireDam_Position)
{        
    if(valSireSeq=="")
    {
        window.parent.document.getElementById("LSire_"+SireDam_Position).innerHTML="";
        window.parent.document.getElementById("Aso_Sire_"+SireDam_Position+"_L").innerHTML="";
        window.parent.document.getElementById("Sire_"+SireDam_Position+"_L").innerHTML="";
        //Sire  Text and hidden box
        window.parent.document.getElementById("Sire_Name_"+SireDam_Position).value="";
        window.parent.document.getElementById("Aso_Sire_"+SireDam_Position+"_Seq").value="";
        window.parent.document.getElementById("Aso_Sire_"+SireDam_Position).value="";
        window.parent.document.getElementById("Sire_"+SireDam_Position+"_Seq").value="";
        window.parent.document.getElementById("Sire_"+SireDam_Position).value="";

        //Dam  label     
        window.parent.document.getElementById("LDam_"+SireDam_Position).innerHTML="";
        window.parent.document.getElementById("Aso_Dam_"+SireDam_Position+"_L").innerHTML="";
        window.parent.document.getElementById("Dam_"+SireDam_Position+"_L").innerHTML="";
        //Dam  Text and hidden box
        window.parent.document.getElementById("Dam_Name_"+SireDam_Position).value   ="";
        window.parent.document.getElementById("Aso_Dam_"+SireDam_Position+"_Seq").value="";
        window.parent.document.getElementById("Aso_Dam_"+SireDam_Position).value    ="";
        window.parent.document.getElementById("Dam_"+SireDam_Position+"_Seq").value    ="";
        window.parent.document.getElementById("Dam_"+SireDam_Position).value        ="";
    }    
    var xmlhttp;

    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
    xmlhttp=new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange=function()
    {
        if (xmlhttp.readyState==4 && xmlhttp.status==200)
        {
          if(xmlhttp.responseText==0)
              return false             
          else
          {
                var Items=xmlhttp.responseText.split('#@#');                      
                                
                //Sire  label      
                window.parent.document.getElementById("LSire_"+SireDam_Position).innerHTML=Items[4].trim();
                window.parent.document.getElementById("Aso_Sire_"+SireDam_Position+"_L").innerHTML=Items[6].trim();
                window.parent.document.getElementById("Sire_"+SireDam_Position+"_L").innerHTML=Items[2].trim();        
                //Sire  Text and hidden box
                window.parent.document.getElementById("Sire_Name_"+SireDam_Position).value=Items[4].trim();
                window.parent.document.getElementById("Aso_Sire_"+SireDam_Position+"_Seq").value=Items[7].trim();
                window.parent.document.getElementById("Aso_Sire_"+SireDam_Position).value=Items[6].trim();                
                window.parent.document.getElementById("Sire_"+SireDam_Position+"_Seq").value=Items[0].trim();
                window.parent.document.getElementById("Sire_"+SireDam_Position).value=Items[2].trim();

                //Dam  label     
                window.parent.document.getElementById("LDam_"+SireDam_Position).innerHTML=Items[5].trim();
                window.parent.document.getElementById("Aso_Dam_"+SireDam_Position+"_L").innerHTML=Items[8].trim();
                window.parent.document.getElementById("Dam_"+SireDam_Position+"_L").innerHTML=Items[3].trim();        
                //Dam  Text and hidden box
                window.parent.document.getElementById("Dam_Name_"+SireDam_Position).value   =Items[5].trim();
                window.parent.document.getElementById("Aso_Dam_"+SireDam_Position+"_Seq").value=Items[7].trim();
                window.parent.document.getElementById("Aso_Dam_"+SireDam_Position).value    =Items[8].trim();                
                window.parent.document.getElementById("Dam_"+SireDam_Position+"_Seq").value    =Items[1].trim();
                window.parent.document.getElementById("Dam_"+SireDam_Position).value        =Items[3].trim();
                                               
                //document.getElementById(Elem2_Edit_Txt).value=document.getElementById(Elem1_Txt).value;                               
          }
        }
    }
    xmlhttp.open("GET","frmReg_Ped_PopulateSireDam.jsp?SireSeqNo="+valSireSeq+"&Srch=SIRE",true);
    xmlhttp.send(); 
}
function Ajax_PopulateDam(valDamSeq,SireDam_Position)
{    
   
     if(valDamSeq=="")
    {

        window.parent.document.getElementById("LSire_"+SireDam_Position).innerHTML="";
        window.parent.document.getElementById("Aso_Sire_"+SireDam_Position+"_L").innerHTML="";
        window.parent.document.getElementById("Sire_"+SireDam_Position+"_L").innerHTML="";
        //Sire  Text and hidden box
        window.parent.document.getElementById("Sire_Name_"+SireDam_Position).value="";
        window.parent.document.getElementById("Aso_Sire_"+SireDam_Position+"_Seq").value="";
        window.parent.document.getElementById("Aso_Sire_"+SireDam_Position).value="";
        window.parent.document.getElementById("Sire_"+SireDam_Position+"_Seq").value="";
        window.parent.document.getElementById("Sire_"+SireDam_Position).value="";

        //Dam  label     
        window.parent.document.getElementById("LDam_"+SireDam_Position).innerHTML="";
        window.parent.document.getElementById("Aso_Dam_"+SireDam_Position+"_L").innerHTML="";
        window.parent.document.getElementById("Dam_"+SireDam_Position+"_L").innerHTML="";
        //Dam  Text and hidden box
        window.parent.document.getElementById("Dam_Name_"+SireDam_Position).value   ="";
        window.parent.document.getElementById("Aso_Dam_"+SireDam_Position+"_Seq").value="";
        window.parent.document.getElementById("Aso_Dam_"+SireDam_Position).value    ="";
        window.parent.document.getElementById("Dam_"+SireDam_Position+"_Seq").value    ="";
        window.parent.document.getElementById("Dam_"+SireDam_Position).value        ="";
}    
    var xmlhttp;

    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
    xmlhttp=new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange=function()
    {
        if (xmlhttp.readyState==4 && xmlhttp.status==200)
        {
          if(xmlhttp.responseText==0)
              return false             
          else
          {
                var Items=xmlhttp.responseText.split('#@#');                      
                //Sire  label      
        window.parent.document.getElementById("LSire_"+SireDam_Position).innerHTML=Items[4].trim();
        window.parent.document.getElementById("Aso_Sire_"+SireDam_Position+"_L").innerHTML=Items[6].trim();
        window.parent.document.getElementById("Sire_"+SireDam_Position+"_L").innerHTML=Items[2].trim();        
        //Sire  Text and hidden box
        window.parent.document.getElementById("Sire_Name_"+SireDam_Position).value=Items[4].trim();
        window.parent.document.getElementById("Aso_Sire_"+SireDam_Position+"_Seq").value=Items[7].trim();
        window.parent.document.getElementById("Aso_Sire_"+SireDam_Position).value=Items[6].trim();                
        window.parent.document.getElementById("Sire_"+SireDam_Position+"_Seq").value=Items[0].trim();
        window.parent.document.getElementById("Sire_"+SireDam_Position).value=Items[2].trim();
        
        //Dam  label     
        window.parent.document.getElementById("LDam_"+SireDam_Position).innerHTML=Items[5].trim();
        window.parent.document.getElementById("Aso_Dam_"+SireDam_Position+"_L").innerHTML=Items[8].trim();
        window.parent.document.getElementById("Dam_"+SireDam_Position+"_L").innerHTML=Items[3].trim();        
        //Dam  Text and hidden box
        window.parent.document.getElementById("Dam_Name_"+SireDam_Position).value   =Items[5].trim();
        window.parent.document.getElementById("Aso_Dam_"+SireDam_Position+"_Seq").value=Items[7].trim();
        window.parent.document.getElementById("Aso_Dam_"+SireDam_Position).value    =Items[8].trim();                
        window.parent.document.getElementById("Dam_"+SireDam_Position+"_Seq").value    =Items[1].trim();
        window.parent.document.getElementById("Dam_"+SireDam_Position).value        =Items[3].trim();
                                                          
          }
        }
    }
    xmlhttp.open("GET","frmReg_Ped_PopulateSireDam.jsp?Srch=DAM&DamSeqNo="+valDamSeq,true);
    xmlhttp.send(); 
}

function viewall_Ped()
{
    document.forms[0].method="post";
    document.forms[0].action="frmPedigreeSearchPopupInclude.jsp?viewall=2";
    document.forms[0].target="_self";
    document.forms[0].submit();
}
</script>

<link href="Tables_style.css" rel="stylesheet" type="text/css" />
    <body>        
        <%@ page import="java.util.*" %>
        <%@ page import="java.io.*" %>
        <%@ page import="java.sql.*" %>
        <%@ page import="javax.sql.rowset.*" %>
        <%@ page import="pasotracker.DBConnection" %>
        <%@ page import="pasotracker.GeneralServlet" %>  
      
      <form name="frm_Pedigreesearchpopup_include" method="post">        
        <%@ include file="frmPedigreeSearchPopup.jsp" %>
        
       <div id="maincontent">
       <div class="innertube">
            
<%               
       
        String RegSeq="";
        String str_Reg_no1="";
        String strHor_PName1="";
        String strHor_DOB1="";
        String strAño="";
        String strOrg_Name="";
        String strOrg_Seq="";
        String viewall="";
        int crsSize_All=0;
        int asgno=0;
        String Own_OrgName="";
        String strage="";   
        String strOwn_Type="";
        //1st generation
        String Sire_Seq="";
        String Dam_Seq="";
        String SireRegNum="";
        String DamRegNum="";
        String SireName="";
        String DamName="";
        String Sire_OrgSeq="";
        String Sire_OrgName="";
        String Dam_OrgSeq="";
        String Dam_OrgName="";
               
        
        if(request.getParameter("viewall")!=null)
            viewall=request.getParameter("viewall"); 
        else
            viewall="";
        
        List HorseList = new ArrayList();
        try
        {                                   
            GeneralServlet gen=new GeneralServlet();
             RowSetFactory factory25 = RowSetProvider.newFactory();
   CachedRowSet crsGetHorseDetails= factory25.createCachedRowSet();
            //CachedRowSetImpl crsGetHorseDetails = new CachedRowSetImpl();
           
            if((strHorseType.equals("MALE") || strHorseType.equals("FEMALE") )&& ( viewall.equals("1")|| viewall.equals("2") ))
            {
            
            if(strHorseType.equals("MALE"))                           
            crsGetHorseDetails = gen.GET_SIRE(REGSEQ,str_Reg_no,strHor_PName.replace("\'","''"),strHor_DOB,strmem_name,strmicro_num,strRegistration_Type,strAssignedNo);            
            
            else if(strHorseType.equals("FEMALE"))                            
            crsGetHorseDetails = gen.GET_DAM(REGSEQ,str_Reg_no,strHor_PName.replace("\'","''"),strHor_DOB,strmem_name,strmicro_num,strRegistration_Type,strAssignedNo);
            
            crsSize_All = crsGetHorseDetails.size();
            
            Map MpHorseDetails = new TreeMap();
            
            ArrayList ARList=new ArrayList();
            
            while(crsGetHorseDetails.next())
            {                
                str_Reg_no1="";
                strHor_PName1="";
                strHor_DOB1="";
                strmem_name="";
                strmem_lname="";
                strmicro_num="";
                strAño="";
                strOrg_Name="";
                strOrg_Seq="";
                strAssignedNo="";
                RegSeq="";
                Sire_Seq="";
                Dam_Seq="";
                SireRegNum="";
                DamRegNum="";
                SireName="";
                DamName="";
                Sire_OrgSeq="";
                Sire_OrgName="";
                Dam_OrgSeq="";
                Dam_OrgName="";
                Own_OrgName="";
                strage="";
                strOwn_Type="";
                asgno=0;
     
                if(crsGetHorseDetails.getString("OWNER_TYPE")!=null)                  
                    strOwn_Type=crsGetHorseDetails.getString("OWNER_TYPE").trim();
                
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
                    strmem_lname= crsGetHorseDetails.getString("LASTNAME");
                
                if(crsGetHorseDetails.getString("SUFFIX")!=null)
                    strmem_mname= crsGetHorseDetails.getString("SUFFIX");

                if(crsGetHorseDetails.getString("MICROCHIP_NUM")!=null)                  
                    strmicro_num= crsGetHorseDetails.getString("MICROCHIP_NUM");
                
                if(crsGetHorseDetails.getString("HORSE_ORG_VAL")!=null)                  
                    strOrg_Name= crsGetHorseDetails.getString("HORSE_ORG_VAL");
                
                if(crsGetHorseDetails.getString("ORGANISATION")!=null)                  
                    strOrg_Seq= crsGetHorseDetails.getString("ORGANISATION");
                
                if(crsGetHorseDetails.getString("ORGANIZATION_NAME")!=null)                  
                    Own_OrgName= crsGetHorseDetails.getString("ORGANIZATION_NAME").trim();
                
                if(crsGetHorseDetails.getString("ASSIGNEDNUM")!=null)
                 {
                      strAssignedNo= crsGetHorseDetails.getString("ASSIGNEDNUM");
                      asgno=Integer.parseInt(strAssignedNo);  
                }
                                                
                if(crsGetHorseDetails.getString("SIRE")!=null)                                                              
                   Sire_Seq= crsGetHorseDetails.getString("SIRE");                   
               
                if(crsGetHorseDetails.getString("DAM")!=null)                               
                   Dam_Seq= crsGetHorseDetails.getString("DAM");                                    
                                            
                
                if(crsGetHorseDetails.getString("SIRE_REGISTRATION_NUM")!=null)
                    SireRegNum= crsGetHorseDetails.getString("SIRE_REGISTRATION_NUM");
                
                if(crsGetHorseDetails.getString("DAM_REGISTRATION_NUM")!=null)
                    DamRegNum= crsGetHorseDetails.getString("DAM_REGISTRATION_NUM");
                
                if(crsGetHorseDetails.getString("SIRENAME")!=null)
                    SireName= crsGetHorseDetails.getString("SIRENAME");
                
                if(crsGetHorseDetails.getString("DAMNAME")!=null)
                    DamName= crsGetHorseDetails.getString("DAMNAME");                

                if(crsGetHorseDetails.getString("SIRE_ORGANISATION")!=null)                  
                    Sire_OrgName= crsGetHorseDetails.getString("SIRE_ORGANISATION");
                
                if(crsGetHorseDetails.getString("SIRE_ORGANISATION_SEQ")!=null)                  
                    Sire_OrgSeq= crsGetHorseDetails.getString("SIRE_ORGANISATION_SEQ");
                
                if(crsGetHorseDetails.getString("DAM_ORGANISATION")!=null)                  
                    Dam_OrgName= crsGetHorseDetails.getString("DAM_ORGANISATION");
                
                if(crsGetHorseDetails.getString("DAM_ORGANISATION_SEQ")!=null)                  
                    Dam_OrgSeq= crsGetHorseDetails.getString("DAM_ORGANISATION_SEQ");
                
                if(crsGetHorseDetails.getString("AGE")!=null)                  
                    strage= crsGetHorseDetails.getString("AGE"); 
                                             
                strOwnerName=strmem_name+" "+strmem_lname;

                MpHorseDetails = new TreeMap();
                
                MpHorseDetails.put("REG",str_Reg_no1);
                MpHorseDetails.put("HORSENAME",strHor_PName1);
            
				strHor_PName1 = strHor_PName1.replace("\'", "%27");
                MpHorseDetails.put("HORSENAMES",strHor_PName1);
            
                MpHorseDetails.put("DOB",strHor_DOB1);
                
                if(strOwn_Type.equalsIgnoreCase("INDIVIDUAL") 
					|| strOwn_Type.equalsIgnoreCase("YOUTH RIDER") ||(strOwn_Type.equals("") && Own_OrgName.equals("") ))
                    MpHorseDetails.put("OWNER",strOwnerName);  /* FULL NAME */
                else
                    MpHorseDetails.put("OWNER",Own_OrgName); 
                                                
                MpHorseDetails.put("MCHIP",strmicro_num);
                MpHorseDetails.put("REGSEQ",RegSeq);
                MpHorseDetails.put("ORGSEQ",strOrg_Seq);
                MpHorseDetails.put("ORGNAME",strOrg_Name);
                MpHorseDetails.put("ASSIGNEDNUM",strAssignedNo);                               
                MpHorseDetails.put("SIRESEQ",Sire_Seq);
                MpHorseDetails.put("DAMSEQ",Dam_Seq);
                MpHorseDetails.put("AGE",strage);
                
                MpHorseDetails.put("SIREREGNUM",SireRegNum);
                MpHorseDetails.put("DAMREGNUM",DamRegNum);
                MpHorseDetails.put("SIRENAME",SireName);
                MpHorseDetails.put("DAMNAME",DamName);                
                MpHorseDetails.put("SIREORG",Sire_OrgName);
                MpHorseDetails.put("DAMORG",Dam_OrgName);
                MpHorseDetails.put("SIREORGSEQ",Sire_OrgSeq);
                MpHorseDetails.put("DAMORGSEQ",Dam_OrgSeq);
				
				SireName=SireName.replace("\'", "%27");
				DamName=DamName.replace("\'", "%27");
				
				MpHorseDetails.put("SIRENAMES",SireName);
                MpHorseDetails.put("DAMNAMES",DamName); 
                
                HorseList.add(MpHorseDetails);
            }
            }
            
            
        }
        catch(Exception ex)
        {
                ex.printStackTrace();	
        }

        request.setAttribute("HorseList", HorseList);        

        if(viewall.equals("1"))
        {             
%>       
        <display:table  id="Details" name="requestScope.HorseList" 
                        pagesize="100" 
                        class="grid"
                        style="border-color:Black;border-width:0px;border-style:None;border-collapse:collapse;text-transform: uppercase;">
        <display:setProperty name="paging.banner.item_name" value="Horse" />
        <display:setProperty name="paging.banner.items_name" value="Horses" />
        <display:setProperty name="paging.banner.some_items_found">

            <span class="pagebanner" >{0} {1} founds,displaying {2} to {3}</span>
            <span ><input type="checkbox" onClick="viewall_Ped()"> <font style="font-weight:bold;">View All&nbsp;&nbsp;&nbsp;</font></span>

        </display:setProperty>
        <display:column style="width:1%" headerClass="Grid_Header">
        <input type="radio" name="checkedVal" onclick="returnSireDam('<%=strHorName%>','<%=strHorReg%>','${Details.REG}','${Details.HORSENAMES}'
,'<%=strLabelHor%>','${Details.REGSEQ}','<%=strHorseRegSeq%>','<%=strHorseOrgName%>','<%=strHorseOrgSeq%>','${Details.ORGNAME}','${Details.ORGSEQ}'
,'${Details.SIRESEQ}','${Details.DAMSEQ}','${Details.SIREREGNUM}','${Details.DAMREGNUM}','${Details.SIRENAMES}','${Details.DAMNAMES}','${Details.SIREORGSEQ}','${Details.DAMORGSEQ}','${Details.SIREORG}','${Details.DAMORG}')" />
        </display:column>
        <display:column style="width:10%" title="REG#" property="REG" sortable="true" headerClass="Grid_Header" />        
        <display:column style="width:20%" property="HORSENAME"  title="HORSE NAME" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:5%" property="AGE"  sortable="true" headerClass="Grid_Header" />
        <display:column style="width:5%"   title="ID#" property="ASSIGNEDNUM" sortable="true" headerClass="Grid_Header"/>
        <display:column style="width:20%" property="OWNER" headerClass="Grid_Header" />
        <display:column style="width:20%" property="SIRENAME" title="SIRE"  headerClass="Grid_Header" />
        <display:column style="width:20%" property="DAMNAME" title="DAM" headerClass="Grid_Header" />
        <%--<display:column style="width:5%" property="MCHIP" headerClass="Grid_Header" />--%>
        </display:table>
<%   }     
else if(viewall.equals("2"))
        {
     out.println(crsSize_All +" Horses founds,displaying 1 to "+ crsSize_All); 
%>
        <display:table  id="Details" name="requestScope.HorseList" 
                        class="grid"
                        style="border-color:Black;border-width:0px;border-style:None;border-collapse:collapse;text-transform: uppercase;">
                        
        <display:column style="width:1%" headerClass="Grid_Header">
        <input type="radio" name="checkedVal" onclick="returnSireDam('<%=strHorName%>','<%=strHorReg%>','${Details.REG}','${Details.HORSENAMES}','<%=strLabelHor%>','${Details.REGSEQ}','<%=strHorseRegSeq%>','<%=strHorseOrgName%>','<%=strHorseOrgSeq%>','${Details.ORGNAME}','${Details.ORGSEQ}'
,'${Details.SIRESEQ}','${Details.DAMSEQ}','${Details.SIREREGNUM}','${Details.DAMREGNUM}','${Details.SIRENAMES}','${Details.DAMNAMES}','${Details.SIREORGSEQ}','${Details.DAMORGSEQ}','${Details.SIREORG}','${Details.DAMORG}')" />
        </display:column>
        <display:column style="width:10%" title="REG#" property="REG" sortable="true" headerClass="Grid_Header" />        
        <display:column style="width:20%" property="HORSENAME"  title="HORSE NAME" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:5%" property="AGE"  sortable="true" headerClass="Grid_Header" />
        <display:column style="width:5%"   title="ID#" property="ASSIGNEDNUM" sortable="true" headerClass="Grid_Header"/>
        <display:column style="width:20%" property="OWNER" headerClass="Grid_Header" />
        <display:column style="width:20%" property="SIRENAME" title="SIRE"  headerClass="Grid_Header" />
        <display:column style="width:20%" property="DAMNAME" title="DAM" headerClass="Grid_Header" />
        <%--<display:column style="width:5%" property="MCHIP" headerClass="Grid_Header" />--%>
        </display:table>            
<%}%>                 
   </div>
 </div>
 

    </form>
    </body>
</html>
