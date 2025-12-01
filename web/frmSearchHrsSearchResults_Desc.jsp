<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>
<%@ page import = "java.util.Iterator"%>
<%@ page import = "java.util.List"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import =  "model.*" %>



<%
        Connection localConnection=null;
        DbConnMngr dbcmt=new DbConnMngr();

         String strParentType="";
         String strParentSeq="";
         List HorseList = new ArrayList();
       
          if(request.getParameter("TPS")!=null)
            strParentSeq=request.getParameter("TPS");
          if(request.getParameter("PAR")!=null)
            strParentType=request.getParameter("PAR");






        ArrayList ArEvent=new ArrayList();
        try
        {
            localConnection=dbcmt.getConnection();
            localConnection.setAutoCommit(false);
            CallableStatement cst = localConnection.prepareCall("{call GET_DESC_GROUPS(?,?,?)}");
            cst.setString(1, strParentSeq);
            cst.setString(2, strEventSeq);
            cst.setString(3, strParentType);


        ResultSet rs1 = cst.executeQuery();

        Map MpHorseDetails = new TreeMap();
            while (rs1.next())
            {
                    MpHorseDetails = new TreeMap();
                    MpHorseDetails.put("Seq",rs1.getString("REG_SEQ"));
                    MpHorseDetails.put("Name",rs1.getString("HORSE_PRIMARYNAME"));
                    MpHorseDetails.put("Reg",rs1.getString("REGISTRATION_NUM"));
                   
                    MpHorseDetails.put("Age",rs1.getString("Age"));
                    MpHorseDetails.put("Sex",rs1.getString("HORSE_GENDER"));

                    MpHorseDetails.put("Sire",rs1.getString("SIRE"));
                    MpHorseDetails.put("Dam",rs1.getString("DAM"));
                    MpHorseDetails.put("Points",rs1.getString("Points"));


                    HorseList.add(MpHorseDetails);
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

        request.setAttribute("HrsValues", HorseList);

%>

 <display:table  id="Details" name="requestScope.HrsValues"
               class="grid"  pagesize="10"
                    style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">

            <display:column style="width:1%" headerClass="Grid_Header" >
            <input type="radio" name="chkSire" onClick="SearchHorse_Retn_NoRefresh('${Details.Reg}','${Details.Seq}','${Details.Name}','<%=strGroupType%>')">
            </display:column>

            <display:column style="width:25%" title="Horse Name" property="Name" sortable="true" headerClass="Grid_Header"/>


            <display:column style="width:15%" property="Reg"  sortable="true" headerClass="Grid_Header" />
        
            <display:column style="width:5%" property="Age" headerClass="Grid_Header" />
            <display:column style="width:5%;text-align:center" property="Sex" headerClass="Grid_Header" />
          
            <display:column style="width:18%" property="Sire" headerClass="Grid_Header" />
            <display:column style="width:18%" property="Dam" headerClass="Grid_Header" />
            <display:column style="width:5%;text-align:center" property="Points" headerClass="Grid_Header" />
            </display:table>

</table >
