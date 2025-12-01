<%@ page import = "model.GetInterface" %>
<%@ page import = "java.util.*" %>
<%

//String strEvnName=request.getParameter("EvnName");
List LiValues=new ArrayList();
HashMap F1Val=new HashMap();
List LiValues_F2=new ArrayList();


            GetInterface GUI=new GetInterface();
            if(strEventSeq!=null && strEventSeq.trim().length()>0)
            {
                LiValues= GUI.GetF1F2(strEventSeq,"F1");
                
                for(int F1Sz=0;F1Sz < LiValues.size();F1Sz++)
                {
                    ArrayList ArRow=new ArrayList();
                    ArRow=(ArrayList)LiValues.get(F1Sz);
                    String strJudgeSeq=ArRow.get(1).toString();
                    String strJudgeName=ArRow.get(2).toString();

                    F1Val.put("JudgeSeq"+(F1Sz+1),strJudgeSeq.trim());
                    F1Val.put("JudgeName"+(F1Sz+1),strJudgeName.trim());

                    for (int i=1; i<=7;i++)
                     {
                        String strCurrVal="";
                         if (ArRow.get(i+2)!=null)
                            strCurrVal=ArRow.get(i+2).toString();

                            F1Val.put("J"+(F1Sz+1)+"_F1_"+i,strCurrVal.trim());
                     }
                 }
                
                LiValues_F2=GUI.GetF1F2(strEventSeq,"F2");
 
                for(int F2Sz=0;F2Sz<LiValues_F2.size();F2Sz++)
                {
                    ArrayList ArRow=new ArrayList();
                    ArRow=(ArrayList)LiValues_F2.get(F2Sz);


                    for (int i=1; i<=7;i++)
                     {
                        String strCurrVal="";
                         if (ArRow.get(i+2)!=null)
                            strCurrVal=ArRow.get(i+2).toString();

                            F1Val.put("J"+(F2Sz+1)+"_F2_"+i,strCurrVal.trim());
                     }
                }
            }

           

%>
