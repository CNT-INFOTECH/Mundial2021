<%@ page import = "model.GetInterface" %>
<%@ page import = "java.util.*" %>
 <%
          String strcity=request.getParameter("City");
          String strState=request.getParameter("State");
          String strZip=request.getParameter("Zip");

          GetInterface GUI=new GetInterface();
          List LiValues= GUI.GetCityStateZip(strcity,strState,strZip,"");

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
           else if(RecSize>1)
              out.println(2);
%>
 
