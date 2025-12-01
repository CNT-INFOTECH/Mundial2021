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
         GetInterface GUI=new GetInterface();
          HashMap MpHorseDetails=new  HashMap();

        if(strRegNum.trim().length() > 0)
        MpHorseDetails = GUI.GET_SHORT_REGISTRATION_GROUP(strRegNum.trim(),strEventSeq);
        String strSht_RegSeq="";  //1
        String strSht_HorseName=""; //2
        String strSht_RegNum="";  //3
        String strSht_Gender="";  //4
        String strSht_POB="";  //5
        String strSht_DOB="";  //6
        String strSht_COLOR="";  //7
        String strSht_HORSE_COLOR_VAL="";
        String strREGISTRY_PLACE_VAL="";
        String strSht_Modality="";  //8
        String strSht_Chip="";  //9
        String strSht_Asso="";  //10

        String strSht_DamSeq="";  //11
        String strDamReg_Num="";
        String strSht_DamName="";  //12

        String strSht_SireSeq="";  //13
        String strSireReg_Num="";
        String strSht_SireName="";  //14

        String strSht_OwnerSeq="";  //15
        String strSht_OwnerAssignedNum="";  //15
        String strSht_OwnerFName="";  //16
        String strSht_OwnerMName="";  //17
        String strSht_OwnerLName="";  //18

        String strSht_BreederSeq="";  //19
        String strSht_BreederAssignedNum="";  //19
        String strSht_BreederFName=""; //20
        String strSht_BreederMName=""; //21
        String strSht_BreederLName=""; //22

        String strSht_RiderSeq="";  //23
        String strSht_RiderAssignedNum="";
        String strSht_RiderFName="";  //24
        String strSht_RiderMName="";  //25
        String strSht_RiderLName="";  //26

        String strTotalCharges="";
        String strCC="";
        String strATM="";
        String strCash="";
        String strCheck="";
        String strMO="";
        String strPaidAmt="";
        String strBalanceAmt="";

        String strRegType="";
        String strIsMember="";

         String strORGNAME="";
         String strSht_Age="";
         String strSht_GroupSeq="0";

        String strSht_RegSeq_Off="";  //1
        String strSht_HorseName_Off=""; //2
        String strSht_RegNum_Off="";  //3

         String strSht_RegSeq_Off_2="";  //1
        String strSht_HorseName_Off_2=""; //2
        String strSht_RegNum_Off_2="";  //3

         String strSht_RegSeq_Off_3="";  //1
        String strSht_HorseName_Off_3=""; //2
        String strSht_RegNum_Off_3="";  //3

         String strSht_RegSeq_Off_4="";  //1
        String strSht_HorseName_Off_4=""; //2
        String strSht_RegNum_Off_4="";  //3


        if(MpHorseDetails.get("Seq")!=null )
           strSht_RegSeq= MpHorseDetails.get("Seq").toString();

         if(MpHorseDetails.get("Group_Seq")!=null )
           strSht_GroupSeq= MpHorseDetails.get("Group_Seq").toString();


         if(MpHorseDetails.get("Name")!=null)
           strSht_HorseName= MpHorseDetails.get("Name").toString();

         if(MpHorseDetails.get("Reg")!=null)
           strSht_RegNum= MpHorseDetails.get("Reg").toString();


         if(MpHorseDetails.get("Gender")!=null && !MpHorseDetails.get("Gender").equals("null"))
           strSht_Gender= MpHorseDetails.get("Gender").toString();

         if(MpHorseDetails.get("POB")!=null)
           strSht_POB= MpHorseDetails.get("POB").toString();

        if(MpHorseDetails.get("REGISTRY_PLACE_VAL")!=null)
           strREGISTRY_PLACE_VAL= MpHorseDetails.get("REGISTRY_PLACE_VAL").toString();

         if(MpHorseDetails.get("ORGNAME")!=null)
           strORGNAME= MpHorseDetails.get("ORGNAME").toString();



         if(MpHorseDetails.get("DOB")!=null)
           strSht_DOB= MpHorseDetails.get("DOB").toString();

           if(MpHorseDetails.get("Age")!=null)
           strSht_Age= MpHorseDetails.get("Age").toString();



         if(MpHorseDetails.get("Color")!=null)
           strSht_COLOR= MpHorseDetails.get("Color").toString();

          if(MpHorseDetails.get("HORSE_COLOR_VAL")!=null)
           strSht_HORSE_COLOR_VAL= MpHorseDetails.get("HORSE_COLOR_VAL").toString();



         if(MpHorseDetails.get("Aire")!=null)
           strSht_Modality= MpHorseDetails.get("Aire").toString();

         if(MpHorseDetails.get("Chip")!=null)
           strSht_Chip= MpHorseDetails.get("Chip").toString();

         if(MpHorseDetails.get("ORGANISATION")!=null)
           strSht_Asso= MpHorseDetails.get("ORGANISATION").toString();

         if(MpHorseDetails.get("SIRE")!=null)
           strSht_SireSeq= MpHorseDetails.get("SIRE").toString();

          if(MpHorseDetails.get("SireReg_Num")!=null)
           strSireReg_Num= MpHorseDetails.get("SireReg_Num").toString();

         if(MpHorseDetails.get("SireName")!=null)
           strSht_SireName= MpHorseDetails.get("SireName").toString();

         if(MpHorseDetails.get("Dam")!=null)
           strSht_DamSeq= MpHorseDetails.get("Dam").toString();

          if(MpHorseDetails.get("DamReg_Num")!=null)
           strDamReg_Num= MpHorseDetails.get("DamReg_Num").toString();

         if(MpHorseDetails.get("DamName")!=null)
           strSht_DamName= MpHorseDetails.get("DamName").toString();



         if(MpHorseDetails.get("HORSE_BREEDER")!=null)
           strSht_BreederSeq= MpHorseDetails.get("HORSE_BREEDER").toString();

          if(MpHorseDetails.get("BREEDER_ASSIGNEDNUM")!=null)
           strSht_BreederAssignedNum= MpHorseDetails.get("BREEDER_ASSIGNEDNUM").toString();

         if(MpHorseDetails.get("BreederFName")!=null)
           strSht_BreederFName= MpHorseDetails.get("BreederFName").toString();

         if(MpHorseDetails.get("BreederMName")!=null)
           strSht_BreederMName= MpHorseDetails.get("BreederMName").toString();

         if(MpHorseDetails.get("BreederLName")!=null)
           strSht_BreederLName= MpHorseDetails.get("BreederLName").toString();




         if(MpHorseDetails.get("OwnerSeq")!=null)
           strSht_OwnerSeq= MpHorseDetails.get("OwnerSeq").toString();

         if(MpHorseDetails.get("OwnerFName")!=null)
           strSht_OwnerFName= MpHorseDetails.get("OwnerFName").toString();

         if(MpHorseDetails.get("OwnerMName")!=null)
           strSht_OwnerMName= MpHorseDetails.get("OwnerMName").toString();

         if(MpHorseDetails.get("OwnerLName")!=null)
           strSht_OwnerLName= MpHorseDetails.get("OwnerLName").toString();



         if(MpHorseDetails.get("RiderSeq")!=null)
           strSht_RiderSeq= MpHorseDetails.get("RiderSeq").toString();

           if(MpHorseDetails.get("Rider_AssignedNum")!=null)
           strSht_RiderAssignedNum= MpHorseDetails.get("Rider_AssignedNum").toString();

         if(MpHorseDetails.get("BreederFName")!=null)
           strSht_BreederFName= MpHorseDetails.get("BreederFName").toString();


         if(MpHorseDetails.get("RiderFName")!=null)
           strSht_RiderFName= MpHorseDetails.get("RiderFName").toString();

         if(MpHorseDetails.get("RiderMName")!=null)
           strSht_RiderMName= MpHorseDetails.get("RiderMName").toString();

         if(MpHorseDetails.get("RiderLName")!=null)
           strSht_RiderLName= MpHorseDetails.get("RiderLName").toString();

  

        if(MpHorseDetails.get("OFF_REGSEQ")!=null)
            strSht_RegSeq_Off= MpHorseDetails.get("OFF_REGSEQ").toString();
        if(MpHorseDetails.get("OFF_REGNUM")!=null)
            strSht_RegNum_Off= MpHorseDetails.get("OFF_REGNUM").toString();
        if(MpHorseDetails.get("OFF_HNAME")!=null)
            strSht_HorseName_Off= MpHorseDetails.get("OFF_HNAME").toString();

         if(MpHorseDetails.get("OFF_REGSEQ_2")!=null)
            strSht_RegSeq_Off_2= MpHorseDetails.get("OFF_REGSEQ_2").toString();
        if(MpHorseDetails.get("OFF_REGNUM_2")!=null)
            strSht_RegNum_Off_2= MpHorseDetails.get("OFF_REGNUM_2").toString();
        if(MpHorseDetails.get("OFF_HNAME_2")!=null)
            strSht_HorseName_Off_2= MpHorseDetails.get("OFF_HNAME_2").toString();

         if(MpHorseDetails.get("OFF_REGSEQ_3")!=null)
            strSht_RegSeq_Off_3= MpHorseDetails.get("OFF_REGSEQ_3").toString();
        if(MpHorseDetails.get("OFF_REGNUM_3")!=null)
            strSht_RegNum_Off_3= MpHorseDetails.get("OFF_REGNUM_3").toString();
        if(MpHorseDetails.get("OFF_HNAME_3")!=null)
            strSht_HorseName_Off_3= MpHorseDetails.get("OFF_HNAME_3").toString();

         if(MpHorseDetails.get("OFF_REGSEQ_4")!=null)
            strSht_RegSeq_Off_4= MpHorseDetails.get("OFF_REGSEQ_4").toString();
        if(MpHorseDetails.get("OFF_REGNUM_4")!=null)
            strSht_RegNum_Off_4= MpHorseDetails.get("OFF_REGNUM_4").toString();
        if(MpHorseDetails.get("OFF_HNAME_4")!=null)
            strSht_HorseName_Off_4= MpHorseDetails.get("OFF_HNAME_4").toString();




