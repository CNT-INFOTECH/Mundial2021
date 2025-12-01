
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
    /******  added by erzath on Jan 3 2012 ***********/
    String REGSEQ="";
    if(session.getAttribute("ses_REGSEQ")!=null)
        REGSEQ =(String) session.getAttribute("ses_REGSEQ");
    else
        REGSEQ="";     
    /*********** end by erzath ***********************/
%>
<%@ include file="frmOwnersHistoryInclude.jsp"%> 

<%
String strfileindex="";

if(request.getParameter("fileindex")!=null)
    strfileindex=request.getParameter("fileindex").toString();

        HashMap MhorseDoc=new HashMap();
        HashMap MDeleteFile=new HashMap();
        HashMap CheckMDeleteFile=new HashMap();

	String sRegSeq="";
    sRegSeq=REGSEQ;

    /*if(session.getAttribute("Horsedocuments") !=null)
        MhorseDoc=(HashMap)session.getAttribute("Horsedocuments");


    if(session.getAttribute("DeleteFile") !=null)
        MDeleteFile=(HashMap)session.getAttribute("DeleteFile");*/

    /*String strfilePath= (String)MDeleteFile.get(strfileindex);
    

            File yourFile = new File(strfilePath);
            yourFile.delete();
*/
//Added By erzath For Removing Session of the path            
     ArrayList ALFilePath=new ArrayList();
     ServletContext sc = this.getServletContext();
     File folder = new File(sc.getRealPath(File.separator)+"pasoTempFiles"+"/"+sRegSeq+"/");
     
     List<String> filnamn = new ArrayList();
     List<String> filnamn1= new ArrayList();
     //filnamn=folder.getAbsoluteFile();
    
     File[] listOfFiles = folder.listFiles();     
 
     if(listOfFiles!=null)
     {
        for (int i = 0; i < listOfFiles.length; i++) {
            if (listOfFiles[i].isFile()) {
                
                filnamn.add(listOfFiles[i].getName());
                
                String filenames =listOfFiles[i].getName();
                
                ALFilePath.add(folder+"#@#"+filenames);		                
            }
        }
     
     //ALFilePath.add(sc.getRealPath(File.separator)+"pasoTempFiles"+"/"+str_reggno+"/"+filnamn);     
     if(!REGSEQ.equals(""))
     MhorseDoc.put(REGSEQ, ALFilePath);   
     }
 
    int iDocCnt=0;
    HashMap HDeleteFile=new HashMap();   
	ArrayList ALFileListOfHorse=new ArrayList();
	String strfilePath="";
	String strfilename="";
	String strfileNamePath="";

	//ArrayList ALFileListOfHorse=(ArrayList)MhorseDoc.get(REGSEQ);//changed to regseq instead of regno--erzath 3 jan 2012 

	if(MhorseDoc.containsKey(sRegSeq))
     ALFileListOfHorse=(ArrayList)MhorseDoc.get(sRegSeq);

    for(int i=0;i<ALFileListOfHorse.size();i++)
    {
		iDocCnt++;

                     /*added on 30072011*/
     String strClass="";
    if( i%2 ==0 )
        strClass="even";
    else
        strClass="odd";

		/*added on 30072011*/

         String str[]= ALFileListOfHorse.get(i).toString().split("#@#");

     if(str.length > 0)
        strfilePath=str[0];

     strfilePath=strfilePath.replace("\\","/");
     if(str.length > 1)
     strfilename=str[1];

     strfileNamePath=strfilePath+"\\"+strfilename;


     MDeleteFile.put(""+iDocCnt, strfileNamePath);
     }
 //* end of erzath code for removing session 

String strfilePath_Del= (String)MDeleteFile.get(strfileindex);

            File yourFile = new File(strfilePath_Del);
            

            yourFile.delete();
			response.sendRedirect("frmDocuments.jsp");  
			/*
    MhorseDoc.put(str_reggno, ALFileListOfHorse);
    session.setAttribute("Horsedocuments",MhorseDoc);

    
RequestDispatcher reqDisp=request.getRequestDispatcher("frmDocuments.jsp");
	reqDisp.forward(request,response);*/


%>
