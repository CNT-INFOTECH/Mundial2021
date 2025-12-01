<%-- 
    Document   : frmReg_GetHorseImage
    Created on : Dec 5, 2012, 5:42:59 PM
    Author     : Erzath
--%>


<%@page import="pasotracker.GeneralServlet"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="pasotracker.DbConnMngr" %>

<html>
<body>
<%
    String strHorseSeq="";

    if(request.getParameter("seq")!=null)
    strHorseSeq=request.getParameter("seq");

    InputStream imgHorse;

    String strID="";

    Connection con = null;
    DbConnMngr dbconnection = new DbConnMngr();

    CallableStatement pst = null;
    if(strHorseSeq!=null){
    try {

    con = dbconnection.getCon();

    pst = con.prepareCall("{call GET_PASOIMAGES(?)}");
    pst.setString(1,strHorseSeq);

    ResultSet rs =  pst.executeQuery();

%>
<table>
<tr>
<td>

<%
    ServletOutputStream servletOutputStream = response.getOutputStream();
    while(rs.next())
    {

        //byte[] bytearray = new byte[1024];
        int size=0;
        strID=rs.getString(1);

        response.reset();
        response.setContentType("image/jpeg");

        byte[] bytearray = new byte[1024];
        imgHorse = rs.getBinaryStream(3);

        if( imgHorse!=null && !(imgHorse.equals("NULL")))
        {
            try
            {
                while((size=imgHorse.read(bytearray))!= -1)
                {
                    //response.getOutputStream().write(bytearray,0,size);
                    servletOutputStream.write(bytearray,0,size);
                }
            }
            catch(Exception ex)
            {
                System.out.println("Exception in frmReg_GetHorseImage:"+ex);
            }
        }
    }


    servletOutputStream.flush();
    servletOutputStream.close();

    rs.close();
    pst.close();
    con.commit();
    con.close();
             
    // dbconnection.releaseConnection(con);

    }
    catch(Exception e)
    {
        System.out.println("Exception in frmReg_GetHorseImage---:"+e);
    }
    }

%>
</td></tr>
</table>

</body>
</html>
