
<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>
<%@ page contentType="text/html" pageEncoding="ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

    <%@ page import="java.util.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.rowset.*" %>
    <%@ page import="pasotracker.DBConnection" %>
    <%@ page import="pasotracker.GeneralServlet" %>    
              
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">             
<style type="text/css">

body {  background:url("Images/trans-wood-1.png"); font: .89em "Trebuchet MS", Arial, Sans-Serif;}
    
</style>
 <link href="Tables_style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function trimRegister(str) {
	str = str.replace(/^\s+/, '');
	for (var i = str.length - 1; i >= 0; i--) {
		if (/\S/.test(str.charAt(i))) {
			str = str.substring(0, i + 1);
			break;
		}
	}
	return str;
}

function ListEvents(RegNum)
{
    document.forms[0].target="_self";
   // parent.opener.document.getElementById(?ShowName?).value=SelValue
    document.forms[0].method="post";
    document.forms[0].action="index.jsp?mode=2&RegNo="+RegNum;
    document.forms[0].submit();
}
function returnValues_EntySeq(EntySeq)
{
    parent.opener.document.forms[0].target="_self";
    parent.opener.document.forms[0].method="post";
    parent.opener.document.forms[0].action="frmReg_OwnerInformation.jsp?se="+EntySeq;
    parent.opener.document.forms[0].submit();

    window.close();
} 
function countLetterOccurences(str,letter,replacableChar){
    count = 0;
    pos = str.indexOf(letter);
    while ( pos != -1 ) {
    count++;
    pos = str.indexOf(letter,pos+1);
    }
    //return count;
    var i=0;
    for(i=0;i<count;i++)
    {
    str=str.replace(letter,replacableChar);
    }
    return str;

}
 function returnValues(strFName,strLName,strOrgName,strPhone,strEntitySeq,strOWNERNO,strOwnName,searchFor,
     ADDRESS1,ADDRESS2,CITY,STATE,ZIP,COUNTRY,EMAIL)
{   
	letter='%22';
strOwnName=countLetterOccurences(strOwnName,letter,'"');
strFName=countLetterOccurences(strFName,letter,'"');
strLName=countLetterOccurences(strLName,letter,'"');

    if(opener.document.forms[0].name=="Person_frm")
    {
        opener.document.forms[0].target="_self";
        opener.document.forms[0].method="post";
        opener.document.forms[0].action="frmPerson.jsp?Mode=2&Assigned="+strEntitySeq;
        opener.document.forms[0].submit();
    }
    else if(opener.document.forms[0].name=="Person_Search")
    {
        opener.document.getElementById("EntitySeq").value=trimRegister(strEntitySeq);   
        opener.document.getElementById("Owner_No").value=trimRegister(strOWNERNO);   
        opener.document.getElementById("Org_Name").value=trimRegister(strOwnName);   
    }
    else if(opener.document.forms[0].name=="Registrationform")
    {           
        
        //Ajax_PopulateOwner_Entity(strEntitySeq,'HDNENTITYSEQ','HDNOWNER_NO','HDNOWNER_TYPE','HDNMEMBER_NUM','OWNER_NAME_VAL','ADDRESS1_VAL','ADDRESS2_VAL','CITY_VAL','STATE_VAL','ZIP_VAL','COUNTRY_VAL','PHONE_VAL','EMAIL_VAL');                                    
        //window.close();        return false;
        opener.document.getElementById("HDNENTITYSEQ").value=trimRegister(strEntitySeq);              
        opener.document.getElementById("HDNOWNER_NO").value=trimRegister(strOWNERNO);              
        //opener.document.getElementById("HDNOWNER_TYPE").value=trimRegister(document.getElementById('OWNER_TYPE').value);                        
        //opener.document.getElementById("HdnSeqNo_Mem").value=trimRegister(document.getElementById('MEMBER').value);
        opener.document.getElementById("ADDRESS1_VAL").innerHTML=trimRegister(ADDRESS1);     
        opener.document.getElementById("ADDRESS2_VAL").innerHTML=trimRegister(ADDRESS2);      
        opener.document.getElementById("CITY_VAL").innerHTML=trimRegister(CITY);      
        opener.document.getElementById("STATE_VAL").innerHTML=trimRegister(STATE);     
        opener.document.getElementById("ZIP_VAL").innerHTML=trimRegister(ZIP);      
        opener.document.getElementById("COUNTRY_VAL").innerHTML=trimRegister(COUNTRY);      
        opener.document.getElementById("PHONE_VAL").innerHTML=trimRegister(strPhone);      
        opener.document.getElementById("EMAIL_VAL").innerHTML=trimRegister(EMAIL);
        opener.document.getElementById('SavedYN').value='N';
        opener.document.getElementById("OWNER_NAME_VAL").innerHTML='<a onclick="EditOwner('+trimRegister(strEntitySeq)+')">'+trimRegister(strOwnName)+'</a>';
        
    }
    else if(opener.document.forms[0].name=="Reg_Ped_EditHorseInformation")
    {   
        if(searchFor=='O')
        {
        opener.document.getElementById("OWNER_NAME_VAL").innerHTML='<a onclick="EditOwner('+trimRegister(strEntitySeq)+')">'+trimRegister(strOwnName)+'</a>';
        opener.document.getElementById("OWNER_NO").value=strOWNERNO;
        opener.document.getElementById("HDNENTITYSEQ").value=strEntitySeq;
        }
        else if(searchFor=='B')
        {
        opener.document.getElementById("BreederName_Lbl").innerHTML='<a onclick="EditOwner('+trimRegister(strEntitySeq)+')">'+trimRegister(strOwnName)+'</a>';
        opener.document.getElementById("BREEDER_NO").value=strOWNERNO;
        opener.document.getElementById("breederSeq").value=strEntitySeq;
        }        
    }
    else if(opener.document.forms[0].name=="Reg_Pedigree_NewRegistration")
    {   
        if(searchFor=='O')
        {
        opener.document.getElementById("OWNER_NAME_VAL").innerHTML='<a onclick="EditOwner('+trimRegister(strEntitySeq)+')">'+trimRegister(strOwnName)+'</a>';
        opener.document.getElementById("OwnerNo").value=strOWNERNO;
        opener.document.getElementById("OwnerSeq").value=strEntitySeq;
        }
        else if(searchFor=='B')
        {
        opener.document.getElementById("BreederName_Lbl").innerHTML='<a onclick="EditOwner('+trimRegister(strEntitySeq)+')">'+trimRegister(strOwnName)+'</a>';
        opener.document.getElementById("BreederNo").value=strOWNERNO;
        opener.document.getElementById("BreederSeq").value=strEntitySeq;
        }        
    }
    else if(opener.document.forms[0].name=="Person_ShowHistory_frm")
    {
        opener.document.forms[0].target="_self";
        opener.document.forms[0].method="post";
        opener.document.forms[0].action="Person_ShowHistory.jsp?Mode=1&Enty="+strEntitySeq;
        opener.document.forms[0].submit();        
    }
    else if(opener.document.forms[0].name=="Person_Observation_frm")
    {
        opener.document.forms[0].target="_self";
        opener.document.forms[0].method="post";
        opener.document.forms[0].action="Person_Observations.jsp?Mode=1&Enty="+strEntitySeq;
        opener.document.forms[0].submit();        
    }
    else if(opener.document.forms[0].name=="Person_MemberPin_frm")
    {
        opener.document.forms[0].target="_self";
        opener.document.forms[0].method="post";
        opener.document.forms[0].action="Person_MemberPin.jsp?Mode=1&Enty="+strEntitySeq;
        opener.document.forms[0].submit();        
    }
    else
    {   
        opener.document.forms[0].target="_self";
        opener.document.forms[0].method="post";
        opener.document.forms[0].action="frmReg_OwnerInformation.jsp?Mode=4&FNAME="+strFName+"&LNAME="+strLName+"&ORGNAME="+strOrgName+"&PHONE="+strPhone+"&ON="+strOWNERNO;
        opener.document.forms[0].submit();          
    }
   window.close();
}

