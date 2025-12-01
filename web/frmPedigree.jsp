
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.GeneralServlet" %>
<html>
<head>
<title>PEDIGREE</title>

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
<link href="buttons.css" rel="stylesheet" type="text/css" />

<link href="Registration.css" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/interface.js"></script>
<script type="text/javascript">
function trimRegister(str){
	str = str.replace(/^\s+/, '');
	for (var i = str.length - 1; i >= 0; i--) {
		if (/\S/.test(str.charAt(i))) {
			str = str.substring(0, i + 1);
			break;
		}
	}
	return str;
}
function checkSireDam(GenType,varName,varLabel,varReg,varRSeq,varOrg,varOSeq)
{    
    valRegNo = document.getElementById(varReg).value;    
    valHName = document.getElementById(varName).value;            
        
    if(valHName=='' && valRegNo=='')
        return false;    
    
    if(GenType=='MALE')
        Popup_Name='Sire';
    else
        Popup_Name='Dam';
    
    $('#dialog-PedigreeSearch_'+Popup_Name).dialog({ autoOpen: false,height: 550,width: 740, modal: true });
    $('#dialog-PedigreeSearch_'+Popup_Name).dialog('open');    
    $("#modalIFrame_Pedigree_"+Popup_Name).attr('src','frmReg_Ped_SireDamSearch.jsp?valRegNo='+valRegNo+'&varHName='+varName+'&HName='+valHName+'&HorType='+GenType+'&viewall=1'+'&HReg='+varReg+'&HorSeq='+varRSeq+'&HorOrgName='+varOrg+'&HorOrgSeq='+varOSeq+'&LabelHor='+varLabel);
    return false;//HName='+Elem1+'&HReg='+Elem2+'&LabelHor='+Elem3+'&HorSeq='+Elem4+'&HorType='+ElemType+'&HorOrgName='+Elem5+'&HorOrgSeq='+Elem6    
}
function SaveMode_P()
{
    document.getElementById('SavedYN').value='N'; 
}

function Ped_To_Index(Elem1)
{       
    valSeq= document.getElementById(Elem1).value;    
    document.forms[0].method="post";
    document.forms[0].action="index.jsp?Mode=2&RegNo="+valSeq;
    document.forms[0].target="_self";  
    document.forms[0].submit();
    
}
function EmptySireDam(SireDam_Position)
{       
    document.getElementById("LSire_"+SireDam_Position).innerHTML="";
    document.getElementById("Aso_Sire_"+SireDam_Position+"_L").innerHTML="";
    document.getElementById("Sire_"+SireDam_Position+"_L").innerHTML="";
    //Sire  Text and hidden box
    document.getElementById("Sire_Name_"+SireDam_Position).value="";
    document.getElementById("Aso_Sire_"+SireDam_Position+"_Seq").value="";
    document.getElementById("Aso_Sire_"+SireDam_Position).value="";
    document.getElementById("Sire_"+SireDam_Position+"_Seq").value="";
    document.getElementById("Sire_"+SireDam_Position).value="";
    //Dam  label     
    document.getElementById("LDam_"+SireDam_Position).innerHTML="";
    document.getElementById("Aso_Dam_"+SireDam_Position+"_L").innerHTML="";
    document.getElementById("Dam_"+SireDam_Position+"_L").innerHTML="";     
    //Dam  Text and hidden box
    document.getElementById("Dam_Name_"+SireDam_Position).value="";
    document.getElementById("Aso_Dam_"+SireDam_Position+"_Seq").value="";
    document.getElementById("Aso_Dam_"+SireDam_Position).value="";                
    document.getElementById("Dam_"+SireDam_Position+"_Seq").value="";
    document.getElementById("Dam_"+SireDam_Position).value="";

}
function EmptySire(Sire_Position)
{       
    document.getElementById("LSire_"+Sire_Position).innerHTML="";
    document.getElementById("Aso_Sire_"+Sire_Position+"_L").innerHTML="";
    document.getElementById("Sire_"+Sire_Position+"_L").innerHTML="";
    //Sire  Text and hidden box
    document.getElementById("Sire_Name_"+Sire_Position).value="";
    document.getElementById("Aso_Sire_"+Sire_Position+"_Seq").value="";
    document.getElementById("Aso_Sire_"+Sire_Position).value="";
    document.getElementById("Sire_"+Sire_Position+"_Seq").value="";
    document.getElementById("Sire_"+Sire_Position).value="";
} 
function EmptyDam(Dam_Position)
{ 
    //Dam  label     
    document.getElementById("LDam_"+Dam_Position).innerHTML="";
    document.getElementById("Aso_Dam_"+Dam_Position+"_L").innerHTML="";
    document.getElementById("Dam_"+Dam_Position+"_L").innerHTML="";     
    //Dam  Text and hidden box
    document.getElementById("Dam_Name_"+Dam_Position).value="";
    document.getElementById("Aso_Dam_"+Dam_Position+"_Seq").value="";
    document.getElementById("Aso_Dam_"+Dam_Position).value="";                
    document.getElementById("Dam_"+Dam_Position+"_Seq").value="";
    document.getElementById("Dam_"+Dam_Position).value="";

}
function Delete_Ped_RegNo(valChildSeq,sire_dam_Seq,valHGender,valMAINSEQ,varLHname,varTHname,varLRegno,varTxtRegNo,TxtOrg,LblOrg,TxtOrgSeq,TxtRegSeq)
{
        
    if(trimRegister(valChildSeq)=='')
        return  false;
    
    if(trimRegister(sire_dam_Seq)=='')
    {   
        if(trimRegister(document.getElementById(TxtRegSeq).value)!='')
        {
        var bconfirm = confirm("Are you sure want to delete?");
        if(bconfirm)
        {
        document.getElementById(varLHname).innerHTML="";
        document.getElementById(varLRegno).innerHTML="";
        document.getElementById(LblOrg).innerHTML="";         
        document.getElementById(varTHname).value="";
        document.getElementById(varTxtRegNo).value="";
        document.getElementById(TxtOrg).value="";                
        document.getElementById(TxtOrgSeq).value="";
        document.getElementById(TxtRegSeq).value="";        
        }
        }
        return  false;
    }
    
    var bconfirm = confirm("Are you sure want to delete?");
    if(bconfirm)
    {                 
        var j=0;
        var SireDam_Position="";
        // this for loop - is for checking whether the childseq is repeating in any other position 
        for(j=0;j<3;j++)
        {            
            if(j==0)            
            {
                if(valChildSeq == document.getElementById("Dam_Seq").value)
                {   
                    SireDam_Position0="1_2"; 
                    SireDam_Position1="2_3";
                    SireDam_Position2="2_4";
                    for(i=0;i<2;i++){
                    if(i==0 && TxtRegSeq=="Sire_1_2_Seq")                            
                        EmptySire(SireDam_Position0);
                    else if(i==0 && TxtRegSeq=="Dam_1_2_Seq")
                        EmptyDam(SireDam_Position0);
                    else if(i==1 && TxtRegSeq=="Sire_1_2_Seq")                            
                        EmptySireDam(SireDam_Position1);
                    else if(i==1 && TxtRegSeq=="Dam_1_2_Seq")
                        EmptySireDam(SireDam_Position2);}
                }        
                if(valChildSeq == document.getElementById("Sire_Seq").value)
                {   
                    SireDam_Position0="1"; 
                    SireDam_Position1="2_1";
                    SireDam_Position2="2_2";
                    for(i=0;i<2;i++){
                    if(i==0 && TxtRegSeq=="Sire_1_Seq")                            
                        EmptySire(SireDam_Position0);
                    else if(i==0 && TxtRegSeq=="Dam_1_Seq")
                        EmptyDam(SireDam_Position0);
                    else if(i==1 && TxtRegSeq=="Sire_1_Seq")                            
                        EmptySireDam(SireDam_Position1);
                    else if(i==1 && TxtRegSeq=="Dam_1_Seq")
                        EmptySireDam(SireDam_Position2);}
                }
            }
            else if(j==1 || j==2)
            {    
                if(j==1)
                    SireDam_Position="1";                
                else if(j==2)
                    SireDam_Position="1_2";
            
                if(valChildSeq == document.getElementById("Dam_"+SireDam_Position+"_Seq").value)
                {                   
                if(SireDam_Position=="1")
                {
                    if(valHGender=='s')
                    EmptySire("2_2");
                    else if(valHGender=='d')
                    EmptyDam("2_2");                    
                }
                else if(SireDam_Position=="1_2")
                {
                    if(valHGender=='s')
                    EmptySire("2_4");
                    else if(valHGender=='d')
                    EmptyDam("2_4");                
                }               
                }        
                else if(valChildSeq == document.getElementById("Sire_"+SireDam_Position+"_Seq").value)
                {                   
                if(SireDam_Position=="1")
                {
                    if(valHGender=='s')
                    EmptySire("2_1");
                    else if(valHGender=='d')
                    EmptyDam("2_1");                    
                }
                else if(SireDam_Position=="1_2")
                {
                    if(valHGender=='s')
                    EmptySire("2_3");
                    else if(valHGender=='d')
                    EmptyDam("2_3");                
                }                
                }
            }
        }    
        // this is the begining of ajax function to delete the horse for the child
        var xmlhttp;
        var i_loop=0;
        var i=0;    
        
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
            if(xmlhttp.responseText.length >0)
            {
                var Items=xmlhttp.responseText;             
                document.getElementById(varLHname).innerHTML="";
                document.getElementById(LblOrg).innerHTML="";     
                document.getElementById(varLRegno).innerHTML="";                  
                document.getElementById(varTHname).value="";                           
                document.getElementById(varTxtRegNo).value="";                                                                 
                document.getElementById(TxtOrg).value="";
                document.getElementById(TxtOrgSeq).value="";
                document.getElementById(TxtRegSeq).value="";                
                
                if(varTxtRegNo=="Sire"||varTxtRegNo=="Dam"||varTxtRegNo=="Sire_1"||varTxtRegNo=="Dam_1"||varTxtRegNo=="Sire_1_2"||varTxtRegNo=="Dam_1_2")
                {
                    if(varTxtRegNo=="Sire")
                    {
                    SireDam_Position0="1"; 
                    SireDam_Position1="2_1";
                    SireDam_Position2="2_2";     
                    i_loop=3;
                    }
                    else if(varTxtRegNo=="Dam")
                    {    
                    SireDam_Position0="1_2"; 
                    SireDam_Position1="2_3";
                    SireDam_Position2="2_4";                
                    i_loop=3;
                    }
                    else if(varTxtRegNo=="Sire_1")
                    {    
                    SireDam_Position0="2_1";
                    i_loop=1;
                    }
                    else if(varTxtRegNo=="Dam_1")
                    {    
                    SireDam_Position0="2_2";
                    i_loop=1;
                    }
                    else if(varTxtRegNo=="Sire_1_2")
                    {    
                    SireDam_Position0="2_3";
                    i_loop=1;
                    }
                    else if(varTxtRegNo=="Dam_1_2")
                    {    
                    SireDam_Position0="2_4";
                    i_loop=1;
                    }                               
                    for(i=0;i<i_loop;i++)
                    {                                               
                        if(i==0)                            
                        EmptySireDam(SireDam_Position0);
                        if(i==1)                            
                        EmptySireDam(SireDam_Position1);
                        if(i==2)                            
                        EmptySireDam(SireDam_Position2);
                    }
                }
            }         
            }
        }
    xmlhttp.open("GET","frmPedigree.jsp?Mode=3&csrq="+valChildSeq+"&grch="+valHGender,true);
    xmlhttp.send(); 
    }        
}
function Edit_HorseInfm(seqVar,LHorNam,THorName,LReg,TReg,LAso,TAso,TAsoSeq)
{       
    seqVal=document.getElementById(seqVar).value;
        
    if(seqVal=='')
    return false;
       
    $('#dialog-EditHorseInformation').dialog({ autoOpen: false,height:350,width: 610, modal: true });
    $('#dialog-EditHorseInformation').dialog('open');    
    $("#modalIFrame_EditHorseInformation").attr('src','frmReg_Ped_EditHorseInfm.jsp?RSq='+seqVal+"&LHorNam="+LHorNam+"&THorName="+THorName+"&LReg="+LReg+"&TReg="+TReg+"&LAso="+LAso+"&TAso="+TAso+"&TAsoSeq="+TAsoSeq);
    return false;
}
</script>

