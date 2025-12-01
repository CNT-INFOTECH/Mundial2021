<%-- 
    Document   : frmCommonExcel
    Created on : Jul 7, 2016, 3:12:32 PM
    Author     : cntuser
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.apache.poi.hssf.util.Region"%>
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
<%@page import="javax.sql.rowset.*"%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
    String PageId = "";
    String strUserName = "";
    String filename = "";
    String header = "";
    DbConnMngr dbconnection = new DbConnMngr();
    Connection con = null;
    CallableStatement pst = null;
    ResultSet rs_SelectSet = null;
    PreparedStatement preparedStatement = null;
    ArrayList arRow = new ArrayList();
    ArrayList arExcelValues = new ArrayList();

    String strShwSeq = "";
    String strEvntSeq = "";

    if (request.getParameter("PAGEID") != null) {
        PageId = request.getParameter("PAGEID");
    }

    try {
        if (PageId.equalsIgnoreCase("ShowSummary")) {
            String strMembershipCreatedDt = "";
            String strMembershipCreatedDtTo = "";
             RowSetFactory factory2crrs = RowSetProvider.newFactory();
   CachedRowSet crrs= factory2crrs.createCachedRowSet();
            //CachedRowSetImpl crrs = new CachedRowSetImpl();

            if (request.getParameter("ShowSeq") != null) {
                strShwSeq = request.getParameter("ShowSeq");
            }

            if (request.getParameter("EventSeq") != null) {
                strEvntSeq = request.getParameter("EventSeq");
            }

            if (session.getAttribute("user") != null) {
                strUserName = (String) session.getAttribute("user");
            }

            con = dbconnection.getCon();
            pst = con.prepareCall("{call GET_SHOW_EVENT_SUMMARY(?,?)}");
            pst.setString(1, strShwSeq);
            pst.setString(2, strEvntSeq);
            rs_SelectSet = pst.executeQuery();
            crrs.populate(rs_SelectSet);

            if (crrs.size() > 0) {
                while (crrs.next()) {
                    arRow = new ArrayList();

                    if (crrs.getString("Event_Order") != null) {
                        arRow.add(crrs.getString("Event_Order"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("Event_Date") != null) {
                        arRow.add(crrs.getString("Event_Date"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("Show_Name") != null) {
                        arRow.add(crrs.getString("Show_Name"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("Show_Place") != null) {
                        arRow.add(crrs.getString("Show_Place"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("Name") != null) {
                        arRow.add(crrs.getString("Name"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("Registration_Num") != null) {
                        arRow.add(crrs.getString("Registration_Num"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("HORSE_PRIMARYNAME") != null) {
                        arRow.add(crrs.getString("HORSE_PRIMARYNAME"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("MICROCHIP_NUM") != null) {
                        arRow.add(crrs.getString("MICROCHIP_NUM"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("HORSE_COLOR") != null) {
                        arRow.add(crrs.getString("HORSE_COLOR"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("Gender") != null) {
                        arRow.add(crrs.getString("Gender"));
                    } else {
                        arRow.add("");
                    }
                    

                    if (crrs.getString("HORSE_DOB") != null) {
                        arRow.add(crrs.getString("HORSE_DOB"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("AssignedNum") != null) {
                        arRow.add(crrs.getString("AssignedNum"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("Sire") != null) {
                        arRow.add(crrs.getString("Sire"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("Sire_RegNum") != null) {
                        arRow.add(crrs.getString("Sire_RegNum"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("Dam") != null) {
                        arRow.add(crrs.getString("Dam"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("Dam_RegNum") != null) {
                        arRow.add(crrs.getString("Dam_RegNum"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("OwnerID") != null) {
                        arRow.add(crrs.getString("OwnerID"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("OwnerName") != null) {
                        arRow.add(crrs.getString("OwnerName"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("BreederID") != null) {
                        arRow.add(crrs.getString("BreederID"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("BreederName") != null) {
                        arRow.add(crrs.getString("BreederName"));
                    } else {
                        arRow.add("");
                    }
                    
                    
                    if (crrs.getString("Placement") != null) {
                        arRow.add(crrs.getString("Placement"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("J1Pos") != null) {
                        arRow.add(crrs.getString("J1Pos"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("J2Pos") != null) {
                        arRow.add(crrs.getString("J2Pos"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("J3Pos") != null) {
                        arRow.add(crrs.getString("J3Pos"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("J4Pos") != null) {
                        arRow.add(crrs.getString("J4Pos"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("J5Pos") != null) {
                        arRow.add(crrs.getString("J5Pos"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("RiderID_Only") != null) {
                        arRow.add(crrs.getString("RiderID_Only"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("RiderName") != null) {
                        arRow.add(crrs.getString("RiderName"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("RepCountry") != null) {
                        arRow.add(crrs.getString("RepCountry"));
                    } else {
                        arRow.add("");
                    }

                    arExcelValues.add(arRow);
                }
            }
            header = "Event#    ,Event Date	, Show Name	, Show Place	,Event Name		, HorseReg#        ,Horse Name              ,Microchip#         ,Horse Color , Gender	, Horse Dob     ,AssignedNum	,Sire               ,Sire Reg#	,Dam                ,Dam Reg#         , OwnerID        ,Owner Name                  ,BreederID	, BreederName	,Placement      ,J1Pos          ,J2Pos    ,J3Pos            ,J4Pos	,J5Pos	,RiderID	,RiderName                  ,RepresentCountry         ";
            filename = "Show Summary";            //File Name for excel creation name
            processExcelCreationArrayList(request, response, header, filename, arExcelValues, "");
        }
        else if (PageId.equalsIgnoreCase("AlphaHrsList")) {
           
         //   CachedRowSetImpl crrs = new CachedRowSetImpl();
  RowSetFactory factory22crrs = RowSetProvider.newFactory();
   CachedRowSet crrs= factory22crrs.createCachedRowSet();
            if (request.getParameter("ShowsSeq") != null) {
                strShwSeq = request.getParameter("ShowsSeq");
            }

            con = dbconnection.getCon();
            pst = con.prepareCall("{call Get_AlphaHorseListing(?)}");
            pst.setString(1, strShwSeq);           
            rs_SelectSet = pst.executeQuery();
            crrs.populate(rs_SelectSet);

            if (crrs.size() > 0) {
                while (crrs.next()) {
                    arRow = new ArrayList();

                    if (crrs.getString("HorseName") != null) {
                        arRow.add(crrs.getString("HorseName"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("HrsCount") != null) {
                        arRow.add(crrs.getString("HrsCount"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("Event_Order") != null) {
                        arRow.add(crrs.getString("Event_Order"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("Name") != null) {
                        arRow.add(crrs.getString("Name"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("Rider") != null) {
                        arRow.add(crrs.getString("Rider"));
                    } else {
                        arRow.add("");
                    }

                    if (crrs.getString("RepCountry") != null) {
                        arRow.add(crrs.getString("RepCountry"));
                    } else {
                        arRow.add("");
                    }
                    
                    arExcelValues.add(arRow);
                }
            }
            header = " HorseName                , HrsCount      , Event#        , EventName		, Rider                         ,RepresentCountry             ";
            filename = "AlphaHorseListing";            //File Name for excel creation name
            processExcelCreationArrayList(request, response, header, filename, arExcelValues, "");
        }
        //processExcelCreationMetaData(request,response,filename,rs_SelectSet);   //For calling the excel method with resultset metadata
    } catch (Exception e) {
        System.out.println(e.getMessage());
    } finally {
        if (rs_SelectSet != null) {
            rs_SelectSet.close();
        }
        if (pst != null) {
            pst.close();
        }
        if (con != null) {
            con.close();
        }
    }
%>
<%!
    public void processExcelCreationMetaData(HttpServletRequest req, HttpServletResponse res, String filename, ResultSet resultSet) {
        try {
            System.out.println("inside the excel creation");
            ResultSetMetaData rsMetaData = resultSet.getMetaData();
            int numberOfColumns = rsMetaData.getColumnCount();
            HSSFWorkbook wb = new HSSFWorkbook();
            res.setContentType("application/vnd.ms-excel");
            res.setHeader("Content-Disposition", "attachment;filename=" + filename + ".xls");
            HSSFSheet sheet = wb.createSheet(filename);
            HSSFCellStyle headerStyle = wb.createCellStyle();
            HSSFFont headerFont = wb.createFont();
            headerFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
            headerStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
            headerStyle.setFillForegroundColor(HSSFColor.PALE_BLUE.index);
            headerStyle.setFillBackgroundColor(HSSFColor.WHITE.index);
            headerStyle.setFont(headerFont);
            HSSFCellStyle Datestyle = wb.createCellStyle();
            Datestyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("mm/dd/yyyy"));
            HSSFRow XLS_SH_R = null;
            HSSFCell XLS_SH_R_C = null;

            XLS_SH_R = sheet.createRow((short) 0);

            sheet.createFreezePane(0, 1, 0, 1);

            int j = 0;
            if (resultSet.next()) {
                for (int i = 1; i <= numberOfColumns; i++) {
                    XLS_SH_R_C = XLS_SH_R.createCell((short) j);
                    XLS_SH_R_C.setCellStyle(headerStyle);
                    XLS_SH_R_C.setCellValue("" + rsMetaData.getColumnName(i).trim());
                    j++;
                }
            }
            int introw = 0;
            do {
                introw = introw + 1;
                XLS_SH_R = sheet.createRow((short) introw);
                String st1 = "";

                for (int k = 1; k <= numberOfColumns; k++) {
                    st1 = "";
                    XLS_SH_R_C = XLS_SH_R.createCell((short) (k - 1));
                    st1 = "" + resultSet.getString(k);

                    if (!st1.equals("null")) {
                        XLS_SH_R_C.setCellValue(st1);
                    } else {
                        XLS_SH_R_C.setCellValue("");
                    }
                }
            } while (resultSet.next());
            OutputStream ArrivalFile = res.getOutputStream();

            wb.write(ArrivalFile);
            ArrivalFile.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void processExcelCreationArrayList(HttpServletRequest req, HttpServletResponse res, String header, String filename, ArrayList values, String strAlVal) {
        String strEnty = "";
        String strYear = "";
        String strFronDt = "";
        String strToDt = "";
        String Placement = "";
        String type = "";
        String id = "";
        String name = "";
        String date = "";
        String point = "";
        String[] strSplit;
        try {
//                String header=req.getParameter("header");
//                String filename=req.getParameter("filename");
            System.out.println("inside the excel creation method");
            System.out.println("the header value " + header);
            System.out.println("the filename value " + filename);
            //                ArrayList values=(ArrayList)req.getAttribute("excelvalues");
            String[] strHead = header.split(",");

            //ResultSetMetaData rsMetaData = crs.getMetaData();
            ArrayList arGetRows = new ArrayList();

            int numberOfColumns = strHead.length;
            HSSFWorkbook wb = new HSSFWorkbook();

            res.setContentType("application/vnd.ms-excel");
            res.setHeader("Content-Disposition", "attachment;filename=" + filename + ".xls");
            HSSFSheet sheet = wb.createSheet(filename);

            HSSFCellStyle headerStyle = wb.createCellStyle();
            HSSFCellStyle headerStyleTH = wb.createCellStyle();
            HSSFCellStyle headerStyleTB = wb.createCellStyle();
            HSSFFont headerFont = wb.createFont();
            headerFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);

            headerStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
            headerStyle.setFillForegroundColor(HSSFColor.PALE_BLUE.index);
            headerStyle.setFillBackgroundColor(HSSFColor.WHITE.index);
            headerStyle.setFont(headerFont);
            headerStyleTH.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
            headerStyleTH.setFillForegroundColor(HSSFColor.LIGHT_BLUE.index);
            headerStyleTH.setFillBackgroundColor(HSSFColor.OLIVE_GREEN.index);
            headerStyleTH.setAlignment(headerStyleTH.ALIGN_CENTER);
            headerStyleTH.setFont(headerFont);
            headerStyleTB.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
            headerStyleTB.setFillForegroundColor(HSSFColor.LIGHT_GREEN.index);
            headerStyleTB.setAlignment(headerStyleTB.ALIGN_CENTER);
            headerStyleTB.setFont(headerFont);
//            headerStyleTH.setBorderBottom(HSSFCellStyle.BORDER_MEDIUM);
//            headerStyleTH.setBorderTop(HSSFCellStyle.BORDER_MEDIUM);
//            headerStyleTH.setBorderRight(HSSFCellStyle.BORDER_MEDIUM);
//            headerStyleTH.setBorderLeft(HSSFCellStyle.BORDER_MEDIUM);
//            headerStyleTB.setBorderBottom(HSSFCellStyle.BORDER_MEDIUM);
//            headerStyleTB.setBorderTop(HSSFCellStyle.BORDER_MEDIUM);
//            headerStyleTB.setBorderRight(HSSFCellStyle.BORDER_MEDIUM);
//            headerStyleTB.setBorderLeft(HSSFCellStyle.BORDER_MEDIUM);

            HSSFCellStyle Datestyle = wb.createCellStyle();
            Datestyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("mm/dd/yyyy"));

            HSSFRow XLS_SH_R = null;
            HSSFCell XLS_SH_R_C = null;
            int introw = 0;
            for (int i = 0; i < numberOfColumns; i++) {
                sheet.setColumnWidth((short) i, (short) ((strHead[i].toString().length() * 14) / (0.05)));
            }

            XLS_SH_R = sheet.createRow((short) 0);
            int j = 0;
            for (int i = 0; i < numberOfColumns; i++) {
                XLS_SH_R_C = XLS_SH_R.createCell((short) j);
                XLS_SH_R_C.setCellStyle(headerStyle);
                // XLS_SH_R_C.setCellValue(""+rsMetaData.getColumnName(i).trim());strHead
                XLS_SH_R_C.setCellValue("" + strHead[i].toString());
                j++;
            }
            //introw=0;
            for (int i = 0; i < values.size(); i++) {
                arGetRows = new ArrayList();
                arGetRows = (ArrayList) values.get(i);
                introw = introw + 1;
                XLS_SH_R = sheet.createRow((short) introw);
                String st1 = "";

                for (int k = 0; k < arGetRows.size(); k++) {
                    st1 = "";
                    XLS_SH_R_C = XLS_SH_R.createCell((short) (k));
                    //XLS_SH_R_C.setCellValue(""+rs1.getString(k));
                    st1 = "" + arGetRows.get(k);

                    if (!st1.equals("null")) {
                        XLS_SH_R_C.setCellValue(st1);
                    } else {
                        XLS_SH_R_C.setCellValue("");
                    }
                    //sheet.autoSizeColumn((short)k);
                }
            }

            OutputStream ArrivalFile = res.getOutputStream();

            wb.write(ArrivalFile);
            ArrivalFile.close();
        } catch (Exception e) {
        }
    }

    public void processExcelCreationArrayListFormated(HttpServletRequest req, HttpServletResponse res, String header, String filename, ArrayList values) {
        try {
//                String header=req.getParameter("header");
//                String filename=req.getParameter("filename");
            System.out.println("inside the excel creation method");
            System.out.println("the header value " + header);
            System.out.println("the filename value " + filename);
            //                ArrayList values=(ArrayList)req.getAttribute("excelvalues");
            String[] strHead = header.split(",");
            //ResultSetMetaData rsMetaData = crs.getMetaData();
            ArrayList arGetRows = new ArrayList();

            int numberOfColumns = strHead.length;
            HSSFWorkbook wb = new HSSFWorkbook();

            res.setContentType("application/vnd.ms-excel");
            res.setHeader("Content-Disposition", "attachment;filename=" + filename + ".xls");
            HSSFSheet sheet = wb.createSheet(filename);

            HSSFCellStyle headerStyle = wb.createCellStyle();
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

            HSSFCellStyle Datestyle = wb.createCellStyle();
            Datestyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("mm/dd/yyyy"));

            HSSFRow XLS_SH_R = null;
            HSSFCell XLS_SH_R_C = null;
            for (int i = 0; i < numberOfColumns; i++) {
                sheet.setColumnWidth((short) i, (short) ((strHead[i].toString().length() * 14) / (0.05)));
            }

            XLS_SH_R = sheet.createRow((short) 0);
            sheet.createFreezePane(0, 1);

        //sheet.createFreezePane(0,1,0,1);
            int j = 0;
            for (int i = 0; i < numberOfColumns; i++) {
                XLS_SH_R_C = XLS_SH_R.createCell((short) j);
                XLS_SH_R_C.setCellStyle(headerStyle);
                // XLS_SH_R_C.setCellValue(""+rsMetaData.getColumnName(i).trim());strHead
                XLS_SH_R_C.setCellValue("" + strHead[i].toString());
                j++;
            }
            int introw = 0;
            for (int i = 0; i < values.size(); i++) {
                arGetRows = new ArrayList();
                arGetRows = (ArrayList) values.get(i);
                introw = introw + 1;
                XLS_SH_R = sheet.createRow((short) introw);
                String st1 = "";

                for (int k = 0; k < arGetRows.size(); k++) {
                    st1 = "";
                    XLS_SH_R_C = XLS_SH_R.createCell((short) (k));
                    //XLS_SH_R_C.setCellValue(""+rs1.getString(k));
                    st1 = "" + arGetRows.get(k);

                    if (k == 7 || k == 12) {
                        XLS_SH_R_C.setCellStyle(headerStyle);
                    }

                    if (!st1.equals("null")) {
                        XLS_SH_R_C.setCellValue(st1);
                    } else {
                        XLS_SH_R_C.setCellValue("");
                    }
                    //sheet.autoSizeColumn((short)k);
                }
            }

            OutputStream ArrivalFile = res.getOutputStream();

            wb.write(ArrivalFile);
            ArrivalFile.close();
        } catch (Exception e) {
            System.out.println("Exception in frmCommonExcel in creating excel" + e);
        }
    }
%>