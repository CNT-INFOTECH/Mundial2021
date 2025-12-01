<%-- 
    Document   : SM_MOS_Admin_Process
    Created on : Jun 5, 2017, 5:25:19 PM
    Author     : CNT
--%>

<%@page import="java.util.Collections"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.TreeSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.net.URLDecoder"%>
<%@ page import = "java.util.Iterator"%>
<%@ page import = "java.util.List"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.sql.*" %>
<%@page import="Shows.ShowUtil"%>
<%@ page import =  "Shows.*" %>
<%
    Cookie[] cookies = request.getCookies();
    String strCookieShowSeq = "";
    String strUserID = "";
    String strDBName = "";
    for (int i = 0; i < cookies.length; i++) {
        Cookie c = cookies[i];
        if (c.getName().equals("CookieShowSeq")) {
            strCookieShowSeq = URLDecoder.decode(c.getValue(), "UTF-8");
        }
        if (c.getName().equals("username")) {
            strUserID = URLDecoder.decode(c.getValue(), "UTF-8");
        }
        if (c.getName().equals("DBName")) {
            strDBName = URLDecoder.decode(c.getValue(), "UTF-8");
        }
    }

    String strEventSeq = request.getParameter("hdnEventSeq");

    List TotalJudges_DB = new ArrayList();
    ArrayList<String> EachJudgeRow_DB = new ArrayList<String>();
     HashMap<String, List> hMap = new HashMap<String, List>();
      SortbyMedian JudgeCards=new SortbyMedian();
      ScoringNC1D InsResults=new ScoringNC1D();
      
        List AlJudgeCardA=new ArrayList();
        List AlJudgeCardB=new ArrayList();
        List AlJudgeCardC=new ArrayList();
     
    for (int i = 1; i <= 3; i++) {
             EachJudgeRow_DB = new ArrayList<String>();
             EachJudgeRow_DB.add(request.getParameter("hdnJudgeSeq" + i));
             EachJudgeRow_DB.add(request.getParameter("hdnJudgeNum" + i));
        for (int j = 1; j <= 7; j++) {
            
             String strbackNum=request.getParameter("txtRow" + i + "Column" + j);
                
             EachJudgeRow_DB.add(strbackNum);
               
        }
        TotalJudges_DB.add(EachJudgeRow_DB);
    }
         
        
        SM_DBInsUpdF1F2 SmIns = new SM_DBInsUpdF1F2();
        SmIns.InsUpdF1F2(strEventSeq, "F2", TotalJudges_DB,"",strUserID,strDBName);
        
           for (int i = 1; i <=7; i++) {
               for (int j = 0; j < 3; j++) {
                   EachJudgeRow_DB=(ArrayList) TotalJudges_DB.get(j);
                   String strbackNum = EachJudgeRow_DB.get(i+1);
                   
                   if(j==0){
                       AlJudgeCardA.add(strbackNum);
                   }
                   else if(j==1)
                       AlJudgeCardB.add(strbackNum);
                   else if(j==2)
                       AlJudgeCardC.add(strbackNum);
                   
                   
                   

                   if(strbackNum!=null && strbackNum.trim().length() > 0){
                        List li = new ArrayList();
                        List li_existing = new ArrayList();
                        
                        boolean blnExists = hMap.containsKey(strbackNum);

                        if (blnExists) {
            
                             li_existing = hMap.get(strbackNum);
                             int pos=li_existing.indexOf("99");
                             li_existing.set(pos,""+i);
                             
                            hMap.put(strbackNum, li_existing);
                        }
                        else{
                            li = new ArrayList();
                            
                            li.add(0,"99");
                            li.add(1,"99");
                            li.add(2,"99");
                            
                            li.set(0, ""+i);
                            hMap.put(strbackNum, li);
                        }
                   }
               }
           }
    
    
            Iterator<Map.Entry<String, List>> it1 = hMap.entrySet().iterator();
               //int i = 0;
              ArrayList<MOS> ar = new ArrayList<MOS>();
               while (it1.hasNext()) {
                   Map.Entry<String, List> pair1 = it1.next();
                   String strBackNum = pair1.getKey();
                   List VoteCount = pair1.getValue();
                   if(Integer.parseInt(""+VoteCount.get(1))==99 && Integer.parseInt(""+VoteCount.get(2))==99 )
                       continue;
                      ar.add(new MOS(strBackNum, Integer.parseInt(""+VoteCount.get(0)), Integer.parseInt(""+VoteCount.get(1)),Integer.parseInt(""+VoteCount.get(2))));
                     
               }
               
                JudgeCards.setJudgeCardA(AlJudgeCardA);
                JudgeCards.setJudgeCardB(AlJudgeCardB);
                JudgeCards.setJudgeCardC(AlJudgeCardC);
                
        
                Collections.sort(ar, JudgeCards);

                            /* This is used for 3 way Similar time.
                                1) Assumed that there will be a value 3 in the Identical Majority variable
                                2) If there is a value 3
                                3) Get the Median, which is the Position where it has 3 in the Identical Majority variable
                                4) loop through the entire arrayList and find all the back Numbers with that median and swap based on the Judge Card.
                                */
                               
                                
                           ArrayList<MOS> Al_Sorted=ar;
                           ArrayList FinalResults=new ArrayList();
                         
                           for (int k=0; k<Al_Sorted.size(); k++){
                               
                                MOS ObjMos=Al_Sorted.get(k);
                                int iIdenticalTie_Majority=ObjMos.getIdenticalTie_Majority();
                                
                                if(iIdenticalTie_Majority==3){
                                   
                                    int threeWayIdenticalTie_Pos = ObjMos.getMedian();
                                     for (int j=0; j<Al_Sorted.size(); j++){
                                            MOS ObjMosj=Al_Sorted.get(j);
                                            if(threeWayIdenticalTie_Pos==ObjMosj.getMedian()){
                                               Collections.swap(ar, j, JudgeCards.getJudgeCardA().indexOf(ObjMosj.getBackNum())); 
                                           }
                                     }
                                    
                                     break;
                                }
                                
                              
                           }     
                       
                      for (int k=0; k<ar.size(); k++){
                                ArrayList AlEachRow=new ArrayList();
                                MOS ObjMos=ar.get(k);
                                 
                                AlEachRow.add(ObjMos.getBackNum());
                               
                                 ArrayList AlPos=new ArrayList();
                                     
                                int JudgeBackPosA=JudgeCards.getJudgeCardA().indexOf(ObjMos.getBackNum()) + 1;
                                int JudgeBackPosB=JudgeCards.getJudgeCardB().indexOf(ObjMos.getBackNum()) + 1;
                                int JudgeBackPosC=JudgeCards.getJudgeCardC().indexOf(ObjMos.getBackNum()) + 1;
                                
                                     if(JudgeBackPosA==0)
                                         AlPos.add("X");
                                     else
                                         AlPos.add(JudgeBackPosA);
                                     
                                      if(JudgeBackPosB==0)
                                         AlPos.add("X");
                                     else
                                         AlPos.add(JudgeBackPosB);
                                      
                                       if(JudgeBackPosC==0)
                                         AlPos.add("X");
                                     else
                                         AlPos.add(JudgeBackPosC);
                                  
                                AlEachRow.add(AlPos);
                                
                                AlEachRow.add( ObjMos.getBest() + " - "+ ObjMos.getMedian()+ " - "+ ObjMos.getLast());
                                
                                FinalResults.add(AlEachRow);
                                
                      }
                       //out.println(FinalResults);      
                     InsResults.InsertF2Results(strEventSeq, FinalResults, 1, strUserID, strDBName);          
               
  
       response.sendRedirect("SM_F2_MOS.jsp?EIdent="+strEventSeq);
%>

