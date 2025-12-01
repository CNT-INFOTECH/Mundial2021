<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.DBConnection" %>
<%@ page import="pasotracker.GeneralServlet" %>    
<script type="text/javascript" src="jscIndex.js"></script>   

<%  
    String Button_Status="";    
    String strReg_Status="";
    String strEffectivedate="";
    String strRegistration_Type="";
    String strreg_placeSeq="";
    String strreg_colorSeq="";
    String strhor_breederSeq="";
    String strhor_aireSeq="";
    String strorgSeq="";
    
    String strEntitySeq="";
    
    String strOwnerName="";
    
    String strOwnerNo="";

    String strOwn_Type="";
    String strOrg_Name="";

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
    String strmem_lname="";
    String strmem_mname="";
    String strmem_add1="";
    String strmem_add2="";
    String strmem_city="";
    String strmem_state="";
    String strmem_zip="";
    String strmem_country="";
    String strmem_phone="";
    String strmem_email="";
    String strAño="";
    
    String strSire="";
    String strDam="";
            
    String strHdnSeqNo_Mem="";
    String strEmb_Transfer="";
    String str_reggno="";    
    
    String strhor_color_Value="";        
    String FontColor="";
    String RegType="";
    
    String age_Months="";
    String age_Days="";
    String age_MD="";
    int strCOUN=0;
   
    if(request.getParameter("EnableRegNo")!= null && request.getParameter("EnableRegNo").equals("R"))   
       EnabledDisable="Readonly";        
    else
       EnabledDisable="";
    
    if(request.getParameter("RegNo")!=null)
    {  
      str_reggno=request.getParameter("RegNo");  
      session.setAttribute("Regno_str",str_reggno);      
    }
    else
      str_reggno="";
    
     /*if(session.getAttribute("ses_ENTITYSEQ")!=null)
           strEntitySeq =(String) session.getAttribute("ses_ENTITYSEQ");
    else
        strEntitySeq="";
      */     
    //mode=3,2 are similar & mode =2 deleted RegNo- in seq
