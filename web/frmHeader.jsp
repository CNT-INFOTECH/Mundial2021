<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.net.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import= "javax.naming.*" %>
<%@ page import= "javax.sql.rowset.*" %>
<%@ page import =  "model.*" %>

<%@ page import =  "pasotracker.GeneralServlet" %>
<link rel="stylesheet" href="menuTemplate/menuTemplate1.css">
<link rel="stylesheet" href="menuTemplate/menuTemplate4.css">
<script type="text/javascript" src="jscCommon.js" ></script>
<%
   String strUserName="";
   String userRoleId="";
	boolean bRegistraion=false;
	boolean bShows=false;
	boolean bPersons=false;
	boolean bAdmin=false;

if(session.getAttribute("user")!=null)
        strUserName=(String)session.getAttribute("user");
   //  System.out.println("************************"+strUserName);
       //if(strUserName.trim().equals(""))
       //{
            //response.sendRedirect("login.jsp");
       //}
	  // out.println("strUserName"+strUserName);
	   ArrayList ArScreenName = new ArrayList();
	   ArrayList Screen_InsUpd = new ArrayList();
	   ArrayList Screen_View = new ArrayList();
	   ArrayList Arr_UserRoleName = new ArrayList();
           RowSetFactory factory76 = RowSetProvider.newFactory();
   CachedRowSet crsGetUserAccess= factory76.createCachedRowSet();
   //CachedRowSetImpl crsGetUserAccess = new CachedRowSetImpl();
   GeneralServlet gen_User = new GeneralServlet();
   
try{
   if(strUserName.length()>0)
   crsGetUserAccess = gen_User.Get_User_ScreenAccess(strUserName);


   String User_RoleName="";
   //String Screen_InsUpd="";
   //String Screen_View="";
   String Screen_Name="";
   int CrsUserSize=0;
   CrsUserSize= crsGetUserAccess.size();
   
   while(crsGetUserAccess.next())
    {
    if(crsGetUserAccess.getString("roleid")!=null)
		Arr_UserRoleName.add(crsGetUserAccess.getString("roleid"));
    else
		Arr_UserRoleName.add("");    

	
    
    if(crsGetUserAccess.getString("SCREEN_INSERT_UPDATE")!=null)
	{
		Screen_InsUpd.add(crsGetUserAccess.getString("SCREEN_INSERT_UPDATE"));
    }
    else
		Screen_InsUpd.add("");
    
    if(crsGetUserAccess.getString("SCREEN_VIEW")!=null)
	{
		Screen_View.add(crsGetUserAccess.getString("SCREEN_VIEW"));
	}
    else
		Screen_View.add("");
        
   if(crsGetUserAccess.getString("SCREEN_NAME")!=null)
    {        
        ArScreenName.add(crsGetUserAccess.getString("SCREEN_NAME"));
    }
    else
		ArScreenName.add(""); 

	
    
//out.println("ArScreenName NAME"+ArScreenName);
    }
}catch(Exception e)
{
	out.println("exception in frmheader.jsp:"+e);
}
   
%>

<img src="Images/HeaderBanner.png" width="100%" alt="header image">
            
<div class="dockTime"  id="dock" >
    <%--=strUserName.toUpperCase()--%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;       
    <span id='ct' ></span>
    <br><br>
    <table style="text-align: right;width: 100%;">
        <tr>
            <td width="60%"></td>
            <!--<td><a href='Admn_UserProfile.jsp?<%--=Calendar.getInstance().getTimeInMillis()--%>'><img src="Images/Registation.png"  /></a>&nbsp;&nbsp;&nbsp;</td>-->
            <td><h2><a href="Logout.jsp" style="color:white">Logout</a></h2></td>
        </tr>            
    </table>
</div>

<div class="dock" id="dock">

<div class="dock-container">


<%
String Reg_ScrnStatus_Ins="N";
String Reg_ScrnStatus_View="";

String Per_ScrnStatus_Ins="N";
String Per_ScrnStatus_View="";

String Adm_ScrnStatus_Ins="N";
String Adm_ScrnStatus_View="";

String Shw_ScrnStatus_Ins="N";
String Shw_ScrnStatus_View="";

