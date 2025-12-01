<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"/>

<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.rowset.*" %>
<%@ page import="pasotracker.DBConnection" %>
<%@ page import="pasotracker.GeneralServlet" %>
<html>

<head>
<title>PASO TRACKER</title>
<link rel="stylesheet" href="themes/base/jquery.ui.all.css"/>
<script type="text/javascript" src="jquery-1.5.1.js"></script>
<script type="text/javascript" src="external/jquery.bgiframe-2.1.2.js"></script>
<script type="text/javascript" src="ui/jquery.ui.core.js"></script>
<script type="text/javascript" src="ui/jquery.ui.widget.js"></script>
<script type="text/javascript" src="ui/jquery.ui.mouse.js"></script>
<script type="text/javascript" src="ui/jquery.ui.button.js"></script>
<script type="text/javascript" src="ui/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="ui/jquery.ui.draggable.js"></script>
<script type="text/javascript" src="ui/jquery.ui.position.js"></script>
<script type="text/javascript" src="ui/jquery.ui.resizable.js"></script>
<script type="text/javascript" src="ui/jquery.ui.dialog.js"></script>
<script type="text/javascript" src="ui/jquery.effects.core.js"></script>
<script type="text/javascript" src="jscRegistration.js"></script>
<script type="text/javascript" src="jscIndex.js"></script>
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />
 <link href="Registration.css" rel="stylesheet" type="text/css" />
 <link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/interface.js"></script>
 
 <!-- added by kumar -->
<script type="text/javascript">
  function addRow()
{
	var tbody = document.getElementById("table1")//.getElementsByTagName("tbody")[0];
	var lastRow = tbody.rows.length
	var iteration = lastRow + 1;
	var row = document.createElement("TR");

	var cell_Label = document.createElement("TD");
	cell_Label.innerHTML = 'File '+iteration+':';
	row.appendChild(cell_Label);

	var cell_File = document.createElement("TD");
	var inp9 = document.createElement('INPUT');
	inp9.setAttribute('type', 'file');
	inp9.setAttribute('className', 'attachfiles');
	inp9.setAttribute('name', 'file[' + (cell_File+1)+']');

     //  for Dynamic delete Button -Start
        var cell_File1 = document.createElement("TD");
        var inp10 = document.createElement('INPUT');
        inp10.setAttribute('type', 'BUTTON');
        inp10.setAttribute('value', 'Delete');
        inp10.setAttribute('class', 'button');
        inp10.setAttribute('style', 'padding: 4px 7px;');
       //inp10.setAttribute('onClick', 'deleteRow('+iteration+')');
        inp10.setAttribute('onClick', 'deleteRow(this)');

     //  for Dynamic delete Button -End

     //  for Dynamic View Button -Start
        var cell_File2 = document.createElement("TD");
        var inp11 = document.createElement('INPUT');
        inp11.setAttribute('type', 'BUTTON');
        inp11.setAttribute('value', 'View');
       //inp10.setAttribute('onClick', 'deleteRow('+iteration+')');
        inp11.setAttribute('onClick', 'fnDownload()');
     //  for Dynamic View Button -End


	cell_File.appendChild(inp9);
      //cell_File2.appendChild(inp11);//Dynamic View Button
        cell_File1.appendChild(inp10);//Dynamic delete Button


        row.appendChild(cell_File);
        // row.appendChild(cell_File2);//Dynamic View Button
        row.appendChild(cell_File1);//Dynamic delete Button
        tbody.appendChild(row);
}

    function deleteRow(r)
    {
         var i=r.parentNode.parentNode.rowIndex;
         document.getElementById("table1").deleteRow(i);


    }
</script>

<script>
function fnDeleteFile(r,Rowid)
    {
        var bok=confirm('Do you want to delete this file?')
        if(bok)
            {  
                document.forms[0].method="post";
                document.forms[0].action="frmPasoDeleteFile.jsp?DeleteFlag=yes&fileindex="+Rowid;
                document.forms[0].target="_self";
            }

        else
            {
                return false;
            }
    }
</script>
        <!-- added by kumar -->

<style type="text/css">
<!--
@import url("CommonTableStyle.css");
-->
</style>


        <style type="text/css">
<!--
@import url("CommonTableStyle.css");
-->
#footer_Bot {
	clear:both;
	text-align:center;
	/*background: #555;
	color:#fff;*/
	height:50px;
	padding:5px;
         bottom: auto;

}
.gridNew
{

}

.gridNew td
{
	border-bottom:1px dotted #ffffff;
	font-size:9pt;
	color:#000000;
	padding:5px 0 5px 5px;
	vertical-align:top;
	text-align:center;
}


