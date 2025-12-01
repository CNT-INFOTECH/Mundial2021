<%-- 
    Document   : regsearchpopup_include
    Created on : Apr 28, 2011, 3:46:48 PM
    Author     : Erzath
--%>

<html>
<style type="text/css">
<!--
@import url("CommonTableStyle.css");
-->
</style>
    <body>
        
        <%@ page import="java.util.*" %>
        <%@ page import="java.io.*" %>
        <%@ page import="java.sql.*" %>
        <%@ page import="javax.sql.rowset.*" %>
        <%@ page import="pasotracker.DBConnection" %>
        <%@ page import="pasotracker.GeneralServlet" %>
        
      <form name="frmPedigree_DamSearchPopupInclude" method="post">  
        <%@ include file="frmPedigree_DamSearchPopup.jsp" %>
        <div id="wrapper1">
<%
try{        
            String REGSEQ=request.getParameter("HdnRegSeq");
            String str_Reg_no = request.getParameter("regno");
            String strHor_PName = request.getParameter("hor_name");
            String strHor_DOB = request.getParameter("dob");
            
            GeneralServlet gen=new GeneralServlet();
             RowSetFactory factory24 = RowSetProvider.newFactory();
   CachedRowSet crsGetHorseDetails= factory24.createCachedRowSet();
           // CachedRowSetImpl crsGetHorseDetails = new CachedRowSetImpl();
            
            crsGetHorseDetails = gen.GetHorseDetails(REGSEQ,str_Reg_no,strHor_PName,strHor_DOB,"","","","");
            
            %>
        
             <table width="100%" border="0" align="center" id="gradient-style" title="SEARCH">
                 <tr>
                    <th>REGISTRATION#</th>
                    <th>HORSE NAME</th>                
                    <th>HORSE DOB</th>
                </tr>
<%
   
                String str_Reg_no1="";
                String strHor_PName1="";
                String strHor_DOB1="";
                
                      
            while(crsGetHorseDetails.next())
            {
                str_Reg_no1="";
                strHor_PName1="";
                strHor_DOB1="";
   
                
            if(crsGetHorseDetails.getString("REGISTRATION_NUM")!=null)                  
                str_Reg_no1= crsGetHorseDetails.getString("REGISTRATION_NUM");  

            if(crsGetHorseDetails.getString("HORSE_PRIMARYNAME")!=null)                     
                strHor_PName1= crsGetHorseDetails.getString("HORSE_PRIMARYNAME");  


            if(crsGetHorseDetails.getString("HORSE_DOB")!=null)                  
                strHor_DOB1= crsGetHorseDetails.getString("HORSE_DOB");  

            String  strValues = str_Reg_no1 + strHor_PName1 + strHor_DOB1;

%>
<tr>
    <td>
        <% out.println(str_Reg_no1);%>
    </td>
    <td>
        <% out.println(strHor_PName1);%>
    </td>
    <td>
        <% out.println(strHor_DOB1);%>
    </td>
    <td>
        <input type="checkbox" name="value_selected"  onclick="return_DamValues('<%=str_Reg_no1%>')" />
    </td>
    
    
</tr>



<%                                         
                 
            }          
          
          } 
            catch (Exception e) {
            System.err.println("Got an exception! ");
            System.err.println("+++++"+e);
        } 
%>
       
            
            
            
        </table>
    </div>
    </form>
    </body>
</html>
