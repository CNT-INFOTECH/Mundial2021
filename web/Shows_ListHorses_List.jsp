<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.net.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>

<%

String strSearchMode=request.getParameter("mode");
String strShowSeq=request.getParameter("ShowSeq");
String strEventSeq=request.getParameter("EventSeq");
if(strSearchMode!=null && strSearchMode.equals("0") )
 {

%>
<link href="Shows_Pop.css" rel="stylesheet" type="text/css" />
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />
        <table class="grid" width="100%" style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">
                    <tr>
                    <th width="1%" class="Grid_Header">&nbsp;</th>
                     <th width="16%" class="Grid_Header">Name</th>
                    <th width="5%" class="Grid_Header">Age</th>
                    <th width="16%" class="Grid_Header">Sire</th>
                    <th width="16%" class="Grid_Header">Dam</th>
                    <th width="16%" class="Grid_Header">Owner</th>
                    <th width="16%" class="Grid_Header">Breeder</th>
                    <th width="16%" class="Grid_Header">Rider</th>
                    </tr>

  <%



 Connection localConnection=null;
 DbConnMngr dbcmt=new DbConnMngr();
 ArrayList AlEvents=new ArrayList();
try {
        localConnection=dbcmt.getConnection();
	localConnection.setAutoCommit(false);
        CallableStatement cst = localConnection.prepareCall("{call GET_EVENT_PARTICIPANTS(?,?)}");
        cst.setString(1, strShowSeq);
        cst.setString(2, strEventSeq);
        ResultSet rs2 = cst.executeQuery();


        ArrayList AlRows=new ArrayList();

        while(rs2.next())
        {
            AlRows=new ArrayList();


           if(rs2.getString("HORSE_PRIMARYNAME")!=null)
            AlRows.add(rs2.getString("HORSE_PRIMARYNAME").toUpperCase());
           else
             AlRows.add("");
//-------0
            if(rs2.getString("HAge")!=null)
                    AlRows.add(rs2.getString("HAge"));
            else
             AlRows.add("");
//-------1
             if(rs2.getString("SireName")!=null)
                AlRows.add(rs2.getString("SireName").toUpperCase());
              else
             AlRows.add("");
//-------2


            if(rs2.getString("DamName")!=null)
                AlRows.add(rs2.getString("DamName").toUpperCase());
            else
             AlRows.add("");
//-------3

            if(rs2.getString("OwnerName")!=null)
                AlRows.add(rs2.getString("OwnerName").toUpperCase());
            else
             AlRows.add("");
//-------4

            if(rs2.getString("BreederName")!=null)
                AlRows.add(rs2.getString("BreederName").toUpperCase());
            else
             AlRows.add("");
//-------5

            if(rs2.getString("HRider")!=null)
                AlRows.add(rs2.getString("HRider").toUpperCase());
            else
             AlRows.add("");
//-------6

           


            AlEvents.add(AlRows);

         }



         rs2.close();
         cst.close();

        localConnection.commit();
        dbcmt.releaseConnection(localConnection);
        }

        catch(Exception ex)
        {
            ex.printStackTrace();
            try
            {
                localConnection.rollback();
                dbcmt.releaseConnection(localConnection);
            }
            catch(SQLException exc)
            {
            exc.printStackTrace();
            }

        }

                             boolean bColor=true;

%>



                            <% for (int li=0; li < AlEvents.size() ;li++ )
                             {
                                 ArrayList AlGetRows=(ArrayList)AlEvents.get(li);
                                    if(bColor){  bColor=false;%>
                                    <tr class="odd">
                                    <%} else {  bColor=true; %>
                                    <tr class="even">
                                    <%}%>
                                                               
                                    <td>&nbsp;</td>
                                <td><%= AlGetRows.get(0)%></td>
                                <td><%= AlGetRows.get(1)%></td>
                                <td><%= AlGetRows.get(2)%></td>
                                 <td><%= AlGetRows.get(3)%></td>
                                <td><%= AlGetRows.get(4)%></td>
                                <td><%= AlGetRows.get(5)%></td>
                                <td><%= AlGetRows.get(6)%></td>
                               
                                </tr>
                              <%}

 }%>
        </table>