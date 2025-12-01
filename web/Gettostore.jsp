
        <%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>
        <%@ page language="java" import="java.sql.*,java.io.*" %>
        <%@ page import="java.io.*,javax.servlet.http.HttpServletRequest,javax.servlet.ServletInputStream" %>  
        <%@ page import="java.io.FileWriter,java.io.IOException" %>  
        <%@ page import ="java.sql.*,java.io.*,java.util.*" %>
        <%@ page import="java.io.FileInputStream"%>
        <%@ page import="org.apache.commons.fileupload.disk.*"%>

        <%@ page import="org.apache.commons.fileupload.*"%>

<!--<%@ page import="pasotracker.DbConnMngr" %>-->

        <%@page language="java" session="true" %>
        
<html>
<body>        
        
   <%
              
    String Regno = (String)session.getAttribute("Regno_str");
    //String REGSEQ = request.getParameter("HdnRegSeq");
    String REGSEQ=(String) session.getAttribute("ses_REGSEQ");
	String loginUserId=(String)session.getAttribute("user");
        
       
try
{
    ServletContext sc = this.getServletContext();
    ArrayList ArList = new ArrayList();
    ArrayList DateList = new ArrayList();
    String strValues = "";
    String strDirName = "";
    //File FileToProcess = null;
    String dirname = sc.getRealPath("") + "/" + "TempFiles" + "/";
    File fl = new File(dirname);
    fl.mkdirs();
    String seperator = System.getProperty("file.separator");


    DiskFileUpload dfu = new DiskFileUpload();

    dfu.setSizeMax(1000000000); //1GB

    List fileItems = dfu.parseRequest(request);

    Iterator itr = fileItems.iterator();
    // System.out.println(itr);
    ArrayList Al = new ArrayList(); //raju
    Al.add("");
    Al.add("");
    Al.add("");
    while (itr.hasNext())
    {
    FileItem fi = (FileItem) itr.next();

    if (!fi.isFormField()) 
    {


        String strGetDir = fi.getName();
        String strfield = fi.getFieldName();


        if(strGetDir==null   || strGetDir.equals("null") || strGetDir.isEmpty())
            continue;

        File fNew = new File(strGetDir);
        int ind = strGetDir.lastIndexOf(seperator);
        strDirName = dirname + strGetDir.substring(ind + 1, strGetDir.length());

        fi.write(new File(strDirName));
        if(strfield.equals("up"))
            Al.set(0,strDirName);
        else if(strfield.equals("up1"))
            Al.set(1,strDirName);
        else if(strfield.equals("up2"))
            Al.set(2,strDirName);


       // FileToProcess = new File(strDirName);
     }
    }

    Connection connection = null;
    CallableStatement pst = null;

    DbConnMngr dbconnection = new DbConnMngr();

    connection = dbconnection.getCon();

    for(int i=0;i<Al.size();i++)//raju
    {

    String strDirName1="";
    strDirName1=(String)Al.get(i);


    if(strDirName1.equals(""))
        continue;

    pst = connection.prepareCall("{call INS_UPD_IMAGES(?,?,?,?,?)}");
    FileInputStream fis=new FileInputStream(strDirName1);
    byte[] b= new byte[fis.available()+1];
    fis.read(b);
    pst.setString(1,REGSEQ);
    pst.setString(2,Regno);
    pst.setBytes(3,b);
    pst.setString(4,""+i);
	pst.setString(5,loginUserId);
        // if i=0 it is left image
        // if i=1 it is Middle image
        // if i=2 it is Right image

    pst.executeUpdate();
    pst.close();
  }
    connection.commit();
    connection.close();
    //dbconnection.releaseConnection(connection);
    response.sendRedirect("Images.jsp");            
}
catch(SQLException e)
    {
    out.println ( e);
    }
catch (ClassNotFoundException e)
    {
    out.println( e );
}
%>
</body>
</html>