String Shw_ScrnRegShwStatus_Ins="N";
String Shw_ScrnRegShwStatus_View="";

String Shw_ScrnPtsTblStatus_Ins="N";
String Shw_ScrnPtsTblStatus_View="";

String Shw_ScrnDeviationStatus_Ins="N";
String Shw_ScrnDeviationStatus_View="";

String Shw_ScrnPlacementStatus_Ins="N";
String Shw_ScrnPlacementStatus_View="";


String Reg_BtnStatus="";
String Per_BtnStatus="";
String Adm_BtnStatus="hidden";
String Btn_OrgRole="hidden";
String Tab_Width="0%";
try{

if(crsGetUserAccess.size()>0)
{
String [] ScreenList_Header = (String[])ArScreenName.toArray(new String[ArScreenName.size()]);
String [] ScreenStatus_Header = (String[])Screen_InsUpd.toArray(new String[Screen_InsUpd.size()]);
String [] ScreenStatus_HeaderView = (String[])Screen_View.toArray(new String[Screen_View.size()]);
String [] StrArr_UserRole = (String[])Arr_UserRoleName.toArray(new String[Arr_UserRoleName.size()]);




for(int k=0;k<ScreenList_Header.length;k++)
{

if( ScreenList_Header[k].equals("REGISTRATION"))
	{
	if(ScreenStatus_Header[k].equals("InsUpd"))
		Reg_ScrnStatus_Ins="Y";
	else if (ScreenStatus_HeaderView[k].equals("View") )
		Reg_ScrnStatus_View="Y";
	}

/*else if( (ScreenList_Header[k].equals("CREATE SHOW") ||ScreenList_Header[k].equals("REGISTER SHOW") ||
	ScreenList_Header[k].equals("SHOW PLACEMENT") ||ScreenList_Header[k].equals("SHOW POINTS TABLE") ||ScreenList_Header[k].equals("SHOW DEVIATION") ) )
	{
	if ( ScreenStatus_Header[k].equals("InsUpd"))
		Shw_ScrnStatus_Ins="Y";	
    else if(ScreenStatus_HeaderView[k].equals("View"))
		Shw_ScrnStatus_View="Y";	
	}*/
	else if(ScreenList_Header[k].equals("CREATE SHOW"))
	{
	if ( ScreenStatus_Header[k].equals("InsUpd"))
		Shw_ScrnStatus_Ins="Y";	
    else if(ScreenStatus_HeaderView[k].equals("View"))
		Shw_ScrnStatus_View="Y";	
	}
	
	else if( ScreenList_Header[k].equals("REGISTER SHOW"))
	{
	if ( ScreenStatus_Header[k].equals("InsUpd"))
		Shw_ScrnRegShwStatus_Ins="Y";	
    else if(ScreenStatus_HeaderView[k].equals("View"))
		Shw_ScrnRegShwStatus_View="Y";	
	}
	
	else if(ScreenList_Header[k].equals("SHOW PLACEMENT") )
	{
	if ( ScreenStatus_Header[k].equals("InsUpd"))
		Shw_ScrnPlacementStatus_Ins="Y";	
    else if(ScreenStatus_HeaderView[k].equals("View"))
		Shw_ScrnPlacementStatus_View="Y";	
	}
	
	else if( ScreenList_Header[k].equals("SHOW POINTS TABLE") )
	{
	if ( ScreenStatus_Header[k].equals("InsUpd"))
		Shw_ScrnPtsTblStatus_Ins="Y";	
    else if(ScreenStatus_HeaderView[k].equals("View"))
		Shw_ScrnPtsTblStatus_View="Y";	
	}
	
	else if( ScreenList_Header[k].equals("SHOW DEVIATION") ) 
	{
	if ( ScreenStatus_Header[k].equals("InsUpd"))
		Shw_ScrnDeviationStatus_Ins="Y";	
    else if(ScreenStatus_HeaderView[k].equals("View"))
		Shw_ScrnDeviationStatus_View="Y";	
	}
	
	

	else if( ScreenList_Header[k].equals("PERSONS") )
	{
		if ( ScreenStatus_Header[k].equals("InsUpd"))
			Per_ScrnStatus_Ins="Y";	
		else if(ScreenStatus_HeaderView[k].equals("View"))
			Per_ScrnStatus_View="Y";	

	}

	else if( ScreenList_Header[k].equals("ADMINISTRATOR"))
	{
		Btn_OrgRole="visible;width=100%";
		if( ScreenStatus_Header[k].equals("InsUpd"))
		{
			Adm_ScrnStatus_Ins="Y";
			Adm_BtnStatus="visible";
		}
		else if (ScreenStatus_HeaderView[k].equals("View") )
			Adm_ScrnStatus_View="Y";
	}

else if( StrArr_UserRole[k].equalsIgnoreCase("1000") )
	{	
	//Reg_ScrnStatus_Ins="N";
	Shw_ScrnStatus_Ins="N";
	Per_ScrnStatus_Ins="N";
	Adm_ScrnStatus_Ins="N";
	bRegistraion=true;
	}


}
}
}catch(Exception e){out.println("exception in frmheader 179:"+e);}
%>