<style type="text/css">
#footer_Bot {
    clear:both;
    text-align:center;
    /*background: #555;
    color:#fff;*/
    height:50px;
    padding:5px;
    bottom: auto;
}
</style>
</head>
<body>    
 <form name="pedigree_frm">
 <%@ include file="frmReg_ScreenAttributes.jsp"%>
    <div id="container">    
    <div id="header">
            <%@ include file="frmHeader.jsp" %>
        </div>        
<%		
		if(!bRegistraion)
		response.sendRedirect("login.jsp");

    String REGSEQ="";        
    String strMode="";
    String SaveYN="N";
    
    
    if(request.getParameter("Mode")!=null)
        strMode=request.getParameter("Mode");
    else
        strMode="";
    
    if(strMode.equals("1"))
    {
    SaveYN="N";            
    session.removeAttribute("ses_REGSEQ");        
    }
    if(strMode.equals("2"))
    {
        if(request.getParameter("RegNo")!=null)
        REGSEQ =request.getParameter("RegNo");
        else
        REGSEQ="";           
    }
    else if(session.getAttribute("ses_REGSEQ")!=null)
        REGSEQ =(String) session.getAttribute("ses_REGSEQ");
    else
        REGSEQ="";                
%>
     <%@ include file="frmPedigreeInclude.jsp"%>
<%
        String strDamSecStyle="background:none";
        String FontColor="";
        String RegType="";

        if(strRegistration_Type.equals("R"))
        {
           FontColor="blue";
           RegType="R";
        }
        else if(strRegistration_Type.equals("P"))
        {
           FontColor="red";
           RegType="P";
        }
        else if(strRegistration_Type.equals("S"))
        {
           FontColor="green";
           RegType="S";
        }
        try{
            
            GeneralServlet gen =new GeneralServlet();
            RowSetFactory factory21 = RowSetProvider.newFactory();
   CachedRowSet crsGetPedigreeDetails= factory21.createCachedRowSet();
            //CachedRowSetImpl crsGetPedigreeDetails = new CachedRowSetImpl();
            if(REGSEQ.length()>0 && REGSEQ!=null)
            {crsGetPedigreeDetails = gen.GetPedigree(REGSEQ);
            
            if(crsGetPedigreeDetails.next())
            {
                
                if(crsGetPedigreeDetails.getString("SIRE")!=null)
                    strSire=crsGetPedigreeDetails.getString("SIRE").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("SIRESEQ")!=null)
                    strSire_Seq=crsGetPedigreeDetails.getString("SIRESEQ").trim();
                
                if(crsGetPedigreeDetails.getString("SIREORGANISATION")!=null)
                    strAso_Sire=crsGetPedigreeDetails.getString("SIREORGANISATION").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("Sire_Name")!=null)
                    strSire_Name=crsGetPedigreeDetails.getString("Sire_Name").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("DAM")!=null)
                    strDam=crsGetPedigreeDetails.getString("DAM").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("DAMSEQ")!=null)
                    strDam_Seq=crsGetPedigreeDetails.getString("DAMSEQ").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("Dam_name")!=null)
                    strDam_Name=crsGetPedigreeDetails.getString("Dam_name").trim().toUpperCase();                                       
                
                if(crsGetPedigreeDetails.getString("DAMORGANISATION")!=null)
                    strAso_Dam=crsGetPedigreeDetails.getString("DAMORGANISATION").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("DAMSEQNO")!=null)
                    strAso_Dam_Seq=crsGetPedigreeDetails.getString("DAMSEQNO").trim();
                
                if(crsGetPedigreeDetails.getString("SIRESEQNO")!=null)
                    strAso_Sire_Seq=crsGetPedigreeDetails.getString("SIRESEQNO").trim();                                
                
            }
                        
            //1st generation sire
            //if(strSire_Seq.length()>0 && strSire_Seq!=null)
            crsGetPedigreeDetails = gen.GetPedigree(strSire_Seq);
            
            if(crsGetPedigreeDetails.next())
            {
                if(crsGetPedigreeDetails.getString("SIRE")!=null)
                    strSire_1=crsGetPedigreeDetails.getString("SIRE").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("SIRESEQ")!=null)
                    strSire_1_Seq=crsGetPedigreeDetails.getString("SIRESEQ").trim();
                
                if(crsGetPedigreeDetails.getString("Sire_Name")!=null)
                    strSire_Name_1=crsGetPedigreeDetails.getString("Sire_Name").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("DAM")!=null)
                    strDam_1=crsGetPedigreeDetails.getString("DAM").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("DAMSEQ")!=null)
                    strDam_1_Seq=crsGetPedigreeDetails.getString("DAMSEQ").trim();
                
                if(crsGetPedigreeDetails.getString("Dam_name")!=null)
                    strDam_Name_1=crsGetPedigreeDetails.getString("Dam_name").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("DAMORGANISATION")!=null)
                    strAso_Dam_1=crsGetPedigreeDetails.getString("DAMORGANISATION").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("DAMSEQNO")!=null)
                    strAso_Dam_1_Seq=crsGetPedigreeDetails.getString("DAMSEQNO").trim();
                
                if(crsGetPedigreeDetails.getString("SIRESEQNO")!=null)
                    strAso_Sire_1_Seq=crsGetPedigreeDetails.getString("SIRESEQNO").trim();
                
                if(crsGetPedigreeDetails.getString("SIREORGANISATION")!=null)
                    strAso_Sire_1=crsGetPedigreeDetails.getString("SIREORGANISATION").trim().toUpperCase();                                  
            }
            
            //1st generation dam
            //if(strDam_Seq.length()>0 && strDam_Seq!=null)
            crsGetPedigreeDetails = gen.GetPedigree(strDam_Seq);
            
            if(crsGetPedigreeDetails.next())
            {
                if(crsGetPedigreeDetails.getString("SIRE")!=null)
                    strSire_1_2=crsGetPedigreeDetails.getString("SIRE").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("SIRESEQ")!=null)
                    strSire_1_2_Seq=crsGetPedigreeDetails.getString("SIRESEQ").trim();
                
                if(crsGetPedigreeDetails.getString("Sire_Name")!=null)
                    strSire_Name_1_2=crsGetPedigreeDetails.getString("Sire_Name").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("DAM")!=null)
                    strDam_1_2=crsGetPedigreeDetails.getString("DAM").trim().toUpperCase();
                
                 if(crsGetPedigreeDetails.getString("DAMSEQ")!=null)
                    strDam_1_2_Seq=crsGetPedigreeDetails.getString("DAMSEQ").trim();
                
                if(crsGetPedigreeDetails.getString("Dam_name")!=null)
                    strDam_Name_1_2=crsGetPedigreeDetails.getString("Dam_name").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("DAMORGANISATION")!=null)
                    strAso_Dam_1_2=crsGetPedigreeDetails.getString("DAMORGANISATION").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("DAMSEQNO")!=null)
                    strAso_Dam_1_2_Seq=crsGetPedigreeDetails.getString("DAMSEQNO").trim();
                
                if(crsGetPedigreeDetails.getString("SIRESEQNO")!=null)
                    strAso_Sire_1_2_Seq=crsGetPedigreeDetails.getString("SIRESEQNO").trim();
                
                if(crsGetPedigreeDetails.getString("SIREORGANISATION")!=null)
                    strAso_Sire_1_2=crsGetPedigreeDetails.getString("SIREORGANISATION").trim().toUpperCase();  
                                
            }
            
            //2nd generation 1
            //if(strSire_1_Seq.length()>0 && strSire_1_Seq!=null)
            crsGetPedigreeDetails = gen.GetPedigree(strSire_1_Seq);
            
            if(crsGetPedigreeDetails.next())
            {
                if(crsGetPedigreeDetails.getString("SIRE")!=null)
                    strSire_2_1=crsGetPedigreeDetails.getString("SIRE").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("SIRESEQ")!=null)
                    strSire_2_1_Seq=crsGetPedigreeDetails.getString("SIRESEQ").trim();
                
                if(crsGetPedigreeDetails.getString("Sire_Name")!=null)
                    strSire_Name_2_1=crsGetPedigreeDetails.getString("Sire_Name").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("DAM")!=null)
                    strDam_2_1=crsGetPedigreeDetails.getString("DAM").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("DAMSEQ")!=null)
                    strDam_2_1_Seq=crsGetPedigreeDetails.getString("DAMSEQ").trim();
                
                if(crsGetPedigreeDetails.getString("Dam_name")!=null)
                    strDam_Name_2_1=crsGetPedigreeDetails.getString("Dam_name").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("DAMORGANISATION")!=null)
                    strAso_Dam_2_1=crsGetPedigreeDetails.getString("DAMORGANISATION").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("DAMSEQNO")!=null)
                    strAso_Dam_2_1_Seq=crsGetPedigreeDetails.getString("DAMSEQNO").trim();
                
                if(crsGetPedigreeDetails.getString("SIRESEQNO")!=null)
                    strAso_Sire_2_1_Seq=crsGetPedigreeDetails.getString("SIRESEQNO").trim();
                
                if(crsGetPedigreeDetails.getString("SIREORGANISATION")!=null)
                    strAso_Sire_2_1=crsGetPedigreeDetails.getString("SIREORGANISATION").trim().toUpperCase();                                  
            }
            
            //2nd generation 2
            //if(strDam_1_Seq.length()>0 && strDam_1_Seq!=null)
            crsGetPedigreeDetails = gen.GetPedigree(strDam_1_Seq);
            
            if(crsGetPedigreeDetails.next())
            {
                if(crsGetPedigreeDetails.getString("SIRE")!=null)
                    strSire_2_2=crsGetPedigreeDetails.getString("SIRE").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("SIRESEQ")!=null)
                    strSire_2_2_Seq=crsGetPedigreeDetails.getString("SIRESEQ").trim();
                
                if(crsGetPedigreeDetails.getString("Sire_Name")!=null)
                    strSire_Name_2_2=crsGetPedigreeDetails.getString("Sire_Name").trim().toUpperCase();                                                              
                
                if(crsGetPedigreeDetails.getString("DAM")!=null)
                    strDam_2_2=crsGetPedigreeDetails.getString("DAM").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("DAMSEQ")!=null)
                    strDam_2_2_Seq=crsGetPedigreeDetails.getString("DAMSEQ").trim();
                
                if(crsGetPedigreeDetails.getString("Dam_name")!=null)
                    strDam_Name_2_2=crsGetPedigreeDetails.getString("Dam_name").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("DAMORGANISATION")!=null)
                    strAso_Dam_2_2=crsGetPedigreeDetails.getString("DAMORGANISATION").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("DAMSEQNO")!=null)
                    strAso_Dam_2_2_Seq=crsGetPedigreeDetails.getString("DAMSEQNO").trim();
                
                if(crsGetPedigreeDetails.getString("SIRESEQNO")!=null)
                    strAso_Sire_2_2_Seq=crsGetPedigreeDetails.getString("SIRESEQNO").trim();
                
                if(crsGetPedigreeDetails.getString("SIREORGANISATION")!=null)
                    strAso_Sire_2_2=crsGetPedigreeDetails.getString("SIREORGANISATION").trim().toUpperCase();                                  
            }
            
            //2nd generation 3
            //if(strSire_1_2_Seq.length()>0 && strSire_1_2_Seq!=null)
            crsGetPedigreeDetails = gen.GetPedigree(strSire_1_2_Seq);
            
            if(crsGetPedigreeDetails.next())
            {
                if(crsGetPedigreeDetails.getString("SIRE")!=null)
                    strSire_2_3=crsGetPedigreeDetails.getString("SIRE").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("SIRESEQ")!=null)
                    strSire_2_3_Seq=crsGetPedigreeDetails.getString("SIRESEQ").trim();
                
                if(crsGetPedigreeDetails.getString("Sire_Name")!=null)
                    strSire_Name_2_3=crsGetPedigreeDetails.getString("Sire_Name").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("SIREORGANISATION")!=null)
                    strAso_Sire_2_3=crsGetPedigreeDetails.getString("SIREORGANISATION").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("DAM")!=null)
                    strDam_2_3=crsGetPedigreeDetails.getString("DAM").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("DAMSEQ")!=null)
                    strDam_2_3_Seq=crsGetPedigreeDetails.getString("DAMSEQ").trim();
                
                if(crsGetPedigreeDetails.getString("Dam_name")!=null)
                    strDam_Name_2_3=crsGetPedigreeDetails.getString("Dam_name").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("DAMORGANISATION")!=null)
                    strAso_Dam_2_3=crsGetPedigreeDetails.getString("DAMORGANISATION").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("DAMSEQNO")!=null)
                    strAso_Dam_2_3_Seq=crsGetPedigreeDetails.getString("DAMSEQNO").trim();
                
                if(crsGetPedigreeDetails.getString("SIRESEQNO")!=null)
                    strAso_Sire_2_3_Seq=crsGetPedigreeDetails.getString("SIRESEQNO").trim();                                
            }
            
            //2nd generation 4
            //if(strDam_1_2_Seq.length()>0 && strDam_1_2_Seq!=null)
            crsGetPedigreeDetails = gen.GetPedigree(strDam_1_2_Seq);
            
            if(crsGetPedigreeDetails.next())
            {
                if(crsGetPedigreeDetails.getString("SIRE")!=null)
                    strSire_2_4=crsGetPedigreeDetails.getString("SIRE").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("SIRESEQ")!=null)
                    strSire_2_4_Seq=crsGetPedigreeDetails.getString("SIRESEQ").trim();
                
                if(crsGetPedigreeDetails.getString("Sire_Name")!=null)
                    strSire_Name_2_4=crsGetPedigreeDetails.getString("Sire_Name").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("SIREORGANISATION")!=null)
                    strAso_Sire_2_4=crsGetPedigreeDetails.getString("SIREORGANISATION").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("DAM")!=null)
                    strDam_2_4=crsGetPedigreeDetails.getString("DAM").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("DAMSEQ")!=null)
                    strDam_2_4_Seq=crsGetPedigreeDetails.getString("DAMSEQ").trim();
                
                if(crsGetPedigreeDetails.getString("Dam_name")!=null)
                    strDam_Name_2_4=crsGetPedigreeDetails.getString("Dam_name").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("DAMORGANISATION")!=null)
                    strAso_Dam_2_4=crsGetPedigreeDetails.getString("DAMORGANISATION").trim().toUpperCase();
                
                if(crsGetPedigreeDetails.getString("DAMSEQNO")!=null)
                    strAso_Dam_2_4_Seq=crsGetPedigreeDetails.getString("DAMSEQNO").trim();
                
                if(crsGetPedigreeDetails.getString("SIRESEQNO")!=null)
                    strAso_Sire_2_4_Seq=crsGetPedigreeDetails.getString("SIRESEQNO").trim();                                
            }
            }
