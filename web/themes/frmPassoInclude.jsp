<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.DBConnection" %>
<%@ page import="pasotracker.GeneralServlet" %>     

<%  
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
    //String strObservations="";

    String str_reggno="";
    String strMode="";
    
    if(session.getAttribute("ses_REGSEQ")!=null)
           strHdnRegSeq =(String) session.getAttribute("ses_REGSEQ");
else
    strHdnRegSeq="";
    
    if(session.getAttribute("Regno_str")!=null)
           strreg_num =(String) session.getAttribute("Regno_str");
else
    strreg_num="";
    if(session.getAttribute("ses_REGISTRY_TYPE")!=null)
           strreg_type =(String) session.getAttribute("ses_REGISTRY_TYPE");
else
    strreg_type="";
    if(session.getAttribute("ses_DNA")!=null)
           strdna =(String) session.getAttribute("ses_DNA");
else
    strdna="";
    if(session.getAttribute("ses_INF_EMP")!=null)
           strinf_emp =(String) session.getAttribute("ses_INF_EMP");
else
    strinf_emp="";
    if(session.getAttribute("STRDATE")!=null)
           strdate =(String) session.getAttribute("STRDATE");
else
    strdate="";
    if(session.getAttribute("ses_REGISTRY_PLACE")!=null)
           strreg_place =(String) session.getAttribute("ses_REGISTRY_PLACE");
else
    strreg_place="";
    if(session.getAttribute("ses_REGISTRY_USER")!=null)
           strreg_user =(String) session.getAttribute("ses_REGISTRY_USER");
else
    strreg_user="";   
if(session.getAttribute("STRHORSENAME")!=null)
           strhor_name =(String) session.getAttribute("STRHORSENAME");
else
    strhor_name="";
if(session.getAttribute("ses_HORSE_GENDER")!=null)
           strhor_gender =(String) session.getAttribute("ses_HORSE_GENDER");
else
    strhor_gender="";
if(session.getAttribute("ses_HORSE_GELDING_DATE")!=null)
           strhor_gelding_date=(String) session.getAttribute("ses_HORSE_GELDING_DATE");
else
    strhor_gelding_date="";
if(session.getAttribute("ses_HORSE_AGE")!=null)
           strhor_age=(String) session.getAttribute("ses_HORSE_AGE");
else
    strhor_age="";
if(session.getAttribute("STRHORSEDOB")!=null)
           strhor_dob=(String) session.getAttribute("STRHORSEDOB");
else
    strhor_dob="";          
if(session.getAttribute("ses_HORSE_DEATHDATE")!=null)
           strhor_deathdate=(String) session.getAttribute("ses_HORSE_DEATHDATE");
else
    strhor_deathdate="";                       
if(session.getAttribute("STRHORSECOLOR")!=null)
           strhor_color=(String) session.getAttribute("STRHORSECOLOR");
else
    strhor_color="";

    
    
    
if(session.getAttribute("ses_HORSE_AIRE")!=null)
           strhor_aire=(String) session.getAttribute("ses_HORSE_AIRE");
else
    strhor_aire="";
if(session.getAttribute("ses_ORGANISATION")!=null)
           strorg=(String) session.getAttribute("ses_ORGANISATION");
else
    strorg="";
if(session.getAttribute("ses_MICROCHIP_NUM")!=null)
           strmicro_num=(String) session.getAttribute("ses_MICROCHIP_NUM");
else
    strmicro_num="";
if(session.getAttribute("ses_CASODNA_NUM")!=null)
           strcaso_num=(String) session.getAttribute("ses_CASODNA_NUM");
else
    strcaso_num="";
if(session.getAttribute("ses_HORSE_BREEDER")!=null)
           strhor_breeder=(String) session.getAttribute("ses_HORSE_BREEDER");
else
    strhor_breeder="";         
if(session.getAttribute("ses_Año")!=null)
           strAño=(String) session.getAttribute("ses_Año");
else
    strAño="";
       
