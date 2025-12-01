<%@ page import = "java.util.Iterator"%>
<%@ page import = "java.util.List"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>
<%
        Connection localConnection=null;
        DbConnMngr dbcmt=new DbConnMngr();

        String strSht_RegSeq="";
        String strSht_HorseName=""; //2
        String strSht_RegNum="";  //3
        String strSht_Gender="";  //4
        String strSht_POB="";  //5
        String strSht_DOB="";  //6
        String strSht_Age="";
        String strSht_COLOR="";  //7
        String strSht_HORSE_COLOR_VAL="";
        String strREGISTRY_PLACE_VAL="";
        String strSht_Modality="";  //8
        String strSht_Chip="";  //9
        String strSht_Asso="";  //10
        String strORGNAME="";


        String strSht_DamSeq="";  //11
        String strSht_DamRegNum="";
        String strSht_DamName="";  //12

        String strSht_SireSeq="";  //13
        String strSht_SireRegNum="";  //13
        String strSht_SireName="";  //14

        String strSht_OwnerSeq="";  //15
        String strSht_OwnerFName="";  //16
        String strSht_OwnerSeq_AssignedNum="";  //17
      

        String strSht_BreederSeq="";  //19
        String strSht_BreederFName=""; //20
        String strSht_BreederSeq_AssignedNum=""; //21

   if(strRegNum.length() > 0)
       
  {
        try
        {
            localConnection=dbcmt.getConnection();
            localConnection.setAutoCommit(false);
            CallableStatement cst = localConnection.prepareCall("{call GET_PASODETAILS_SHOW_REG(?)}");
             cst.setString(1, strRegNum);

        ResultSet rs1 = cst.executeQuery();


        while (rs1.next())
        {
           if(rs1.getString("RegSeq")!=null )
                strSht_RegSeq=  rs1.getString("RegSeq");

            if(rs1.getString("REGISTRATION_NUM")!=null )
               strSht_RegNum =  rs1.getString("REGISTRATION_NUM");

            if(rs1.getString("HORSE_PRIMARYNAME")!=null )
                strSht_HorseName=  rs1.getString("HORSE_PRIMARYNAME");

            if(rs1.getString("HORSE_GENDER")!=null )
                strSht_Gender=  rs1.getString("HORSE_GENDER");

            if(rs1.getString("HORSE_DOB")!=null )
                strSht_DOB=  rs1.getString("HORSE_DOB");


            if(rs1.getString("AGE")!=null )
                strSht_Age=  rs1.getString("AGE");
            if(rs1.getString("REGISTRY_PLACE")!=null )
                strSht_POB=  rs1.getString("REGISTRY_PLACE");
            if(rs1.getString("HORSE_COLOR")!=null )
                strSht_COLOR=  rs1.getString("HORSE_COLOR");
           if(rs1.getString("COLOR_VAL")!=null )
                strSht_HORSE_COLOR_VAL=  rs1.getString("COLOR_VAL");

            if(rs1.getString("ORGANISATION")!=null )
                strSht_Asso=  rs1.getString("ORGANISATION");

            if(rs1.getString("ASSO_VALUE")!=null )
                strORGNAME=  rs1.getString("ASSO_VALUE");
           
            if(rs1.getString("MICROCHIP_NUM")!=null )
                strSht_Chip=  rs1.getString("MICROCHIP_NUM");

            if(rs1.getString("HORSE_AIRE")!=null )
                strSht_Modality=  rs1.getString("HORSE_AIRE");
            if(rs1.getString("SIRE")!=null )
                strSht_SireSeq=  rs1.getString("SIRE");
            if(rs1.getString("SIRENAME")!=null )
                strSht_SireName=  rs1.getString("SIRENAME");
            if(rs1.getString("SIREREG_NUM")!=null )
                strSht_SireRegNum=  rs1.getString("SIREREG_NUM");




            if(rs1.getString("DAM")!=null )
                strSht_DamSeq=  rs1.getString("DAM");
           if(rs1.getString("DAMREG_NUM")!=null )
                strSht_DamRegNum=  rs1.getString("DAMREG_NUM");

            if(rs1.getString("DAMNAME")!=null )
                strSht_DamName=  rs1.getString("DAMNAME");
            if(rs1.getString("EntitySeq")!=null )
                strSht_OwnerSeq=  rs1.getString("EntitySeq");
            if(rs1.getString("Owner_Name")!=null )
                strSht_OwnerFName=  rs1.getString("Owner_Name");
            if(rs1.getString("Owner_AssignedNum")!=null )
                strSht_OwnerSeq_AssignedNum=  rs1.getString("Owner_AssignedNum");

            if(rs1.getString("HORSE_BREEDER")!=null )
                strSht_BreederSeq=  rs1.getString("HORSE_BREEDER");
            if(rs1.getString("Breeder_Name")!=null )
                strSht_BreederFName=  rs1.getString("Breeder_Name");
           if(rs1.getString("Breeder_AssignedNum")!=null )
                strSht_BreederSeq_AssignedNum=  rs1.getString("Breeder_AssignedNum");


        }

                    rs1.close();
                    cst.close();

                    localConnection.commit();
                    dbcmt.releaseConnection(localConnection);

		}
                catch(Exception ex)
		{
			ex.printStackTrace();
			try
				{
                                       System.out.println("release:");
					localConnection.rollback();
					dbcmt.releaseConnection(localConnection);
				}
                                catch(SQLException exc)
				{
					exc.printStackTrace();
				}

		}

        }


%>