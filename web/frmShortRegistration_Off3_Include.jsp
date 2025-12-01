<%--
    Document   : frmShortRegistration_Include
    Created on : Jun 38, 2011, 8:57:45 AM
    Author     : CNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "model.GetInterface" %>
<%@ page import = "java.util.*" %>

<%
         GetInterface GUI3=new GetInterface();
          HashMap MpHorseDetails3=new  HashMap();

        if(strRegNum3.trim().length() > 0)
        MpHorseDetails3 = GUI3.GET_SHORT_REGISTRATION_GROUP(strRegNum3.trim(),strEventSeq3);
        String strSht_RegSeq3="";  //1
        String strSht_HorseName3=""; //2
        String strSht_RegNum3="";  //3
        String strSht_Gender3="";  //4
        String strSht_POB3="";  //5
        String strSht_DOB3="";  //6
        String strSht_COLOR3="";  //7
        String strSht_HORSE_COLOR_VAL3="";
        String strREGISTRY_PLACE_VAL3="";
        String strSht_Modality3="";  //8
        String strSht_Chip3="";  //9
        String strSht_Asso3="";  //10

        String strSht_DamSeq3="";  //11
        String strDamReg_Num3="";  //11
        String strSht_DamName3="";  //13

        String strSht_SireSeq3="";  //13
        String strSireReg_Num3="";  //11
        String strSht_SireName3="";  //14

        String strSht_OwnerSeq3="";  //15
        String strSht_OwnerFName3="";  //16
        String strSht_OwnerMName3="";  //17
        String strSht_OwnerLName3="";  //18

        String strSht_BreederSeq3="";  //19
        String strSht_BreederAssigned3="";
        String strSht_BreederFName3=""; //30
        String strSht_BreederMName3=""; //21
        String strSht_BreederLName3=""; //22

        String strSht_RiderSeq3="";  //23
        String strSht_RiderAssinged3="";
        String strSht_RiderFName3="";  //34
        String strSht_RiderMName3="";  //35
        String strSht_RiderLName3="";  //36



         String strORGNAME3="";
         String strSht_Age3="";


        if(MpHorseDetails3.get("Seq")!=null )
           strSht_RegSeq3= MpHorseDetails3.get("Seq").toString();

         if(MpHorseDetails3.get("Name")!=null)
           strSht_HorseName3= MpHorseDetails3.get("Name").toString();

         if(MpHorseDetails3.get("Reg")!=null)
           strSht_RegNum3= MpHorseDetails3.get("Reg").toString();


         if(MpHorseDetails3.get("Gender")!=null && !MpHorseDetails3.get("Gender").equals("null"))
           strSht_Gender3= MpHorseDetails3.get("Gender").toString();

         if(MpHorseDetails3.get("POB")!=null)
           strSht_POB3= MpHorseDetails3.get("POB").toString();

        if(MpHorseDetails3.get("REGISTRY_PLACE_VAL")!=null)
           strREGISTRY_PLACE_VAL3= MpHorseDetails3.get("REGISTRY_PLACE_VAL").toString();

         if(MpHorseDetails3.get("ORGNAME")!=null)
           strORGNAME3= MpHorseDetails3.get("ORGNAME").toString();



         if(MpHorseDetails3.get("DOB")!=null)
           strSht_DOB3= MpHorseDetails3.get("DOB").toString();

           if(MpHorseDetails3.get("Age")!=null)
           strSht_Age3= MpHorseDetails3.get("Age").toString();



         if(MpHorseDetails3.get("Color")!=null)
           strSht_COLOR3= MpHorseDetails3.get("Color").toString();

          if(MpHorseDetails3.get("HORSE_COLOR_VAL")!=null)
           strSht_HORSE_COLOR_VAL3= MpHorseDetails3.get("HORSE_COLOR_VAL").toString();



         if(MpHorseDetails3.get("Aire")!=null)
           strSht_Modality3= MpHorseDetails3.get("Aire").toString();

         if(MpHorseDetails3.get("Chip")!=null)
           strSht_Chip3= MpHorseDetails3.get("Chip").toString();

  

         if(MpHorseDetails3.get("ORGANISATION")!=null)
           strSht_Asso3= MpHorseDetails3.get("ORGANISATION").toString();

         if(MpHorseDetails3.get("SIRE")!=null)
           strSht_SireSeq3= MpHorseDetails3.get("SIRE").toString();

          if(MpHorseDetails3.get("SireReg_Num")!=null)
           strSireReg_Num3= MpHorseDetails3.get("SireReg_Num").toString();

         if(MpHorseDetails3.get("SireName")!=null)
           strSht_SireName3= MpHorseDetails3.get("SireName").toString();

         if(MpHorseDetails3.get("Dam")!=null)
           strSht_DamSeq3= MpHorseDetails3.get("Dam").toString();

         if(MpHorseDetails3.get("DamReg_Num")!=null)
           strDamReg_Num3= MpHorseDetails3.get("DamReg_Num").toString();

         if(MpHorseDetails3.get("DamName")!=null)
           strSht_DamName3= MpHorseDetails3.get("DamName").toString();



         if(MpHorseDetails3.get("HORSE_BREEDER")!=null)
           strSht_BreederSeq3= MpHorseDetails3.get("HORSE_BREEDER").toString();

          if(MpHorseDetails3.get("BREEDER_ASSIGNEDNUM")!=null)
           strSht_BreederAssigned3= MpHorseDetails3.get("BREEDER_ASSIGNEDNUM").toString();


         if(MpHorseDetails3.get("BreederFName")!=null)
           strSht_BreederFName3= MpHorseDetails3.get("BreederFName").toString();

         if(MpHorseDetails3.get("BreederMName")!=null)
           strSht_BreederMName3= MpHorseDetails3.get("BreederMName").toString();

         if(MpHorseDetails3.get("BreederLName")!=null)
           strSht_BreederLName3= MpHorseDetails3.get("BreederLName").toString();




         if(MpHorseDetails3.get("OwnerSeq")!=null)
           strSht_OwnerSeq3= MpHorseDetails3.get("OwnerSeq").toString();

         if(MpHorseDetails3.get("OwnerFName")!=null)
           strSht_OwnerFName3= MpHorseDetails3.get("OwnerFName").toString();

         if(MpHorseDetails3.get("OwnerMName")!=null)
           strSht_OwnerMName3= MpHorseDetails3.get("OwnerMName").toString();

         if(MpHorseDetails3.get("OwnerLName")!=null)
           strSht_OwnerLName3= MpHorseDetails3.get("OwnerLName").toString();



         if(MpHorseDetails3.get("RiderSeq")!=null)
           strSht_RiderSeq3= MpHorseDetails3.get("RiderSeq").toString();

            if(MpHorseDetails3.get("Rider_AssignedNum")!=null)
           strSht_RiderAssinged3= MpHorseDetails3.get("Rider_AssignedNum").toString();



         if(MpHorseDetails3.get("RiderFName")!=null)
           strSht_RiderFName3= MpHorseDetails3.get("RiderFName").toString();

         if(MpHorseDetails3.get("RiderMName")!=null)
           strSht_RiderMName3= MpHorseDetails3.get("RiderMName").toString();

         if(MpHorseDetails3.get("RiderLName")!=null)
           strSht_RiderLName3= MpHorseDetails3.get("RiderLName").toString();

// Payment Info



%>