.gridOne
{

}


.gridOne td
{
	margin: 0px 0px 0px 0px;
	padding: 0em 0em;
	font-family: Verdana, Arial, Helvetica, Sans Serif;
	font-size: 15px;
	color: black;
	text-decoration: none;
	text-align: left;
	vertical-align: middle;
	font-weight: normal;
	letter-spacing: 0px;
	border: none;
        border-bottom:1px dotted #ffffff;
}

.gridOne tr:hover td
{
	background: #4e738f ;
	color: #339;
        cursor : pointer;

}

.gridOne thead
{
	background: #4e738f ;
	color: #339;
        cursor : pointer;
}



/*added on 30072011*/
.even
{
	margin: 0px 0px 0px 0px;
	padding: 0em 0em 0em 0em;
	font-family: Verdana, Arial, Helvetica, Sans Serif;
	font-size: 12px;
	color: black;
	text-decoration: none;
	text-align: left;
	vertical-align: middle;
	font-weight: normal;
	letter-spacing: 0px;




}

.odd
{
	margin: 0px 0px 0px 0px;
	background-color: #DCDCDC;
	padding: 0em 0em 0em 0em;
	font-family: Verdana, Arial, Helvetica, Sans Serif;
	font-size: 12px;
	color: black;
	text-decoration: none;
	text-align: left;
	vertical-align: middle;
	font-weight: normal;
	letter-spacing: 0px;
}
/*added on 30072011*/

</style>





</head>
<%@ include file="frmReg_ScreenAttributes.jsp"%>
<%
    /****** added by erzath start November 14 2011*************/
    String REGSEQ="";        
    String strMode="";
    String SaveYN="N";
    if(request.getParameter("Mode")!=null)
        strMode=request.getParameter("Mode");
    //Mode 1 for reset button
    if(strMode.equals("1"))
    {
   // SaveYN="N";            
    session.removeAttribute("ses_REGSEQ");        
    }
    if(strMode.equals("2"))
    {
        if(request.getParameter("RegNo")!=null)
        REGSEQ =request.getParameter("RegNo");
        else
        REGSEQ="";               
    }
   else if(session.getAttribute("ses_REGSEQ")!=null)
        REGSEQ =(String) session.getAttribute("ses_REGSEQ");
   else
        REGSEQ=""; 
    /****** added by erzath end*************/
    HashMap MhorseDoc=new HashMap();
    ArrayList ALFileListOfHorse=new ArrayList();
    String sHorseRegNo="";
   /*****/
    String sRegSeq="";
/******/

    boolean bFileUploadflag=false;
    if(request.getAttribute("filesuploade") != null && request.getAttribute("filesuploade").toString().equalsIgnoreCase("success") )
        bFileUploadflag=true;

    //if(session.getAttribute("Horsedocuments") !=null)
      //  MhorseDoc=(HashMap)session.getAttribute("Horsedocuments");
		//else
        //MhorseDoc.put(REGSEQ,sc.getRealPath(File.separator)+"pasoTempFiles"+"/"+REGSEQ);

       String strfilePath="";
       String strfilename="";
       String strfileNamePath="";

	   

%>
<body>
 <form name="Documents_frm" enctype="multipart/form-data"  method="post" >
     <%@ include file="frmOwnersHistoryInclude.jsp"%>

     <%
     sHorseRegNo=str_reggno;
     /****/
     sRegSeq=REGSEQ;
     /*****/  
	//Added By erzath For Removing Session of the path            
     ArrayList ALFilePath=new ArrayList();
     ServletContext sc = this.getServletContext();
     File folder = new File(sc.getRealPath(File.separator)+"pasoTempFiles"+"/"+sRegSeq+"/");
     
     List<String> filnamn = new ArrayList();
     List<String> filnamn1= new ArrayList();
     //filnamn=folder.getAbsoluteFile();
     //System.out.println("folder--------"+folder);
     File[] listOfFiles = folder.listFiles();
 //System.out.println("list of file 123--------"+listOfFiles);
 
 if(listOfFiles!=null)
     {
        for (int i = 0; i < listOfFiles.length; i++) {
            if (listOfFiles[i].isFile()) {
                filnamn.add(listOfFiles[i].getName());
                String filenames =listOfFiles[i].getName();
                //System.out.println("List of filessssss"+listOfFiles[i].getName());
                ALFilePath.add(folder+"#@#"+filenames);		
                //System.out.println("ALFilePath  File upload file "+ALFilePath);
            }
        }
     
     //ALFilePath.add(sc.getRealPath(File.separator)+"pasoTempFiles"+"/"+str_reggno+"/"+filnamn);
     //System.out.println("AlFile path check--"+ALFilePath);
     if(!REGSEQ.equals(""))
     MhorseDoc.put(REGSEQ, ALFilePath);   
     }
 
 //* end of erzath code for removing session 

        
        String FontColor="";
        String RegType="";

            if(strRegistration_Type.equals("R"))
            {
               FontColor="blue";
               RegType="R";
            }
            else if(strRegistration_Type.equals("P"))
            {
               FontColor="red";
               RegType="P";
            }
            else if(strRegistration_Type.equals("S"))
            {
               FontColor="green";
               RegType="S";
            }
