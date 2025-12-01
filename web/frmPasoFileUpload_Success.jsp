<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%
    /******  added by erzath on Jan 3 2012 ***********/
    String REGSEQ="";
    if(request.getParameter("SeqNo")!=null)
        REGSEQ =request.getParameter("SeqNo");
    else
        REGSEQ="";        
    /*********** end by erzath ***********************/
%>
<%@ include file="frmOwnersHistoryInclude.jsp"%> 
<%
    String strMode1="";
    String strGetDir="";
    String strDirName="";

    String strHorseRegNo="";
    strHorseRegNo="HRA0001";
    
    /*********************/
    String strRegSeq="";
    strRegSeq="123";
    strRegSeq=REGSEQ;
    /*********************/
    strHorseRegNo=str_reggno;
        
    ArrayList ALFileList=new ArrayList();
    HashMap horseDocMap=new HashMap();
    

    if(request.getParameter("Mode")!=null)
        strMode1=request.getParameter("Mode");
    
        if(session.getAttribute("Horsedocuments")!=null)
        {
            horseDocMap=(HashMap)session.getAttribute("Horsedocuments");
          
/*
            if(horseDocMap.containsKey(strHorseRegNo))
                ALFileList=(ArrayList)horseDocMap.get(strHorseRegNo);*/
            if(horseDocMap.containsKey(strRegSeq))
                ALFileList=(ArrayList)horseDocMap.get(strRegSeq);
            
        }
    
    
    
    int intExpType = 1;   
    Calendar calendar = new GregorianCalendar();

    String strCurMonth = ""+(calendar.get(Calendar.MONTH)+1);
    if (strCurMonth.length() ==1)
            strCurMonth = "0"+strCurMonth;

    String strcurDay = ""+calendar.get(Calendar.DATE);
    if (strcurDay.length() ==1)
            strcurDay = "0"+strcurDay;
    int curYear = calendar.get(Calendar.YEAR);
    String strDate = ""+curYear+strCurMonth+strcurDay;
		


    //String dirname = "E:/Paso_Uploaded_Files/"+strDate+"/";
    ServletContext sc = this.getServletContext();

    File fl1 = new File(sc.getRealPath(File.separator)+"pasoTempFiles"+"/"+strRegSeq+"/");//strHorseRegNo
    fl1.mkdirs();

    String path = fl1.getAbsoluteFile()+"/";
    //String seperator = System.getProperty("file.separator");
       
    
    DiskFileUpload dfu = new DiskFileUpload();
    dfu.setSizeMax(1000000000); //1GB

    List fileItems =dfu.parseRequest(request);
    Iterator itr = fileItems.iterator();

                
    while(itr.hasNext()) 
    {
        FileItem fi = (FileItem)itr.next();                                                                                                                          
        if(!fi.isFormField())
        {                        
                strGetDir=fi.getName();                                               
                File fNew= new File(fi.getName());                                                
                File tosave=new File(path,fNew.getName());
                fi.write(tosave);                                
                ALFileList.add(path+"#@#"+strGetDir);			
                System.out.println("File upload file "+strGetDir);			
        }
    }
   // horseDocMap.put(strHorseRegNo, ALFileList);
     horseDocMap.put(strRegSeq, ALFileList);    
    
    session.setAttribute("Horsedocuments",horseDocMap);
                        
   // request.setAttribute("HorseRegNo",strHorseRegNo);
     request.setAttribute("HorseRegNo",strRegSeq);
    request.setAttribute("filesuploade","success");    
    

       
    RequestDispatcher reqDisp=request.getRequestDispatcher("frmDocuments.jsp");
	reqDisp.forward(request,response);
   
        
%>
