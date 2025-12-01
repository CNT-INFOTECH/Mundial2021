<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.DBConnection" %>
<%@ page import="pasotracker.GeneralServlet" %>  
<%
    
    String strRegistration_Type="";
    String strreg_placeSeq="";
    String strreg_colorSeq="";
    String strhor_breederSeq="";
    String strhor_aireSeq="";
    String strorgSeq="";   
    String strEntitySeq="";    
    String strOwnerName="";        
    String strreg_num="";
    String strreg_type="";    
    String strreg_place="";    
    String strhor_name="";
    String strhor_gender="";    
    String strhor_dob="";
    String strhor_age="";    
    String strhor_color="";
    String strhor_aire="";
    String strorg="";
    String strmicro_num="";    
    String strhor_breeder="";    
    String strmem_name="";
    String strmem_lname="";
    String strmem_mname="";
    String strOwnerNo="";
    
    String strSire_RegNum="";
    String strDam_RegNum="";
    String strSireName="";
    String strDamName="";
    String strSireSeq="";
    String strDamSeq="";
    String strMode="";
    String SaveYN="";
    String strHdnRegSeq="";
    String BreederNo="";
    String age_Months="";
    String age_Days="";
    
    if(request.getParameter("Mode")!=null)
    strMode=request.getParameter("Mode");
    
    if(request.getParameter("Gen")!=null)
        strhor_gender=request.getParameter("Gen");    
    
