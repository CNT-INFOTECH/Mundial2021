<%-- 
    Document   : frmYouthRider_Include
    Created on : Sep 20, 2011, 2:05:42 PM
    Author     : CNT
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.text.*" %>


<%@ page import =  "model.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>PASO TRACKER</title>
    </head>
    <body>
       <%
         

        String strEntitySeq="";
        if (request.getParameter("EntitySeq")!=null)
            strEntitySeq=request.getParameter("EntitySeq");

       Calendar cal = Calendar.getInstance();
         int day = cal.get(Calendar.DATE);
        int month = cal.get(Calendar.MONTH) + 1;
        int year = cal.get(Calendar.YEAR);
        String strCurrentDate=month+"/"+day+"/"+year;

        GetInterface GUI1=new GetInterface();
        ArrayList AlEventInfo1=GUI1.GET_EVENT_INFORMATION("",strEventSeq);
        String strEventOrder1=""+AlEventInfo1.get(1);
        String strEventDate1=""+AlEventInfo1.get(2);
        String strEventGender1=""+AlEventInfo1.get(5);
        String strEventName1=""+AlEventInfo1.get(6);
        String strShowName1=""+AlEventInfo1.get(8);

         DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
         java.util.Date today = df.parse(strCurrentDate);
         java.util.Date Dt_Event_Date = df.parse(strEventDate);
       

        String strAssignedNum="";
        

        String strFirstName="";
        String strLastName="";
        String strMidName="";

        String strDOB="";
        String strGender=strEventGender;

        String strAddress1="";
        String strAddress2="";

        String strCity="";
        String strState="";
        String strZip="";
        String strCountry="";

        String strPhone="";
        String strEmail="";

        String strAge="";
        
        String strGroupSeq_S="0";
        String strRegSeq="";
        String strRegistration_Num="";
        String strHorsePrimaryName="";

        String PaymentType="";

        if(today.before(Dt_Event_Date))
            PaymentType="Pre";
        else
            PaymentType="Spot";
        
        String MemberYN="";
        String Charges="";
        String CC="";
        String ATM="";
        String Cash="";
        String Cheque="";
        String MO="";
        String OtherModes="";
        String TotalPaid="";
        String Balance="";
        String strEvntAssignedNum="";
		String strSht_Country="";


        if(strEntitySeq.trim().length()>0)
                {
        try
        {

            localConnection=dbcmt.getConnection();
            localConnection.setAutoCommit(false);
            CallableStatement cst = localConnection.prepareCall("{call GET_SHOWS_OWNERDETAILS_EQUI_EVENT(?,?,?,?,?, ?,?,?,?,?)}");
            cst.setString(1,"");
            cst.setString(2,"");
            cst.setString(3,"");
            cst.setString(4,"");
            cst.setString(5,"");

            cst.setString(6,"");
            cst.setString(7,"");
            cst.setString(8,strEventSeq);
            cst.setString(9,strEntitySeq);
            cst.setInt(10,2);
           

        ResultSet rs1 = cst.executeQuery();
         while (rs1.next())
        {

          strAssignedNum=rs1.getString("AssignedNum");


         if (rs1.getString("FirstName")!=null)
			strFirstName= rs1.getString("FirstName");
		if (rs1.getString("LASTNAME")!=null)
		strLastName= rs1.getString("LASTNAME") ;

		if (rs1.getString("MidName")!=null)
		strMidName= rs1.getString("MidName") ;


      

         strAddress1=rs1.getString("Address1");
         strAddress2=rs1.getString("Address2");

         strCity=rs1.getString("City");
         strState=rs1.getString("State");
         strZip=rs1.getString("Zip");
         strCountry=rs1.getString("Country");

         strPhone=rs1.getString("Phone");
         strEmail=rs1.getString("Email");

          strDOB=rs1.getString("DOB");
          strAge=rs1.getString("Age");
           strGender=rs1.getString("Gender");

           strGroupSeq_S=rs1.getString("Group_Seq");
           strRegSeq=rs1.getString("REG_SEQ");
           strRegistration_Num=rs1.getString("Registration_Num");
           strHorsePrimaryName=rs1.getString("Horse_PrimaryName");

            if(rs1.getString("PaymentType")!=null && !rs1.getString("PaymentType").equals("0"))
                PaymentType=rs1.getString("PaymentType");

            if(rs1.getString("MemberYN")!=null && !rs1.getString("MemberYN").equals("0"))
            MemberYN=rs1.getString("MemberYN");

            if(rs1.getString("Charges")!=null && !rs1.getString("Charges").equals("0"))
            Charges=rs1.getString("Charges");

            if(rs1.getString("CC")!=null && !rs1.getString("CC").equals("0"))
            CC=rs1.getString("CC");

            if(rs1.getString("ATM")!=null && !rs1.getString("ATM").equals("0"))
            ATM=rs1.getString("ATM");

            if(rs1.getString("Cash")!=null && !rs1.getString("Cash").equals("0"))
            Cash=rs1.getString("Cash");

            if(rs1.getString("Cheque")!=null && !rs1.getString("Cheque").equals("0"))
            Cheque=rs1.getString("Cheque");

            if(rs1.getString("MO")!=null && !rs1.getString("MO").equals("0"))
            MO=rs1.getString("MO");

            if(rs1.getString("OtherModes")!=null && !rs1.getString("OtherModes").equals("0"))
            OtherModes=rs1.getString("OtherModes");

            if(rs1.getString("TotalPaid")!=null && !rs1.getString("TotalPaid").equals("0"))
             TotalPaid=rs1.getString("TotalPaid");

            if(rs1.getString("Balance")!=null && !rs1.getString("Balance").equals("0"))
             Balance=rs1.getString("Balance");

            if(rs1.getString("EvntAssignmentNum")!=null)
                strEvntAssignedNum=rs1.getString("EvntAssignmentNum");
			

            if(rs1.getString("Represent_Country")!=null)
                strSht_Country=rs1.getString("Represent_Country");



        }

                    rs1.close();
                    cst.close();

                   
                    dbcmt.releaseConnection(localConnection);
                    }

		
                catch(Exception ex)
		{
			ex.printStackTrace();
			try
				{
                                       System.out.println("release:" +ex);
					localConnection.rollback();
					dbcmt.releaseConnection(localConnection);
				}
                                catch(SQLException exc)
				{
					exc.printStackTrace();
				}

		}

        } // If block for EntitySeq.length() >0
        %>
    </body>
</html>
