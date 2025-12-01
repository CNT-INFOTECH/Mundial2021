
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

<link href="Shows_Pop.css" rel="stylesheet" type="text/css" />
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="themes/base/jquery.ui.all.css"/>
<link href="style.css" rel="stylesheet" type="text/css" />

    </head>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "model.DBInsUpdF1F2" %>
<%@ page import = "model.GetInterface" %>
<%@ page import = "model.Employee" %>
<%@ page import = "model.EmpSortByName" %>
<%@ page import = "model.MajorityVotes" %>
<%@ page import = "model.Results" %>
<form>


 <%

    String strMode="0";
            if(request.getParameter("mode")!=null)
                strMode=request.getParameter("mode");
      String strEventSeq=request.getParameter("EventSeq");
       String strEventType=request.getParameter("hdnEventType");
      String strhdnNumberOfPlaces="5";   // By Default the number of Positions are 5
          if(request.getParameter("hdnNumberOfPlaces")!=null)
              strhdnNumberOfPlaces=request.getParameter("hdnNumberOfPlaces");
      int NoneSelected_value=Integer.parseInt(strhdnNumberOfPlaces)+1;  // This will give either 6
     
     
     String strJudgeCnt="3";
     if(request.getParameter("hdnJudgeCount")!=null)
         strJudgeCnt=request.getParameter("hdnJudgeCount");

     int intJdgCount=Integer.parseInt(strJudgeCnt);
     List LiAllValues=new ArrayList();

     //System.out.println("*******************frmF1_F2_Results***************strJudgeCnt***********" +strJudgeCnt);
   
     HashMap HmValues_Horses=new HashMap();
     ArrayList AlRows=new ArrayList();
      Set set=new TreeSet();

     DBInsUpdF1F2 DBIns=new DBInsUpdF1F2();
     GetInterface GUI=new GetInterface();

     if(strEventSeq!=null && strEventSeq.length()>0)
         HmValues_Horses=GUI.GetHorseName_ByAssignedNum(strEventSeq);


    if(strMode.equals("F1") )
    {


        //JudgeSeq
		List<String> listBackNumber = new ArrayList<String>();
        for(int i=1;i <=intJdgCount;i++)
        {
            AlRows=new ArrayList();
            String strJudgeNum="JudgeSeq"+i;
            AlRows.add(strEventSeq); //1
            AlRows.add(request.getParameter(strJudgeNum)); // JudgeSeq from CommonRef instead on Name
            AlRows.add(""+i); // Judge Number
            AlRows.add("F1"); // TYPE
            for(int j=1;j <=7;j++)
            {
                String strParamValue="J"+i+"_F1_"+j;
                  if(request.getParameter(strParamValue)!=null
                   && (!request.getParameter(strParamValue).equals("null"))
                   && request.getParameter(strParamValue).length() > 0)
                    {
                       AlRows.add(request.getParameter(strParamValue));
                        set.add(Integer.parseInt(request.getParameter(strParamValue)));
						listBackNumber.add(request.getParameter(strParamValue));

                    }
                    else
                        AlRows.add("");
            }

            LiAllValues.add(AlRows);
         }

        if(strEventSeq!=null && strEventSeq.length()>0)
            {
          
            DBIns.InsUpdF1F2(LiAllValues);
            }

      Iterator iterator =set.iterator();
%>

  <table  class="altRow" align="center"  border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <th>Name</th>
          <th>Number</th>
          <th>Judge1</th>
          <th>Judge2</th>
          <th>Judge3</th>
          <th>Total</th>
          <th>Placement</th>
        </tr>
        <%
        while(iterator.hasNext())
        {
            String strHrsNum=iterator.next().toString();
			 if(Collections.frequency(listBackNumber, strHrsNum)<2)
				 continue;
            %>
        <tr>
          <td width="200"><% if(HmValues_Horses.get(strHrsNum)!=null){%>
              <%=HmValues_Horses.get(strHrsNum)%> <%}%></td><td> <font size="3"><b><%=strHrsNum%></b></font></td>
          <td>7</td>
          <td>7</td>
          <td>7</td>
          <td>21</td>
          <td>7</td>
         </tr>
        <% } %>
        </table>
     <% }
   else if(strMode.equals("F2"))
    {
       Set set1=new TreeSet();

      // String[][] F2Values=new String[3][7];  Changed from 3 to 5 to accomodate Deletion of Judges in a 5 judge system
       String[][] F2Values=new String[5][7];
  
       for(int i=1;i <=intJdgCount;i++)
        {
            AlRows=new ArrayList();
            String strJudgeNum="JudgeSeq"+i;
            AlRows.add(strEventSeq); //1
            AlRows.add(request.getParameter(strJudgeNum)); // JudgeSeq from CommonRef instead on Name
            AlRows.add(""+i); // Judge Number
            AlRows.add("F2"); // TYPE

            for(int j=1;j <=7;j++)
            {
                String strParamValue="J"+i+"_F2_"+j;

                  if(request.getParameter(strParamValue)!=null
                   && (!request.getParameter(strParamValue).equals("null"))
                   && request.getParameter(strParamValue).length() > 0)
                    {
                       AlRows.add(request.getParameter(strParamValue));
                        set1.add(Integer.parseInt(request.getParameter(strParamValue)));  // HorseAssigned  Numbers
                        F2Values[i-1][j-1]=request.getParameter(strParamValue);
                     }
                    else
                     {
                        AlRows.add("");
                        F2Values[i-1][j-1]="X";
                     }
            }

            LiAllValues.add(AlRows);
         }
     

                if(strEventSeq!=null && strEventSeq.length()>0)
                {
                 DBIns.InsUpdF1F2(LiAllValues);
                 }

      Iterator iterator1 =set1.iterator();
%>

 <table class="altRow" align="center"  border="0" cellpadding="0" cellspacing="0" width="100%" >
        <tr align="center">
          <th>Name</th>
           <th>Number</th>
          <th>Judge1</th>
          <th>Judge2</th>
          <th>Judge3</th>
          <th>Total</th>
          <th>&nbsp;</th>
          <th>Placement</th>
          <th>Final Placement</th>
        </tr>

   <%

   
    List <Results> col = new ArrayList() ;
   
       
       
     while(iterator1.hasNext())
        {
         AlRows=new ArrayList();
        String KeyValue=iterator1.next().toString(); // HorseAssigned  Numbers
        int strJudge1=NoneSelected_value;
        int strJudge2=NoneSelected_value;
        int strJudge3=NoneSelected_value;
         for(int i=1;i<4;i++)
        {

            for(int j=1;j <8;j++)
            {
                String strParamValue="J"+i+"_F2_"+j;
                  if(request.getParameter(strParamValue)!=null
                   && (!request.getParameter(strParamValue).equals("null"))
                   && request.getParameter(strParamValue).length() > 0)
                    {
                       if(request.getParameter(strParamValue).equals(KeyValue))
                       {
                           if(i==1)
                            strJudge1=j;
                           else if(i==2)
                             strJudge2=j;
                           else if (i==3)
                             strJudge3=j;
                       }

                    }
                }
         }
        int TotalPts=strJudge1+strJudge2+strJudge3;
 
        col.add(new Results(KeyValue,strJudge1,strJudge2,strJudge3,TotalPts));
    
}
  
        Collections.sort(col,new MajorityVotes()); // sort method
        int[] Al=new int[5];

             for(int i=0;i < 5;i++)
               {
                 String strRow0=F2Values[0][i];
                 String strRow1=F2Values[1][i];
                 String strRow2=F2Values[2][i];

                    if(strRow0.equals("X") && strRow1.equals("X")
                    || strRow1.equals("X") && strRow2.equals("X")
                    || strRow0.equals("X") && strRow2.equals("X"))
                     {
                        Al[i]=999;
                     }
                     else
                        Al[i]=i;
             }
       
        int HrsSize=col.size();
        int LpVar=1;
        int LpVar1=0;
         String[][] ArSorted_Results = new String[HrsSize][12];

            
           for (Results Rst: col) {

               LpVar1+=1;
             
                for(int i=(LpVar1-1);i<5;i++)
                {

                    if(Al[i]==999)
                        LpVar1+=1;
                    else
                        break;
                }
          
        
           
           int strFinalPlacement=LpVar1;

           int[] ArPoints={Rst.getJudgeNumber1(),Rst.getJudgeNumber2(),Rst.getJudgeNumber3()};
           Arrays.sort(ArPoints);
           //int AlgPoints=ArPoints[ArPoints.length-1] + ArPoints[0];
		   int AlgPoints= ArPoints[1];

           if(Find_None_Section(LpVar,ArPoints,NoneSelected_value))
           {
                  strFinalPlacement=-1; // if 2 or more judges did not pick the horse we shold not award him any points
                  LpVar1=LpVar1-1;
           }
                ArSorted_Results[LpVar-1][0]="";
                if(HmValues_Horses.get(Rst.getHorseNumber())!=null){
                    ArSorted_Results[LpVar-1][0]=""+HmValues_Horses.get(Rst.getHorseNumber());
                }
                 if(strhdnNumberOfPlaces.equals("6") && !strEventType.equals("Championship"))
                    { strFinalPlacement= (strFinalPlacement-1) ; }
                ArSorted_Results[LpVar-1][1]=""+Rst.getHorseNumber();
                ArSorted_Results[LpVar-1][2]=""+Rst.getJudgeNumber1();
                ArSorted_Results[LpVar-1][3]=""+Rst.getJudgeNumber2();
                ArSorted_Results[LpVar-1][4]=""+Rst.getJudgeNumber3();
                ArSorted_Results[LpVar-1][5]=""+Rst.getTotalPoints();
                ArSorted_Results[LpVar-1][6]=""+AlgPoints;

                if(strFinalPlacement==0)
                     ArSorted_Results[LpVar-1][7]="B";
                else if(strFinalPlacement < 0)  // No Placement
                      ArSorted_Results[LpVar-1][7]="";
                else
                     ArSorted_Results[LpVar-1][7]=""+strFinalPlacement;
                
                if(strFinalPlacement==0)
                     ArSorted_Results[LpVar-1][8]="B";
                else if(strFinalPlacement < 0) // No Placement
                      ArSorted_Results[LpVar-1][8]="";
                 else
                      ArSorted_Results[LpVar-1][8]=""+strFinalPlacement;

               
                ArSorted_Results[LpVar-1][9]=FindMajority(LpVar,ArPoints,NoneSelected_value);  // Holds 'Y' if there is any Majority or not
                ArSorted_Results[LpVar-1][10]="";  //ALGORITHM POINTS SETTING
                ArSorted_Results[LpVar-1][11]=FindMajorityValue(LpVar,ArPoints);
          
            LpVar+=1;
           }

         for(int i=0;i < HrsSize;i++)
        {
             if(i < (HrsSize-1))
             {
                if( (ArSorted_Results[i][5]).equals((ArSorted_Results[i+1][5]))) // if total Points are same for 2 rows
                {
                      if((ArSorted_Results[i][9]).equals("N") && (ArSorted_Results[i+1][9]).equals("N")) // if no Majority
                      {
                          if((ArSorted_Results[i][6]).equals((ArSorted_Results[i+1][6]))) // if  Algorithm Pts are same
                         {
                             ArSorted_Results[i][7]="";
                             ArSorted_Results[i+1][7]="";
                             ArSorted_Results[i][8]="";
                             ArSorted_Results[i+1][8]="";
                             ArSorted_Results[i][10]=ArSorted_Results[i][6];  // Set the Alg Points
                             ArSorted_Results[i+1][10]=ArSorted_Results[i+1][6]; // Set the Alg Points
                         }
                         else if(!(ArSorted_Results[i][6].equals((ArSorted_Results[i+1][6])))) // If they are not Equal we need to swap
                         {
                             if(Integer.parseInt(ArSorted_Results[i+1][6]) < Integer.parseInt(ArSorted_Results[i][6]))
                              {
                                if(!ArSorted_Results[i+1][7].equals(""))
                                    ArSorted_Results[i+1][7]=""+(Integer.parseInt(ArSorted_Results[i+1][7])-1);
                                 if(!ArSorted_Results[i+1][8].equals(""))
                                    ArSorted_Results[i+1][8]=""+(Integer.parseInt(ArSorted_Results[i+1][8])-1);
                                 if(!ArSorted_Results[i+1][7].equals(""))
                                    ArSorted_Results[i][7]=""+(Integer.parseInt(ArSorted_Results[i+1][7])+1);
                                  if(!ArSorted_Results[i+1][8].equals(""))
                                    ArSorted_Results[i][8]=""+(Integer.parseInt(ArSorted_Results[i+1][8])+1);
                                // Before Swapping we need to change the Placements
                                swapRows(ArSorted_Results,(i+1),i);
                                i=-1;
                              }
                             else continue;
                         }

                      }
                      else if((ArSorted_Results[i][9]).equals("Y") && (ArSorted_Results[i+1][9]).equals("Y")) // if Both Have Majority
                      {
                          if( Integer.parseInt(ArSorted_Results[i][11])  > Integer.parseInt(ArSorted_Results[i+1][11])) // Check the Majority Position
                          {
                                if(!ArSorted_Results[i+1][7].equals(""))
                                    ArSorted_Results[i+1][7]=""+(Integer.parseInt(ArSorted_Results[i+1][7])-1);
                                 if(!ArSorted_Results[i+1][8].equals(""))
                                    ArSorted_Results[i+1][8]=""+(Integer.parseInt(ArSorted_Results[i+1][8])-1);
                                 if(!ArSorted_Results[i+1][7].equals(""))
                                    ArSorted_Results[i][7]=""+(Integer.parseInt(ArSorted_Results[i+1][7])+1);
                                  if(!ArSorted_Results[i+1][8].equals(""))
                                    ArSorted_Results[i][8]=""+(Integer.parseInt(ArSorted_Results[i+1][8])+1);
                                  swapRows(ArSorted_Results,(i+1),i);  // Swap the mimimum row to the top
                                i=-1;
                            }
                            else continue;
                      }
                      else  if((ArSorted_Results[i][9]).equals("N") && (ArSorted_Results[i+1][9]).equals("Y"))
                      {
                                 if(!ArSorted_Results[i+1][7].equals(""))
                                    ArSorted_Results[i+1][7]=""+(Integer.parseInt(ArSorted_Results[i+1][7])-1);
                                 if(!ArSorted_Results[i+1][8].equals(""))
                                    ArSorted_Results[i+1][8]=""+(Integer.parseInt(ArSorted_Results[i+1][8])-1);
                                 if(!ArSorted_Results[i+1][7].equals(""))
                                    ArSorted_Results[i][7]=""+(Integer.parseInt(ArSorted_Results[i+1][7])+1);
                                  if(!ArSorted_Results[i+1][8].equals(""))
                                    ArSorted_Results[i][8]=""+(Integer.parseInt(ArSorted_Results[i+1][8])+1);
                                  swapRows(ArSorted_Results,(i+1),i);  // Swap the mimimum row to the top
                                i=-1;

                      }

                }

            }
        }

        int RwCnt=1;
        for(int i=0;i <HrsSize;i++)
        {

            String strAssignNum ="txtAssignedNum"+(RwCnt);
            String strPlacement ="txtPlacement"+(RwCnt);
            String strJ1 ="txtJ1Value"+(RwCnt);
            String strJ2 ="txtJ2Value"+(RwCnt);
            String strJ3 ="txtJ3Value"+(RwCnt);
            out.println("<tr>");
        %>

            <td width="200"><b><%=ArSorted_Results[i][0]%> </b>  </td>
                <td><%=ArSorted_Results[i][1]%><input type="hidden"  size="1" name="<%=strAssignNum%>" value="<%=ArSorted_Results[i][1]%>" > </td>
                <td><%=ArSorted_Results[i][2]%><input type="hidden" name=<%=strJ1%> value=<%=ArSorted_Results[i][2]%> ></td>
                <td><%=ArSorted_Results[i][3]%><input type="hidden" name=<%=strJ2%> value=<%=ArSorted_Results[i][3]%> ></td>
                <td><%=ArSorted_Results[i][4]%><input type="hidden" name=<%=strJ3%> value=<%=ArSorted_Results[i][4]%> ></td>
                <td><%=ArSorted_Results[i][5]%> </td>
                <td><%= ArSorted_Results[i][10]%> </td>
                <td><%=ArSorted_Results[i][7]%> </td>
                <td><input type="text" size="1" name=<%=strPlacement%> value=<%=ArSorted_Results[i][8]%> ></td>
            <%
             out.println("</tr>");
             RwCnt++;
        }
        %>
      </table>

 <input type=hidden name="NumberofHorses" value="<%=HrsSize%>">
<input type=hidden name="EventSeq" value="<%=strEventSeq%>">
<input type=hidden name="PageID" value="EVENTS_PLACEMENT">
<%}
 else
     {%>
         <%@ include file="frmF1_F2_Final_Results.jsp" %>
     <%}%>
 