function Ajax_PopulateOwner_Entity(obj,hdnEntSeq,txtOwnNo,HdnOwmTyp,HdnMemNo,lblOwnNam,lblAd1,lblAd2,lblCity,lblState,lblZip,lblCountry,lblPhone,lblEmail)
{  
    var xmlhttp;    
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari        
    xmlhttp=new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange=function()
    {    
    if(xmlhttp.readyState==4 && xmlhttp.status==200)
    {
      if(xmlhttp.responseText == 0)       
           return false;
      else 
      {
        var Items=xmlhttp.responseText.split("#@#");            
        opener.document.getElementById(hdnEntSeq).value=trimRegister(Items[0]);              
        opener.document.getElementById(txtOwnNo).value=trimRegister(Items[1]);              
        opener.document.getElementById(HdnOwmTyp).value=trimRegister(Items[2]);                        
        opener.document.getElementById(HdnMemNo).value=trimRegister(Items[4]);
        opener.document.getElementById(lblAd1).innerHTML=trimRegister(Items[7]);     
        opener.document.getElementById(lblAd2).innerHTML=trimRegister(Items[8]);      
        opener.document.getElementById(lblCity).innerHTML=trimRegister(Items[9]);      
        opener.document.getElementById(lblState).innerHTML=trimRegister(Items[10]);     
        opener.document.getElementById(lblZip).innerHTML=trimRegister(Items[11]);      
        opener.document.getElementById(lblCountry).innerHTML=trimRegister(Items[12]);      
        opener.document.getElementById(lblPhone).innerHTML=trimRegister(Items[13]);      
        opener.document.getElementById(lblEmail).innerHTML=trimRegister(Items[14]);            
        opener.document.getElementById(lblOwnNam).innerHTML="<a onclick='AddOwnerbtn_Index()'>"+trimRegister(Items[16])+"</a>";           
        document.getElementById(varFocus).focus();        
        
      }
    }    
    }
    xmlhttp.open("GET","frmReg_SearchEntitySeq.jsp?enty="+obj,true);
    xmlhttp.send(); 
    
}    