String Regno="";
            Regno=str_reggno;  //Regno is used in frmReg_Top.jsp
%>

            <div id="content">
                <input type="hidden" name="SavedYN" id="SavedYN" />
            <%@ include file="frmReg_Top.jsp"%>

         <table style="border-color:black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;" cellpadding="0" cellspacing="0" >
            <tr>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="8%">
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="8%" >
                    &nbsp;                    
                </td>
                <td width="2%" class="bottom">
                    <label style="font-weight:bold;">Sire:</label>
                </td>
                <td  class="bottom" width="20%"  ><!-- 3rd generation---sire sire sire-->                                      
                <span id="LSire_2_1_L"  >
                    <label id="LSire_2_1"  class="ped" style="text-transform:uppercase;" onclick="Ped_To_Index('Sire_2_1_Seq')" ><%=strSire_Name_2_1%></label>
                </span>
                <!--<span id="LSire_2_1_T" style="visibility:hidden;" >-->
                    <input type="hidden" name="Sire_Name_2_1" onchange="SaveMode_P(), checkSireDam('MALE','Sire_Name_2_1','LSire_2_1','Sire_2_1','Sire_2_1_Seq','Aso_Sire_2_1','Aso_Sire_2_1_Seq')" id="Sire_Name_2_1"  size="25" value='<%=strSire_Name_2_1%>' class="Sire_sec_gen">                    
                <!--</span>-->
                </td>
                <td width="8%" class="bottom" ><!-- 1  -->                
                    <img src="Images/edit-add.png" onclick="Edit_HorseInfm('Sire_2_1_Seq','LSire_2_1','Sire_Name_2_1','Sire_2_1_L','Sire_2_1','Aso_Sire_2_1_L','Aso_Sire_2_1','Aso_Sire_2_1_Seq')"   <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> > <!--onclick="Ped_Edit('LSire_2_1_L','LSire_2_1_T','Edit_2_1','NonEdit_2_1')"-->
                    <img src="Images/delete.png"  <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> onclick='Delete_Ped_RegNo("<%=strSire_1_Seq%>","<%=strSire_2_1_Seq%>","s","<%=REGSEQ%>","LSire_2_1","Sire_Name_2_1","Sire_2_1_L","Sire_2_1","Aso_Sire_2_1","Aso_Sire_2_1_L","Aso_Sire_2_1_Seq","Sire_2_1_Seq")' >
                    <img src="Images/Find12.jpg" onClick='PedigreeSearch_Sire("Sire_Name_2_1","Sire_2_1","LSire_2_1","Sire_2_1_Seq","MALE","Aso_Sire_2_1","Aso_Sire_2_1_Seq")'
					 <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%>/>                                       
                </td>
            </tr>
<!-----------------------------------111111111111111111111------------------------   -->
            <tr>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%">
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%"  class="right">
                    &nbsp;                    
                </td>
                <td width="2%"  >
                    &nbsp;                    
                </td>
                <td><!-- 3rd generation---sire sire sire-->                 
                <div id="NonEdit_2_1">
                    <label id="Aso_Sire_2_1_L" style="text-transform:uppercase;" ><%=strAso_Sire_2_1%></label>
                    <label id="Sire_2_1_L"   style="text-transform:uppercase;" ><%=strSire_2_1%></label>
                </div>
                <!--<div id="Edit_2_1" style="visibility: hidden;">-->
<input type="hidden" name="Aso_Sire_2_1" id="Aso_Sire_2_1"  placeholder="ORG" value='<%=strAso_Sire_2_1%>' size="10" class="Sire_bot" ><input type="hidden"placeholder="REG#"  name="Sire_2_1" id="Sire_2_1"  onchange="checkSireDam('MALE','Sire_Name_2_1','LSire_2_1','Sire_2_1','Sire_2_1_Seq','Aso_Sire_2_1','Aso_Sire_2_1_Seq')" value='<%=strSire_2_1%>' size="10" class="Sire_bot" >
                    <input type="hidden" name="Aso_Sire_2_1_Seq" id="Aso_Sire_2_1_Seq"   value='<%=strAso_Sire_2_1_Seq%>' size="8" >                        
                    <input type="hidden" name="Sire_2_1_Seq" id="Sire_2_1_Seq"   value='<%=strSire_2_1_Seq%>' size="8" >
                <!--</div>-->
                </td>
                <td><!-- 1-1  -->
                    &nbsp;
                </td>
            </tr>
