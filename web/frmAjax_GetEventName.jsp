<%@ page import = "model.GetInterface" %>
<%@ page import = "java.util.*" %>
 <%
          String strShowSeq=request.getParameter("ShowSeq");
          String strEventOrder=request.getParameter("EventOrder");


          GetInterface GUI=new GetInterface();
          HashMap LiValues= GUI.GetEventName_By_EventOrder(strShowSeq,strEventOrder);

          String strOutput="";


            if(LiValues.get("Event_Seq")!=null)
                strOutput+=""+LiValues.get("Event_Seq");
            strOutput+="#@#";

            if(LiValues.get("Name")!=null)
                strOutput+=""+LiValues.get("Name");
            
            out.print(strOutput);
                 

%>