</script>
</head>

    <body>          
        <form name="Reg_NewOwnerInformationSearchInclude" >
<%          
    List OwnerList = new ArrayList();

    GeneralServlet gen=new GeneralServlet();

 RowSetFactory factory56 = RowSetProvider.newFactory();
   CachedRowSet crsGetOwnerDetails= factory56.createCachedRowSet();
   // CachedRowSetImpl crsGetOwnerDetails = new CachedRowSetImpl();
    int size_all = 0;
    int asgno=0;     
    String strOwn_Type="";
    String Email="";
    
    if(strSearch.length()>0 && !strType.equals("entyseq") )
    crsGetOwnerDetails = gen.GET_OwnerInformation(strFName.trim(),strLName.trim(),strOrgName.trim(),strPhone,strOwnerNo);
    else if(strSearch.length()>0 && strType.equals("entyseq") )
    crsGetOwnerDetails = gen.Get_IndividualsEntityDetails(strEntitySeq);
    size_all= crsGetOwnerDetails.size();
    Map MpOwnerDetails = new TreeMap();
    int Counter=0;
                
    while (crsGetOwnerDetails.next())
    {
     strFName="";
     strLName="";
     strOrgName="";
     strPhone="";
     strEntitySeq="";
     strOwnerNo="";
     asgno=0;
     strOwnerName="";
     strMName="";
     strAddress="";
     strAddress1="";
     strAddress2="";     
     city="";
     state="";
     zip="";
     country="";
     strOwn_Type="";
     Email="";
     
     if(crsGetOwnerDetails.getString("OWNER_TYPE")!=null)                  
        strOwn_Type=crsGetOwnerDetails.getString("OWNER_TYPE").trim();

    if(crsGetOwnerDetails.getString("FIRSTNAME")!=null)                  
        strFName= crsGetOwnerDetails.getString("FIRSTNAME").trim();

    if(crsGetOwnerDetails.getString("LASTNAME")!=null)                  
        strLName= crsGetOwnerDetails.getString("LASTNAME").trim();  
    
    /* SUFFIX is used as the middle name in the database */
    if(crsGetOwnerDetails.getString("SUFFIX")!=null)                  
        strMName= crsGetOwnerDetails.getString("SUFFIX").trim();       
    
    if(crsGetOwnerDetails.getString("ORGANIZATION_NAME")!=null)                     
        strOrgName= crsGetOwnerDetails.getString("ORGANIZATION_NAME").trim();  

    if(crsGetOwnerDetails.getString("PHONE")!=null)                  
        strPhone= crsGetOwnerDetails.getString("PHONE").trim();

    if(crsGetOwnerDetails.getString("ENTITYSEQ")!=null)
        strEntitySeq= crsGetOwnerDetails.getString("ENTITYSEQ").trim();
    
    if(crsGetOwnerDetails.getString("ASSIGNEDNUM")!=null)
    {
       strOwnerNo= crsGetOwnerDetails.getString("ASSIGNEDNUM").trim();
       asgno=Integer.parseInt(strOwnerNo);  
    }
     
    if(crsGetOwnerDetails.getString("ADDRESS1")!=null)                  
        strAddress1= crsGetOwnerDetails.getString("ADDRESS1").trim();
    else
        strAddress1="";

    if(crsGetOwnerDetails.getString("ADDRESS2")!=null)                  
        strAddress2= crsGetOwnerDetails.getString("ADDRESS2").trim();
    else
        strAddress2="";

    if(crsGetOwnerDetails.getString("CITY")!=null)                  
        city= crsGetOwnerDetails.getString("CITY").trim();

    if(crsGetOwnerDetails.getString("STATE")!=null)                  
        state= crsGetOwnerDetails.getString("STATE").trim();

    if(crsGetOwnerDetails.getString("ZIP")!=null)                  
        zip= crsGetOwnerDetails.getString("ZIP").trim();

    if(crsGetOwnerDetails.getString("COUNTRY")!=null)                  
        country= crsGetOwnerDetails.getString("COUNTRY").trim(); 

    if(crsGetOwnerDetails.getString("EMAIL")!=null)                  
        Email= crsGetOwnerDetails.getString("EMAIL").trim(); 
     
     strOwnerName=strFName+" "+strLName;
	 
     strAddress =strAddress1+" "+strAddress2+" "+city+" "+state+" "+zip+" "+country; 
     
        MpOwnerDetails = new TreeMap();
        
        MpOwnerDetails.put("FNAME",strFName.replace("\"","%22"));
        MpOwnerDetails.put("LNAME",strLName.replace("\"","%22"));

        
        if(strOwn_Type.equalsIgnoreCase("INDIVIDUAL") ||strOwn_Type.equalsIgnoreCase("YOUTH RIDER")||(strOwn_Type.equalsIgnoreCase("") && strOrgName.equals("") ))
            MpOwnerDetails.put("OWNERNAME",strOwnerName);  /* FULL NAME */
        else
            MpOwnerDetails.put("OWNERNAME",strOrgName);

        if(strOwn_Type.equalsIgnoreCase("INDIVIDUAL") ||strOwn_Type.equalsIgnoreCase("YOUTH RIDER")||(strOwn_Type.equalsIgnoreCase("") && strOrgName.equals("") ))
            MpOwnerDetails.put("OWNERNAMES",strOwnerName.replace("\"","%22"));  /* FULL NAME */
        else
            MpOwnerDetails.put("OWNERNAMES",strOrgName.replace("\"","%22"));
        
        MpOwnerDetails.put("PHONE",strPhone);
        MpOwnerDetails.put("ENTITYSEQ",strEntitySeq); 
        
        if(asgno!=0)              
                MpOwnerDetails.put("OWNERNO",asgno);        
        else
             MpOwnerDetails.put("OWNERNO",null);        
        
        if(strAddress.trim().equals("NULL"))
                 strAddress="";

        MpOwnerDetails.put("ADDRESS",strAddress); 
        MpOwnerDetails.put("ADDRESS1",strAddress1); 
        MpOwnerDetails.put("ADDRESS2",strAddress2); 
        MpOwnerDetails.put("CITY",city); 
        MpOwnerDetails.put("STATE",state); 
        MpOwnerDetails.put("ZIP",zip); 
        MpOwnerDetails.put("COUNTRY",country); 
        MpOwnerDetails.put("EMAIL",Email); 
        

        OwnerList.add(MpOwnerDetails);
        Counter=Counter+1;
    }           
    request.setAttribute("OwnerList", OwnerList);
    if(strSearch.length()>0 && strType.equals("1") )
    {    
%>
       

  <display:table  id="Details" name="requestScope.OwnerList" 
                        pagesize="100" 
                        class="grid"
                        style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;text-transform: uppercase;">
    <display:setProperty name="paging.banner.item_name" value="Owner" />
    <display:setProperty name="paging.banner.items_name" value="Owners" />
    <display:setProperty name="paging.banner.some_items_found">

        <span class="pagebanner" >{0} {1} founds,displaying {2} to {3}</span>
        <span ><input type="checkbox" name="ownername" value="OWNER_NAME" onClick="ViewAll_Owner(this.value)"> <font style="font-weight:bold;">View All&nbsp;&nbsp;&nbsp;</font></span>

    </display:setProperty>
    <display:setProperty name="basic.msg.empty_list" value="No Owner found with the Search Critera "/>
        <display:column style="width:1%" headerClass="Grid_Header">
        <input type="radio" name="checkedVal" onClick="returnValues('${Details.FNAME}','${Details.LNAME}','${Details.ORGNAME}','${Details.PHONE}','${Details.ENTITYSEQ}','${Details.OWNERNO}','${Details.OWNERNAMES}','<%=srchType%>',
'${Details.ADDRESS1}','${Details.ADDRESS2}','${Details.CITY}','${Details.STATE}','${Details.ZIP}','${Details.COUNTRY}','${Details.EMAIL}')" />
        </display:column>
        <display:column style="width:5%;Height:30px;"   title="ID#" property="OWNERNO" sortable="true" headerClass="Grid_Header" />       
        <display:column style="width:15%" property="OWNERNAME" title="NAME" sortable="true" headerClass="Grid_Header"/> 
        <display:column style="width:25%"  property="ADDRESS" sortable="true" headerClass="Grid_Header" />        
        <display:column style="width:5%" property="PHONE" sortable="true" headerClass="Grid_Header" />       
        </display:table>   
