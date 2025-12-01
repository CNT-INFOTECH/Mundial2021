<%@ page import = "java.util.Iterator"%>
<%@ page import = "java.util.List"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>
<%
        Connection localConnection=null;
        DbConnMngr dbcmt=new DbConnMngr();




        ArrayList ArEvent=new ArrayList();


    if(strGroupSeq.trim().length() > 0 && !strGroupSeq.equals("0") )
     {
        try
        {
            localConnection=dbcmt.getConnection();
            localConnection.setAutoCommit(false);

            CallableStatement cst = localConnection.prepareCall("{call [GET_PAYMENT_DETAILS_GROUP](?,?)}");
            cst.setString(1, strGroupSeq);
            cst.setString(2, strEventSeqMain);




        ResultSet rs1 = cst.executeQuery();


        while (rs1.next())
        {
            strTotalCharges=rs1.getString("Charges");
            strCC=rs1.getString("CC");
            strATM=rs1.getString("ATM");
            strCash=rs1.getString("Cash");
            strCheck=rs1.getString("Cheque");
            strMO=rs1.getString("MO");
            strPaidAmt=rs1.getString("TotalPaid");
            strBalanceAmt=rs1.getString("Balance");

            strRegType=rs1.getString("PaymentType");
          
            strIsMember=rs1.getString("MemberYN");
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
    } //END OF IF


%>