String Regno="";
    Regno=str_reggno;  //Regno is used in frmReg_Top.jsp
%>
      <div id="container">

        <div id="header">
            <%@ include file="frmHeader.jsp"%>
        </div>
			<%
			if(!bRegistraion)
			response.sendRedirect("login.jsp");
			%>

            <div id="content">
                  
        <%@ include file="frmReg_Top.jsp"%>


        <!-- added by kumar -->
        <table  class="altRow">
                <tr>
                    <td class="buttonstyle" width=""align="" nowrap>
                 <!--   <button id="attachfiles">Attach more files</button>   -->
 <input type="button" value="Attach more files" onClick="addRow()" name="button" class="button" />
                </td>

                <td>
                <%--     <input type="button" id="Upload" name="Upload" value="Upload" class="button" />--%>
                  <button id="Upload" class="button"  <% if(Reg_ScrnStatus_Ins.equals("N"))  {%> style="visibility:hidden;" <%}%> >Upload</button>
                </td>

            <!--
                 <td>
                    <button id="Download">Download</button>
                </td>
             -->

                     <!-- added by kumar -->
            </table>
      <table class="gradient-style" id="table1" align="center"  border="0" cellpadding="0" cellspacing="0" width="100%" >
        <tr>
            <td width="" >File 1:</td>

            <td width="">
                <input class="" type="file" name="filename[0]" id="checkfile"/>
            </td>
    <!--
            <td>
            <input type="button" value="View" name="btnView" onclick="fnDownload()" id="btnView"/>
            </td>
    -->
            <td>
            <!--<input type="button" value="Delete" name="btnDelete" onclick="deleteRow(this.parentNode.parentNode.rowIndex)" id="btnDelete"/>-->

            <input type="button" value="Delete" name="btnDelete" style="padding: 4px 7px;" onclick="deleteRow(this)" class="button" id="btnDelete"
			/>
            </td>
        </tr>
  </table>
<%
//if(bFileUploadflag || MhorseDoc.containsKey(sHorseRegNo) )
	  if(bFileUploadflag || MhorseDoc.containsKey(sRegSeq) )
    {
 %>
<br>
    <table class="gridOne" name="docName" align="center"  border="0" cellpadding="0" cellspacing="0" width="100%" >
<thead>
        <tr>
            <th class="Grid_Header" align="left">Sno</th>
            <th class="Grid_Header" align="left">Document Name </th>
            <th class="Grid_Header" width="20px"></th>
        </tr>
</thead>
<%
        int iDocCnt=0;
        String strhdnfilepath="hdnfilepath";
        String strhdnfilename="hdnfilename";
        HashMap Mfilepathname=new HashMap();
        HashMap HDeleteFile=new HashMap();
/*
        if(MhorseDoc.containsKey(sHorseRegNo))
             ALFileListOfHorse=(ArrayList)MhorseDoc.get(sHorseRegNo);
*/

          if(MhorseDoc.containsKey(sRegSeq))
             ALFileListOfHorse=(ArrayList)MhorseDoc.get(sRegSeq);

             for(int i=0;i<ALFileListOfHorse.size();i++)
              {
                 iDocCnt++;

				 /*added on 30072011*/
                 String strClass="";
                if( i%2 ==0 )
                    strClass="even";
                else
                    strClass="odd";

/*added on 30072011*/

                 String str[]= ALFileListOfHorse.get(i).toString().split("#@#");

                     if(str.length > 0)
                        strfilePath=str[0];

                     strfilePath=strfilePath.replace("\\","/");
                     if(str.length > 1)
                     strfilename=str[1];

                     strfileNamePath=strfilePath+strfilename;

                     Mfilepathname.put("fpathname"+iDocCnt,strfileNamePath);
                     Mfilepathname.put("fname"+iDocCnt,strfilename);

                     HDeleteFile.put(""+iDocCnt, strfileNamePath);

%>
    <tbody>
        <tr class="<%=strClass%>">
            <td><%=iDocCnt%></td>
            <td>
                <a href="frmShowPasoDocument.jsp?Index=<%=iDocCnt%>" target="_blank">
                <%=strfilename%>
                </a>
           </td>
         <!--   <td class="" >  <input type="image" src="Images/Delete_Claim.gif" name="image" width="15" height="15" onclick="return fnDeleteFile('<%=iDocCnt %>','<%= sHorseRegNo %>')">   </td> -->
                <td align="left" class="" >  <input type="image" src="Images/delete.png" name="image" width="15" height="15" onclick="return fnDeleteFile(this,<%=iDocCnt%>)" />   </td>
        </tr>
    </tbody>
<%
            }
            //session.setAttribute("filenamepath",Mfilepathname);
            //session.setAttribute("DeleteFile",HDeleteFile);

            
%>
</table>
<%
    }