<%}else if(strSearch.length()>0 && strType.equals("2"))
    {out.println(Counter +" Owners founds,displaying 1 to "+ Counter);
%>       
  <display:table  id="Details" name="requestScope.OwnerList" 
                        class="grid"
                        style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;text-transform: uppercase;">
                        
        <display:column style="width:1%" headerClass="Grid_Header">
        <input type="radio" name="checkedVal" onClick="returnValues('${Details.FNAME}','${Details.LNAME}','${Details.ORGNAME}','${Details.PHONE}','${Details.ENTITYSEQ}','${Details.OWNERNO}','${Details.OWNERNAMES}','<%=srchType%>',
'${Details.ADDRESS1}','${Details.ADDRESS2}','${Details.CITY}','${Details.STATE}','${Details.ZIP}','${Details.COUNTRY}','${Details.EMAIL}')" />
        </display:column>
        <display:column style="width:5%;Height:30px;"   title="ID#" property="OWNERNO" sortable="true" headerClass="Grid_Header" />       
        <display:column style="width:20%" property="OWNERNAME" title="NAME" sortable="true" headerClass="Grid_Header"/> 
        <display:column style="width:25%"  property="ADDRESS" sortable="true" headerClass="Grid_Header" />        
        <display:column style="width:5%" property="PHONE" sortable="true" headerClass="Grid_Header" />       
        </display:table>    