<!-- *****************************************************2222222222222222222 -->           
            <tr>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="8%">
                    &nbsp;
                </td>
                <td width="2%" class="bottom" >
                    <label style="font-weight:bold;">Sire:</label>
                </td>
                <td width="20%" class="bottom" >     
                <span id="LSire_1_L"  >
                    <label id="LSire_1" style="text-transform:uppercase;" class="ped"  onclick="Ped_To_Index('Sire_1_Seq')"><%=strSire_Name_1%></label>
                </span>
                <!--<span id="LSire_1_T" style="visibility:hidden;" >-->
                    <input type="hidden" name="Sire_Name_1" onchange="SaveMode_P(), checkSireDam('MALE','Sire_Name_1','LSire_1','Sire_1','Sire_1_Seq','Aso_Sire_1','Aso_Sire_1_Seq')" id="Sire_Name_1" size="20"  value='<%=strSire_Name_1%>' class="Sire">                    
                <!--</span>  -->               
                </td>
                <td width="8%" class="bottom right"><!-- 2 -->
                    <img src="Images/edit-add.png" onclick="Edit_HorseInfm('Sire_1_Seq','LSire_1','Sire_Name_1','Sire_1_L','Sire_1','Aso_Sire_1_L','Aso_Sire_1','Aso_Sire_1_Seq')"   <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%>><!--onclick="Ped_Edit('LSire_1_L','LSire_1_T','Edit_1','NonEdit_1')" >-->
                    <img src="Images/delete.png" onclick='Delete_Ped_RegNo("<%=strSire_Seq%>","<%=strSire_1_Seq%>","s","<%=REGSEQ%>","LSire_1","Sire_Name_1","Sire_1_L","Sire_1","Aso_Sire_1","Aso_Sire_1_L","Aso_Sire_1_Seq","Sire_1_Seq")'  <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%>>    
                    <img src="Images/Find12.jpg" onClick='PedigreeSearch_Sire("Sire_Name_1","Sire_1","LSire_1","Sire_1_Seq","MALE","Aso_Sire_1","Aso_Sire_1_Seq")'  <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%>/>                      
                </td>                
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="8%" >
                    &nbsp;                    
                </td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                    
            </tr>
<!-- ******************************************************333333333333333333 -->
            <tr>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="8%" class="right">
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td  width="20%"  >
                <div id="NonEdit_1">
                    <label id="Aso_Sire_1_L" style="text-transform:uppercase;" ><%=strAso_Sire_1%></label>
                    <label id="Sire_1_L"   style="text-transform:uppercase;" ><%=strSire_1%></label>
                </div>
                <!--<div id="Edit_1" style="visibility: hidden;">-->
<input type="hidden" name="Aso_Sire_1" id="Aso_Sire_1" size="8" placeholder="ORG" class="Sire_bot" value='<%=strAso_Sire_1%>' ><input type="hidden" name="Sire_1"placeholder="REG#"  class="Sire_bot" id="Sire_1" onchange="checkSireDam('MALE','Sire_Name_1','LSire_1','Sire_1','Sire_1_Seq','Aso_Sire_1','Aso_Sire_1_Seq')" value='<%=strSire_1%>' size="8" >&nbsp;
                    <input type="hidden" name="Aso_Sire_1_Seq" id="Aso_Sire_1_Seq" size="5" value='<%=strAso_Sire_1_Seq%>' >
                    <input type="hidden" name="Sire_1_Seq" id="Sire_1_Seq"  value='<%=strSire_1_Seq%>' size="8" >                                         
                <!--</div>-->
                </td>
                <td width="8%" class="right" >                    
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="8%">
                    &nbsp;
                </td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                    
            </tr>
<!-- ******************************************************444444444444444444444444 -->
            <tr>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="8%" class="right">
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="8%" class="right">
                    &nbsp;
                </td>
                <td width="2%" class="bottom">
                    <label style="font-weight:bold;">Dam:</label>
                </td>
                <td class="bottom" width="20%" ><!-- 3rd generation---sire sire dam-->     
                <span id="LDam_2_1_L"  >
                    <label id="LDam_2_1" class="ped" style="text-transform:uppercase;"  onclick="Ped_To_Index('Dam_2_1_Seq')"><%=strDam_Name_2_1%></label>
                </span>
                <!--<span id="LDam_2_1_T"  > <%--<input type="text" name="damstyle" id="damstyle" value="<%=strDamSecStyle%>">--%>-->
                    <input type="hidden" name="Dam_Name_2_1"  id="Dam_Name_2_1" onchange="SaveMode_P(),checkSireDam('FEMALE','Dam_Name_2_1','LDam_2_1','Dam_2_1','Dam_2_1_Seq','Aso_Dam_2_1','Aso_Dam_2_1_Seq')" size="25"  value='<%=strDam_Name_2_1%>' class="Dam_sec_gen">                    
                <!--</span>                   -->
                </td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    
                <td width="8%" class="bottom"><!-- 3 -->
                    <img src="Images/edit-add.png" onclick="Edit_HorseInfm('Dam_2_1_Seq','LDam_2_1','Dam_Name_2_1','Dam_2_1_L','Dam_2_1','Aso_Dam_2_1_L','Aso_Dam_2_1','Aso_Dam_2_1_Seq')"  <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> ><!--onclick="Ped_Edit('LDam_2_1_L','LDam_2_1_T','Edit_Dam_2_1','NonEdit_Dam_2_1')" >-->
                    <img src="Images/delete.png" onclick='Delete_Ped_RegNo("<%=strSire_1_Seq%>","<%=strDam_2_1_Seq%>","d","<%=REGSEQ%>","LDam_2_1","Dam_Name_2_1","Dam_2_1_L","Dam_2_1","Aso_Dam_2_1","Aso_Dam_2_1_L","Aso_Dam_2_1_Seq","Dam_2_1_Seq")'  <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> >
                    <img src="Images/Find12.jpg" onClick='PedigreeSearch_Dam("Dam_Name_2_1","Dam_2_1","LDam_2_1","Dam_2_1_Seq","FEMALE","Aso_Dam_2_1","Aso_Dam_2_1_Seq")'  <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%>/>
                </td>
            </tr>
<!-- *****************************1st generation*************************555555555555555 -->
            <tr>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="8%" class="right">
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="8%">
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>                
                <td width="20%"><!-- 3rd generation---sire sire dam-->   
                <div id="NonEdit_Dam_2_1" >   
                    <label id="Aso_Dam_2_1_L"  style="text-transform:uppercase;" ><%=strAso_Dam_2_1%></label>
                    <label id="Dam_2_1_L"   style="text-transform:uppercase;" ><%=strDam_2_1%></label>
                </div>
                <!--<div id="Edit_Dam_2_1" style="visibility:hidden;">-->
<input type="hidden" name="Aso_Dam_2_1" id="Aso_Dam_2_1" placeholder="ORG" class="Dam_bot" value='<%=strAso_Dam_2_1%>' size="10" ><input type="hidden" class="Dam_bot" name="Dam_2_1" placeholder="REG#"  id="Dam_2_1" onchange="checkSireDam('FEMALE','Dam_Name_2_1','LDam_2_1','Dam_2_1','Dam_2_1_Seq','Aso_Dam_2_1','Aso_Dam_2_1_Seq')"  value='<%=strDam_2_1%>' size="10" >
                    <input type="hidden" name="Aso_Dam_2_1_Seq" value='<%=strAso_Dam_2_1_Seq%>' id="Aso_Dam_2_1_Seq" size="8" >
                    <input type="hidden" name="Dam_2_1_Seq" id="Dam_2_1_Seq"  value='<%=strDam_2_1_Seq%>' size="8" >
                <!--</div>-->
                </td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      
                <td width="5%"><!-- 3-1 -->
                     &nbsp;  
                </td>
            </tr>
<!-- *****************************1st generation*************************6666666666666666 -->
            <tr>
                <td width="2%" class="bottom">
                    <label style="font-weight:bold;">Sire:</label>
                </td>
                <td width="20%" class="bottom" >                    
                    <span id="LSire_L"   >
                        <label id="LSire" style="text-transform:uppercase;" class="ped"  onclick="Ped_To_Index('Sire_Seq')" ><%=strSire_Name%></Label>
                    </span>                    
                    <!--<span id="LSire_T" style="visibility:hidden;" >-->
                        <input type="hidden" name="Sire_Name" id="Sire_Name" size="5" 
                        onchange="SaveMode_P(), checkSireDam('MALE','Sire_Name','LSire','Sire','Sire_Seq','Aso_Sire','Aso_Sire_Seq')" value='<%=strSire_Name%>' class="Sire">                        
<%--onmouseout="Onload('LSire_L','LSire_T','NonEdit','Edit','LSire','Sire_Name')" --%>
                        
                    <!--</span>                    -->
                    <input type="hidden" name="Sire_Name" id="Sire_Name" size="20" onchange="SaveMode_P(),checkSireDam('MALE','Sire_Name','LSire','Sire','Sire_Seq','Aso_Sire','Aso_Sire_Seq')" value='<%=strSire_Name%>' class="Sire">                    
                </td>
                <td width="8%" class="bottom right">
                    <img src="Images/edit-add.png" onclick="Edit_HorseInfm('Sire_Seq','LSire','Sire_Name','Sire_L','Sire','Aso_Sire_L','Aso_Sire','Aso_Sire_Seq')"  <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> ><!--onclick="Ped_Edit('LSire_L','LSire_T','Edit','NonEdit')"--> 
                    <img src="Images/delete.png"  onclick='Delete_Ped_RegNo("<%=REGSEQ%>","<%=strSire_Seq%>","s","<%=REGSEQ%>","LSire","Sire_Name","Sire_L","Sire","Aso_Sire","Aso_Sire_L","Aso_Sire_Seq","Sire_Seq")'  <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%>>
                    <img src="Images/Find12.jpg" onClick='PedigreeSearch_Sire("Sire_Name","Sire","LSire","Sire_Seq","MALE","Aso_Sire","Aso_Sire_Seq")' 
					 <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%>/>
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%">
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%">
                    &nbsp;
                </td>
            </tr>