if(strMode.equals("1"))
{
     strRegistration_Type="";
     strreg_placeSeq="";
     strreg_colorSeq="";
     strhor_breederSeq="";
     strhor_aireSeq="";
     strorgSeq="";   
     strEntitySeq="";    
     strOwnerName="";        
     strreg_num="";
     strreg_type="";    
     strreg_place="";    
     strhor_name="";
     strhor_gender="";    
     strhor_dob="";
     strhor_age="";    
     strhor_color="";
     strhor_aire="";
     strorg="";
     strmicro_num="";    
     strhor_breeder="";    
     strmem_name="";
     strmem_lname="";
     strmem_mname="";
     BreederNo="";
     strOwnerNo="";
     strSire_RegNum="";
     strDam_RegNum=""; 
     age_Months="";
     age_Days="";
}
if(strMode.equals("2"))
{                      
    try
    {        
            SaveYN="Y"; // initially the var is set to N and updating to Y once saving to DB.
                    //This is used to identify whether page is saved or not.
            if(request.getParameter("RegSeq")!=null)
                strHdnRegSeq=request.getParameter("RegSeq"); 
            else
                strHdnRegSeq="";
            
            GeneralServlet gen=new GeneralServlet();  
             RowSetFactory factory27 = RowSetProvider.newFactory();
   CachedRowSet crsGetHorseDetails= factory27.createCachedRowSet();
         //   CachedRowSetImpl crsGetHorseDetails = new CachedRowSetImpl();            
            if(strHdnRegSeq!=null)
            crsGetHorseDetails = gen.GetHorseDetails(strHdnRegSeq,"","","","","","","");
                      
            while(crsGetHorseDetails.next())
            { 
                strHdnRegSeq="";
                strreg_num="";
                strhor_name="";
                strreg_placeSeq="";
                strreg_place="";
                strhor_gender="";
                strhor_dob="";
                strhor_age="";
                strreg_colorSeq="";
                strhor_color="";
                strhor_aire="";
                strorg="";
                strorgSeq="";
                strmicro_num="";
                strEntitySeq="";
                strOwnerNo="";
                strhor_breeder="";                
                strhor_breederSeq="";
                BreederNo="";
                strmem_name="";
                strmem_lname="";
                strmem_mname="";
                strSireSeq="";
                strDamSeq="";
                strSireName="";
                strDamName="";  
                strSire_RegNum="";
                strDam_RegNum="";                                             
                age_Months="";
                age_Days="";        
                
            if(crsGetHorseDetails.getString("REGSEQ")!=null)   
                strHdnRegSeq= crsGetHorseDetails.getString("REGSEQ").trim();
            
            if(crsGetHorseDetails.getString("REGISTRATION_NUM")!=null)   
                strreg_num= crsGetHorseDetails.getString("REGISTRATION_NUM").trim();                                                                                                    
            
            if(crsGetHorseDetails.getString("HORSE_PRIMARYNAME")!=null)                     
                strhor_name= crsGetHorseDetails.getString("HORSE_PRIMARYNAME").trim();
            
            if(crsGetHorseDetails.getString("REGISTRY_PLACE")!=null)                                    
                strreg_placeSeq= crsGetHorseDetails.getString("REGISTRY_PLACE").trim();                
            
            if(crsGetHorseDetails.getString("REGISTRY_PLACE_VAL")!=null)                     
                strreg_place= crsGetHorseDetails.getString("REGISTRY_PLACE_VAL").trim();                                 
                
            if(crsGetHorseDetails.getString("HORSE_GENDER")!=null)                  
               strhor_gender= crsGetHorseDetails.getString("HORSE_GENDER").trim();                
            
            if(crsGetHorseDetails.getString("HORSE_DOB")!=null)                  
                strhor_dob= crsGetHorseDetails.getString("HORSE_DOB").trim();
            /*    
            if(crsGetHorseDetails.getString("AGE")!=null)                     
                strhor_age= crsGetHorseDetails.getString("AGE").trim();                
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
            
            if(crsGetHorseDetails.getString("HORSE_COLOR")!=null)                  
                strreg_colorSeq= crsGetHorseDetails.getString("HORSE_COLOR").trim();                                                                             
                
            if(crsGetHorseDetails.getString("HORSE_COLOR_VAL")!=null)                  
                strhor_color= crsGetHorseDetails.getString("HORSE_COLOR_VAL").trim();                                                                 
                        
            if(crsGetHorseDetails.getString("HORSE_MODALITY_VAL")!=null)                  
                strhor_aire= crsGetHorseDetails.getString("HORSE_MODALITY_VAL").trim();                        
            
            if(crsGetHorseDetails.getString("HORSE_ORG_VAL")!=null)                  
                strorg= crsGetHorseDetails.getString("HORSE_ORG_VAL").trim();
                      
            if(crsGetHorseDetails.getString("ORGANISATION")!=null)                  
                strorgSeq= crsGetHorseDetails.getString("ORGANISATION").trim();
                        
            if(crsGetHorseDetails.getString("MICROCHIP_NUM")!=null)                                  
                strmicro_num= crsGetHorseDetails.getString("MICROCHIP_NUM").trim();
                        
            if(crsGetHorseDetails.getString("ENTITYSEQ")!=null)                  
                strEntitySeq= crsGetHorseDetails.getString("ENTITYSEQ").trim();
            
            if(crsGetHorseDetails.getString("ASSIGNEDNUM")!=null)                  
                strOwnerNo= crsGetHorseDetails.getString("ASSIGNEDNUM").trim();
            
            if(crsGetHorseDetails.getString("HORSE_BREEDER_VAL")!=null)                  
                strhor_breeder= crsGetHorseDetails.getString("HORSE_BREEDER_VAL").trim();
                
            if(crsGetHorseDetails.getString("HORSE_BREEDER")!=null)                  
                strhor_breederSeq= crsGetHorseDetails.getString("HORSE_BREEDER").trim();
            
            if(crsGetHorseDetails.getString("BREEDERNO")!=null)                  
                BreederNo= crsGetHorseDetails.getString("BREEDERNO").trim();
                                   
            if(crsGetHorseDetails.getString("FIRSTNAME")!=null)                  
                strmem_name= crsGetHorseDetails.getString("FIRSTNAME").trim();
               
            if(crsGetHorseDetails.getString("LASTNAME")!=null)                  
                strmem_lname= crsGetHorseDetails.getString("LASTNAME").trim();
               
            if(crsGetHorseDetails.getString("SUFFIX")!=null)                  
                strmem_mname= crsGetHorseDetails.getString("SUFFIX").trim();
               
            if(crsGetHorseDetails.getString("SIRE")!=null)                  
                strSireSeq= crsGetHorseDetails.getString("SIRE").trim();
            
            if(crsGetHorseDetails.getString("DAM")!=null)                  
                strDamSeq= crsGetHorseDetails.getString("DAM").trim();
            
            if(crsGetHorseDetails.getString("SIRENAME")!=null)                  
                strSireName= crsGetHorseDetails.getString("SIRENAME").trim();
            
            if(crsGetHorseDetails.getString("DAMNAME")!=null)                  
                strDamName= crsGetHorseDetails.getString("DAMNAME").trim();
                
            if(crsGetHorseDetails.getString("SIRE_REGNUM")!=null)                  
                strSire_RegNum= crsGetHorseDetails.getString("SIRE_REGNUM").trim();
            
            if(crsGetHorseDetails.getString("DAM_REGNUM")!=null)                  
                strDam_RegNum= crsGetHorseDetails.getString("DAM_REGNUM").trim();
    
            strOwnerName=strmem_name+" "+strmem_lname;
            
            }          
          
          } 
            catch (Exception e) {
            System.err.println("Got an exception! ");
            System.err.println("+++frmReg_Pedigree_NewReginclude+mod2+"+e);
        } 
        
    }
%>