<a class="dock-item" href="Logout.jsp">
<span>Logout</span></a>
</div>
</div>

<ul class="menuTemplate1 decor1_1" license="mylicense" style="width: 100%" nowrap>
    <%       
        if(Reg_ScrnStatus_Ins.equals("Y") || Reg_ScrnStatus_View.equals("Y")){
                bRegistraion=true;
    %>      
    <li  ><a href='index.jsp?<%=Calendar.getInstance().getTimeInMillis()%>'>REGISTRATION</a></li>
    <li class="separator"></li>
    <%
        }
        if(Shw_ScrnStatus_Ins.equals("Y") || Shw_ScrnStatus_View.equals("Y")
	|| Shw_ScrnRegShwStatus_Ins.equals("Y") || Shw_ScrnRegShwStatus_View.equals("Y")
|| Shw_ScrnPlacementStatus_Ins.equals("Y") || Shw_ScrnPlacementStatus_View.equals("Y")
|| Shw_ScrnPtsTblStatus_Ins.equals("Y") || Shw_ScrnPtsTblStatus_View.equals("Y")
|| Shw_ScrnDeviationStatus_Ins.equals("Y") || Shw_ScrnDeviationStatus_View.equals("Y")){
                bShows=true;
    %>     
    <li><a   class="arrow" href='Shows.jsp?S&<%=Calendar.getInstance().getTimeInMillis()%>' >SHOWS</a>
        <div class="drop decor1_2" style="width: 180px;">
            <div class='left'>
                <a href="Shows.jsp?S&<%=Calendar.getInstance().getTimeInMillis()%>" style="font-size: 13px;"><b>Shows</b></a><br />                               
                <a href="RptShow.jsp?S=<%=Calendar.getInstance().getTimeInMillis()%>" style="font-size: 13px;"><b>Reports</b></a><br />                               
            </div>
        </div>
    </li>
    <li class="separator"></li>
        <%
            }
            if(Per_ScrnStatus_Ins.equals("Y") || Per_ScrnStatus_View.equals("Y") ){
                    bPersons=true;
        %>
    <li><a href='frmPerson.jsp?<%=Calendar.getInstance().getTimeInMillis()%>' >PERSONS</a></li>     
    <li class="separator"></li>
    <%
            }
            if(Shw_ScrnStatus_Ins.equals("Y") || Shw_ScrnStatus_Ins.equals("Y")){
	bShows=true;
    %>
    <li><a href="Shows_Forms.jsp?<%=Calendar.getInstance().getTimeInMillis()%>"   class="arrow">FORMS</a></li>

    <li class="separator"></li>
        <% 
            }
            if(Adm_ScrnStatus_Ins.equals("Y") || Adm_ScrnStatus_View.equals("Y")){
	bAdmin=true;
    %>     
    <li><a href='createuser.jsp?<%=Calendar.getInstance().getTimeInMillis()%>' class="arrow">ADMINISTRATOR</a>

<!--        <div class="drop decor1_2 dropToLeft" style="width: 320px;">
            <h2>Create</h2><br/>   
            <div class='left'>
                <h3>User Profile</h3>
                <div>
                    <a href="createuser.jsp">Profile Setup</a><br />
                </div>
            </div>
        </div>  -->
    </li>
    <%}%>
</ul>
<script type="text/javascript">display_ct()</script>