<input type=hidden name="Mode" value="<%=strMode%>">
</form>
<%!
 static String FindMajority(int RowCnt,int[] ar,int strhdnNumberOfPlaces) {
        boolean[] done = new boolean[ar.length];
        for(int i = 0; i < ar.length; i++) {
            if(done[i])
                continue;
            int nb = 0;
            for(int j = i; j < ar.length; j++) {
                if(done[j])
                    continue;
                if(ar[j] == ar[i]) {
                    done[j] = true;
                    nb++;
                }
            }
            if(nb>=2 && ar[i] !=strhdnNumberOfPlaces)
                return "Y";
            }

        return "N";
    }

   static String FindMajorityValue(int RowCnt,int[] ar) {
        boolean[] done = new boolean[ar.length];
        int nb=0;
        int Majority=0;
         for(int i = 0; i < ar.length; i++) {
            if(done[i])
                continue;
             nb = 0;
                for(int j = i; j < ar.length; j++) {
                    if(done[j])
                        continue;
                    if(ar[j] == ar[i]) {
                        done[j] = true;
                        nb++;
                        
                    }
                }
                if(nb>=2 )
                  Majority=ar[i];
            }

         return Integer.toString(Majority);
    }

  static boolean Find_None_Section(int RowCnt,int[] ar,int NoneSelected_value) {
        boolean[] done = new boolean[ar.length];
        for(int i = 0; i < ar.length; i++) {
            if(done[i])
                continue;
            int nb = 0;
            for(int j = i; j < ar.length; j++) {
                if(done[j])
                    continue;
                if(ar[j] == ar[i]) {
                    done[j] = true;
                    nb++;
                }
            }
           if( (ar[i]>=NoneSelected_value) && nb >=2)
               return true;
        }
        return false;
    }

  public static void swapRows(String[][] a, int row0, int row1) {
    int cols = a[0].length;
    for (int col=0; col<cols; col++)
      swap(a, row0, col, row1, col);
  }
  public static void swap(String[][] a, int i0, int j0, int i1, int j1) {
    String temp = a[i0][j0];
    a[i0][j0] = a[i1][j1];
    a[i1][j1] = temp;
  }
%>

  