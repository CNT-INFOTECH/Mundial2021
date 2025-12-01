<%@ page import = "java.util.Iterator"%>
<%@ page import = "java.util.List"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.sql.*" %>
<%@ page import =  "model.*" %>
<%
        GetInterface GUI=new GetInterface();
        List LiValues= GUI.GetCommonRefValues("Judge",null,null);
        ArrayList ArShow=new ArrayList();
        try
        {
            for (int i=0;i < LiValues.size(); i++)
            {
                ArrayList ArRow=new ArrayList();
                ArRow=(ArrayList)LiValues.get(i);
                ArShow.add(ArRow.get(2)+"#@#"+ArRow.get(0));

            }
        }
        catch(Exception ex)
        {
            System.out.println("release:");
        }
        String [] ShowList = (String[])ArShow.toArray(new String[ArShow.size()]);


	String query = (String)request.getParameter("q");
	response.setHeader("Content-Type", "text/html");

	int cnt=1;
	for(int i=0;i<ShowList.length;i++)
	{
		if(ShowList[i].toUpperCase().startsWith(query.toUpperCase()))
		{
			out.print(ShowList[i]+"\n");
			//if(cnt>=20)
			//	break;
			cnt++;
		}
	}
%>