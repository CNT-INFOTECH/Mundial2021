<%-- 
    Document   : close
    Created on : Apr 21, 2011, 9:39:32 PM
    Author     : Erzath
	Modified By : Darshan
	Modified On : July 12, 2011, 4:49:41 PM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PASO TRACKER</title>
		
		<link href="Registration.css" rel="stylesheet" type="text/css" />
		 </head>
		<body>
		<br/>
		<br/>
		<br/>
		<br/>
		<p><span style="color:#4e738f; font:bold 14px Lucida Sans Unicode;">Thank you for using PasoTracker. Please click <a href="index.jsp">here</a> to go back.</span></p>
              <%
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
    session.removeAttribute("ses_HORSE_BREEDERSEQ");
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
    session.removeAttribute("ses_ORGANISATION_NAME");
              %>
    </body>
</html>
