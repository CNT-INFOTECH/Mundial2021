<%--     Document   : frmExportExcel    Created on : Dec 19, 2015, 11:31:17 AM    Author     : ruban   --%>

<%@page import="pasotracker.InsUpdInvoice"%>
<%@page import="org.apache.poi.hssf.util.Region"%>
<%@page import="org.apache.poi.ss.usermodel.*"%>
<%@page import="org.apache.poi.hssf.usermodel.*"%>
<%@page import="pasotracker.DbConnMngr"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.OutputStream"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFDataFormat"%>
<%@page import="org.apache.poi.hssf.util.HSSFColor"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFFont"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCellStyle"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Connection localConnection = null;
    CallableStatement pst = null;
    ResultSet rs=null;    
    
    DbConnMngr dbcmt = new DbConnMngr();    
    InsUpdInvoice iuInv = new InsUpdInvoice();
        
    ArrayList alRow=new ArrayList();
    ArrayList alRow0=new ArrayList();
    ArrayList arRow1=new ArrayList();
    ArrayList arRow2=new ArrayList();
    ArrayList arRow3=new ArrayList();
    
    ArrayList GetAllRows = new ArrayList();
    ArrayList GetAllRows0 = new ArrayList();
    ArrayList GetAllRows1 = new ArrayList();
    ArrayList GetAllRows2 = new ArrayList();
    ArrayList GetAllRows3 = new ArrayList();
    
    ArrayList arExcelValues=new ArrayList();
        
    String strAllFieldVal="";
    String strSplitAll[];
    String strPage="";
    String header="";
    
    String strExpType="";
    String strTransType="";
    String strTransDateFrom="";
    String strTransDateTo="";
    String strUnInvoice="";
    
    if(request.getParameter("Pg")!=null)
        strPage=request.getParameter("Pg");
    
    if(request.getParameter("AllVal")!=null)
        strAllFieldVal=request.getParameter("AllVal");
    
//    System.out.println("strPage " +strPage);
//    System.out.println("strAllFieldVal " +strAllFieldVal);
    
    strSplitAll=strAllFieldVal.split(",");
    
    try{
        localConnection = dbcmt.getCon();
        if(strPage.equalsIgnoreCase("InvoiceSummary") || strPage.equalsIgnoreCase("InvoiceDetails")){
            if(strSplitAll.length >= 1)
                strExpType=strSplitAll[0];
            if(strSplitAll.length >= 2)
                strTransType=strSplitAll[1];
            if(strSplitAll.length >= 3)
                strTransDateFrom=strSplitAll[2];
            if(strSplitAll.length >= 4)
                strTransDateTo=strSplitAll[3];
            if(strSplitAll.length >= 5)
                strUnInvoice=strSplitAll[4];
            
            if(strPage.equalsIgnoreCase("InvoiceSummary")){
                GetAllRows = new ArrayList();
                GetAllRows1 = new ArrayList();
                GetAllRows = iuInv.getTransCount_Certificate_TransOwner(strExpType,strTransType, strTransDateFrom, strTransDateTo,strUnInvoice);
                for(int i=0; i<GetAllRows.size(); i++){
                    alRow= new ArrayList();
                    alRow=(ArrayList) GetAllRows.get(i);
                    alRow.remove(0);
                    GetAllRows1.add(alRow);
                }
            }
            if(strPage.equalsIgnoreCase("InvoiceDetails") ){
                GetAllRows = new ArrayList();
                GetAllRows1 = new ArrayList();
                System.out.println("strTransTypestrTransTypestrTransTypestrTransTypestrTransType "+strTransType);
                GetAllRows = iuInv.getTransCount_Certificate_TransOwner(strExpType,strTransType, strTransDateFrom, strTransDateTo,strUnInvoice);
                for(int i=0; i<GetAllRows.size(); i++){
                    alRow= new ArrayList();
                    alRow=(ArrayList) GetAllRows.get(i);
                    alRow.remove(0);
                    alRow.remove(0);
                    alRow.remove(2);
                    GetAllRows1.add(alRow);
                }
            }
        }
    }
    catch(Exception e){
       System.err.println("Exception in Export excel : "+e);
    }
    finally{
        if (rs != null)
           rs.close();
       if (pst != null)
           pst.close();
       if(localConnection!=null)
          localConnection.close();
    }

    String filename="";
    if(strPage.equalsIgnoreCase("InvoiceSummary")){
        filename="Invoice Summary";
        header="Transaction Type               ,Count      ";
    }
    else if(strPage.equalsIgnoreCase("InvoiceDetails")){
        filename="Invoice Details";
        header="Horse Reg#     ,Horse Name                               ,Owner Id#       ,Owner Name                                      ,Transaction Date, Transaction User          ,Included in Invoice,Certificate Issued";
    }
    System.out.println("GetAllRows1 " +GetAllRows1);
    System.out.println("GetAllRows2 " +GetAllRows2);
    processExcelCreationArrayList(strPage,request,response,header,filename,GetAllRows1,GetAllRows2,strTransType);