<!-- ******************************************************77777777777777777 -->
            <tr>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">    
                <div id="NonEdit">
                    <label id="Aso_Sire_L"  style="text-transform:uppercase;" ><%=strAso_Sire%></label>
                    <label id="Sire_L"   style="text-transform:uppercase;" ><%=strSire%></label>
                </div>
                <!--<div id="Edit" style="visibility: hidden;">-->
<input type="hidden" name="Aso_Sire" id="Aso_Sire" size="8" placeholder="ORG" class="Sire_bot" value='<%=strAso_Sire%>' ><input type="hidden" name="Sire"  id="Sire" placeholder="REG#" onchange="checkSireDam('MALE','Sire_Name','LSire','Sire','Sire_Seq','Aso_Sire','Aso_Sire_Seq')" value='<%=strSire%>'  size="8" class="Sire_bot" >&nbsp;
                    <input type="hidden" name="Aso_Sire_Seq" value='<%=strAso_Sire_Seq%>' id="Aso_Sire_Seq" size="8" >
                    <input type="hidden" name="Sire_Seq" id="Sire_Seq"  value='<%=strSire_Seq%>'  size="8" >    
                <!--</div>-->
                </td>                
                <td width="5%" class="right">
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%">
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%">
                    &nbsp;
                </td>
            </tr>

<!-- ******************************************************8888888888888888888 -->
            <tr>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%" class="right">
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%">
                    &nbsp;
                </td>
                <td width="2%" class="bottom">
                    <label style="font-weight:bold;">Sire:</label>
                </td>
                <td class="bottom" ><!-- 3rd generation sire dam sire -->  
                <span id="LSire_2_2_L"  >
                    <label id="LSire_2_2" class="ped" style="text-transform:uppercase;" onclick="Ped_To_Index('Sire_2_2_Seq')" ><%=strSire_Name_2_2%></label>
                </span>
                <!--<span id="LSire_2_2_T"  >-->
                    <input type="hidden" name="Sire_Name_2_2" onchange="SaveMode_P() ,checkSireDam('MALE','Sire_Name_2_2','LSire_2_2','Sire_2_2','Sire_2_2_Seq','Aso_Sire_2_2','Aso_Sire_2_2_Seq')" id="Sire_Name_2_2" size="25" value='<%=strSire_Name_2_2%>' class="Sire_sec_gen">                    
                <!--</span>-->
                </td>
                <td width="8%" class="bottom">
                    <img src="Images/edit-add.png" onclick="Edit_HorseInfm('Sire_2_2_Seq','LSire_2_2','Sire_Name_2_2','Sire_2_2_L','Sire_2_2','Aso_Sire_2_2_L','Aso_Sire_2_2','Aso_Sire_2_2_Seq')"   <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> ><!-- onclick="Ped_Edit('LSire_2_2_L','LSire_2_2_T','Edit_2_2','NonEdit_2_2')" >-->
                    <img src="Images/delete.png" onclick='Delete_Ped_RegNo("<%=strDam_1_Seq%>","<%=strSire_2_2_Seq%>","s","<%=REGSEQ%>","LSire_2_2","Sire_Name_2_2","Sire_2_2_L","Sire_2_2","Aso_Sire_2_2","Aso_Sire_2_2_L","Aso_Sire_2_2_Seq","Sire_2_2_Seq")'  <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> >
                    <img src="Images/Find12.jpg" onClick='PedigreeSearch_Sire("Sire_Name_2_2","Sire_2_2","LSire_2_2","Sire_2_2_Seq","MALE","Aso_Sire_2_2","Aso_Sire_2_2_Seq")'  
					<% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> />
                </td>                
            </tr>
<!-- ******************************************************999999999999999 -->
            <tr>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%" class="right">
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%" class="right">
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                <div id="NonEdit_2_2" >   
                    <label id="Aso_Sire_2_2_L"  style="text-transform:uppercase;" ><%=strAso_Sire_2_2%></label>
                    <label id="Sire_2_2_L"    style="text-transform:uppercase;" ><%=strSire_2_2%></label>
                </div>
                <!--<div id="Edit_2_2" style="visibility: hidden;">-->
<input type="hidden" name="Aso_Sire_2_2"  id="Aso_Sire_2_2" placeholder="ORG" class="Sire_bot" value='<%=strAso_Sire_2_2%>' size="10" ><input type="hidden" name="Sire_2_2" placeholder="REG#" id="Sire_2_2" onchange="checkSireDam('MALE','Sire_Name_2_2','LSire_2_2','Sire_2_2','Sire_2_2_Seq','Aso_Sire_2_2','Aso_Sire_2_2_Seq')" value='<%=strSire_2_2%>' size="10" class="Sire_bot" >
                    <input type="hidden" name="Aso_Sire_2_2_Seq" value='<%=strAso_Sire_2_2_Seq%>' id="Aso_Sire_2_2_Seq" size="8" >
                    <input type="hidden" name="Sire_2_2_Seq" id="Sire_2_2_Seq"  value='<%=strSire_2_2_Seq%>' size="8" > 
                <!--</div>-->
                </td>
                <td width="5%">
                    &nbsp;
                </td>                
            </tr>
<!-- ******************************************************10101010101010 -->
            <tr>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%" class="right">
                    &nbsp;
                </td>                
                <td width="2%" class="bottom">
                    <label style="font-weight:bold;">Dam:</label>
                </td>
                <td class="bottom" ><!-- 2nd generation sire dam -->      
                <span id="LDam_1_L"  >
                    <label id="LDam_1" class="ped" style="text-transform:uppercase;" onclick="Ped_To_Index('Dam_1_Seq')" ><%=strDam_Name_1%></label>
                </span>
                <!--<span id="LDam_1_T"  >-->
                    <input type="hidden"  name="Dam_Name_1" id="Dam_Name_1" onchange="SaveMode_P(),checkSireDam('FEMALE','Dam_Name_1','LDam_1','Dam_1','Dam_1_Seq','Aso_Dam_1','Aso_Dam_1_Seq')" size="20" value='<%=strDam_Name_1%>' class="Dam">
                <!--</span>                    -->
                </td>
                <td width="7%" class="bottom right">
                    <img src="Images/edit-add.png" onclick="Edit_HorseInfm('Dam_1_Seq','LDam_1','Dam_Name_1','Dam_1_L','Dam_1','Aso_Dam_1_L','Aso_Dam_1','Aso_Dam_1_Seq')"   <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> ><!--onclick="Ped_Edit('LDam_1_L','LDam_1_T','Edit_Dam_1','NonEdit_Dam_1')" >-->
                    <img src="Images/delete.png" onclick='Delete_Ped_RegNo("<%=strSire_Seq%>","<%=strDam_1_Seq%>","d","<%=REGSEQ%>","LDam_1","Dam_Name_1","Dam_1_L","Dam_1","Aso_Dam_1","Aso_Dam_1_L","Aso_Dam_1_Seq","Dam_1_Seq")'  <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> >
                    <img src="Images/Find12.jpg" onClick='PedigreeSearch_Dam("Dam_Name_1","Dam_1","LDam_1","Dam_1_Seq","FEMALE","Aso_Dam_1","Aso_Dam_1_Seq")'  
					<% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> />                  
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%" >
                    &nbsp;
                </td>
            </tr>
<!-- ************************************************11***11***11 11-11-11 11 -->
            <tr>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%">
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    <div id="NonEdit_Dam_1" >   
                    <label id="Aso_Dam_1_L" style="text-transform:uppercase;" ><%=strAso_Dam_1%></label>
                    <label id="Dam_1_L"   style="text-transform:uppercase;" ><%=strDam_1%></label>
                </div>
                <!--<div id="Edit_Dam_1" style="visibility: hidden;">-->
<input type="hidden" name="Aso_Dam_1" id="Aso_Dam_1" size="8" placeholder="ORG" class="Dam_bot" value='<%=strAso_Dam_1%>' ><input type="hidden" name="Dam_1" placeholder="REG#" class="Dam_bot" id="Dam_1" onchange="checkSireDam('FEMALE','Dam_Name_1','LDam_1','Dam_1','Dam_1_Seq','Aso_Dam_1','Aso_Dam_1_Seq')" value='<%=strDam_1%>' size="8" >&nbsp;                
                    <input type="hidden" name="Aso_Dam_1_Seq" value='<%=strAso_Dam_1_Seq%>' id="Aso_Dam_1_Seq" size="8" >
                    <input type="hidden" name="Dam_1_Seq" id="Dam_1_Seq"  value='<%=strDam_1_Seq%>' size="8" >                    
                <!--</div>-->
                </td>
                <td width="5%" class="right">
                    &nbsp; 
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%" >
                    &nbsp;
                </td>                                
            </tr>
<!-- ******************************************************12 12 12 12 12 12 -->
            <tr>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%" >
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%" class="right">
                    &nbsp;
                </td>
                <td width="2%" class="bottom">
                    <label style="font-weight:bold;">Dam:</label>
                </td>                
                <td class="bottom" width="20%" ><!-- 3rd generatin sire dam dam -->   
                <span id="LDam_2_2_L"  >
                    <label id="LDam_2_2" class="ped" style="text-transform:uppercase;" onclick="Ped_To_Index('Dam_2_2_Seq')" ><%=strDam_Name_2_2%></label>
                </span>
                <!--<span id="LDam_2_2_T"  >-->
                    <input type="hidden" name="Dam_Name_2_2" id="Dam_Name_2_2" onchange="SaveMode_P(), checkSireDam('FEMALE','Dam_Name_2_2','LDam_2_2','Dam_2_2','Dam_2_2_Seq','Aso_Dam_2_2','Aso_Dam_2_2_Seq')" size="25"  value='<%=strDam_Name_2_2%>' class="Dam_sec_gen">                    
                <!--</span>-->
                </td>
                <td width="7%" class="bottom">
                    <img src="Images/edit-add.png" onclick="Edit_HorseInfm('Dam_2_2_Seq','LDam_2_2','Dam_Name_2_2','Dam_2_2_L','Dam_2_2','Aso_Dam_2_2_L','Aso_Dam_2_2','Aso_Dam_2_2_Seq')"   <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> ><!--onclick="Ped_Edit('LDam_2_2_L','LDam_2_2_T','Edit_Dam_2_2','NonEdit_Dam_2_2')" >-->
                    <img src="Images/delete.png" onclick='Delete_Ped_RegNo("<%=strDam_1_Seq%>","<%=strDam_2_2_Seq%>","d","<%=REGSEQ%>","LDam_2_2","Dam_Name_2_2","Dam_2_2_L","Dam_2_2","Aso_Dam_2_2","Aso_Dam_2_2_L","Aso_Dam_2_2_Seq","Dam_2_2_Seq")'  <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> >
                    <img src="Images/Find12.jpg" onClick='PedigreeSearch_Dam("Dam_Name_2_2","Dam_2_2","LDam_2_2","Dam_2_2_Seq","FEMALE","Aso_Dam_2_2","Aso_Dam_2_2_Seq")'  <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> />
                </td>
            </tr>
