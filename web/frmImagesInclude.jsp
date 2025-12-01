<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.DBConnection" %>
<%@ page import="pasotracker.GeneralServlet" %>     

<%    
    String Regno="";
    String strHorse_Name ="";
    String strHorse_Color="";
    String strHorse_DOB="";    
    String strRegistration_Type="";    
    String strreg_colorSeq="";    
    
    String strTxtHead="";
    String strChkHead="";
    
    String strTxtLeftForeLeg="";
    String strTxtRightForeLeg="";
    String strChkLeftForeLeg="";
    String strChkRightForeLeg="";
    
    String strTxtLeftHindLeg="";
    String strTxtRightHindLeg="";
    String strChkLeftHindLeg="";
    String strChkRightHindLeg="";

    String strBody="";
    String strTail="";
    String strHair="";
    String strBranding="";
    String strScars="";
    String strOthers="";

    String strreg_type="";
    String strdna="";
    String strinf_emp="";
    String strdate="";
    String strreg_place="";
    String strreg_user="";
    
    String strhor_gender="";
    String strhor_gelding_date="";
    
    String strhor_age="";
    String strhor_deathdate="";
    
    String strhor_aire="";
    String strorg="";
    String strmicro_num="";
    String strcaso_num="";
    String strhor_breeder="";
    String strmem_num="";
    String strmem_name="";
    String strmem_lname="";
    String strmem_add1="";
    String strmem_add2="";
    String strmem_city="";
    String strmem_state="";
    String strmem_zip="";
    String strmem_country="";
    String strmem_phone="";
    String strmem_email="";
    String strAño="";
    
    String strOwn_Type="";
    String strOrg_Name="";
        
    String strHdnSeqNo_Mem="";
    String strEmb_Transfer="";
    String strObservations="";

    String strhor_color_Value="";
    
    String strEffectivedate="";
    String strEntitySeq="";
    String strmem_mname="";   
    String strOwnerName="";
    int strCOUN=0;
    String strOwnerNo="";
    
    String strSire="";
    String strDam="";
    String strReg_Status="";
    String strhor_breederSeq="";
    String strorgSeq="";
    String strhor_aireSeq="";
    
    String age_Months="";
    String age_Days="";
       
    GeneralServlet gen=new GeneralServlet();
    RowSetFactory factory27 = RowSetProvider.newFactory();
   CachedRowSet crsGetHorseDetails= factory27.createCachedRowSet();
    //CachedRowSetImpl crsGetHorseDetails = new CachedRowSetImpl();        
   
    try
	{					                
            if(REGSEQ.length()>0 && REGSEQ!=null)
            crsGetHorseDetails = gen.GetHorseDetails(REGSEQ,"","","","","","","");
                                  
            while(crsGetHorseDetails.next())
            { 
            strOwnerName="";
            REGSEQ="";
            Regno="";
            strreg_type="";
            strdna="";
            strinf_emp="";
            strdate="";
            strreg_place="";            
            strreg_user="";
            strHorse_Name="";
            strhor_gender="";
            strhor_gelding_date="";
            strHorse_DOB="";
            strhor_age="";
            strhor_deathdate="";
            strHorse_Color="";
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
            age_Months="";
            age_Days="";
            
            if(crsGetHorseDetails.getString("REGSEQ")!=null)   
            {                              
                REGSEQ= crsGetHorseDetails.getString("REGSEQ").trim();
                session.setAttribute("ses_REGSEQ",REGSEQ);                 
            }
            else
                REGSEQ="";
            
            if(crsGetHorseDetails.getString("REGISTRATION_NUM")!=null)               
                Regno= crsGetHorseDetails.getString("REGISTRATION_NUM").trim();                
            else
                Regno="";
            
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
                        
            if(crsGetHorseDetails.getString("REGISTRY_PLACE_VAL")!=null)                     
		strreg_place= crsGetHorseDetails.getString("REGISTRY_PLACE_VAL").trim();
            else
                strreg_place="";                
            
            if(crsGetHorseDetails.getString("REGISTRY_USER")!=null)                     
                strreg_user= crsGetHorseDetails.getString("REGISTRY_USER").trim();
            else
                strreg_user="";

            if(crsGetHorseDetails.getString("HORSE_PRIMARYNAME")!=null)                     
                strHorse_Name= crsGetHorseDetails.getString("HORSE_PRIMARYNAME").trim();
			else
                strHorse_Name="";                
                
            if(crsGetHorseDetails.getString("HORSE_GENDER")!=null)                  
                strhor_gender= crsGetHorseDetails.getString("HORSE_GENDER").trim();
            else
                strhor_gender="";
            
            if(crsGetHorseDetails.getString("HORSE_GELDING_DATE")!=null)                  
                strhor_gelding_date= crsGetHorseDetails.getString("HORSE_GELDING_DATE").trim();
            else
                strhor_gelding_date="";


            if(crsGetHorseDetails.getString("HORSE_DOB")!=null)                  
                strHorse_DOB= crsGetHorseDetails.getString("HORSE_DOB").trim();
            else
                strHorse_DOB="";  
                
            /*if(crsGetHorseDetails.getString("AGE")!=null)                     
                strhor_age= crsGetHorseDetails.getString("AGE").trim()+" Months";
            else
                strhor_age=""; 
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
                strhor_deathdate= crsGetHorseDetails.getString("HORSE_DEATHDATE").trim();
            else
                strhor_deathdate="";    
                       
            if(crsGetHorseDetails.getString("HORSE_COLOR")!=null)                  
                strreg_colorSeq= crsGetHorseDetails.getString("HORSE_COLOR").trim();		
	    else
                strreg_colorSeq="";
            
            if(crsGetHorseDetails.getString("HORSE_COLOR_VAL")!=null)                  
                strHorse_Color= crsGetHorseDetails.getString("HORSE_COLOR_VAL").trim();               
            else
                strHorse_Color="";
                        
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
            System.err.println("+++frmimageinclude.jsp++"+e);
        } 
%>
 