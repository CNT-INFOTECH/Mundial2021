<%-- 
    Document   : frmReg_Ped_SireDamSearch
    Created on : Aug 12, 2011, 12:12:26 PM
    Author     : Erzath
--%>

<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <link href="Tables_style.css" rel="stylesheet" type="text/css" />
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
    <script type="text/javascript">
function viewall_Ped(FLD_HName,HType)
{       
    valHname= window.parent.document.getElementById(FLD_HName.value).value;
    document.forms[0].method="post";
    document.forms[0].action='frmReg_Ped_SireDamSearch.jsp?viewall=2&HName='+valHname+'&HorType='+HType.value;
    document.forms[0].target="_self";
    document.forms[0].submit();
}
function Close_Ped(Htyp,varHReg,size)
{   var PopUp_Name="";
    if(Htyp.value=='MALE')
        Popup_Name="Sire";
    else
        Popup_Name="Dam";
    
    if(size!=0)
        window.parent.document.getElementById(varHReg).value="";
    /*else    
        Pedigree_AjaxRegNumCheck(varHReg,PopUp_Name,Htyp);
    */
        
    window.parent.jQuery('#dialog-PedigreeSearch_'+Popup_Name).dialog('close')              
}

//To check whether Registration No exist or not
function Pedigree_AjaxRegNumCheck(Obj,PopUp_Name,Htyp)
{    
    var value=window.parent.document.getElementById(Obj).value;    
    if(Htyp.value=='MALE')
        RegNo_Gend="Female";
    else
        RegNo_Gend="Male";
    
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
              var Items=xmlhttp.responseText;               
              /*alert("Registration Number Already Exist in "+RegNo_Gend+".");*/              
              window.parent.document.getElementById(Obj).value='';
          }
        }
    }
    xmlhttp.open("GET","RegistrationServlet?PAGEID=REGISTRATION_NUM_CHECK&RegNo="+value,true);
    xmlhttp.send();
}
function returnSireDam(HName,RegName,varRegNum,varHrsName,LabelValue,varRegSeq,SeqName,varOrgName,varOrgSeq,val_Orgname,val_Orgseq,
     SireSeq,DamSeq,SireRegNo,DamRegNo,SireName,DamName,SireOrgSeq,DamOrgSeq,SireOrgName,DamOrgName)    
{    
    window.parent.document.getElementById(LabelValue).innerHTML='<a href="index.jsp?Mode=2&RegNo='+varRegSeq+'" >'+varHrsName+'</a>';
    window.parent.document.getElementById(HName).value=varHrsName;
    window.parent.document.getElementById(SeqName).value=varRegSeq;   
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
        window.parent.document.getElementById("Dam_Name_"+SireDam_Position).value   =DamName;
        window.parent.document.getElementById("Aso_Dam_"+SireDam_Position+"_Seq").value=DamOrgSeq;
        window.parent.document.getElementById("Aso_Dam_"+SireDam_Position).value    =DamOrgName;                
        window.parent.document.getElementById("Dam_"+SireDam_Position+"_Seq").value    =DamSeq;
        window.parent.document.getElementById("Dam_"+SireDam_Position).value        =DamRegNo;
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
        window.parent.document.getElementById("Sire_Name_"+SireDam_Position).value="";
        window.parent.document.getElementById("Aso_Sire_"+SireDam_Position+"_Seq").value="";
        window.parent.document.getElementById("Aso_Sire_"+SireDam_Position).value="";
        window.parent.document.getElementById("Sire_"+SireDam_Position+"_Seq").value="";
        window.parent.document.getElementById("Sire_"+SireDam_Position).value="";
        
        window.parent.document.getElementById("LDam_"+SireDam_Position).innerHTML="";
        window.parent.document.getElementById("Aso_Dam_"+SireDam_Position+"_L").innerHTML="";
        window.parent.document.getElementById("Dam_"+SireDam_Position+"_L").innerHTML="";        
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
            window.parent.document.getElementById("LSire_"+SireDam_Position).innerHTML=Items[4].trim();
            window.parent.document.getElementById("Aso_Sire_"+SireDam_Position+"_L").innerHTML=Items[6].trim();
            window.parent.document.getElementById("Sire_"+SireDam_Position+"_L").innerHTML=Items[2].trim();                
            window.parent.document.getElementById("Sire_Name_"+SireDam_Position).value=Items[4].trim();
            window.parent.document.getElementById("Aso_Sire_"+SireDam_Position+"_Seq").value=Items[7].trim();
            window.parent.document.getElementById("Aso_Sire_"+SireDam_Position).value=Items[6].trim();                
            window.parent.document.getElementById("Sire_"+SireDam_Position+"_Seq").value=Items[0].trim();
            window.parent.document.getElementById("Sire_"+SireDam_Position).value=Items[2].trim();


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

    </script>
    <body>
        
    <%@ page import="java.util.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.rowset.*" %>        
    <%@ page import="pasotracker.GeneralServlet" %>
    <form name="Ped_SireDamSearchFrm">
       <div id="maincontent_add">
            <div class="innertube">
<%
        String Var_HName = request.getParameter("varHName");
        String strHor_PName = request.getParameter("HName");
        String strHorseType = request.getParameter("HorType");
        String strHorReg = request.getParameter("HReg");
        String strHorseRegSeq = request.getParameter("HorSeq");  
        String strHorseOrgName=request.getParameter("HorOrgName");  
        String strHorseOrgSeq=request.getParameter("HorOrgSeq"); 
        String strLabelHor = request.getParameter("LabelHor");
        String str_Reg_no = request.getParameter("valRegNo");
                                    
        String REGSEQ="";        
        String strHor_DOB="";
        String strmem_name="";
        String strmem_lname="";
        String strmem_mname="";
        String strmicro_num="";
        String strRegistration_Type="";
        String strOrg_Name="";
        String strOrg_Seq="";
        String viewall="";
        String strOwnerName="";
        String strAssignedNo="";
        int crsSize_All=0;        
        int asgno=0;
        String Own_OrgName="";
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
        String strage="";
        
        if(request.getParameter("viewall")!=null)
            viewall=request.getParameter("viewall");
        else
            viewall="";
        
        List HorseList = new ArrayList();
        try
        {                                   
            GeneralServlet gen=new GeneralServlet();
             RowSetFactory factory21 = RowSetProvider.newFactory();
   CachedRowSet crsGetHorseDetails= factory21.createCachedRowSet();
            //11CachedRowSetImpl crsGetHorseDetails = new CachedRowSetImpl();            
            
            if((strHorseType.equals("MALE") || strHorseType.equals("FEMALE") )&& (viewall.equals("1") || viewall.equals("2")))
            {
            if(strHorseType.equals("MALE") && viewall.equals("1") )            
                crsGetHorseDetails = gen.GET_SIRE(REGSEQ,str_Reg_no,strHor_PName,strHor_DOB,strmem_name,strmicro_num,strRegistration_Type,strAssignedNo);
            
            else if(strHorseType.equals("FEMALE") && viewall.equals("1") )           
                crsGetHorseDetails = gen.GET_DAM(REGSEQ,str_Reg_no,strHor_PName,strHor_DOB,strmem_name,strmicro_num,strRegistration_Type,strAssignedNo);
            
            crsSize_All = crsGetHorseDetails.size();
            
            Map MpHorseDetails = new TreeMap();
    
            while (crsGetHorseDetails.next())
            {
                str_Reg_no="";
                strHor_PName="";
                strHor_DOB="";
                strmem_name="";
                strmicro_num="";                
                strOrg_Name="";
                strAssignedNo="";
                Own_OrgName="";
                strage="";
                
                if(crsGetHorseDetails.getString("REGSEQ")!=null)                  
                    REGSEQ= crsGetHorseDetails.getString("REGSEQ").trim();

                if(crsGetHorseDetails.getString("REGISTRATION_NUM")!=null)                  
                    str_Reg_no= crsGetHorseDetails.getString("REGISTRATION_NUM").trim();  

                if(crsGetHorseDetails.getString("HORSE_PRIMARYNAME")!=null)                     
                    strHor_PName= crsGetHorseDetails.getString("HORSE_PRIMARYNAME").trim();  

                if(crsGetHorseDetails.getString("DOB")!=null)                  
                    strHor_DOB= crsGetHorseDetails.getString("DOB").trim();  

                if(crsGetHorseDetails.getString("FIRSTNAME")!=null)                  
                    strmem_name= crsGetHorseDetails.getString("FIRSTNAME").trim();
                
                if(crsGetHorseDetails.getString("LASTNAME")!=null)
                    strmem_lname= crsGetHorseDetails.getString("LASTNAME").trim();
                
                if(crsGetHorseDetails.getString("SUFFIX")!=null)
                    strmem_mname= crsGetHorseDetails.getString("SUFFIX").trim();

                if(crsGetHorseDetails.getString("MICROCHIP_NUM")!=null)                  
                    strmicro_num= crsGetHorseDetails.getString("MICROCHIP_NUM").trim();
                
                if(crsGetHorseDetails.getString("HORSE_ORG_VAL")!=null)                  
                    strOrg_Name= crsGetHorseDetails.getString("HORSE_ORG_VAL").trim();
                
                if(crsGetHorseDetails.getString("ORGANISATION")!=null)                  
                    strOrg_Seq= crsGetHorseDetails.getString("ORGANISATION").trim();
                
                if(crsGetHorseDetails.getString("ORGANIZATION_NAME")!=null)                  
                    Own_OrgName= crsGetHorseDetails.getString("ORGANIZATION_NAME").trim();
                
                if(crsGetHorseDetails.getString("ASSIGNEDNUM")!=null)
                {
                       strAssignedNo= crsGetHorseDetails.getString("ASSIGNEDNUM").trim();
                       asgno=Integer.parseInt(strAssignedNo);  
                }
                
                if(crsGetHorseDetails.getString("SIRE")!=null)
                    Sire_Seq= crsGetHorseDetails.getString("SIRE").trim();
                
                if(crsGetHorseDetails.getString("DAM")!=null)
                    Dam_Seq= crsGetHorseDetails.getString("DAM").trim();                                                                   
                
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
                MpHorseDetails.put("REG",str_Reg_no);
                MpHorseDetails.put("HORSENAME",strHor_PName);
                MpHorseDetails.put("DOB",strHor_DOB);
                if(!Own_OrgName.equals(""))
                    MpHorseDetails.put("OWNER",Own_OrgName);
                else
                    MpHorseDetails.put("OWNER",strOwnerName);
                
                MpHorseDetails.put("MCHIP",strmicro_num);
                MpHorseDetails.put("REGSEQ",REGSEQ);
                MpHorseDetails.put("ORGSEQ",strOrg_Seq);
                MpHorseDetails.put("ORGNAME",strOrg_Name);
                MpHorseDetails.put("ASSIGNEDNUM",asgno);
                MpHorseDetails.put("AGE",strage);
                
                MpHorseDetails.put("SIRESEQ",Sire_Seq);
                MpHorseDetails.put("DAMSEQ",Dam_Seq);
                MpHorseDetails.put("SIREREGNUM",SireRegNum);
                MpHorseDetails.put("DAMREGNUM",DamRegNum);
                MpHorseDetails.put("SIRENAME",SireName);
                MpHorseDetails.put("DAMNAME",DamName);                
                MpHorseDetails.put("SIREORG",Sire_OrgName);
                MpHorseDetails.put("DAMORG",Dam_OrgName);
                MpHorseDetails.put("SIREORGSEQ",Sire_OrgSeq);
                MpHorseDetails.put("DAMORGSEQ",Dam_OrgSeq);                                

                HorseList.add(MpHorseDetails);
            }
            }
        }
        catch(Exception ex)
        {
                ex.printStackTrace();	

        }

        request.setAttribute("HorseList", HorseList);
%>
<input type="hidden" name="fldname" id="fldname" value="<%=Var_HName%>" />
<input type="hidden" name="Hortyp" id="Hortyp" value="<%=strHorseType%>" />
<input type="hidden" name="HdnHorseRegno" value="<%=strHorReg%>">                                     
<input type="hidden" name="HdnHorseRegSeq" value="<%=strHorseRegSeq%>">
<input type="hidden" name="HdnLabelHorse" value="<%=strLabelHor%>"> 
<input type="hidden" name="HdnHorseOrgName" value="<%=strHorseOrgName%>"> 
<input type="hidden" name="HdnHorseOrgSeq" value="<%=strHorseOrgSeq%>"> 
<%
        if(viewall.equals("1"))
        {
%>
       

        <display:table  id="Details" name="requestScope.HorseList" 
                        pagesize="100" defaultsort="2" defaultorder="ascending"
                        class="grid"
                        style="border-color:Black;border-width:0px;border-style:None;border-collapse:collapse;text-transform: uppercase;">
        <display:setProperty name="paging.banner.item_name" value="Horse" />
        <display:setProperty name="paging.banner.items_name" value="Horses" />
        <display:setProperty name="paging.banner.some_items_found">

            <span class="pagebanner" >{0} {1} founds,displaying {2} to {3}</span>
            <span ><input type="checkbox" onClick="viewall_Ped(fldname,Hortyp)"> <font style="font-weight:bold;">View All&nbsp;&nbsp;&nbsp;</font></span>

        </display:setProperty>
        <display:column style="width:1%" headerClass="Grid_Header">
        <input type="radio" name="checkedVal" onclick="returnSireDam('<%=Var_HName%>','<%=strHorReg%>','${Details.REG}','${Details.HORSENAME}','<%=strLabelHor%>','${Details.REGSEQ}','<%=strHorseRegSeq%>','<%=strHorseOrgName%>','<%=strHorseOrgSeq%>','${Details.ORGNAME}','${Details.ORGSEQ}'
,'${Details.SIRESEQ}','${Details.DAMSEQ}','${Details.SIREREGNUM}','${Details.DAMREGNUM}','${Details.SIRENAME}','${Details.DAMNAME}','${Details.SIREORGSEQ}','${Details.DAMORGSEQ}','${Details.SIREORG}','${Details.DAMORG}')" />
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
     out.println(crsSize_All+" items found");
%>
        <display:table  id="Details" name="requestScope.HorseList" 
                        defaultsort="2" defaultorder="ascending"
                        class="grid"
                        style="border-color:Black;border-width:0px;border-style:None;border-collapse:collapse;text-transform: uppercase;">
                        
        <display:column style="width:1%" headerClass="Grid_Header">
        <input type="radio" name="checkedVal" onclick="returnSireDam('<%=Var_HName%>','<%=strHorReg%>','${Details.REG}','${Details.HORSENAME}','<%=strLabelHor%>','${Details.REGSEQ}','<%=strHorseRegSeq%>','<%=strHorseOrgName%>','<%=strHorseOrgSeq%>','${Details.ORGNAME}','${Details.ORGSEQ}'
,'${Details.SIRESEQ}','${Details.DAMSEQ}','${Details.SIREREGNUM}','${Details.DAMREGNUM}','${Details.SIRENAME}','${Details.DAMNAME}','${Details.SIREORGSEQ}','${Details.DAMORGSEQ}','${Details.SIREORG}','${Details.DAMORG}')" />
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
<div id="framecontent_add">
<div class="innertube">
<table width="100%">
    <tr>
        <td align="right">
            <input type="button" id="Reg_Pedigree" class="button" onclick="newreg_Ped()" value="New Horse" />
            <input type="button" class="button" value="Close" onclick="Close_Ped(Hortyp,'<%=strHorReg%>','<%=crsSize_All%>')" name="closeped" id="closeped">
        </td>
    </tr>    
</table>
</div>
</div>    
<div id="dialog-NewReg" title="HORSE REGISTRATION" style="display:none; background:url('Images/trans-wood-1.png');" >
    <iframe  src="frmReg_Pedigree_NewRegistration.jsp"  id="modalIFrame_NewReg" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes">
    </iframe>
</div>
    </body>
</html>