%>
<%!
public void processExcelCreationArrayList(String strPage, HttpServletRequest req, HttpServletResponse res,String header,String filename,ArrayList arListvalues1, ArrayList arListvalues2, String strTransType ){
    try{
//        System.out.println("header "+header);
        String[] strHead=header.split(",");
        String strStatus="";
        ArrayList arGetRows = new ArrayList();        
        int numberOfColumns = strHead.length;
        
        HSSFWorkbook wb = new HSSFWorkbook();
        res.setContentType("application/vnd.ms-excel");
        res.setHeader("Content-Disposition", "attachment;filename="+filename+".xls");
        
        HSSFCellStyle    headerStyle = wb.createCellStyle();
        HSSFCellStyle    headerStyle1 = wb.createCellStyle();
        HSSFFont headerFont = wb.createFont();
        headerFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);

        headerStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        headerStyle.setFillForegroundColor(HSSFColor.PALE_BLUE.index);
        headerStyle.setFillBackgroundColor(HSSFColor.WHITE.index);
        headerStyle.setFont(headerFont);
        headerStyle.setBorderBottom(HSSFCellStyle.BORDER_MEDIUM);
        headerStyle.setBorderTop(HSSFCellStyle.BORDER_MEDIUM);
        headerStyle.setBorderRight(HSSFCellStyle.BORDER_MEDIUM);
        headerStyle.setBorderLeft(HSSFCellStyle.BORDER_MEDIUM);
        headerStyle1.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        headerStyle1.setFillForegroundColor(HSSFColor.PALE_BLUE.index);
        headerStyle1.setFillBackgroundColor(HSSFColor.WHITE.index);
        headerStyle1.setFont(headerFont);
        headerStyle1.setBorderBottom(HSSFCellStyle.BORDER_MEDIUM);
        headerStyle1.setBorderTop(HSSFCellStyle.BORDER_MEDIUM);
        headerStyle1.setBorderRight(HSSFCellStyle.BORDER_MEDIUM);
        headerStyle1.setBorderLeft(HSSFCellStyle.BORDER_MEDIUM);
        headerStyle1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
                
        HSSFCellStyle Datestyle = wb.createCellStyle();
        Datestyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("mm/dd/yyyy"));
        System.out.println("strTransType : "+strTransType);
        
        if(strPage.equalsIgnoreCase("InvoiceDetails") && strTransType.equalsIgnoreCase("3")){
            HSSFSheet sheet1 = wb.createSheet("Certificate Details");
            HSSFSheet sheet2 = wb.createSheet("Trasfer Owner");
            HSSFRow XLS_SH_R1=null;
            HSSFRow XLS_SH_R2=null;
            HSSFCell XLS_SH_R_C1=null;
            HSSFCell XLS_SH_R_C2=null;
        
            for (int i =0; i <numberOfColumns; i++){
                sheet1.setColumnWidth((short) i, (short) ((strHead[i].toString().length() * 14) / (0.05)));
                sheet2.setColumnWidth((short) i, (short) ((strHead[i].toString().length() * 14) / (0.05)));
            }
            sheet1.createFreezePane(0,1,0,1);
            sheet2.createFreezePane(0,1,0,1);
            int introw=0;
            XLS_SH_R1= sheet1.createRow((short)introw);
            XLS_SH_R2= sheet2.createRow((short)introw);
            
            for (short cellnum = (short) 0; cellnum < strHead.length; cellnum++) {
                XLS_SH_R_C1 = XLS_SH_R1.createCell(cellnum);
                XLS_SH_R_C1.setCellValue(strHead[cellnum].toString());
                XLS_SH_R_C1.setCellStyle(headerStyle);
                
                XLS_SH_R_C2 = XLS_SH_R2.createCell(cellnum);
                XLS_SH_R_C2.setCellValue(strHead[cellnum].toString());
                XLS_SH_R_C2.setCellStyle(headerStyle);

            }
            int introw1=introw;
            int introw2=introw;
            for(int i=0;i<arListvalues1.size();i++){
                arGetRows = new ArrayList();
                arGetRows=(ArrayList)arListvalues1.get(i);
                
                if(arGetRows.get(8).toString().equalsIgnoreCase("1")){
                    introw1=introw1+1;
                    XLS_SH_R1 = sheet1.createRow((short)introw1);
                    for(int k=0;k<arGetRows.size();k++){
                        if(k==8){}
                        else{
                            XLS_SH_R_C1 = XLS_SH_R1.createCell((short)(k));
                            if(k==6){
                                strStatus="";
                                if(arGetRows.get(k).toString().equalsIgnoreCase("N"))
                                    strStatus="NO";
                                else
                                    strStatus="YES";
                                XLS_SH_R_C1.setCellValue(strStatus);
                            }
                            else
                                XLS_SH_R_C1.setCellValue(""+arGetRows.get(k));
                        }
                    }
                }
                if(arGetRows.get(8).toString().equalsIgnoreCase("2")){
                    introw2=introw2+1;
                    XLS_SH_R2 = sheet2.createRow((short)introw2);
                    for(int k=0;k<arGetRows.size();k++){
                        if(k==8){}
                        else{
                            XLS_SH_R_C2 = XLS_SH_R2.createCell((short)(k));
                            if(k==6){
								strStatus="YES";
                                XLS_SH_R_C2.setCellValue(strStatus);
                            }
                            else
                                XLS_SH_R_C2.setCellValue(""+arGetRows.get(k));
                        }
                    }
                }
            }
            
        }
        else if(strPage.equalsIgnoreCase("InvoiceSummary")){
            HSSFSheet sheet1 = wb.createSheet("Summary");
            HSSFRow XLS_SH_R1=null;
            HSSFCell XLS_SH_R_C1=null;
        
            for (int i =0; i <numberOfColumns; i++){
                sheet1.setColumnWidth((short) i, (short) ((strHead[i].toString().length() * 14) / (0.05)));
            }
            sheet1.createFreezePane(0,1,0,1);
            int introw=0;            
            XLS_SH_R1= sheet1.createRow((short)introw);
            
            for (short cellnum = (short) 0; cellnum < strHead.length; cellnum++) {
                XLS_SH_R_C1 = XLS_SH_R1.createCell(cellnum);
                XLS_SH_R_C1.setCellValue(strHead[cellnum].toString());
                XLS_SH_R_C1.setCellStyle(headerStyle);
            }
            int introw1=introw;
            
            for(int i=0;i<arListvalues1.size();i++){
                arGetRows = new ArrayList();
                arGetRows=(ArrayList)arListvalues1.get(i);

                introw1=introw1+1;
                XLS_SH_R1 = sheet1.createRow((short)introw1);
                for(int k=0;k<arGetRows.size();k++){
                    XLS_SH_R_C1 = XLS_SH_R1.createCell((short)(k));
                    XLS_SH_R_C1.setCellValue(""+arGetRows.get(k));
                }
            }
        }
        else if(strPage.equalsIgnoreCase("InvoiceDetails")){
            String strSheetName="";
            if(strTransType.equalsIgnoreCase("1"))
                strSheetName="Certificate Details";
            else if(strTransType.equalsIgnoreCase("2"))
                strSheetName="Transfer Owner Details";
            HSSFSheet sheet1 = wb.createSheet(strSheetName);
            HSSFRow XLS_SH_R1=null;
            HSSFCell XLS_SH_R_C1=null;
        
            for (int i =0; i <numberOfColumns; i++){
                sheet1.setColumnWidth((short) i, (short) ((strHead[i].toString().length() * 14) / (0.05)));
            }
            sheet1.createFreezePane(0,1,0,1);
            int introw=0;
            XLS_SH_R1= sheet1.createRow((short)introw);
            
            for (short cellnum = (short) 0; cellnum < strHead.length; cellnum++) {
                XLS_SH_R_C1 = XLS_SH_R1.createCell(cellnum);
                XLS_SH_R_C1.setCellValue(strHead[cellnum].toString());
                XLS_SH_R_C1.setCellStyle(headerStyle);

            }
            int introw1=introw;
            for(int i=0;i<arListvalues1.size();i++){
                arGetRows = new ArrayList();
                arGetRows=(ArrayList)arListvalues1.get(i);
                introw1=introw1+1;
                XLS_SH_R1 = sheet1.createRow((short)introw1);
                for(int k=0;k<arGetRows.size();k++){
                    if(k==8){}
                    else{
                        XLS_SH_R_C1 = XLS_SH_R1.createCell((short)(k));
                        if(k==6){
                            strStatus="";
                            if(strTransType.equalsIgnoreCase("2"))
                                    strStatus="YES";
                            else{
                                if(arGetRows.get(k).toString().equalsIgnoreCase("N"))
                                        strStatus="NO";
                                else
                                        strStatus="YES";
                            }
                            XLS_SH_R_C1.setCellValue(strStatus);
                        }
                        else
                            XLS_SH_R_C1.setCellValue(""+arGetRows.get(k));
                    }
                }
            }
        }


    OutputStream ArrivalFile = res.getOutputStream();

    wb.write(ArrivalFile);
    ArrivalFile.close();
    }
    catch(Exception e)
            {System.out.println(e.getMessage());}
}
%>