<%}else if(strSearch.length()>0 && strType.equals("5"))
    {
%>


  <display:table  id="Details" name="requestScope.OwnerList"
                        pagesize="100"
                        class="grid"
                        style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;text-transform: uppercase;">
    <display:setProperty name="paging.banner.item_name" value="Person" />
    <display:setProperty name="paging.banner.items_name" value="Persons" />
    <display:setProperty name="paging.banner.some_items_found">

        <span class="pagebanner" >{0} {1} founds,displaying {2} to {3}</span>
        <span ><input type="checkbox" name="Orgname" value="PERSON_NAME" onClick="ViewAll_Owner(this.value)"> <font style="font-weight:bold;">View All&nbsp;&nbsp;&nbsp;</font></span>

    </display:setProperty>

        <display:column style="width:1%" headerClass="Grid_Header">
        <input type="radio" name="checkedVal" onClick="returnValues('${Details.FNAME}','${Details.LNAME}','${Details.ORGNAME}','${Details.PHONE}','${Details.ENTITYSEQ}','${Details.OWNERNO}','${Details.OWNERNAMES}','<%=srchType%>',
'${Details.ADDRESS1}','${Details.ADDRESS2}','${Details.CITY}','${Details.STATE}','${Details.ZIP}','${Details.COUNTRY}','${Details.EMAIL}')" />
        </display:column>
        <display:column style="width:5%;Height:30px;"   title="ID#" property="OWNERNO" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:25%" property="OWNERNAME" title="NAME"  sortable="true" headerClass="Grid_Header" />
        <display:column style="width:25%"  property="ADDRESS" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:5%" property="PHONE" sortable="true" headerClass="Grid_Header" />
        </display:table>
