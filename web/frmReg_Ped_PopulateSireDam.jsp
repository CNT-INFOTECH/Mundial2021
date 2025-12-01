<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.GeneralServlet" %>  
 <%
    String strSireSeq=request.getParameter("SireSeqNo");
    String strDamSeq=request.getParameter("DamSeqNo");          
    String strSrch=request.getParameter("Srch");          

    String Sire_1_Seq="";
    String Dam_1_Seq="";
    String Sire_1RegNum="";
    String Dam_1RegNum="";
    String Sire_1Name="";
    String Dam_1Name="";
    String Sire_1OrgSeq="";
    String Sire_1OrgName="";
    String Dam_1OrgSeq="";
    String Dam_1OrgName="";

    String Sire_1_2_Seq="";
    String Dam_1_2_Seq="";
    String Sire_1_2RegNum="";
    String Dam_1_2RegNum="";
    String Sire_1_2Name="";
    String Dam_1_2Name="";
    String Sire_1_2OrgSeq="";
    String Sire_1_2OrgName="";
    String Dam_1_2OrgSeq="";
    String Dam_1_2OrgName="";
          
    List LiValues = new ArrayList();                                  
    GeneralServlet gen=new GeneralServlet();
     RowSetFactory factory2 = RowSetProvider.newFactory();
   CachedRowSet crsGetSireDetails= factory2.createCachedRowSet();
   // CachedRowSetImpl crsGetSireDetails = new CachedRowSetImpl();
        
    if(strSrch.equals("SIRE"))
    crsGetSireDetails=gen.GET_SIRE(strSireSeq,"","","","","","","");

    if(strSrch.equals("DAM"))
    crsGetSireDetails=gen.GET_DAM(strDamSeq,"","","","","","","");
    
    ArrayList ArRow=new ArrayList();
    while (crsGetSireDetails.next())
    {

        ArRow=new ArrayList();
        
        if(crsGetSireDetails.getString("SIRE")!=null)
            ArRow.add(Sire_1_Seq= crsGetSireDetails.getString("SIRE").trim());
        else 
            ArRow.add("");

        if(crsGetSireDetails.getString("DAM")!=null)
            ArRow.add(Dam_1_Seq= crsGetSireDetails.getString("DAM").trim());
        else 
            ArRow.add("");
            

        if(crsGetSireDetails.getString("SIRE_REGISTRATION_NUM")!=null)
            ArRow.add(Sire_1RegNum= crsGetSireDetails.getString("SIRE_REGISTRATION_NUM").trim());
        else 
            ArRow.add("");

        if(crsGetSireDetails.getString("DAM_REGISTRATION_NUM")!=null)
            ArRow.add(Dam_1RegNum= crsGetSireDetails.getString("DAM_REGISTRATION_NUM").trim());
        else 
            ArRow.add("");

        if(crsGetSireDetails.getString("SIRENAME")!=null)
            ArRow.add(Sire_1Name= crsGetSireDetails.getString("SIRENAME").trim());
        else 
            ArRow.add("");

        if(crsGetSireDetails.getString("DAMNAME")!=null)
            ArRow.add(Dam_1Name= crsGetSireDetails.getString("DAMNAME").trim());
        else 
            ArRow.add("");

        if(crsGetSireDetails.getString("SIRE_ORGANISATION")!=null)                  
            ArRow.add(Sire_1OrgName= crsGetSireDetails.getString("SIRE_ORGANISATION").trim());
        else 
            ArRow.add("");

        if(crsGetSireDetails.getString("SIRE_ORGANISATION_SEQ")!=null)                  
            ArRow.add(Sire_1OrgSeq= crsGetSireDetails.getString("SIRE_ORGANISATION_SEQ").trim());
        else 
            ArRow.add("");

        if(crsGetSireDetails.getString("DAM_ORGANISATION")!=null)                  
            ArRow.add(Dam_1OrgName= crsGetSireDetails.getString("DAM_ORGANISATION").trim());
        else 
            ArRow.add("");

        if(crsGetSireDetails.getString("DAM_ORGANISATION_SEQ")!=null)                  
            ArRow.add(Dam_1OrgSeq= crsGetSireDetails.getString("DAM_ORGANISATION_SEQ").trim());
        else 
            ArRow.add("");
                   
        LiValues.add(ArRow);
    }
    int RecSize=LiValues.size();
    
    if(RecSize==0)    
         out.println(0);
    
    else if(RecSize==1)
    {
        ArrayList AlRow=(ArrayList)LiValues.get(0);
        for(int i=0;i <AlRow.size();i++)
        {
        String strValue="";
        if(AlRow.get(i)!=null)
            strValue=AlRow.get(i).toString();
        out.print(strValue.trim()+"#@#");
        }
    }
    /*
    else if(RecSize>1)
      out.println(2);
    */
%>
 