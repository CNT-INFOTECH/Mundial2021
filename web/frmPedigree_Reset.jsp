<%

if(session.getAttribute("Regno_str")!=null)
    {
    session.removeAttribute("Regno_str");
}
if(session.getAttribute("STRHORSENAME")!=null)
    {
    session.removeAttribute("STRHORSENAME");
}
if(session.getAttribute("STRHORSEDOB")!=null)
    {
    session.removeAttribute("STRHORSEDOB");
}
if(session.getAttribute("STRHORSECOLOR")!=null)
    {
    session.removeAttribute("STRHORSECOLOR");
}
    session.removeAttribute("ses_strSire");
    session.removeAttribute("ses_strDam");
    session.removeAttribute("ses_REG_STATUS");
    
    session.removeAttribute("ses_REGSEQ");    
    session.removeAttribute("Regno_str");
    session.removeAttribute("ses_REGISTRY_TYPE");
    session.removeAttribute("ses_REGISTRATION_TYPE");
    session.removeAttribute("ses_DNA");
    session.removeAttribute("ses_INF_EMP");
    session.removeAttribute("ses_Año");
    session.removeAttribute("STRDATE");
    session.removeAttribute("ses_REGISTRY_PLACE");
    session.removeAttribute("ses_REGISTRY_USER");
    session.removeAttribute("STRHORSENAME");
    session.removeAttribute("ses_HORSE_GENDER");
    session.removeAttribute("ses_HORSE_GELDING_DATE");
    session.removeAttribute("ses_HORSE_AGE");
    session.removeAttribute("STRHORSEDOB");
    session.removeAttribute("ses_HORSE_DEATHDATE");
    session.removeAttribute("STRHORSECOLOR");
    session.removeAttribute("ses_HORSE_AIRE");
    session.removeAttribute("ses_ORGANISATION");
	
    session.removeAttribute("ses_MICROCHIP_NUM");
    session.removeAttribute("ses_CASODNA_NUM");
    session.removeAttribute("ses_EMB_TRANSFER");
    session.removeAttribute("ses_HORSE_BREEDER");
    
	session.removeAttribute("STRHORSECOLORSEQ");
    session.removeAttribute("ses_HORSE_BREEDERSEQ");	
	session.removeAttribute("ses_ORGANISATIONSEQ");

    session.removeAttribute("ses_ENTITYSEQ");
    session.removeAttribute("ses_MEMBER_NUM");
    session.removeAttribute("ses_FIRSTNAME");
    session.removeAttribute("ses_LASTNAME");
    session.removeAttribute("ses_MIDDLENAME");
    session.removeAttribute("ses_ADDRESS1");
    session.removeAttribute("ses_ADDRESS2");
    session.removeAttribute("ses_CITY");
    session.removeAttribute("ses_STATE");
    session.removeAttribute("ses_ZIP");
    session.removeAttribute("ses_COUNTRY");
    session.removeAttribute("ses_PHONE");
    session.removeAttribute("ses_EMAIL");
    session.removeAttribute("ses_EFFECTIVEDATE");
    session.removeAttribute("ses_OWNERNAME");
    session.removeAttribute("ses_OWNER_TYPE");
    session.removeAttribute("ses_ORGANISATION_NAME");
    session.removeAttribute("ses_strHead");
    session.removeAttribute("ses_chkHead_type");
    session.removeAttribute("ses_strLeftFleg");
    session.removeAttribute("ses_chkLeftFleg_Type");
    session.removeAttribute("ses_strRightFleg");
    session.removeAttribute("ses_chkRightFleg_Type");
    session.removeAttribute("ses_strLeftHleg");
    session.removeAttribute("ses_chkLeftHleg_Type");
    session.removeAttribute("ses_strRightHleg");
    session.removeAttribute("ses_chkRightHleg_Type");
    session.removeAttribute("ses_BODY");
    session.removeAttribute("ses_HAIR");
    session.removeAttribute("ses_TAIL");
    session.removeAttribute("ses_BRANDING");
    session.removeAttribute("ses_SCARS");
    session.removeAttribute("ses_OTHERS");
    session.removeAttribute("ses_strSire");
    session.removeAttribute("ses_strSire_Name");
    session.removeAttribute("ses_strDam");
    session.removeAttribute("ses_strDam_Name");
    session.removeAttribute("ses_COUN");
    session.removeAttribute("ses_OWNER_TYPE");


        String strSire="";
        String strDam="";
        String strSire_Name="";
        String strDam_Name="";
        
        String strSire_1="";
        String strDam_1="";
        String strSire_Name_1="";
        String strDam_Name_1="";

        String strSire_1_2="";
        String strDam_1_2="";
        String strSire_Name_1_2="";
        String strDam_Name_1_2="";            

        String strSire_2_1="";
        String strDam_2_1="";
        String strSire_Name_2_1="";
        String strDam_Name_2_1="";

        String strSire_2_2="";
        String strDam_2_2="";
        String strSire_Name_2_2="";
        String strDam_Name_2_2="";                        

        String strSire_2_3="";
        String strDam_2_3="";
        String strSire_Name_2_3="";
        String strDam_Name_2_3="";

        String strSire_2_4="";
        String strDam_2_4="";
        String strSire_Name_2_4="";
        String strDam_Name_2_4="";

String address = request.getContextPath()+"/frmPedigree.jsp";
response.sendRedirect(response.encodeRedirectURL(address));
%>