<!-- **************************************************13*13*13*13*13 13 13 13 -->            
            <tr>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%" >
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%" >
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                <div id="NonEdit_Dam_2_2" >   
                    <label id="Aso_Dam_2_2_L" style="text-transform:uppercase;" ><%=strAso_Dam_2_2%></label>
                    <label id="Dam_2_2_L"   style="text-transform:uppercase;" ><%=strDam_2_2%></label>
                </div>
                <!--<div id="Edit_Dam_2_2" style="visibility: hidden;">-->
<input type="hidden" name="Aso_Dam_2_2" id="Aso_Dam_2_2" placeholder="ORG" class="Dam_bot" size="10" value='<%=strAso_Dam_2_2%>' ><input type="hidden" class="Dam_bot" placeholder="REG#"name="Dam_2_2"  id="Dam_2_2" onchange=" checkSireDam('FEMALE','Dam_Name_2_2','LDam_2_2','Dam_2_2','Dam_2_2_Seq','Aso_Dam_2_2','Aso_Dam_2_2_Seq')" value='<%=strDam_2_2%>' size="10" >
                    <input type="hidden" name="Aso_Dam_2_2_Seq" value='<%=strAso_Dam_2_2_Seq%>' id="Aso_Dam_2_2_Seq" size="8" >
                    <input type="hidden" name="Dam_2_2_Seq"  id="Dam_2_2_Seq"  value='<%=strDam_2_2_Seq%>' size="8" >
                <!--</div>-->
                </td>
                <td width="5%" >
                    &nbsp;
                </td>                
            </tr>
<!-- **************************************************14*14*14*14*14 14 14 14 -->
            <tr>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%" >
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%" >
                    &nbsp;
                </td>
                <td width="2%" class="bottom">
                    <label style="font-weight:bold;">Sire:</label>
                </td>
                <td width="20%" class="bottom" >      
                    <span id="LSire_2_3_L"  >
                    <label id="LSire_2_3" style="text-transform:uppercase;" class="ped"  onclick="Ped_To_Index('Sire_2_3_Seq')"  ><%=strSire_Name_2_3%></label>
                    </span>
                    <!--<span id="LSire_2_3_T"  >-->
                    <input type="hidden" name="Sire_Name_2_3" id="Sire_Name_2_3" onchange="SaveMode_P() ,checkSireDam('MALE','Sire_Name_2_3','LSire_2_3','Sire_2_3','Sire_2_3_Seq','Aso_Sire_2_3','Aso_Sire_2_3_Seq')"size="25" value='<%=strSire_Name_2_3%>' class="Sire_sec_gen">                    
                    <!--</span>-->
                </td>
                <td width="7%" class="bottom">
                    <img src="Images/edit-add.png" onclick="Edit_HorseInfm('Sire_2_3_Seq','LSire_2_3','Sire_Name_2_3','Sire_2_3_L','Sire_2_3','Aso_Sire_2_3_L','Aso_Sire_2_3','Aso_Sire_2_3_Seq')"   <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> ><!--onclick="Ped_Edit('LSire_2_3_L','LSire_2_3_T','Edit_2_3','NonEdit_2_3')" >-->
                    <img src="Images/delete.png" onclick='Delete_Ped_RegNo("<%=strSire_1_2_Seq%>","<%=strSire_2_3_Seq%>","s","<%=REGSEQ%>","LSire_2_3","Sire_Name_2_3","Sire_2_3_L","Sire_2_3","Aso_Sire_2_3","Aso_Sire_2_3_L","Aso_Sire_2_3_Seq","Sire_2_3_Seq")'  <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> >
                    <img src="Images/Find12.jpg" onClick='PedigreeSearch_Sire("Sire_Name_2_3","Sire_2_3","LSire_2_3","Sire_2_3_Seq","MALE","Aso_Sire_2_3","Aso_Sire_2_3_Seq")'  <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> />
                </td>                              
            </tr>
<!-- ******************************************************15 15 15-->
            <tr>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%" >
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%" class="right">
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    <div id="NonEdit_2_3" >   
                        <label id="Aso_Sire_2_3_L" style="text-transform:uppercase;" ><%=strAso_Sire_2_3%></label>
                        <label id="Sire_2_3_L"   style="text-transform:uppercase;" ><%=strSire_2_3%></label>
                    </div>
                    <!--<div id="Edit_2_3" style="visibility: hidden;">-->
<input type="hidden" name="Aso_Sire_2_3" id="Aso_Sire_2_3" placeholder="ORG" class="Sire_bot" size="10" value='<%=strAso_Sire_2_3%>' ><input type="hidden" name="Sire_2_3" placeholder="REG#" id="Sire_2_3" onchange="checkSireDam('MALE','Sire_Name_2_3','LSire_2_3','Sire_2_3','Sire_2_3_Seq','Aso_Sire_2_3','Aso_Sire_2_3_Seq')" value='<%=strSire_2_3%>'size="10" class="Sire_bot" >
                    <input type="hidden" name="Aso_Sire_2_3_Seq" value='<%=strAso_Sire_2_3_Seq%>' id="Aso_Sire_2_3_Seq" size="8" >
                    <input type="hidden" name="Sire_2_3_Seq"  id="Sire_2_3_Seq"  value='<%=strSire_2_3_Seq%>'size="8" >
                <!--</div>-->
                </td>
                <td width="5%" >
                    &nbsp;
                </td>                               
            </tr>
<!-- ******************************************************16 16 16 -->
            <tr>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%" >
                    &nbsp;
                </td>
                <td width="2%" class="bottom ">
                    <label style="font-weight:bold;">Sire:</label>
                </td>
                <td class="bottom " ><!-- 2nd generation dam sire -->   
                    <span id="LSire_1_2_L"  >
                    <label id="LSire_1_2" style="text-transform:uppercase;" class="ped"  onclick="Ped_To_Index('Sire_1_2_Seq')" ><%=strSire_Name_1_2%></label>
                    </span>
                    <!--<span id="LSire_1_2_T"  >-->
                    <input type="hidden" name="Sire_Name_1_2" id="Sire_Name_1_2" onchange="SaveMode_P(), checkSireDam('MALE','Sire_Name_1_2','LSire_1_2','Sire_1_2','Sire_1_2_Seq','Aso_Sire_1_2','Aso_Sire_1_2_Seq')"size="20" value='<%=strSire_Name_1_2%>' class="Sire">                    
                    <!--</span>                    -->
                </td>
                <td width="7%" class="bottom right">
                    <img src="Images/edit-add.png" onclick="Edit_HorseInfm('Sire_1_2_Seq','LSire_1_2','Sire_Name_1_2','Sire_1_2_L','Sire_1_2','Aso_Sire_1_2_L','Aso_Sire_1_2','Aso_Sire_1_2_Seq')"   <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> ><!--onclick="Ped_Edit('LSire_1_2_L','LSire_1_2_T','Edit_1_2','NonEdit_1_2')" >-->
                    <img src="Images/delete.png" onclick='Delete_Ped_RegNo("<%=strDam_Seq%>","<%=strSire_1_2_Seq%>","s","<%=REGSEQ%>","LSire_1_2","Sire_Name_1_2","Sire_1_2_L","Sire_1_2","Aso_Sire_1_2","Aso_Sire_1_2_L","Aso_Sire_1_2_Seq","Sire_1_2_Seq")'  <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> >
                    <img src="Images/Find12.jpg" onClick='PedigreeSearch_Sire("Sire_Name_1_2","Sire_1_2","LSire_1_2","Sire_1_2_Seq","MALE","Aso_Sire_1_2","Aso_Sire_1_2_Seq")'  <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> />
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%" >
                    &nbsp;
                </td>
            </tr>

<!-- **************************************************17*17*17*17*17 -->
            <tr>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%" class="right">
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    <div id="NonEdit_1_2" >   
                        <label id="Aso_Sire_1_2_L" style="text-transform:uppercase;" ><%=strAso_Sire_1_2%></label>
                        <label id="Sire_1_2_L"   style="text-transform:uppercase;" ><%=strSire_1_2%></label>
                    </div>
                    <!--<div id="Edit_1_2" style="visibility: hidden;">-->
<input type="hidden" name="Aso_Sire_1_2" id="Aso_Sire_1_2" placeholder="ORG" size="8" class="Sire_bot" value='<%=strAso_Sire_1_2%>' ><input type="hidden" name="Sire_1_2" placeholder="REG#"id="Sire_1_2" onchange=" checkSireDam('MALE','Sire_Name_1_2','LSire_1_2','Sire_1_2','Sire_1_2_Seq','Aso_Sire_1_2','Aso_Sire_1_2_Seq')" value='<%=strSire_1_2%>' size="8" class="Sire_bot" >&nbsp;
                    <input type="hidden" name ="Aso_Sire_1_2_Seq" value='<%=strAso_Sire_1_2_Seq%>' id="Aso_Sire_1_2_Seq" size="8" >
                    <input type="hidden" name="Sire_1_2_Seq" id="Sire_1_2_Seq"  value='<%=strSire_1_2_Seq%>' size="8" >                     
                    <!--</div>-->
                </td>
                <td width="5%"  class="right">
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%" >
                    &nbsp;
                </td>                                
            </tr>