<%}else if(strSearch.length()>0 && strType.equals("6"))
    {out.println(Counter +" Persons founds,displaying 1 to "+ Counter);
%>
  <display:table  id="Details" name="requestScope.OwnerList"
                        class="grid"
                        style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;text-transform: uppercase;">

        <display:column style="width:1%" headerClass="Grid_Header">
        <input type="radio" name="checkedVal" onClick="returnValues('${Details.FNAME}','${Details.LNAME}','${Details.ORGNAME}','${Details.PHONE}','${Details.ENTITYSEQ}','${Details.OWNERNO}','${Details.OWNERNAMES}','<%=srchType%>',
'${Details.ADDRESS1}','${Details.ADDRESS2}','${Details.CITY}','${Details.STATE}','${Details.ZIP}','${Details.COUNTRY}','${Details.EMAIL}')" />
        </display:column>
        <display:column style="width:5%;Height:30px;"   title="ID#" property="OWNERNO" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:25%" property="OWNERNAME" title="NAME" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:25%"  property="ADDRESS" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:5%" property="PHONE" sortable="true" headerClass="Grid_Header" />
        </display:table>
<%}else if(strSearch.length()>0 && strType.equals("entyseq") )
    {    
%>
    <display:table  id="Details" name="requestScope.OwnerList" 
                pagesize="100"
                class="grid"
                style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;text-transform: uppercase;">
    <display:setProperty name="paging.banner.item_name" value="Owner" />
    <display:setProperty name="paging.banner.items_name" value="Owners" />
    <display:setProperty name="paging.banner.some_items_found">

    <span class="pagebanner" >{0} {1} founds,displaying {2} to {3}</span>
    <span ><input type="checkbox" name="ownername" value="OWNER_NAME" onClick="ViewAll_Owner(this.value)"> <font style="font-weight:bold;">View All&nbsp;&nbsp;&nbsp;</font></span>

    </display:setProperty>
    <display:setProperty name="basic.msg.empty_list" value="No Owner found with the Search Critera "/>
    <display:column style="width:1%" headerClass="Grid_Header">
    <input type="radio" name="checkedVal" onClick="returnValues_EntySeq('${Details.ENTITYSEQ}')" />
    </display:column>
    <display:column style="width:5%;Height:30px;"   title="ID#" property="OWNERNO" sortable="true" headerClass="Grid_Header" />       
    <display:column style="width:15%" property="OWNERNAME" title="NAME" sortable="true" headerClass="Grid_Header"/> 
    <display:column style="width:25%"  property="ADDRESS" sortable="true" headerClass="Grid_Header" />        
    <display:column style="width:5%" property="PHONE" sortable="true" headerClass="Grid_Header" />       
    </display:table>   
<%}%>    
<br/>
<br/>
<jsp:include page="/frmBottom_Registration.jsp"/>
</form>
    </body>

</html>