// Payment Info

         if(MpHorseDetails.get("TotalCharges")!=null)
           strTotalCharges= MpHorseDetails.get("TotalCharges").toString();

         if(MpHorseDetails.get("CC")!=null && !MpHorseDetails.get("CC").equals("0") )
           strCC= MpHorseDetails.get("CC").toString();

         if(MpHorseDetails.get("ATM")!=null && !MpHorseDetails.get("ATM").equals("0") )
           strATM= MpHorseDetails.get("ATM").toString();

         if(MpHorseDetails.get("Cash")!=null && !MpHorseDetails.get("Cash").equals("0"))
           strCash= MpHorseDetails.get("Cash").toString();

         if(MpHorseDetails.get("Check")!=null && !MpHorseDetails.get("Check").equals("0"))
           strCheck= MpHorseDetails.get("Check").toString();

         if(MpHorseDetails.get("MO")!=null && !MpHorseDetails.get("MO").equals("0"))
           strMO= MpHorseDetails.get("MO").toString();

         if(MpHorseDetails.get("PaidAmount")!=null && !MpHorseDetails.get("PaidAmount").equals("0"))
           strPaidAmt= MpHorseDetails.get("PaidAmount").toString();

         if(MpHorseDetails.get("Balance")!=null && !MpHorseDetails.get("Balance").equals("0"))
           strBalanceAmt= MpHorseDetails.get("Balance").toString();

        if(MpHorseDetails.get("RegistryType")!=null )
           strRegType= MpHorseDetails.get("RegistryType").toString();

        if(MpHorseDetails.get("IsMember")!=null )
            strIsMember= MpHorseDetails.get("IsMember").toString();




%>