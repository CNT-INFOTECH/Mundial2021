<%--
    Document   : frmShortRegistration_Include
    Created on : Jun 28, 2011, 8:57:45 AM
    Author     : CNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "model.GetInterface" %>
<%@ page import = "java.util.*" %>

<%


         GetInterface GUI2=new GetInterface();
          HashMap MpHorseDetails2=new  HashMap();

        if(strRegNum2.trim().length() > 0)
        MpHorseDetails2 = GUI2.GET_SHORT_REGISTRATION_GROUP(strRegNum2.trim(),strEventSeq2);
        String strSht_RegSeq2="";  //1
        String strSht_HorseName2=""; //2
        String strSht_RegNum2="";  //3
        String strSht_Gender2="";  //4
        String strSht_POB2="";  //5
        String strSht_DOB2="";  //6
        String strSht_COLOR2="";  //7
        String strSht_HORSE_COLOR_VAL2="";
        String strREGISTRY_PLACE_VAL2="";
        String strSht_Modality2="";  //8
        String strSht_Chip2="";  //9
        String strSht_Asso2="";  //10

        String strSht_DamSeq2="";  //11
        String strDamReg_Num2="";
        String strSht_DamName2="";  //12

        String strSht_SireSeq2="";  //13
        String strSireReg_Num2="";
        String strSht_SireName2="";  //14

        String strSht_OwnerSeq2="";  //15
        String strSht_OwnerFName2="";  //16
        String strSht_OwnerMName2="";  //17
        String strSht_OwnerLName2="";  //18

        String strSht_BreederSeq2="";  //19
        String strSht_BreederAssignedNum2="";
        String strSht_BreederFName2=""; //20
        String strSht_BreederMName2=""; //21
        String strSht_BreederLName2=""; //22

        String strSht_RiderSeq2="";  //23
        String strSht_RiderAssignedNum2="";
        String strSht_RiderFName2="";  //24
        String strSht_RiderMName2="";  //25
        String strSht_RiderLName2="";  //26



         String strORGNAME2="";
         String strSht_Age2="";

        String strSht_RegSeq_Off2="";  //1
        String strSht_HorseName_Off2=""; //2
        String strSht_RegNum_Off2="";  //3



        if(MpHorseDetails2.get("Seq")!=null )
           strSht_RegSeq2= MpHorseDetails2.get("Seq").toString();

         if(MpHorseDetails2.get("Name")!=null)
           strSht_HorseName2= MpHorseDetails2.get("Name").toString();

         if(MpHorseDetails2.get("Reg")!=null)
           strSht_RegNum2= MpHorseDetails2.get("Reg").toString();


         if(MpHorseDetails2.get("Gender")!=null && !MpHorseDetails2.get("Gender").equals("null"))
           strSht_Gender2= MpHorseDetails2.get("Gender").toString();

         if(MpHorseDetails2.get("POB")!=null)
           strSht_POB2= MpHorseDetails2.get("POB").toString();

        if(MpHorseDetails2.get("REGISTRY_PLACE_VAL")!=null)
           strREGISTRY_PLACE_VAL2= MpHorseDetails2.get("REGISTRY_PLACE_VAL").toString();

         if(MpHorseDetails2.get("ORGNAME")!=null)
           strORGNAME2= MpHorseDetails2.get("ORGNAME").toString();



         if(MpHorseDetails2.get("DOB")!=null)
           strSht_DOB2= MpHorseDetails2.get("DOB").toString();

           if(MpHorseDetails2.get("Age")!=null)
           strSht_Age2= MpHorseDetails2.get("Age").toString();



         if(MpHorseDetails2.get("Color")!=null)
           strSht_COLOR2= MpHorseDetails2.get("Color").toString();

          if(MpHorseDetails2.get("HORSE_COLOR_VAL")!=null)
           strSht_HORSE_COLOR_VAL2= MpHorseDetails2.get("HORSE_COLOR_VAL").toString();



         if(MpHorseDetails2.get("Aire")!=null)
           strSht_Modality2= MpHorseDetails2.get("Aire").toString();

         if(MpHorseDetails2.get("Chip")!=null)
           strSht_Chip2= MpHorseDetails2.get("Chip").toString();

         

         if(MpHorseDetails2.get("ORGANISATION")!=null)
           strSht_Asso2= MpHorseDetails2.get("ORGANISATION").toString();

         if(MpHorseDetails2.get("SIRE")!=null)
           strSht_SireSeq2= MpHorseDetails2.get("SIRE").toString();

          if(MpHorseDetails2.get("SireReg_Num")!=null)
           strSireReg_Num2= MpHorseDetails2.get("SireReg_Num").toString();

         if(MpHorseDetails2.get("SireName")!=null)
           strSht_SireName2= MpHorseDetails2.get("SireName").toString();

         if(MpHorseDetails2.get("Dam")!=null)
           strSht_DamSeq2= MpHorseDetails2.get("Dam").toString();

         if(MpHorseDetails2.get("DamReg_Num")!=null)
           strDamReg_Num2= MpHorseDetails2.get("DamReg_Num").toString();

         if(MpHorseDetails2.get("DamName")!=null)
           strSht_DamName2= MpHorseDetails2.get("DamName").toString();



         if(MpHorseDetails2.get("HORSE_BREEDER")!=null)
           strSht_BreederSeq2= MpHorseDetails2.get("HORSE_BREEDER").toString();

        if(MpHorseDetails2.get("BREEDER_ASSIGNEDNUM")!=null)
           strSht_BreederAssignedNum2= MpHorseDetails2.get("BREEDER_ASSIGNEDNUM").toString();


         if(MpHorseDetails2.get("BreederFName")!=null)
           strSht_BreederFName2= MpHorseDetails2.get("BreederFName").toString();

         if(MpHorseDetails2.get("BreederMName")!=null)
           strSht_BreederMName2= MpHorseDetails2.get("BreederMName").toString();

         if(MpHorseDetails2.get("BreederLName")!=null)
           strSht_BreederLName2= MpHorseDetails2.get("BreederLName").toString();




         if(MpHorseDetails2.get("OwnerSeq")!=null)
           strSht_OwnerSeq2= MpHorseDetails2.get("OwnerSeq").toString();

         if(MpHorseDetails2.get("OwnerFName")!=null)
           strSht_OwnerFName2= MpHorseDetails2.get("OwnerFName").toString();

         if(MpHorseDetails2.get("OwnerMName")!=null)
           strSht_OwnerMName2= MpHorseDetails2.get("OwnerMName").toString();

         if(MpHorseDetails2.get("OwnerLName")!=null)
           strSht_OwnerLName2= MpHorseDetails2.get("OwnerLName").toString();



         if(MpHorseDetails2.get("RiderSeq")!=null)
           strSht_RiderSeq2= MpHorseDetails2.get("RiderSeq").toString();

         if(MpHorseDetails2.get("Rider_AssignedNum")!=null)
           strSht_RiderAssignedNum2= MpHorseDetails2.get("Rider_AssignedNum").toString();


         if(MpHorseDetails2.get("RiderFName")!=null)
           strSht_RiderFName2= MpHorseDetails2.get("RiderFName").toString();

         if(MpHorseDetails2.get("RiderMName")!=null)
           strSht_RiderMName2= MpHorseDetails2.get("RiderMName").toString();

         if(MpHorseDetails2.get("RiderLName")!=null)
           strSht_RiderLName2= MpHorseDetails2.get("RiderLName").toString();


        if(MpHorseDetails2.get("OFF_REGSEQ")!=null)
           strSht_RegSeq_Off2= MpHorseDetails2.get("OFF_REGSEQ").toString();
          if(MpHorseDetails2.get("OFF_REGNUM")!=null)
           strSht_RegNum_Off2= MpHorseDetails2.get("OFF_REGNUM").toString();
         if(MpHorseDetails2.get("OFF_HNAME")!=null)
           strSht_HorseName_Off2= MpHorseDetails2.get("OFF_HNAME").toString();

         

%>