<!-- ************************************************18*18*18*18*18*18*18 -->
            <tr>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%" class="right">
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%" class="right">
                    &nbsp;
                </td>
                <td width="2%" class="bottom">
                    <label style="font-weight:bold;">Dam:</label>
                </td>
                <td width="20%" class="bottom" >
                    <span id="LDam_2_3_L"  >
                    <label id="LDam_2_3" class="ped" style="text-transform:uppercase;" onclick="Ped_To_Index('Dam_2_3_Seq')" ><%=strDam_Name_2_3%></a></label>
                    </span>
                    <!--<span id="LDam_2_3_T"  >-->
                    <input type="hidden" name="Dam_Name_2_3" id="Dam_Name_2_3" onchange="SaveMode_P(), checkSireDam('FEMALE','Dam_Name_2_3','LDam_2_3','Dam_2_3','Dam_2_3_Seq','Aso_Dam_2_3','Aso_Dam_2_3_Seq')" size="25" value='<%=strDam_Name_2_3%>' class="Dam_sec_gen">
                    <!--</span>-->
                </td>
                <td width="7%" class="bottom">
                    <img src="Images/edit-add.png" onclick="Edit_HorseInfm('Dam_2_3_Seq','LDam_2_3','Dam_Name_2_3','Dam_2_3_L','Dam_2_3','Aso_Dam_2_3_L','Aso_Dam_2_3','Aso_Dam_2_3_Seq')"   <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> ><!--onclick="Ped_Edit('LDam_2_3_L','LDam_2_3_T','Edit_Dam_2_3','NonEdit_Dam_2_3')" >-->
                    <img src="Images/delete.png" onclick='Delete_Ped_RegNo("<%=strSire_1_2_Seq%>","<%=strDam_2_3_Seq%>","d","<%=REGSEQ%>","LDam_2_3","Dam_Name_2_3","Dam_2_3_L","Dam_2_3","Aso_Dam_2_3","Aso_Dam_2_3_L","Aso_Dam_2_3_Seq","Dam_2_3_Seq")'  <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> >
                    <img src="Images/Find12.jpg" onClick='PedigreeSearch_Dam("Dam_Name_2_3","Dam_2_3","LDam_2_3","Dam_2_3_Seq","FEMALE","Aso_Dam_2_3","Aso_Dam_2_3_Seq")'   <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%>/>                       
                </td>                                             
            </tr>
<!-- *****************************************************19*19 -->
            <tr>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%" class="right">
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%">
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    <div id="NonEdit_Dam_2_3" >   
                        <label id="Aso_Dam_2_3_L" style="text-transform:uppercase;" ><%=strAso_Dam_2_3%></label>
                        <label id="Dam_2_3_L"  style="text-transform:uppercase;"  ><%=strDam_2_3%></label>
                    </div>
                    <!--<div id="Edit_Dam_2_3" style="visibility: hidden;">-->
<input type="hidden" name="Aso_Dam_2_3" id="Aso_Dam_2_3" size="10" placeholder="ORG" class="Dam_bot" value='<%=strAso_Dam_2_3%>' ><input type="hidden" placeholder="REG#"class="Dam_bot" name="Dam_2_3" id="Dam_2_3" onchange="checkSireDam('FEMALE','Dam_Name_2_3','LDam_2_3','Dam_2_3','Dam_2_3_Seq','Aso_Dam_2_3','Aso_Dam_2_3_Seq')" value='<%=strDam_2_3%>' size="10" >
                    <input type="hidden" name="Aso_Dam_2_3_Seq" value='<%=strAso_Dam_2_3_Seq%>' id="Aso_Dam_2_3_Seq" size="8" >
                    <input type="hidden" name="Dam_2_3_Seq" id="Dam_2_3_Seq"  value='<%=strDam_2_3_Seq%>' size="8" >
                    <!--</div>-->
                </td>
                <td width="5%" >
                    &nbsp;
                </td>                               
            </tr>
<!-- ***************************************************20*20*20* -->
            <tr>
                <td width="2%" class="bottom">
                    <label style="font-weight:bold;">Dam:</label>
                </td>
                <td width="20%" class="bottom" >
                    <span id="LDam_L"  >
                    <label id="LDam" class="ped" style="text-transform:uppercase;" onclick="Ped_To_Index('Dam_Seq')" ><%=strDam_Name%></label>
                    </span>
                    <!--<span id="LDam_T"  >-->
                    <input type="hidden" name="Dam_Name"  id="Dam_Name" size="20" onchange="SaveMode_P(),checkSireDam('FEMALE','Dam_Name','LDam','Dam','Dam_Seq','Aso_Dam','Aso_Dam_Seq')" value='<%=strDam_Name%>' class="Dam">
                    <!--</span>-->
                </td>
                <td width="7%" class="bottom right">
                    <img src="Images/edit-add.png" onclick="Edit_HorseInfm('Dam_Seq','LDam','Dam_Name','Dam_L','Dam','Aso_Dam_L','Aso_Dam','Aso_Dam_Seq')"   <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> ><!--onclick="Ped_Edit('LDam_L','LDam_T','Edit_Dam','NonEdit_Dam')" >-->
                    <img src="Images/delete.png" onclick='Delete_Ped_RegNo("<%=REGSEQ%>","<%=strDam_Seq%>","d","<%=REGSEQ%>","LDam","Dam_Name","Dam_L","Dam","Aso_Dam","Aso_Dam_L","Aso_Dam_Seq","Dam_Seq")'  <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> >
                    <img src="Images/Find12.jpg" onClick='PedigreeSearch_Dam("Dam_Name","Dam","LDam","Dam_Seq","FEMALE","Aso_Dam","Aso_Dam_Seq")'  <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> />
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%" >
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%">
                    &nbsp;
                </td>                                
            </tr>
<!-- ******************************************************21 -->
            <tr>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    <div id="NonEdit_Dam" >   
                        <label id="Aso_Dam_L" style="text-transform:uppercase;" ><%=strAso_Dam%></label>
                        <label id="Dam_L"   style="text-transform:uppercase;" ><%=strDam%></label>
                    </div>
                    <!--<div id="Edit_Dam" style="visibility: hidden;">-->
<input type="hidden" name="Aso_Dam" id="Aso_Dam"  size="8" placeholder="ORG" class="Dam_bot" value='<%=strAso_Dam%>' ><input type="hidden" class="Dam_bot" placeholder="REG#"name="Dam"  id="Dam" onchange="checkSireDam('FEMALE','Dam_Name','LDam','Dam','Dam_Seq','Aso_Dam','Aso_Dam_Seq')" value='<%=strDam%>' size="8" >&nbsp;
                    <input type="hidden" name="Aso_Dam_Seq" value='<%=strAso_Dam_Seq%>' id="Aso_Dam_Seq" size="8" >
                    <input type="hidden" name="Dam_Seq"  id="Dam_Seq"  value='<%=strDam_Seq%>' size="8" >
                    <!--</div>-->
                </td>
                <td width="5%" class="right">
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%">
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%">
                    &nbsp;
                </td>                
            </tr>
<!-- ******************************************************22 -->
            <tr>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%" class="right">
                    &nbsp;
                </td> 
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%">
                    &nbsp;
                </td> 
                <td width="2%" class="bottom">
                    <label style="font-weight:bold;">Sire:</label>
                </td>
                <td width="20%" class="bottom" >    
                     <span id="LSire_2_4_L"  >
                     <label id="LSire_2_4" class="ped" style="text-transform:uppercase;" onclick="Ped_To_Index('Sire_2_4_Seq')" ><%=strSire_Name_2_4%></a></label>
                     </span>
                     <!--<span id="LSire_2_4_T"  >-->
                     <input type="hidden" name="Sire_Name_2_4" id="Sire_Name_2_4" onchange="SaveMode_P(), checkSireDam('MALE','Sire_Name_2_4','LSire_2_4','Sire_2_4','Sire_2_4_Seq','Aso_Sire_2_4','Aso_Sire_2_4_Seq')"size="25" value='<%=strSire_Name_2_4%>' class="Sire_sec_gen">
                     <!--</span>-->
                </td>
                <td width="7%" class="bottom">
                    <img src="Images/edit-add.png" onclick="Edit_HorseInfm('Sire_2_4_Seq','LSire_2_4','Sire_Name_2_4','Sire_2_4_L','Sire_2_4','Aso_Sire_2_4_L','Aso_Sire_2_4','Aso_Sire_2_4_Seq')"   <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> ><!--onclick="Ped_Edit('LSire_2_4_L','LSire_2_4_T','Edit_2_4','NonEdit_2_4')" >-->
                    <img src="Images/delete.png" onclick='Delete_Ped_RegNo("<%=strDam_1_2_Seq%>","<%=strSire_2_4_Seq%>","s","<%=REGSEQ%>","LSire_2_4","Sire_Name_2_4","Sire_2_4_L","Sire_2_4","Aso_Sire_2_4","Aso_Sire_2_4_L","Aso_Sire_2_4_Seq","Sire_2_4_Seq")'  <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> >
                    <img src="Images/Find12.jpg" onclick='PedigreeSearch_Sire("Sire_Name_2_4","Sire_2_4","LSire_2_4","Sire_2_4_Seq","MALE","Aso_Sire_2_4","Aso_Sire_2_4_Seq")'  <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> />
                </td>                
            </tr>
<!-- ******************************************************23 -->
            <tr>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%" class="right">
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%" class="right">
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    <div id="NonEdit_2_4" >   
                        <label id="Aso_Sire_2_4_L" style="text-transform:uppercase;" ><%=strAso_Sire_2_4%></label>
                        <label id="Sire_2_4_L"   style="text-transform:uppercase;" ><%=strSire_2_4%></label>
                    </div>
                    <!--<div id="Edit_2_4" style="visibility: hidden;">-->
<input type="hidden" name="Aso_Sire_2_4" id="Aso_Sire_2_4" placeholder="ORG" class="Sire_bot" size="10" value='<%=strAso_Sire_2_4%>' ><input type="hidden" placeholder="REG#" name="Sire_2_4" id="Sire_2_4" onchange="checkSireDam('MALE','Sire_Name_2_4','LSire_2_4','Sire_2_4','Sire_2_4_Seq','Aso_Sire_2_4','Aso_Sire_2_4_Seq')" value='<%=strSire_2_4%>' size="10" class="Sire_bot" >
                    <input type="hidden" name="Aso_Sire_2_4_Seq" value='<%=strAso_Sire_2_4_Seq%>' id="Aso_Sire_2_4_Seq" size="8" >
                    <input type="hidden" name="Sire_2_4_Seq" id="Sire_2_4_Seq"  value='<%=strSire_2_4_Seq%>' size="8" >                        
                    <!--</div>-->
                </td>
                <td width="5%">
                    &nbsp;
                </td>                               
            </tr>