/*if(strMode.equals("3"))
{ */           
    try
    {        
            SaveYN="Y"; // initially the var is set to N and updating to Y once saving to DB.
                    //This is used to identify whether page is saved or not.            
                                    
            GeneralServlet gen=new GeneralServlet();
            
            RowSetFactory factory2 = RowSetProvider.newFactory();
CachedRowSet crsGetHorseDetails = factory2.createCachedRowSet();
            if(strHdnRegSeq.length()>0 && strHdnRegSeq!=null)
            crsGetHorseDetails = gen.GetHorseDetails(strHdnRegSeq,"","","","","","","");
                      
            while(crsGetHorseDetails.next())
            { 
            strOwnerName="";
            strHdnRegSeq="";
            strreg_num="";
            strreg_type="";
            strdna="";
            strinf_emp="";
            strdate="";
            strreg_place="";
            strreg_placeSeq="";
            strreg_user="";
            strhor_name="";
            strhor_gender="";
            strhor_gelding_date="";
            strhor_dob="";
            strhor_age="";
            strhor_deathdate="";
            strhor_color="";
            strreg_colorSeq="";
            strhor_aire="";
            strhor_aireSeq="";            
            strorg="";
            strorgSeq="";
            strAño="";
            strEmb_Transfer="";           
            strmicro_num="";
            strcaso_num="";
            strhor_breeder="";            
            strhor_breederSeq="";    
            strmem_num="";
            strmem_name="";
            strmem_lname="";
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
            strEntitySeq="";
            strSire="";
            strDam="";
            strRegistration_Type="";
            strCOUN=0;
            strOwnerNo="";
            age_MD="";
            age_Months="";
            age_Days="";
            
            EnabledDisable="Readonly";
            
            if(crsGetHorseDetails.getString("REGSEQ")!=null)   
            {                              
                strHdnRegSeq= crsGetHorseDetails.getString("REGSEQ").trim();
                session.setAttribute("ses_REGSEQ",strHdnRegSeq);                 
            }
            else
                strHdnRegSeq="";
            
            if(crsGetHorseDetails.getString("REGISTRATION_NUM")!=null)               
                strreg_num= crsGetHorseDetails.getString("REGISTRATION_NUM").trim();                
            else
                strreg_num="";
            
            if(crsGetHorseDetails.getString("REGISTRY_TYPE")!=null)                 
                strreg_type= crsGetHorseDetails.getString("REGISTRY_TYPE").trim();                
            else
                strreg_type="";
            
            if(crsGetHorseDetails.getString("REGISTRATION_TYPE")!=null)     
                strRegistration_Type= crsGetHorseDetails.getString("REGISTRATION_TYPE").trim();
            else
                strRegistration_Type="";
               
            if(crsGetHorseDetails.getString("REG_STATUS")!=null)                 
                strReg_Status= crsGetHorseDetails.getString("REG_STATUS").trim();
            else
                strReg_Status="";
                        
            if(crsGetHorseDetails.getString("DNA")!=null)                  
                strdna= crsGetHorseDetails.getString("DNA").trim();
            else
                strdna="";  

            if(crsGetHorseDetails.getString("INF_EMP")!=null)                                     
                strinf_emp= crsGetHorseDetails.getString("INF_EMP").trim();                          
            else
                strinf_emp="";     

            if(crsGetHorseDetails.getString("REGISTRY_DATE")!=null)                                  
                strdate= crsGetHorseDetails.getString("REGISTRY_DATE").trim();
            else
                strdate="";
            
            if(crsGetHorseDetails.getString("REGISTRY_PLACE")!=null)                                 
                strreg_placeSeq= crsGetHorseDetails.getString("REGISTRY_PLACE").trim();
            else
                strreg_placeSeq="";
            
            if(crsGetHorseDetails.getString("REGISTRY_PLACE_VAL")!=null)                     
				strreg_place= crsGetHorseDetails.getString("REGISTRY_PLACE_VAL").trim();
            else
                strreg_place="";                
            
            if(crsGetHorseDetails.getString("REGISTRY_USER")!=null)                     
                strreg_user= crsGetHorseDetails.getString("REGISTRY_USER").trim();
            else
                strreg_user="";

            if(crsGetHorseDetails.getString("HORSE_PRIMARYNAME")!=null)                     
                strhor_name= crsGetHorseDetails.getString("HORSE_PRIMARYNAME").trim();
            else
                strhor_name="";                
                
            if(crsGetHorseDetails.getString("HORSE_GENDER")!=null)                  
                strhor_gender= crsGetHorseDetails.getString("HORSE_GENDER").trim();
            else
                strhor_gender="";
            
            if(crsGetHorseDetails.getString("HORSE_GELDING_DATE")!=null)                  
                strhor_gelding_date= crsGetHorseDetails.getString("HORSE_GELDING_DATE").trim();
            else
                strhor_gelding_date="";


            if(crsGetHorseDetails.getString("HORSE_DOB")!=null)                  
                strhor_dob= crsGetHorseDetails.getString("HORSE_DOB").trim();
            else
                strhor_dob="";  
                
            if(crsGetHorseDetails.getString("AGE")!=null)                     
                strhor_age= crsGetHorseDetails.getString("AGE").trim()+" Months";
            else
                strhor_age="";

            if(crsGetHorseDetails.getString("MONTH")!=null)                     
                age_Months= crsGetHorseDetails.getString("MONTH").trim()+"M";
            else
                age_Months="";
            
            if(crsGetHorseDetails.getString("DAYS")!=null)                     
                age_Days= crsGetHorseDetails.getString("DAYS").trim()+"D";
            else
                age_Days="";
            
            age_MD=age_Months+' '+age_Days;
                
            if(crsGetHorseDetails.getString("HORSE_DEATHDATE")!=null)                  
                strhor_deathdate= crsGetHorseDetails.getString("HORSE_DEATHDATE").trim();
            else
                strhor_deathdate="";    
                       
            if(crsGetHorseDetails.getString("HORSE_COLOR")!=null)                  
                strreg_colorSeq= crsGetHorseDetails.getString("HORSE_COLOR").trim();		
            else
                strreg_colorSeq="";
            
            if(crsGetHorseDetails.getString("HORSE_COLOR_VAL")!=null)                  
                strhor_color= crsGetHorseDetails.getString("HORSE_COLOR_VAL").trim();               
            else
                strhor_color="";
                        
            if(crsGetHorseDetails.getString("HORSE_AIRE")!=null)                  
                strhor_aireSeq= crsGetHorseDetails.getString("HORSE_AIRE").trim();
            else
                strhor_aireSeq="";

            if(crsGetHorseDetails.getString("HORSE_MODALITY_VAL")!=null)                  
                strhor_aire= crsGetHorseDetails.getString("HORSE_MODALITY_VAL").trim();
            else
                strhor_aire="";
            
            if(crsGetHorseDetails.getString("HORSE_ORG_VAL")!=null)                  
                strorg= crsGetHorseDetails.getString("HORSE_ORG_VAL").trim();
            else
                strorg="";
			
            if(crsGetHorseDetails.getString("ORGANISATION")!=null)                  
                strorgSeq= crsGetHorseDetails.getString("ORGANISATION").trim();
            else
                strorgSeq="";
            
            if(crsGetHorseDetails.getString("MICROCHIP_NUM")!=null)                  
                strmicro_num= crsGetHorseDetails.getString("MICROCHIP_NUM").trim();
            else
                strmicro_num="";                        
            
            if(crsGetHorseDetails.getString("CASODNA_NUM")!=null)                  
                strcaso_num= crsGetHorseDetails.getString("CASODNA_NUM").trim();
             else
                strcaso_num="";
            
            if(crsGetHorseDetails.getString("HORSE_BREEDER_VAL")!=null)                  
                strhor_breeder= crsGetHorseDetails.getString("HORSE_BREEDER_VAL").trim();
            else
                strhor_breeder="";
			
            if(crsGetHorseDetails.getString("HORSE_BREEDER")!=null)                  
                strhor_breederSeq= crsGetHorseDetails.getString("HORSE_BREEDER").trim();
            else
                strhor_breederSeq=""; 
            
            if(crsGetHorseDetails.getString("Año")!=null)                  
                strAño= crsGetHorseDetails.getString("Año").trim();
            else
                strAño="";
 
            if(crsGetHorseDetails.getString("EMB_TRANSFER")!=null)                  
                strEmb_Transfer= crsGetHorseDetails.getString("EMB_TRANSFER").trim();
            else
                strEmb_Transfer="";
            
            if(crsGetHorseDetails.getString("OWNER_TYPE")!=null)                  
                strOwn_Type= crsGetHorseDetails.getString("OWNER_TYPE").trim();
            else
                strOwn_Type="";

            if(crsGetHorseDetails.getString("ORGANIZATION_NAME")!=null)                  
                strOrg_Name= crsGetHorseDetails.getString("ORGANIZATION_NAME").trim();
             else
                strOrg_Name="";

            if(crsGetHorseDetails.getString("MEMBER_NUM")!=null)                  
                strmem_num= crsGetHorseDetails.getString("MEMBER_NUM").trim();
            else
                strmem_num="";   
            
            if(crsGetHorseDetails.getString("FIRSTNAME")!=null)                  
                strmem_name= crsGetHorseDetails.getString("FIRSTNAME").trim();
            else
                strmem_name="";
            
            if(crsGetHorseDetails.getString("LASTNAME")!=null)                  
                strmem_lname= crsGetHorseDetails.getString("LASTNAME").trim();
            else
                strmem_lname="";            
            
            if(crsGetHorseDetails.getString("ADDRESS1")!=null)                  
                strmem_add1= crsGetHorseDetails.getString("ADDRESS1").trim();
             else
                strmem_add1=""; 
            
            if(crsGetHorseDetails.getString("ADDRESS2")!=null)                  
                strmem_add2= crsGetHorseDetails.getString("ADDRESS2").trim();
             else
                strmem_add2="";
            
            if(crsGetHorseDetails.getString("CITY")!=null)                  
                strmem_city= crsGetHorseDetails.getString("CITY").trim();
            else
                strmem_city="";
            
            if(crsGetHorseDetails.getString("STATE")!=null)                  
                strmem_state= crsGetHorseDetails.getString("STATE").trim();
            else
                strmem_state=""; 
            
            if(crsGetHorseDetails.getString("ZIP")!=null)                  
                strmem_zip= crsGetHorseDetails.getString("ZIP").trim();
            else
                strmem_zip="";
            
            if(crsGetHorseDetails.getString("COUNTRY")!=null)                  
                strmem_country= crsGetHorseDetails.getString("COUNTRY").trim();
            else
                strmem_country="";
            
            if(crsGetHorseDetails.getString("PHONE")!=null)                  
                strmem_phone= crsGetHorseDetails.getString("PHONE").trim();
            else
                strmem_phone="";
            
            if(crsGetHorseDetails.getString("EMAIL")!=null)                  
                strmem_email= crsGetHorseDetails.getString("EMAIL").trim();
            else
                strmem_email="";

            if(crsGetHorseDetails.getString("ENTITYSEQ")!=null)                  
                strEntitySeq= crsGetHorseDetails.getString("ENTITYSEQ").trim();
            else
                strEntitySeq="";           

            if(crsGetHorseDetails.getString("START_DATE")!=null)                  
                strEffectivedate= crsGetHorseDetails.getString("START_DATE").trim();
            else
                strEffectivedate="";

            if(crsGetHorseDetails.getString("SUFFIX")!=null)                  
                strmem_mname= crsGetHorseDetails.getString("SUFFIX").trim();
            else
                strmem_mname=""; 

            if(crsGetHorseDetails.getString("SIRE")!=null)                  
                strSire= crsGetHorseDetails.getString("SIRE").trim();
            else
                strSire="";

            if(crsGetHorseDetails.getString("DAM")!=null)                  
                strDam= crsGetHorseDetails.getString("DAM").trim();
            else
                strDam=""; 

            if(crsGetHorseDetails.getString("COUN")!=null)                  
                strCOUN = Integer.parseInt(crsGetHorseDetails.getString("COUN").trim());
            else
                strCOUN=0;
           
            if(crsGetHorseDetails.getString("ASSIGNEDNUM")!=null)                  
                strOwnerNo= crsGetHorseDetails.getString("ASSIGNEDNUM").trim();
            else
                strOwnerNo="";
            
            strOwnerName=strmem_name+" "+strmem_lname;

            }          
          
          } 
            catch (Exception e) {
            System.err.println("Got an exception! ");
            System.err.println("+++frmpassoinclude+mod3+"+e);
        }                 
 
    