if(session.getAttribute("ses_EMB_TRANSFER")!=null)
           strEmb_Transfer=(String) session.getAttribute("ses_EMB_TRANSFER");
else
    strEmb_Transfer="";
    
/*if(session.getAttribute("ses_OBSERVATIONS")!=null)
           strObservations=(String) session.getAttribute("ses_OBSERVATIONS");
else
    strObservations="";
*/
if(session.getAttribute("ses_MEMBER_NUM")!=null)
         strmem_num=(String) session.getAttribute("ses_MEMBER_NUM");
else
    strmem_num="";
if(session.getAttribute("ses_FIRSTNAME")!=null)
           strmem_name=(String) session.getAttribute("ses_FIRSTNAME");
else
    strmem_name="";
if(session.getAttribute("ses_ADDRESS1")!=null)
           strmem_add1=(String) session.getAttribute("ses_ADDRESS1");
else
    strmem_add1="";
if(session.getAttribute("ses_ADDRESS2")!=null)
           strmem_add2=(String) session.getAttribute("ses_ADDRESS2");
else
    strmem_add2="";
if(session.getAttribute("ses_CITY")!=null)
           strmem_city=(String) session.getAttribute("ses_CITY");
else
    strmem_city="";
if(session.getAttribute("ses_STATE")!=null)
           strmem_state=(String) session.getAttribute("ses_STATE");
else
    strmem_state="";
if(session.getAttribute("ses_ZIP")!=null)
           strmem_zip=(String) session.getAttribute("ses_ZIP");
else
    strmem_zip="";
if(session.getAttribute("ses_COUNTRY")!=null)
           strmem_country=(String) session.getAttribute("ses_COUNTRY");
else
    strmem_country="";
if(session.getAttribute("ses_PHONE")!=null)
           strmem_phone=(String) session.getAttribute("ses_PHONE");
else
    strmem_phone="";
if(session.getAttribute("ses_EMAIL")!=null)
          strmem_email=(String) session.getAttribute("ses_EMAIL");    
