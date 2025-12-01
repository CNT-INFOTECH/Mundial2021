<%@ page import = "model.GetInterface" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>

<%
         GetInterface GUI=new GetInterface();
          HashMap MpHorseDetails=new  HashMap();

          Calendar cal = Calendar.getInstance();
         int day = cal.get(Calendar.DATE);
        int month = cal.get(Calendar.MONTH) + 1;
        int year = cal.get(Calendar.YEAR);
        String strCurrentDate=month+"/"+day+"/"+year;

         DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
         java.util.Date today =df.parse(strCurrentDate);
         java.util.Date Dt_Event_Date =df.parse(strEventDate);
        

        if(strRegNum.trim().length() > 0)

        MpHorseDetails = GUI.GET_SHORT_REGISTRATION(strRegNum.trim(),strEventSeq);
        String strSht_RegSeq="";  //1
        String strSht_HorseName=""; //2
        String strSht_RegNum="";  //3
        String strSht_Gender=strEventGender;  //4
        String strSht_POB="";  //5
        String strSht_DOB="";  //6
        String strSht_COLOR="";  //7
        String strSht_HORSE_COLOR_VAL="";
        String strREGISTRY_PLACE_VAL="";
        String strSht_Modality="";  //8
        String strSht_Chip="";  //9
        String strSht_Asso="";  //10

        String strSht_DamSeq="";  //11
        String strSht_DamName="";  //12
         String strSht_DamNum="";  //12

        String strSht_SireSeq="";  //13
        String strSht_SireName="";  //14
        String strSht_SireNum="";

        String strSht_OwnerSeq="";  //15
        String strSht_OwnerFName="";  //16
        String strSht_OwnerMName="";  //17
        String strSht_OwnerLName="";  //18

        String strSht_BreederSeq="";  //19
        String strSht_BreederFName=""; //20
        String strSht_BreederMName=""; //21
        String strSht_BreederLName=""; //22

        String strSht_RiderSeq="";  //23
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
        if(today.before(Dt_Event_Date))
            strRegType="Pre";
        else
            strRegType="Spot";
        
        String strIsMember="";

         String strORGNAME="";
         String strSht_Age="";
         String strSht_Group="0";
         String strSht_ShowPaid="N";

         String strEvent_AssignedNum="";

         String strSht_OwnerSeq_AssignedNum="";
         String strSht_BreederSeq_AssignedNum="";
         String strSht_RiderSeq_AssignedNum="";
         /*String strSht_Country="";
         if(MpHorseDetails.get("Country")!=null)
             strSht_Country= MpHorseDetails.get("Country").toString();*/

        if(MpHorseDetails.get("Seq")!=null )
           strSht_RegSeq= MpHorseDetails.get("Seq").toString();

         if(MpHorseDetails.get("Group_Seq")!=null )
           strSht_Group= MpHorseDetails.get("Group_Seq").toString();

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

         if(MpHorseDetails.get("SireName")!=null)
           strSht_SireName= MpHorseDetails.get("SireName").toString();

         if(MpHorseDetails.get("Dam")!=null)
           strSht_DamSeq= MpHorseDetails.get("Dam").toString();

         if(MpHorseDetails.get("DamName")!=null)
           strSht_DamName= MpHorseDetails.get("DamName").toString();



         if(MpHorseDetails.get("HORSE_BREEDER")!=null)
           strSht_BreederSeq= MpHorseDetails.get("HORSE_BREEDER").toString();

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

         if(MpHorseDetails.get("RiderFName")!=null)
           strSht_RiderFName= MpHorseDetails.get("RiderFName").toString();

         if(MpHorseDetails.get("RiderMName")!=null)
           strSht_RiderMName= MpHorseDetails.get("RiderMName").toString();

         if(MpHorseDetails.get("RiderLName")!=null)
           strSht_RiderLName= MpHorseDetails.get("RiderLName").toString();

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

          if(MpHorseDetails.get("Show_Paid")!=null )
            strSht_ShowPaid= MpHorseDetails.get("Show_Paid").toString();
        

         if(MpHorseDetails.get("Event_AssignedNum")!=null )
           strEvent_AssignedNum= MpHorseDetails.get("Event_AssignedNum").toString();


 


         if(MpHorseDetails.get("Rider_AssignedNum")!=null )
           strSht_RiderSeq_AssignedNum= MpHorseDetails.get("Rider_AssignedNum").toString();
         if(MpHorseDetails.get("Owner_AssignedNum")!=null )
           strSht_OwnerSeq_AssignedNum= MpHorseDetails.get("Owner_AssignedNum").toString();
         if(MpHorseDetails.get("Breeder_AssignedNum")!=null )
           strSht_BreederSeq_AssignedNum= MpHorseDetails.get("Breeder_AssignedNum").toString();

            if(MpHorseDetails.get("DamNum")!=null )
                strSht_DamNum=MpHorseDetails.get("DamNum").toString();

            if(MpHorseDetails.get("SireNum")!=null )
                strSht_SireNum=MpHorseDetails.get("SireNum").toString();


%>