if(strMode.equals("4"))
    {               
    
    if(request.getParameter("FNAME")!=null)        
        strmem_name=request.getParameter("FNAME").trim();
    
    if(request.getParameter("LNAME")!=null)
        strmem_lname=request.getParameter("LNAME").trim();
    
    if(request.getParameter("ORGNAME")!=null)
        strOrg_Name=request.getParameter("ORGNAME").trim();
    
    if(request.getParameter("PHONE")!=null)
        strmem_phone=request.getParameter("PHONE").trim();
    // ON is the owner no
    if(request.getParameter("ON")!=null)
        strOwnerNo=request.getParameter("ON").trim();
    
    try
    {                    
     GeneralServlet gen_OwnerInformation = new GeneralServlet();
     RowSetFactory factory = RowSetProvider.newFactory();
CachedRowSet crsOwnerInformation = factory.createCachedRowSet();
     crsOwnerInformation = gen_OwnerInformation.GET_OwnerInformation(strmem_name, strmem_lname, strOrg_Name, strmem_phone,strOwnerNo);
     while(crsOwnerInformation.next())
     {
        strEntitySeq="";
        strmem_num="";
        strOrg_Name="";
        strmem_name="";
        strmem_lname="";
        strmem_mname="";
        strmem_add1="";
        strmem_add2="";
        strmem_city="";
        strmem_state="";
        strmem_zip="";
        strmem_country="";
        strmem_phone="";
        strmem_email="";
        strOwnerNo="";
                
        if(crsOwnerInformation.getString("ENTITYSEQ")!=null)                  
        strEntitySeq= crsOwnerInformation.getString("ENTITYSEQ").trim();
        else
        strEntitySeq="";

        if(crsOwnerInformation.getString("ASSIGNEDNUM")!=null)                  
        strOwnerNo= crsOwnerInformation.getString("ASSIGNEDNUM").trim();
        else
        strOwnerNo="";

        if(crsOwnerInformation.getString("OWNER_TYPE")!=null)                  
        strOwn_Type= crsOwnerInformation.getString("OWNER_TYPE").trim();
        else
        strOwn_Type="";

        if(crsOwnerInformation.getString("ORGANIZATION_NAME")!=null)                  
        strOrg_Name= crsOwnerInformation.getString("ORGANIZATION_NAME").trim();
        else
        strOrg_Name="";

        if(crsOwnerInformation.getString("MEMBER_NUM")!=null)                  
        strmem_num= crsOwnerInformation.getString("MEMBER_NUM").trim();
        else
        strmem_num="";   

        if(crsOwnerInformation.getString("FIRSTNAME")!=null)                  
        strmem_name= crsOwnerInformation.getString("FIRSTNAME").trim();
        else
        strmem_name="";

        if(crsOwnerInformation.getString("LASTNAME")!=null)                  
        strmem_lname= crsOwnerInformation.getString("LASTNAME").trim();
        else
        strmem_lname="";

        if(crsOwnerInformation.getString("ADDRESS1")!=null)                  
        strmem_add1= crsOwnerInformation.getString("ADDRESS1").trim();
        else
        strmem_add1=""; 

        if(crsOwnerInformation.getString("ADDRESS2")!=null)                  
        strmem_add2= crsOwnerInformation.getString("ADDRESS2").trim();
        else
        strmem_add2="";

        if(crsOwnerInformation.getString("CITY")!=null)                  
        strmem_city= crsOwnerInformation.getString("CITY").trim();
        else
        strmem_city="";

        if(crsOwnerInformation.getString("STATE")!=null)                  
        strmem_state= crsOwnerInformation.getString("STATE").trim();
        else
        strmem_state=""; 

        if(crsOwnerInformation.getString("ZIP")!=null)                  
        strmem_zip= crsOwnerInformation.getString("ZIP").trim();
        else
        strmem_zip="";

        if(crsOwnerInformation.getString("COUNTRY")!=null)                  
        strmem_country= crsOwnerInformation.getString("COUNTRY").trim();
        else
        strmem_country="";

        if(crsOwnerInformation.getString("PHONE")!=null)                  
        strmem_phone= crsOwnerInformation.getString("PHONE").trim();
        else
        strmem_phone="";

        if(crsOwnerInformation.getString("EMAIL")!=null)                  
        strmem_email= crsOwnerInformation.getString("EMAIL").trim();
        else
        strmem_email="";

        if(crsOwnerInformation.getString("SUFFIX")!=null)                  
        strmem_mname= crsOwnerInformation.getString("SUFFIX").trim();
        else
        strmem_mname="";

        strOwnerName=strmem_name+" "+strmem_lname;

     }        
    }
    catch (Exception e) {
            System.err.println("Got an exception! ");
            System.err.println("++frmpassoinclude mode4+++"+e);
        } 
       
}