else
    strmem_email="";
                                              
    
    
    if(request.getParameter("Mode")!=null)
    strMode=request.getParameter("Mode");
    
    /*if(strMode.equals("2"))
    {
        if(request.getParameter("RegSeq")!=null)
        {   //strreg_num=request.getParameter("RegNo");        
            strHdnRegSeq =request.getParameter("RegNo");
        }
    }
    else
    strHdnRegSeq =(String) session.getAttribute("ses_REGSEQ");
*/
if(strMode.equals("2"))
    {
    

    try
    {
            strHdnRegSeq=request.getParameter("RegSeq");
            String str_Reg_no = "";
            String strHor_PName = "";
            String strHor_DOB = "";
                       
            GeneralServlet gen=new GeneralServlet();
            
          //  CachedRowSetImpl crsGetHorseDetails = new CachedRowSetImpl();
             RowSetFactory factory2 = RowSetProvider.newFactory();
   CachedRowSet crsGetHorseDetails= factory2.createCachedRowSet();
            //strHdnRegSeq
            crsGetHorseDetails = gen.GetHorseDetails(strHdnRegSeq,str_Reg_no,strHor_PName,strHor_DOB,"","","","");
                      
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
            
            if(crsGetHorseDetails.getString("REGSEQ")!=null)   
            {                              
                strHdnRegSeq= crsGetHorseDetails.getString("REGSEQ").trim();
                session.setAttribute("ses_REGSEQ",strHdnRegSeq);                 
                }
            
            if(crsGetHorseDetails.getString("REGISTRATION_NUM")!=null)   
            {                              
                strreg_num= crsGetHorseDetails.getString("REGISTRATION_NUM").trim();
                session.setAttribute("Regno_str",strreg_num);                       
                }
            
            if(crsGetHorseDetails.getString("REGISTRY_TYPE")!=null)     
            {                            
                strreg_type= crsGetHorseDetails.getString("REGISTRY_TYPE").trim();
                session.setAttribute("ses_REGISTRY_TYPE",strreg_type);
                }
             
            if(crsGetHorseDetails.getString("DNA")!=null)                  
                {
                strdna= crsGetHorseDetails.getString("DNA").trim();
                session.setAttribute("ses_DNA",strdna);                
            }  

            if(crsGetHorseDetails.getString("INF_EMP")!=null)                     
                {
                strinf_emp= crsGetHorseDetails.getString("INF_EMP").trim();
                session.setAttribute("str_INF_EMP",strinf_emp);
            }  
                 

            if(crsGetHorseDetails.getString("REGISTRY_DATE")!=null)                  
                {
                strdate= crsGetHorseDetails.getString("REGISTRY_DATE").trim();
                session.setAttribute("STRDATE",strdate);
            }  
            
            if(crsGetHorseDetails.getString("REGISTRY_PLACE")!=null)                     
               {
                strreg_place= crsGetHorseDetails.getString("REGISTRY_PLACE").trim();
                session.setAttribute("ses_REGISTRY_PLACE",strreg_place);
            }
                
            
            if(crsGetHorseDetails.getString("REGISTRY_USER")!=null)                     
                {
                strreg_user= crsGetHorseDetails.getString("REGISTRY_USER").trim();
                 session.setAttribute("ses_REGISTRY_USER",strreg_user);
            }

            if(crsGetHorseDetails.getString("HORSE_PRIMARYNAME")!=null)                     
               {
                strhor_name= crsGetHorseDetails.getString("HORSE_PRIMARYNAME").trim();
                session.setAttribute("STRHORSENAME",strhor_name);
            } 
                
            if(crsGetHorseDetails.getString("HORSE_GENDER")!=null)                  
               {
                strhor_gender= crsGetHorseDetails.getString("HORSE_GENDER").trim();
                session.setAttribute("ses_HORSE_GENDER",strhor_gender);
            }
            
            if(crsGetHorseDetails.getString("HORSE_GELDING_DATE")!=null)                  
                {
                strhor_gelding_date= crsGetHorseDetails.getString("HORSE_GELDING_DATE").trim();
                session.setAttribute("ses_HORSE_GELDING_DATE",strhor_gelding_date);
            }


            if(crsGetHorseDetails.getString("HORSE_DOB")!=null)                  
                {
                strhor_dob= crsGetHorseDetails.getString("HORSE_DOB").trim();
                session.setAttribute("STRHORSEDOB",strhor_dob);
            }  
                
            if(crsGetHorseDetails.getString("AGE")!=null)                     
                {
                strhor_age= crsGetHorseDetails.getString("AGE").trim()+" Months";
                session.setAttribute("ses_HORSE_AGE",strhor_age);
            } 
                
            if(crsGetHorseDetails.getString("HORSE_DEATHDATE")!=null)                  
                {
                strhor_deathdate= crsGetHorseDetails.getString("HORSE_DEATHDATE").trim();
                session.setAttribute("ses_HORSE_DEATHDATE",strhor_deathdate);
            }
            
            if(crsGetHorseDetails.getString("HORSE_COLOR")!=null)                  
                {
                strhor_color= crsGetHorseDetails.getString("HORSE_COLOR").trim();
                session.setAttribute("STRHORSECOLOR",strhor_color);                
            }
            
            if(crsGetHorseDetails.getString("HORSE_AIRE")!=null)                  
                {                         
                strhor_aire= crsGetHorseDetails.getString("HORSE_AIRE").trim();
                session.setAttribute("ses_HORSE_AIRE",strhor_aire);
            }
            
            if(crsGetHorseDetails.getString("ORGANISATION")!=null)                  
                {
                strorg= crsGetHorseDetails.getString("ORGANISATION").trim();
                session.setAttribute("ses_ORGANISATION",strorg);
            }             
            
            if(crsGetHorseDetails.getString("MICROCHIP_NUM")!=null)                  
                {
                strmicro_num= crsGetHorseDetails.getString("MICROCHIP_NUM").trim();
                session.setAttribute("ses_MICROCHIP_NUM",strmicro_num);
            }
            
            if(crsGetHorseDetails.getString("CASODNA_NUM")!=null)                  
                {
                strcaso_num= crsGetHorseDetails.getString("CASODNA_NUM").trim();
                session.setAttribute("ses_CASODNA_NUM",strcaso_num);
            }
            
            if(crsGetHorseDetails.getString("HORSE_BREEDER")!=null)                  
                {
                strhor_breeder= crsGetHorseDetails.getString("HORSE_BREEDER").trim();
                session.setAttribute("ses_HORSE_BREEDER",strhor_breeder);
            } 
            
            if(crsGetHorseDetails.getString("Año")!=null)                  
                {
                strAño= crsGetHorseDetails.getString("Año").trim();
                session.setAttribute("ses_Año",strAño);
                
            }
 
            if(crsGetHorseDetails.getString("EMB_TRANSFER")!=null)                  
                {
                strEmb_Transfer= crsGetHorseDetails.getString("EMB_TRANSFER").trim();
                session.setAttribute("ses_EMB_TRANSFER",strEmb_Transfer);
            }
            
            /*if(crsGetHorseDetails.getString("OBSERVATIONS")!=null)                  
                {
                strObservations= crsGetHorseDetails.getString("OBSERVATIONS").trim();                
                session.setAttribute("ses_OBSERVATIONS",strObservations);  
            }*/
            
            if(crsGetHorseDetails.getString("MEMBER_NUM")!=null)                  
                {
                strmem_num= crsGetHorseDetails.getString("MEMBER_NUM").trim();
                session.setAttribute("ses_MEMBER_NUM",strmem_num);
            }   
            
            if(crsGetHorseDetails.getString("FIRSTNAME")!=null)                  
                {
                strmem_name= crsGetHorseDetails.getString("FIRSTNAME").trim();
                session.setAttribute("ses_FIRSTNAME",strmem_name);
            }
            
            if(crsGetHorseDetails.getString("ADDRESS1")!=null)                  
                {
                strmem_add1= crsGetHorseDetails.getString("ADDRESS1").trim();
                session.setAttribute("ses_ADDRESS1",strmem_add1);
            } 
            
            if(crsGetHorseDetails.getString("ADDRESS2")!=null)                  
                {
                strmem_add2= crsGetHorseDetails.getString("ADDRESS2").trim();
                session.setAttribute("ses_ADDRESS2",strmem_add2);
            }
            
            if(crsGetHorseDetails.getString("CITY")!=null)                  
                {
                strmem_city= crsGetHorseDetails.getString("CITY").trim();
                session.setAttribute("ses_CITY",strmem_city);
            }
            
            if(crsGetHorseDetails.getString("STATE")!=null)                  
                {
                strmem_state= crsGetHorseDetails.getString("STATE").trim();
                session.setAttribute("ses_STATE",strmem_state);
            } 
            
            if(crsGetHorseDetails.getString("ZIP")!=null)                  
                {
                strmem_zip= crsGetHorseDetails.getString("ZIP").trim();
                session.setAttribute("ses_ZIP",strmem_zip);
            }
            
            if(crsGetHorseDetails.getString("COUNTRY")!=null)                  
                {
                strmem_country= crsGetHorseDetails.getString("COUNTRY").trim();
                session.setAttribute("ses_COUNTRY",strmem_country);
            }
            
            if(crsGetHorseDetails.getString("PHONE")!=null)                  
                {
                strmem_phone= crsGetHorseDetails.getString("PHONE").trim();
                session.setAttribute("ses_PHONE",strmem_phone);
            }
            
            if(crsGetHorseDetails.getString("EMAIL")!=null)                  
                {
                strmem_email= crsGetHorseDetails.getString("EMAIL").trim();
                session.setAttribute("ses_EMAIL",strmem_email);
            }
            }          
          
          } 
            catch (Exception e) {
            System.err.println("Got an exception! ");
            System.err.println("+++++"+e);
        } 
       
}

%>
 