%>

<br>

            <table class="gridNew" align="center"  border="0" cellpadding="0" cellspacing="0" width="100%" >

                <tr align="">
                    <td align="center" colspan="6">
                        <input type="button" id="Previous_Documents" class="button" value="&laquo;" />
                        <input type="button" id="Next_Documents" class="button" value="&raquo;" />

                    </td>
                </tr>
				<input type="hidden" name="HdnRegNo" id="HdnRegNo"value="<%=str_reggno%>"/>
				<input type="hidden" name="SavedYN" id="SavedYN" value="Y" />
  </table>

            </div>

<!-- ----------------------------------------------------------------- -->
            <div id="sidebar">

                      <table style="border-collapse:collapse;">
  <tr>
    <td>
      <div onclick="CheckSave('index.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;width:120px;" >General</div>
    </td>
  </tr>
  <tr>
    <td>
      <div onclick="CheckSave('Images.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Images</div>
    </td>
  </tr>
  <tr>
    <td>
      <div  onclick="CheckSave('Markings.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Markings</div>
    </td>
  </tr>
  <tr>
    <td>
      <div onclick="CheckSave('frmPedigree.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Pedigree</div>
    </td>
  </tr>

  <tr>
    <td>
      <div onclick="CheckSave('frmReg_Descendants.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Descendants</div>
    </td>
  </tr>

  <tr>
    <td>
      <div onclick="CheckSave('frmReg_Siblings.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f;color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Siblings</div>
    </td>
  </tr>
  <tr>
    <td>
      <div onclick="CheckSave('frmOwnersHistory.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Owner's&nbsp;History</div>
    </td>
  </tr>
  <tr>
    <td>
      <div onclick="CheckSave('frmShowHistory.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f;color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Show&nbsp;History</div>
    </td>
  </tr>
  <tr>
    <td>
      <div onclick="CheckSave('frmChampionship.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style="cursor: pointer; background-color: #4e738f;color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Championship</div>
    </td>
  </tr>
  <tr>
    <td>
      <div onclick="CheckSave('frmDocuments.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f;color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >&nbsp;&nbsp;Documents&raquo;</div>
    </td>
  </tr>
  <tr>
    <td>
      <div onclick="CheckSave('frmObservations.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f;color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Observations</div>
    </td>
  </tr>
   <tr>
    <td>
      <div onclick="CalculatorPopUp()"  style=" cursor: pointer; background-color: #4e738f;color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Calculator</div>
    </td>
  </tr>

  <tr>
    <td>
      <div onclick="CheckSave('frmRegistrationSearch.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f;color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Search</div>
    </td>
  </tr>

  <tr>
    <td>
      <div onclick="CheckSave('frmReg_SearchHorseDetails.jsp?<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f;color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >Age&nbsp;Verify</div>
    </td>
  </tr>
  <tr>
    <td>
      <div onclick="CheckSave('Admn_UserProfile.jsp?ty=R&<%=Calendar.getInstance().getTimeInMillis()%>');"  style=" cursor: pointer; background-color: #4e738f; color: #FFFFFF; font-weight: bold;
border-top:  1px solid #5D92B1;
border-left:  1px solid #5D92B1;
border-right:  1px solid #5D92B1;
padding: 4px;text-align: center;" >User&nbsp;Profile</div>
    </td>
  </tr>

</table>

    </div>
	<div id="footer_Bot" align="bottom">
	<jsp:include page="/frmBottom_Registration.jsp"/>
	</div>
  </div>
    <div id="dialog-Reg" title="Search Registration" style="display:none; background:url('Images/trans-wood-1.png');" >
        <iframe  src="regsearchpopup.jsp"  id="modalIFrame_Show" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0" scrolling="no">
        </iframe>
    </div>
		</form>
</body>
</html>