//This mode=5  is for new button in the   index screen
if(strMode.equals("5"))
{           
    strreg_num =""; 
    strHdnRegSeq="";
    session.removeAttribute("ses_REGSEQ");                                         
    if( request.getParameter("RegNum")!=null && !request.getParameter("RegNum").equals("") && request.getParameter("RegNum").length()!=0)    
        strreg_num=request.getParameter("RegNum");//this is for onblur funciton Populatevalue()
    else
	strreg_num="";
    try
    {       		    
            GeneralServlet gen=new GeneralServlet();            
            RowSetFactory factory = RowSetProvider.newFactory();
CachedRowSet crsGetHorseDetails = factory.createCachedRowSet();

            if(!strreg_num.equals(""))
            crsGetHorseDetails = gen.GetHorseDetails(strHdnRegSeq,strreg_num,"","","","","","");
                      
            while(crsGetHorseDetails.next())
            { 
            strOwnerName="";
            strHdnRegSeq="";
            strreg_num="";
            strreg_type="";
            strdna="";
            strinf_emp="";
            strdate="";
            strreg_place="";
            strreg_placeSeq="";
            strreg_user="";
            strhor_name="";
            strhor_gender="";
            strhor_gelding_date="";
            strhor_dob="";
            strhor_age="";
            strhor_deathdate="";
            strhor_color="";
            strreg_colorSeq="";
            strhor_aire="";
            strhor_aireSeq="";            
            strorg="";
            strorgSeq="";
            strAño="";
            strEmb_Transfer="";           
            strmicro_num="";
            strcaso_num="";
            strhor_breeder="";            
            strhor_breederSeq="";    
            strmem_num="";
            strmem_name="";
            strmem_mname="";
            strmem_lname="";
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
            strEntitySeq="";
            strRegistration_Type="";
            strReg_Status="";
            strCOUN=0;
            strOwnerNo="";
            age_MD="";
            age_Months="";
            age_Days="";
            
            if(crsGetHorseDetails.getString("REGSEQ")!=null)   
            {                              
                strHdnRegSeq= crsGetHorseDetails.getString("REGSEQ").trim();
                session.setAttribute("ses_REGSEQ",strHdnRegSeq);      
                if(!strHdnRegSeq.equals(""))
                    EnabledDisable="Readonly";
                else
                    EnabledDisable="";
            }
            else
                strHdnRegSeq="";
            
            if(crsGetHorseDetails.getString("REGISTRATION_NUM")!=null)               
                strreg_num= crsGetHorseDetails.getString("REGISTRATION_NUM").trim();                
            else
                strreg_num="";
            
            if(crsGetHorseDetails.getString("REGISTRY_TYPE")!=null)                 
                strreg_type= crsGetHorseDetails.getString("REGISTRY_TYPE").trim();                
            else
                strreg_type="";
            
            if(crsGetHorseDetails.getString("REGISTRATION_TYPE")!=null)     
                strRegistration_Type= crsGetHorseDetails.getString("REGISTRATION_TYPE").trim();
            else
                strRegistration_Type="";
               
            if(crsGetHorseDetails.getString("REG_STATUS")!=null)                 
                strReg_Status= crsGetHorseDetails.getString("REG_STATUS").trim();
            else
                strReg_Status="";
                        
            if(crsGetHorseDetails.getString("DNA")!=null)                  
                strdna= crsGetHorseDetails.getString("DNA").trim();
            else
                strdna="";  

            if(crsGetHorseDetails.getString("INF_EMP")!=null)                                     
                strinf_emp= crsGetHorseDetails.getString("INF_EMP").trim();                          
            else
                strinf_emp="";     

            if(crsGetHorseDetails.getString("REGISTRY_DATE")!=null)                                  
                strdate= crsGetHorseDetails.getString("REGISTRY_DATE").trim();
            else
                strdate="";
            
            if(crsGetHorseDetails.getString("REGISTRY_PLACE")!=null)                                 
                strreg_placeSeq= crsGetHorseDetails.getString("REGISTRY_PLACE").trim();
            else
                strreg_placeSeq="";
            
            if(crsGetHorseDetails.getString("REGISTRY_PLACE_VAL")!=null)                     
				strreg_place= crsGetHorseDetails.getString("REGISTRY_PLACE_VAL").trim();
            else
                strreg_place="";                
            
            if(crsGetHorseDetails.getString("REGISTRY_USER")!=null)                     
                strreg_user= crsGetHorseDetails.getString("REGISTRY_USER").trim();
            else
                strreg_user="";

            if(crsGetHorseDetails.getString("HORSE_PRIMARYNAME")!=null)                     
                strhor_name= crsGetHorseDetails.getString("HORSE_PRIMARYNAME").trim();
			else
                strhor_name="";                
                
            if(crsGetHorseDetails.getString("HORSE_GENDER")!=null)                  
                strhor_gender= crsGetHorseDetails.getString("HORSE_GENDER").trim();
            else
                strhor_gender="";
            
            if(crsGetHorseDetails.getString("HORSE_GELDING_DATE")!=null)                  
                strhor_gelding_date= crsGetHorseDetails.getString("HORSE_GELDING_DATE").trim();
            else
                strhor_gelding_date="";


            if(crsGetHorseDetails.getString("HORSE_DOB")!=null)                  
                strhor_dob= crsGetHorseDetails.getString("HORSE_DOB").trim();
            else
                strhor_dob="";  
                
            if(crsGetHorseDetails.getString("AGE")!=null)                     
                strhor_age= crsGetHorseDetails.getString("AGE").trim()+" Months";
            else
                strhor_age=""; 
            
            if(crsGetHorseDetails.getString("MONTH")!=null)                     
                age_Months= crsGetHorseDetails.getString("MONTH").trim()+"M";
            else
                age_Months="";
            
            if(crsGetHorseDetails.getString("DAYS")!=null)                     
                age_Days= crsGetHorseDetails.getString("DAYS").trim()+"D";
            else
                age_Days="";
            
            age_MD=age_Months+' '+age_Days;
                
            if(crsGetHorseDetails.getString("HORSE_DEATHDATE")!=null)                  
                strhor_deathdate= crsGetHorseDetails.getString("HORSE_DEATHDATE").trim();
            else
                strhor_deathdate="";    
                       
            if(crsGetHorseDetails.getString("HORSE_COLOR")!=null)                  
                strreg_colorSeq= crsGetHorseDetails.getString("HORSE_COLOR").trim();		
			else
                strreg_colorSeq="";
            
			if(crsGetHorseDetails.getString("HORSE_COLOR_VAL")!=null)                  
                strhor_color= crsGetHorseDetails.getString("HORSE_COLOR_VAL").trim();               
			else
                strhor_color="";
                        
            if(crsGetHorseDetails.getString("HORSE_AIRE")!=null)                  
                strhor_aireSeq= crsGetHorseDetails.getString("HORSE_AIRE").trim();
            else
                strhor_aireSeq="";

            if(crsGetHorseDetails.getString("HORSE_MODALITY_VAL")!=null)                  
                strhor_aire= crsGetHorseDetails.getString("HORSE_MODALITY_VAL").trim();
            else
                strhor_aire="";
            
            if(crsGetHorseDetails.getString("HORSE_ORG_VAL")!=null)                  
                strorg= crsGetHorseDetails.getString("HORSE_ORG_VAL").trim();
            else
                strorg="";
			
            if(crsGetHorseDetails.getString("ORGANISATION")!=null)                  
                strorgSeq= crsGetHorseDetails.getString("ORGANISATION").trim();
            else
                strorgSeq="";
            
            if(crsGetHorseDetails.getString("MICROCHIP_NUM")!=null)                  
                strmicro_num= crsGetHorseDetails.getString("MICROCHIP_NUM").trim();
            else
                strmicro_num="";
            
            if(crsGetHorseDetails.getString("ENTITYSEQ")!=null)                  
                strEntitySeq= crsGetHorseDetails.getString("ENTITYSEQ").trim();
            else
                strEntitySeq="";
            
            if(crsGetHorseDetails.getString("CASODNA_NUM")!=null)                  
                strcaso_num= crsGetHorseDetails.getString("CASODNA_NUM").trim();
             else
                strcaso_num="";
            
            if(crsGetHorseDetails.getString("HORSE_BREEDER_VAL")!=null)                  
                strhor_breeder= crsGetHorseDetails.getString("HORSE_BREEDER_VAL").trim();
            else
                strhor_breeder="";
			
            if(crsGetHorseDetails.getString("HORSE_BREEDER")!=null)                  
                strhor_breederSeq= crsGetHorseDetails.getString("HORSE_BREEDER").trim();
            else
                strhor_breederSeq=""; 
            
            if(crsGetHorseDetails.getString("Año")!=null)                  
                strAño= crsGetHorseDetails.getString("Año").trim();
            else
                strAño="";
 
            if(crsGetHorseDetails.getString("EMB_TRANSFER")!=null)                  
                strEmb_Transfer= crsGetHorseDetails.getString("EMB_TRANSFER").trim();
            else
                strEmb_Transfer="";
            
            if(crsGetHorseDetails.getString("OWNER_TYPE")!=null)                  
                strOwn_Type= crsGetHorseDetails.getString("OWNER_TYPE").trim();
            else
                strOwn_Type="";

            if(crsGetHorseDetails.getString("ORGANIZATION_NAME")!=null)                  
                strOrg_Name= crsGetHorseDetails.getString("ORGANIZATION_NAME").trim();
             else
                strOrg_Name="";

            if(crsGetHorseDetails.getString("MEMBER_NUM")!=null)                  
                strmem_num= crsGetHorseDetails.getString("MEMBER_NUM").trim();
            else
                strmem_num="";   
            
            if(crsGetHorseDetails.getString("FIRSTNAME")!=null)                  
                strmem_name= crsGetHorseDetails.getString("FIRSTNAME").trim();
            else
                strmem_name="";
            
            if(crsGetHorseDetails.getString("LASTNAME")!=null)                  
                strmem_lname= crsGetHorseDetails.getString("LASTNAME").trim();
            else
                strmem_lname="";            
            
            if(crsGetHorseDetails.getString("ADDRESS1")!=null)                  
                strmem_add1= crsGetHorseDetails.getString("ADDRESS1").trim();
             else
                strmem_add1=""; 
            
            if(crsGetHorseDetails.getString("ADDRESS2")!=null)                  
                strmem_add2= crsGetHorseDetails.getString("ADDRESS2").trim();
             else
                strmem_add2="";
            
            if(crsGetHorseDetails.getString("CITY")!=null)                  
                strmem_city= crsGetHorseDetails.getString("CITY").trim();
            else
                strmem_city="";
            
            if(crsGetHorseDetails.getString("STATE")!=null)                  
                strmem_state= crsGetHorseDetails.getString("STATE").trim();
            else
                strmem_state=""; 
            
            if(crsGetHorseDetails.getString("ZIP")!=null)                  
                strmem_zip= crsGetHorseDetails.getString("ZIP").trim();
            else
                strmem_zip="";
            
            if(crsGetHorseDetails.getString("COUNTRY")!=null)                  
                strmem_country= crsGetHorseDetails.getString("COUNTRY").trim();
            else
                strmem_country="";
            
            if(crsGetHorseDetails.getString("PHONE")!=null)                  
                strmem_phone= crsGetHorseDetails.getString("PHONE").trim();
            else
                strmem_phone="";
            
            if(crsGetHorseDetails.getString("EMAIL")!=null)                  
                strmem_email= crsGetHorseDetails.getString("EMAIL").trim();
            else
                strmem_email="";

            if(crsGetHorseDetails.getString("ENTITYSEQ")!=null)                  
                strEntitySeq= crsGetHorseDetails.getString("ENTITYSEQ").trim();
            else
                strEntitySeq="";

            if(crsGetHorseDetails.getString("START_DATE")!=null)                  
                strEffectivedate= crsGetHorseDetails.getString("START_DATE").trim();
            else
                strEffectivedate="";

            if(crsGetHorseDetails.getString("SUFFIX")!=null)                  
                strmem_mname= crsGetHorseDetails.getString("SUFFIX").trim();
            else
                strmem_mname=""; 

            if(crsGetHorseDetails.getString("SIRE")!=null)                  
                strSire= crsGetHorseDetails.getString("SIRE").trim();
            else
                strSire="";

            if(crsGetHorseDetails.getString("DAM")!=null)                  
                strDam= crsGetHorseDetails.getString("DAM").trim();
            else
                strDam=""; 

            if(crsGetHorseDetails.getString("COUN")!=null)                  
                strCOUN = Integer.parseInt(crsGetHorseDetails.getString("COUN").trim());
            else
                strCOUN=0;
           
            if(crsGetHorseDetails.getString("ASSIGNEDNUM")!=null)                  
                strOwnerNo= crsGetHorseDetails.getString("ASSIGNEDNUM").trim();
            else
                strOwnerNo="";
            
            strOwnerName=strmem_name+" "+strmem_lname;

            }          
          
          } 
            catch (Exception e) {
            System.err.println("Got an exception! ");
            System.err.println("++frmpassoinclude mode5+++"+e);
        } 
}
        
 
%>
        
   
 
 