<!-- ******************************************************24 -->
            <tr>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%" class="right">
                    &nbsp;
                </td>
                <td width="2%"  class="bottom">
                    <label style="font-weight:bold;">Dam:</label>
                </td>
                <td width="20%" class="bottom" >
                    <span id="LDam_1_2_L"  >
                    <label id="LDam_1_2" class="ped" style="text-transform:uppercase;" onclick="Ped_To_Index('Dam_1_2_Seq')" ><%=strDam_Name_1_2%></a></label>
                    </span>
                    <!--<span id="LDam_1_2_T"  >-->
                    <input type="hidden" name="Dam_Name_1_2" id="Dam_Name_1_2" onchange="SaveMode_P(), checkSireDam('FEMALE','Dam_Name_1_2','LDam_1_2','Dam_1_2','Dam_1_2_Seq','Aso_Dam_1_2','Aso_Dam_1_2_Seq')" size="20" value='<%=strDam_Name_1_2%>' class="Dam">&nbsp;
                    <!--</span>-->
                </td>
                <td width="7%" class="bottom right">
                    <img src="Images/edit-add.png" onclick="Edit_HorseInfm('Dam_1_2_Seq','LDam_1_2','Dam_Name_1_2','Dam_1_2_L','Dam_1_2','Aso_Dam_1_2_L','Aso_Dam_1_2','Aso_Dam_1_2_Seq')"   <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> ><!--onclick="Ped_Edit('LDam_1_2_L','LDam_1_2_T','Edit_Dam_1_2','NonEdit_Dam_1_2')" >-->
                    <img src="Images/delete.png" onclick='Delete_Ped_RegNo("<%=strDam_Seq%>","<%=strDam_1_2_Seq%>","d","<%=REGSEQ%>","LDam_1_2","Dam_Name_1_2","Dam_1_2_L","Dam_1_2","Aso_Dam_1_2","Aso_Dam_1_2_L","Aso_Dam_1_2_Seq","Dam_1_2_Seq")'  <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> >
                    <img src="Images/Find12.jpg" onClick='PedigreeSearch_Dam("Dam_Name_1_2","Dam_1_2","LDam_1_2","Dam_1_2_Seq","FEMALE","Aso_Dam_1_2","Aso_Dam_1_2_Seq")'  <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> />
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%">
                    &nbsp;
                </td>                                                
            </tr>
<!-- ******************************************************25 -->
            <tr>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%">
                    &nbsp;
                </td> 
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    <div id="NonEdit_Dam_1_2" >   
                        <label id="Aso_Dam_1_2_L" style="text-transform:uppercase;" ><%=strAso_Dam_1_2%></label>
                        <label id="Dam_1_2_L"   style="text-transform:uppercase;" ><%=strDam_1_2%></label>
                    </div>
                    <!--<div id="Edit_Dam_1_2" style="visibility: hidden;">-->
<input type="hidden" name="Aso_Dam_1_2" id="Aso_Dam_1_2" size="8" placeholder="ORG" class="Dam_bot" value='<%=strAso_Dam_1_2%>' ><input type="hidden" name="Dam_1_2" id="Dam_1_2" placeholder="REG#" onchange="checkSireDam('FEMALE','Dam_Name_1_2','LDam_1_2','Dam_1_2','Dam_1_2_Seq','Aso_Dam_1_2','Aso_Dam_1_2_Seq')" value='<%=strDam_1_2%>' size="8" class="Dam_bot" >&nbsp;
                    <input type="hidden" name="Aso_Dam_1_2_Seq" value='<%=strAso_Dam_1_2_Seq%>' id="Aso_Dam_1_2_Seq" size="8" >
                    <input type="hidden" name="Dam_1_2_Seq" id="Dam_1_2_Seq"  value='<%=strDam_1_2_Seq%>' size="8" >
                    <!--</div>-->
                </td>
                <td width="5%" class="right">
                    &nbsp;
                </td> 
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%">
                    &nbsp;
                </td>                 
            </tr>
<!-- ******************************************************26 -->
            <tr>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%">
                    &nbsp;
                </td> 
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%" class="right" >
                    &nbsp;
                </td> 
                <td width="2%" class="bottom" ><!-- 3rd generation  dam dam dam -->    
                    <label style="font-weight:bold;">Dam:</label>
                </td>
                <td width="20%" class="bottom" >
                    <span id="LDam_2_4_L"  >
                    <label id="LDam_2_4" class="ped" style="text-transform:uppercase;" onclick="Ped_To_Index('Dam_2_4_Seq')" ><%=strDam_Name_2_4%></a></label>
                    </span>
                    <!--<span id="LDam_2_4_T"  >-->
                    <input type="hidden" name="Dam_Name_2_4" id="Dam_Name_2_4" onchange="SaveMode_P(), checkSireDam('FEMALE','Dam_Name_2_4','LDam_2_4','Dam_2_4','Dam_2_4_Seq','Aso_Dam_2_4','Aso_Dam_2_4_Seq')" size="25"  value='<%=strDam_Name_2_4%>' class="Dam_sec_gen">
                    <!--</span>-->
                </td>      
                <td class="bottom" width="7%">    
                    <img src="Images/edit-add.png" onclick="Edit_HorseInfm('Dam_2_4_Seq','LDam_2_4','Dam_Name_2_4','Dam_2_4_L','Dam_2_4','Aso_Dam_2_4_L','Aso_Dam_2_4','Aso_Dam_2_4_Seq')"   <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> ><!--onclick="Ped_Edit('LDam_2_4_L','LDam_2_4_T','Edit_Dam_2_4','NonEdit_Dam_2_4')" >-->
                    <img src="Images/delete.png" onclick='Delete_Ped_RegNo("<%=strDam_1_2_Seq%>","<%=strDam_2_4_Seq%>","d","<%=REGSEQ%>","LDam_2_4","Dam_Name_2_4","Dam_2_4_L","Dam_2_4","Aso_Dam_2_4","Aso_Dam_2_4_L","Aso_Dam_2_4_Seq","Dam_2_4_Seq")'  <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> >
                    <img src="Images/Find12.jpg" onClick='PedigreeSearch_Dam("Dam_Name_2_4","Dam_2_4","LDam_2_4","Dam_2_4_Seq","FEMALE","Aso_Dam_2_4","Aso_Dam_2_4_Seq")'  <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> />
                </td>
            </tr>   
<!-- *****************************************************27 -->
             <tr>
                 <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%">
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    &nbsp;
                </td>
                <td width="5%">
                    &nbsp;
                </td>
                <td width="2%">
                    &nbsp;
                </td>
                <td width="20%">
                    <div id="NonEdit_Dam_2_4" >   
                        <label id="Aso_Dam_2_4_L" style="text-transform:uppercase;" ><%=strAso_Dam_2_4%></label>
                        <label id="Dam_2_4_L"   style="text-transform:uppercase;" ><%=strDam_2_4%></label>
                    </div>
                    <!--<div id="Edit_Dam_2_4" style="visibility: hidden;">-->
<input type="hidden" name="Aso_Dam_2_4" id="Aso_Dam_2_4" size="10" placeholder="ORG" class="Dam_bot" value='<%=strAso_Dam_2_4%>' ><input type="hidden" name="Dam_2_4" id="Dam_2_4" placeholder="REG#" onchange="checkSireDam('FEMALE','Dam_Name_2_4','LDam_2_4','Dam_2_4','Dam_2_4_Seq','Aso_Dam_2_4','Aso_Dam_2_4_Seq')" value='<%=strDam_2_4%>' size="10" class="Dam_bot" >
                    <input type="hidden" name="Aso_Dam_2_4_Seq" value='<%=strAso_Dam_2_4_Seq%>' id="Aso_Dam_2_4_Seq" size="8" >
                    <input type="hidden" name="Dam_2_4_Seq" id="Dam_2_4_Seq"  value='<%=strDam_2_4_Seq%>' size="8" />
                    <!--</div>-->
                </td>
                <td width="5%">
                    &nbsp;
                </td>                               
            </tr> 
        
<%                                                                                      
  } 
    catch (Exception e) {
    System.err.println("Got an exception! ");
    System.err.println("++frmPedigree.jsp+++"+e);
} 
%>  
            <tr class="buttonstyle">
                <td align="center" colspan="9"> 
                    <input type="button" id="Save_Pedigree" class="button" onclick="SavePedigree('frmPedigree.jsp')" value="Save" 
					<% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%>/>                   
                    <input type="button" id="Reset_Pedigree" class="button" onclick="SavePedigree('frmPedigree.jsp')" value="Reset" />
                    <!--<input type="button" id="ClosePedigree" class="button" value="Close" onclick="Close_Paso('frmPedigree.jsp')" />-->
                    <input type="button" id="PreviousPedigree" class="button" onclick="CheckSave('Markings.jsp')" value="&laquo;" />
                    <input type="button" id="NextPedigree" class="button" onclick="CheckSave('frmReg_Siblings.jsp')" value="&raquo;" />                                          
                </td>
            </tr>
        </table>  
        </div>


    <div id="sidebar">                
        <%@ include file="Reg_Pedigree_Side.jsp" %>
    </div>

    <div id="footer_Bot" align="bottom">
    <br/><br/><br/>
    <jsp:include page="/frmBottom_Registration.jsp"/>
    </div>            

    </div>
    <div id="dialog-Reg" title="SEARCH REGISTRATION" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  src="regsearchpopup.jsp"  id="modalIFrame_Show" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes">
        </iframe>
    </div>    
    <div id="dialog-PedigreeSearch_Sire" title="SIRE SEARCH" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  src="frmPedigreeSearchPopup.jsp"  id="modalIFrame_Pedigree_Sire" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="no">
        </iframe>
    </div>
    <div id="dialog-PedigreeSearch_Dam" title="DAM SEARCH" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  src="frmPedigreeSearchPopup.jsp"  id="modalIFrame_Pedigree_Dam" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="no">
        </iframe>
    </div>
     <div id="dialog-Calculator" style="display:none; background:url('Images/trans-wood-1.png')" >
        <iframe src="frmCalculator.jsp" id="modalIFrame_Calculator" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" >
        </iframe>
    </div>
    <div id="dialog-NewReg" title="HORSE REGISTRATION" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  src="frmReg_Pedigree_NewRegistration.jsp"  id="modalIFrame_NewReg" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes">
        </iframe>
    </div>
    <div id="dialog-EditHorseInformation" title="HORSE INFORMATION" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  src="frmReg_Ped_EditHorseInfm.jsp"  id="modalIFrame_EditHorseInformation" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes">
        </iframe>
    </div>
       
    </form>
</body>
</html>
