<%-- 
    Document   : ModalPop_RoleList
    Created on : Aug 10, 2011, 9:40:46 AM
    Author     : dp
--%>

<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>

<link href="Shows_Pop.css" rel="stylesheet" type="text/css" />
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />

<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.net.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>

<%
String strMode="";
if(request.getParameter("mode")!=null)
    strMode=request.getParameter("mode");


if(strMode.equals("1"))
 {
 Connection localConnection=null;
 DbConnMngr dbcmt=new DbConnMngr();
 String strRoleSeq="";
 List testData = new ArrayList();

try {
        localConnection=dbcmt.getConnection();
	localConnection.setAutoCommit(false);
        CallableStatement cst = localConnection.prepareCall("{call GET_ROLE_DETAIL(?,?,?)}"); 
        cst.setString(1, strRoleId);
        cst.setString(2, strRoleName);
        cst.setString(3, strStatus);

      


        ResultSet rs1 = cst.executeQuery();



        Map map1 = new TreeMap();
        while(rs1.next())
        {

                map1 = new TreeMap();

                map1.put("Roleid",rs1.getInt("RoleID"));
                map1.put("Rolename",rs1.getString("Rolename"));
                map1.put("Status",rs1.getString("Status"));
                map1.put("Abr_Status",rs1.getString("Status"));
               // map1.put("Screen_ID",rs1.getString("Screen_ID"));
                //map1.put("Screen_Name",rs1.getString("Screen_Name"));
                //map1.put("Screen_View",rs1.getString("Screen_View"));
                //map1.put("Screen_Insert_Update",rs1.getString("Screen_Insert_Update"));
                //Screen_ID = rs1.getString("Screen_ID");
                //Screen_Name = rs1.getString("Screen_Name");
                //Screen_View = rs1.getString("Screen_View");
                //Screen_Insert_Update = rs1.getString("Screen_Insert_Update");

//'${Roles.Screen_ID}','${Roles.Screen_Name}','${Roles.Screen_View}','${Roles.Screen_Insert_Update}'
                if(testData.contains(map1))
                    continue;
                testData.add(map1);

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
                localConnection.rollback();
                dbcmt.releaseConnection(localConnection);
            }
            catch(SQLException exc)
            {
            exc.printStackTrace();
            }

        }
        session.setAttribute("Roles", testData);
%>


   <display:table  class="grid" id="Roles"
                   name="sessionScope.Roles" pagesize="10"
                   defaultsort="1" defaultorder="ascending"
                   style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">


   <display:column style="width:1%" headerClass="Grid_Header" >
        <input type="radio" Name="ChkRadio" onClick="returntoMain('${Roles.Roleid}','${Roles.Rolename}','${Roles.Abr_Status}');"></display:column>

    <display:column style="width:10%;text-transform: uppercase"  value="Roleid" title="ID" property="Roleid" sortable="true" headerClass="Grid_Header" />
    <display:column style="width:25%;text-transform: uppercase"  value="Rolename" title="NAME" property="Rolename" headerClass="Grid_Header" sortable="true" />
    <display:column style="width:10%;text-transform: uppercase" value="Status"  property="Status" sortable="true" headerClass="Grid_Header"/>



 </display:table>

<%}%>

<%--

 List HorseList = new ArrayList();
        try
        {
            /*SimpleDateFormat formatter =new SimpleDateFormat("MM/dd/yyyy");
            Date date=null;
            */
            GeneralServlet gen=new GeneralServlet();

            CachedRowSetImpl crsGetHorseDetails = new CachedRowSetImpl();

            crsGetHorseDetails = gen.GetHorseDetails(REGSEQ,str_Reg_no,strHor_PName,strHor_DOB,strmem_name,strmicro_num);

            Map MpHorseDetails = new TreeMap();

          /* String expectedPattern = "MM/dd/yyyy";
            SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
    */
            while (crsGetHorseDetails.next())
            {

                str_Reg_no1="";
                strHor_PName1="";
                strHor_DOB1="";
                strmem_name="";
                strmem_mname="";
                strmem_lname="";
                strmicro_num="";

                if(crsGetHorseDetails.getString("REGSEQ")!=null)
                    RegSeq= crsGetHorseDetails.getString("REGSEQ").trim();

                if(crsGetHorseDetails.getString("REGISTRATION_NUM")!=null)
                    str_Reg_no1= crsGetHorseDetails.getString("REGISTRATION_NUM").trim();

                if(crsGetHorseDetails.getString("HORSE_PRIMARYNAME")!=null)
                    strHor_PName1= crsGetHorseDetails.getString("HORSE_PRIMARYNAME").trim();

                if(crsGetHorseDetails.getString("HORSE_DOB")!=null)
                    strHor_DOB1= crsGetHorseDetails.getString("HORSE_DOB").trim();

                if(crsGetHorseDetails.getString("FIRSTNAME")!=null)
                    strmem_name= crsGetHorseDetails.getString("FIRSTNAME").trim();

                if(crsGetHorseDetails.getString("LASTNAME")!=null)
                    strmem_lname= crsGetHorseDetails.getString("LASTNAME").trim();

                if(crsGetHorseDetails.getString("SUFFIX")!=null)
                    strmem_mname= crsGetHorseDetails.getString("SUFFIX").trim();

                if(crsGetHorseDetails.getString("MICROCHIP_NUM")!=null)
                    strmicro_num= crsGetHorseDetails.getString("MICROCHIP_NUM").trim();

                strOwnerName = strmem_name+" "+strmem_mname+" "+strmem_lname;

                Date date=null;


                MpHorseDetails = new TreeMap();
                MpHorseDetails.put("REGSEQ",RegSeq);
                MpHorseDetails.put("HORSENAME",strHor_PName1);
                MpHorseDetails.put("REG",str_Reg_no1);
                MpHorseDetails.put("OWNER",strOwnerName);
                MpHorseDetails.put("MCHIP",strmicro_num);

                /*if(!strHor_DOB1.equals(""))
                    {
                    date =(Date)formatter.parse(strHor_DOB1);
                     MpHorseDetails.put("DOB",date);
                }
                else*/
                    MpHorseDetails.put("DOB",strHor_DOB1);

                    HorseList.add(MpHorseDetails);
            }
        }
        catch(Exception ex)
        {
                ex.printStackTrace();

        }

        request.setAttribute("HorseList", HorseList);
%>
--%>