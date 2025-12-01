<%-- 
    Document   : Shows_Deviation_List
    Created on : Jun 30, 2011, 4:45:41 PM
    Author     : CNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PASO TRACKER</title>
         <link rel="stylesheet" href="Shows_Pop.css">
        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
        <link href="buttons.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
 <%@ page import = "model.GetInterface" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>


 <%
String strSearchMode=request.getParameter("mode");
String strShowSeq=request.getParameter("ShowSeq");
String strEventSeq=request.getParameter("EventSeq");
String strJudgeSeq=request.getParameter("JudgeSeq");
DecimalFormat df = new DecimalFormat("#.##");
String strEventOrder="";

if(strSearchMode!=null && strSearchMode.equals("0") )
 {

            GetInterface GUI=new GetInterface();
     // This is to get the JudgeNames and Events
            List LiValues= GUI.GetDeviationReport(strShowSeq,strJudgeSeq,strEventSeq,1);
  if(LiValues.size() > 0)
   {
     // This is to get the actual Points and Events
            List LiValues2= GUI.GetDeviationReport(strShowSeq,strJudgeSeq,strEventSeq,2);

     
          
            ArrayList AlEvents=new ArrayList();
            ArrayList AlEventsOrder=new ArrayList();

            HashMap HmVal=new HashMap(); //This will Contain + EventSeq+JudgeNum ,JudgeName
            HashMap HmVal2=new HashMap(); // This will Contain JudgeName, Deviation(H3)
            HashMap HmVal3=new HashMap(); // This will Contain + EventSeq+JudgeNum ,Deviation
            HashMap HmVal4=new HashMap(); // This will Contain + EventSeq+JudgeNum ,Deviation
            int J1Deviation=0;
            int J2Deviation=0;
            int J3Deviation=0;
            int J4Deviation=0;
            int J5Deviation=0;
            String strChkEventSeq2="";

             for (int i=0 ; i < LiValues2.size(); i++)
             {
                 ArrayList AlGetRows=(ArrayList)LiValues2.get(i);
                 strEventSeq=""+AlGetRows.get(0);

                  if(i==0)
                     strChkEventSeq2=strEventSeq;
                 
                   if(!strEventSeq.equals(strChkEventSeq2))
                   {
                        HmVal3.put(strChkEventSeq2+"J1",J1Deviation);
                        HmVal3.put(strChkEventSeq2+"J2",J2Deviation);
                        HmVal3.put(strChkEventSeq2+"J3",J3Deviation);
                        HmVal3.put(strChkEventSeq2+"J4",J4Deviation);
                        HmVal3.put(strChkEventSeq2+"J5",J5Deviation);
                       
                        J1Deviation=0;
                        J2Deviation=0;
                        J3Deviation=0;
                        J4Deviation=0;
                        J5Deviation=0;
                        strChkEventSeq2=strEventSeq;
                       
                    }

                  if(!AlGetRows.get(1).equals(""))
                    J1Deviation+=Integer.parseInt(""+AlGetRows.get(1));
                  if(!AlGetRows.get(2).equals(""))
                    J2Deviation+=Integer.parseInt(""+AlGetRows.get(2));
                  if(!AlGetRows.get(3).equals(""))
                    J3Deviation+=Integer.parseInt(""+AlGetRows.get(3));
                  if(!AlGetRows.get(4).equals(""))
                    J4Deviation+=Integer.parseInt(""+AlGetRows.get(4));
                  if(!AlGetRows.get(5).equals(""))
                    J5Deviation+=Integer.parseInt(""+AlGetRows.get(5));

               

            }

                        HmVal3.put(strEventSeq+"J1",J1Deviation);
                        HmVal3.put(strEventSeq+"J2",J2Deviation);
                        HmVal3.put(strEventSeq+"J3",J3Deviation);
                        HmVal3.put(strEventSeq+"J4",J4Deviation);
                        HmVal3.put(strEventSeq+"J5",J5Deviation);






            String strChkEventSeq="";
            for (int i=0 ; i < LiValues.size(); i++)
             {
                 ArrayList AlGetRows=(ArrayList)LiValues.get(i);
                 strEventSeq=""+AlGetRows.get(0);
                 strEventOrder=""+AlGetRows.get(5);

                 HmVal.put(strEventSeq+"J"+AlGetRows.get(2),  AlGetRows.get(3)+"@#@"+AlGetRows.get(1));
                 HmVal.put(strEventSeq,AlGetRows.get(4));
                 HmVal2.put(strEventSeq+HmVal.get(strEventSeq+"J"+AlGetRows.get(2)),HmVal3.get(strEventSeq+"J"+AlGetRows.get(2)));
                 HmVal4.put(strEventSeq,strEventOrder);


                 if(i==0)
                     strChkEventSeq=strEventSeq;

                  if(!strEventSeq.equals(strChkEventSeq))
                   {
                      AlEvents.add(strChkEventSeq);
                      strChkEventSeq=strEventSeq;
                    }
                  AlEventsOrder.add(strEventOrder);
             }
             AlEvents.add(strEventSeq);
             
            
             ArrayList arrayList1 = new ArrayList();


              for(int evnts=0 ; evnts < AlEvents.size();evnts++)
              {

                  if(HmVal.get(AlEvents.get(evnts)+"J1")!=null)
                     arrayList1.add(HmVal.get(AlEvents.get(evnts)+"J1"));
                   if(HmVal.get(AlEvents.get(evnts)+"J2")!=null)
                     arrayList1.add(HmVal.get(AlEvents.get(evnts)+"J2"));
                   if(HmVal.get(AlEvents.get(evnts)+"J3")!=null)
                     arrayList1.add(HmVal.get(AlEvents.get(evnts)+"J3"));
                   if(HmVal.get(AlEvents.get(evnts)+"J4")!=null)
                     arrayList1.add(HmVal.get(AlEvents.get(evnts)+"J4"));
                   if(HmVal.get(AlEvents.get(evnts)+"J5")!=null)
                     arrayList1.add(HmVal.get(AlEvents.get(evnts)+"J5"));
               

              }

             
             HashSet hashSet = new HashSet(arrayList1);
            ArrayList arrayList2 = new ArrayList(hashSet) ;
            
            HashSet hashSet1 = new HashSet(AlEventsOrder);
            ArrayList arrayList3 = new ArrayList(hashSet1) ;

             Collections.sort(arrayList2);
             Collections.sort(arrayList3);
			   double intTDWidth=(500/(arrayList2.size()));

// Headers
%>
<table summary="" cellpadding="0" cellspacing="1" align="center"   title="" border="0"  width="100%">
<tr>
<td>

<table summary="" cellpadding="0" cellspacing="0"  width="100%" align="center" border="0" >
    <tr>
        <th class="Grid_Header" style="border:1px solid #D9D5BE;text-align: center"  width='30px'>#</th>
         <th Class="Grid_Header" style="border:1px solid #D9D5BE;text-align: center" width=200px>EVENT NAME</th>
    <%
              for(int evnts=0 ; evnts < arrayList2.size();evnts++)
              {
                    String strJudgeName=""+arrayList2.get(evnts);
                    String[] _strJudgeName=strJudgeName.split("@#@");
              %>
              <th Class="Grid_Header" style="border:1px solid #D9D5BE;text-align: center" width=<%=intTDWidth%> ><%=_strJudgeName[0]%></th>
                
              <%}%>
   </tr>
    </table>
</td>
</tr>
<tr>
<td>
 <div style="width:auto; overflow:auto;height:auto;">
 <table summary="" cellpadding="0" cellspacing="0"  width="100%" align="center" border="0" style="table-layout: fixed;">
<%
               
              String[][] strFinalMatrix=new String[AlEvents.size()][arrayList2.size()];
              for(int evnts=0 ; evnts < AlEvents.size();evnts++)
              { 
                  
                    //String strEveOrd = ""+AlEventsOrder.get(evnts);
        %>
                <tr>
               
                <td style="border:1px solid #D9D5BE" align="center" width='30px'><%=HmVal4.get(AlEvents.get(evnts))%></td>
                <td style="border:1px solid #D9D5BE" width=200px><%=HmVal.get(AlEvents.get(evnts))%></td>
                 <% for(int evnts1=0 ; evnts1 < arrayList2.size();evnts1++)
                  {
                     
                      if(HmVal2.get(AlEvents.get(evnts)+""+arrayList2.get(evnts1))!=null)
                      {
                            
                            strFinalMatrix[evnts][evnts1]=""+HmVal2.get(AlEvents.get(evnts)+""+arrayList2.get(evnts1));
                            %>
                          <td style="border:1px solid #D9D5BE;text-align: center" width=<%=intTDWidth%> > <%=HmVal2.get(AlEvents.get(evnts)+""+arrayList2.get(evnts1))%></td>
                         
                      <%}else{
                            strFinalMatrix[evnts][evnts1]="X";
                           %>
                            <td style="border:1px solid #D9D5BE;text-align: center" width=<%=intTDWidth%> ><font color="Red"><b>X</b></font></td>
                        <%}

                  }%>
                  </tr>

              <%}%>

              
   <tfoot>
   <tr bgcolor="#CCCC99">
       <td style="border:1px solid #D9D5BE;text-align: center" colspan='2'><font size="2"><b>TOTAL</b></font></td>
    <%
      int inTotal=0;
      String strVal="0";
      for(int i=0;i<arrayList2.size();i++) {
        inTotal=0;
       for(int j=0;j<AlEvents.size();j++)
       { 
           if(strFinalMatrix[j][i].equals("X"))
             strVal="0";
           else
             strVal=strFinalMatrix[j][i];

        inTotal+=Integer.parseInt(strVal);}%>
       <td style="border:1px solid #D9D5BE;text-align: center"><%=inTotal%> </td>
    <%
			}%>
   </tr>
  

<tr bgcolor="#CCCC99">
    <td style="border:1px solid #D9D5BE;text-align: center" colspan='2'><font size="2"><b>PARTICIPATED EVENTS</b></font></td>
     <%

      for(int i=0;i<arrayList2.size();i++) {
        inTotal=0;
        strVal="0";
       for(int j=0;j<AlEvents.size();j++)
       {
           if(strFinalMatrix[j][i].equals("X"))
             strVal="0";
           else
             strVal="1";

        inTotal+=Integer.parseInt(strVal);}%>
       <td style="border:1px solid #D9D5BE;text-align: center"><%=inTotal%> </td>
    <%}%>
</tr>

<tr bgcolor="#CCCC99">
    <td style="border:1px solid #D9D5BE;text-align: center" colspan='2'><font size="2"><b>AVERAGE</b></font></td>
     <%
     int intTotalVal=0;
	 double dblTotalVal=0;
	 double dblTotal=0;

     String strTotalVal="0";
      for(int i=0;i<arrayList2.size();i++) {
        inTotal=0;
        intTotalVal=0;
		 dblTotalVal=0;
		 dblTotal=0;
        strVal="0";
        strTotalVal="0";
       for(int j=0;j<AlEvents.size();j++)
       {
           if(strFinalMatrix[j][i].equals("X"))
            {
                strVal="0";
				strTotalVal="0";
            }else
			{
                strVal="1";
				strTotalVal=strFinalMatrix[j][i];
				
                
            }

        intTotalVal+=Integer.parseInt(strTotalVal);
        inTotal+=Integer.parseInt(strVal);

		dblTotalVal+=Double.parseDouble(strTotalVal);
        dblTotal+=Double.parseDouble(strVal);
       }%>

       <td style="border:1px solid #D9D5BE;text-align: center"><%=df.format((dblTotalVal/dblTotal))%> </td>
    <%}%>
</tr>


              
</tfoot>
      <%  
    }
    else{             // End of if loop
        out.println("No Records Found");
        }
  } // End strSearchMode.equals("0")



%>

</table>
</div>
</td>
</tr>
</table>
    </body>
</html>
