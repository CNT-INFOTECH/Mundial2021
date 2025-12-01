<HTML>
<HEAD>
<title>aaaaaaaaa</title>
</HEAD>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.util.zip.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<BODY >
    
<%
  
    //HashMap Mfpathname=(HashMap)session.getAttribute("filenamepath"); 
    HashMap Mfpathname=new HashMap(); 
    HashMap MhorseDoc=new HashMap(); 
    String REGSEQ="";
    int iDocCnt=0;
    if(session.getAttribute("ses_REGSEQ")!=null)
        REGSEQ =(String) session.getAttribute("ses_REGSEQ");
    
     ArrayList ALFilePath=new ArrayList();
     ArrayList ALFilePath1=new ArrayList();
     ArrayList ALFileNames=new ArrayList();
     ServletContext sc = this.getServletContext();
     File folder = new File(sc.getRealPath(File.separator)+"pasoTempFiles"+"/"+REGSEQ+"/");
     
     List<String> filnamn = new ArrayList();          
     String filenames="";
     File[] listOfFiles = folder.listFiles();

    if(listOfFiles!=null)
    {
        for (int i = 0; i < listOfFiles.length; i++) {
            if (listOfFiles[i].isFile()) {
                iDocCnt++;
                filnamn.add(listOfFiles[i].getName());
                filenames =listOfFiles[i].getName();
                //System.out.println("List of filessssss"+listOfFiles[i].getName());               

                ALFilePath1.add(folder+"#@#"+filenames);	
                
String str[]= ALFilePath1.get(i).toString().split("#@#");
String strfilePath="";
String strfilename1="";
if(str.length > 0)
strfilePath=str[0];

strfilePath=strfilePath.replace("\\","/");
if(str.length > 1)
strfilename1=str[1];

                ALFilePath.add(strfilePath+"/"+strfilename1);
                //ALFilePath.add(strfilename1);
                ALFileNames.add(strfilename1);
                //System.out.println("fil espa ts11 ALFilePath  1---"+ALFilePath);
                
                //ALFilePath.add(sc.getRealPath(File.separator)+"pasoTempFiles"+"/"+REGSEQ+"/"+"/"+filenames);	//For path name removed "#@#"
                
                //System.out.println("ALFilePath  File upload file "+ALFilePath);
                
            }
        }    
        /*if(!REGSEQ.equals(""))
        {  
           //Mfpathname.put("fpathname"+iDocCnt,ALFilePath);
           //Mfpathname.put("fname"+iDocCnt,filenames);
        }*/        
        System.out.println("array file path size---"+ALFilePath.size());
        System.out.println("array file path size---"+ALFilePath);
    }

    String strfilename="";
    String filename ="";
    String strDocument="";
    String strDocType="";

    String strIndex="";
    String strhdnfilpath="";
    String strhdnfilname="";


    if(request.getParameter("Index")!=null)
        strIndex=request.getParameter("Index").toString();
 
    
    filename=ALFilePath.get(Integer.parseInt(strIndex)-1).toString();    
    strfilename=ALFileNames.get(Integer.parseInt(strIndex)-1).toString();
   

     
    String img=null;
    String no="";
    int imglen=0;
    byte [] img_arr=null;
      
   try
    {

                
		int dotPos = strfilename.lastIndexOf(".");
		strDocType = strfilename.substring(dotPos+1);
	   
		if (strDocType.trim().equalsIgnoreCase("txt"))
		{
			response.setContentType( "text/plain" );
		}
		else if (strDocType.trim().equalsIgnoreCase("docx")||strDocType.trim().equalsIgnoreCase("doc"))
		{
			 response.setContentType( "application/msword" );
			//response.setHeader("Content-Disposition", "attachment; filename=myfile.doc");
			response.setHeader("Content-disposition","attachment; filename=" + strfilename );

		}
		else if (strDocType.trim().equalsIgnoreCase("xls")||strDocType.trim().equalsIgnoreCase("xlsx"))
		{
			response.setContentType( "application/vnd.ms-excel" );
			response.setHeader("Content-disposition","attachment; filename=" + strfilename );
		}
		else if (strDocType.trim().equalsIgnoreCase("pdf"))
		{
			response.setContentType( "application/pdf" );
		}
		else if (strDocType.trim().equalsIgnoreCase("ppt"))
		{
			response.setContentType( "application/ppt" );
		}
		else if (strDocType.trim().equalsIgnoreCase("jpg") ||strDocType.trim().equalsIgnoreCase("jpeg") ||strDocType.trim().equalsIgnoreCase("gif"))
		{
			response.setContentType( "image/gif" );
		}
		else
		{
			response.setContentType( "application/octet-stream" );
		}



		File fileToDownload = new File(filename.toString());
		FileInputStream fileInputStream = new FileInputStream(fileToDownload);
	   
		InputStream in = fileInputStream;
		img=in.toString();
		int length = (int) img.length();
		int bufferSize = 1024;
		byte[] buffer = new byte[bufferSize];
		while ((length = in.read(buffer)) != -1) 
		{
			response.getOutputStream().write(buffer, 0, length);
		}
		response.getOutputStream().flush();                                 
				  in.close();           
      
     }//End of try     
     catch(Exception Ex)
     {
         System.out.println("Exception in Documents.frmShowPasoDocuments.jsp........."+  Ex.getMessage());
         Ex.printStackTrace();
     }

%>


</BODY>
</HTML>