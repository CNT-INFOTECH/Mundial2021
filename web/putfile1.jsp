
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="pasotracker.DbConnMngr" %>

<html>
<body>
<%     
            String strId1="";
            String strTest="";
            
            //String str_reggno =(String) session.getAttribute("Regno_str");            
            String REGSEQ=(String) session.getAttribute("ses_REGSEQ");
            if(REGSEQ!=null)  
            {

                
            if(request.getParameter("ImgId")!=null)            
            strId1=request.getParameter("ImgId");

            String strType="";
            
            if(request.getParameter("Type")!=null)
            strType=request.getParameter("Type");                       
           
            InputStream sImageLeft;
            InputStream sImageCenter;
            InputStream sImageright;

            String strID="";
           
            Connection con = null;
            DbConnMngr dbconnection = new DbConnMngr();

            CallableStatement pst = null; 
                                  
try {

     //Resultset rs = null;          
   con = dbconnection.getCon();
    
    pst = con.prepareCall("{call GET_PASOIMAGES(?)}");
    pst.setString(1,strId1);      
    
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
            //sImageLeft = rs.getBinaryStream(2);
            //sImageCenter = rs.getBinaryStream(3);
            //sImageright = rs.getBinaryStream(4);

            response.reset();
            response.setContentType("image/jpeg");
                                            
         if(strType.equals("0"))        
         {             
                byte[] bytearray = new byte[1024];                
                sImageLeft = rs.getBinaryStream(2);
                
        if( sImageLeft!=null && !(sImageLeft.equals("NULL")))                                             
        {              
            try
            {                           
                while(( size=sImageLeft.read(bytearray) )!= -1)                
                
                {
                    //response.getOutputStream().write(bytearray,0,size);
                    servletOutputStream.write(bytearray,0,size);
                }
                
            }
            catch(Exception ex)
            {
                System.out.println("Exception in Type0:"+ex);
            }
       }
        }
                    
        else if(strType.equals("1") )
        {                   
            byte[] bytearray = new byte[1024];        
            sImageCenter = rs.getBinaryStream(3);
            
             if( sImageCenter!=null && !(sImageCenter.equals("NULL")))
            {
            try
            {            
                while((size=sImageCenter.read(bytearray))!= -1)
                {                           
                    //response.getOutputStream().write(bytearray,0,size);
                    servletOutputStream.write(bytearray,0,size);
                }
            }
            catch(Exception ex)
            {
                System.out.println("Exception in Type1:"+ex);
            }
        }
    }
       else if(strType.equals("2") )
     {         
           byte[] bytearray = new byte[1024];        
           sImageright = rs.getBinaryStream(4);
                     
       if(sImageright!=null && !(sImageright.equals("NULL")))
       {                 
            try
            {                                                                                    
                while((size=sImageright.read(bytearray))!= -1)
                {                                             
                    //response.getOutputStream().write(bytearray,0,size);
                    servletOutputStream.write(bytearray,0,size);
                }
            }
            catch(Exception ex)
            {
                System.out.println("Exception in Type2:"+ex);
            }
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
    out.println ( e);
    }   
   }

%>
</td></tr>
</table>

</body>
</html>
