/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


function Save_PointSystem()
{
   var textbox='TxtPos';
    
    var val=document.getElementById("HdnRecSize").value;
    
   //alert(val)

    for(j=1;j<=val;j++)
    {
        var HMValue='';
        for(i=1;i<=5;i++)
        {
            
           HMValue+=document.getElementById(textbox+j+""+i).value+"@";
        }
        
        document.getElementById("HdnTxtVal").value+=document.getElementById("TxtHdnSeq"+j).value+"@"+document.getElementById("TxtHdnCategory"+j).value+"@"+HMValue+"##";
   }   
        document.forms[0].method="post";
        document.forms[0].action="PointSystemServlet";
        document.forms[0].target="_self";
        document.forms[0].submit();
}

function Save_Who_PointSystem()
{
    var textbox='TxtPos';

    var val=document.getElementById("HdnRecSize").value;

   

    for(j=1;j<=val;j++)
    {
        var HMValue='';
        for(i=1;i<=3;i++)
        {
           HMValue+=document.getElementById(textbox+j+""+i).value+"@";
        }

        document.getElementById("HdnTxtVal").value+=document.getElementById("TxtHdnSeq"+j).value+"@"+document.getElementById("TxtHdnCategory"+j).value+"@"+HMValue+"##";
   }

        document.forms[0].method="post";
        document.forms[0].action="PointSystemServlet";
        document.forms[0].target="_self";
        document.forms[0].submit();        
}

function Empty()
{
    document.getElementById("SavedLbl").value='';
    document.getElementById("SavedTxt").value='';
}

function Reset_PointSystem()
{
    document.forms[0].method="post";
    document.forms[0].action="frmPointSystem.jsp?Mode=2";
    document.forms[0].target="_self";
    document.forms[0].submit();
}

function Reset_Who_PointSystem()
{
    document.forms[0].method="post";
    document.forms[0].action="frmWho_Gets_Point.jsp?Mode=2";
    document.forms[0].target="_self";
    document.forms[0].submit();
}

function Sample1(val)
{   
    document.forms[0].method="post";
    document.forms[0].action="frmPointSystem.jsp?Mode=2&Show_type="+val;
    document.forms[0].target="_self";
    document.forms[0].submit();
}

function Sample(val)
{
    document.forms[0].method="post";
    document.forms[0].action="frmWho_Gets_Point.jsp?Mode=2&Show_type="+val;
    document.forms[0].target="_self";
    document.forms[0].submit();
}

function addRowToTablePointSystem()
{
    if(parent.document.getElementById("Show_type").value=='')
        return false;
   
        //var frmheader=parent.document.getElementById("HdnfrmHeader").value;
        var tabObj=parent.document.getElementById("tblSample");
       
        var nextRow = tabObj.rows.length;

        var iRowids=document.getElementById('HdnRecSize').value;

        iRowids=Number(iRowids)+1;

        parent.document.getElementById("HdnRecSize").value=iRowids;

        var Labelid1;
        var Labelid2;
        var Labelid3;
        var Labelid4;
        var Labelid5;
        var Labelid6;
        var txtLabelid1;
        var txtLabelid2;
        var txtLabelid3;
        var txtLabelid4;
        var txtLabelid5;
        var txtLabelid0;
        var txtLabelid6;

        Labelid1="LblPos"+iRowids+"1";
        LabelidSpan1=Labelid1+"span";
        Labelid2="LblPos"+iRowids+"2";
        LabelidSpan2=Labelid2+"span";
        Labelid3="LblPos"+iRowids+"3";
        LabelidSpan3=Labelid3+"span";
        Labelid4="LblPos"+iRowids+"4";
        LabelidSpan4=Labelid4+"span";
        Labelid5="LblPos"+iRowids+"5";
        LabelidSpan5=Labelid5+"span";
        Labelid6="LblPos"+iRowids+"6";
        LabelidSpan6=Labelid6+"span";

        txtLabelid1="TxtPos"+iRowids+"1";
        var txtLabelidSpan1=txtLabelid1+"span"
        txtLabelid2="TxtPos"+iRowids+"2";
        var txtLabelidSpan2=txtLabelid2+"span"
        txtLabelid3="TxtPos"+iRowids+"3";
        var txtLabelidSpan3=txtLabelid3+"span"
        txtLabelid4="TxtPos"+iRowids+"4";
        var txtLabelidSpan4=txtLabelid4+"span"
        txtLabelid5="TxtPos"+iRowids+"5";
        var txtLabelidSpan5=txtLabelid5+"span"

        txtLabelid0="TxtHdnSeq"+iRowids;
        txtLabelid6="TxtHdnCategory"+iRowids;
    
        //parent.document.getElementById("HdnMTotRow").value=iRowids;

//alert(txtLabelid1)
        
        var row = tabObj.insertRow(nextRow);

        var cell1 = row.insertCell(0);
        var Position0="<span id='"+LabelidSpan6+"' class='ped'>"
        Position0 = "<input type='text'  name='"+txtLabelid6+"'  id='"+txtLabelid6+"' "
        Position0 =Position0+" size='15' onmouseout=Checkload('"+LabelidSpan1+"','"+Labelid1+"','"+txtLabelidSpan1+"','"+txtLabelid1+"')>"
        var HdnPosition0 = "<input type='hidden' maxlength='5' name='"+txtLabelid0+"'  id='"+txtLabelid0+"' value=0> "
        cell1.innerHTML=Position0+HdnPosition0;

        var cell1 = row.insertCell(1);
        var Position1="<span id='"+LabelidSpan1+"' class='ped'>"
        Position1 = "<input type='text'  maxlength='5' size='5' name='"+txtLabelid1+"'  id='"+txtLabelid1+"' "
        Position1 =Position1+"  onmouseout=Checkload('"+LabelidSpan1+"','"+Labelid1+"','"+txtLabelidSpan1+"','"+txtLabelid1+"')>"
        cell1.innerHTML=Position1;


        var cell1 = row.insertCell(2);
        var Position2="<span id='"+LabelidSpan2+"' class='ped'>"
        Position2 = "<input type='text' size='5' name='"+txtLabelid2+"'  id='"+txtLabelid2+"' "
        Position2 =Position2+" onmouseout=Checkload('"+LabelidSpan2+"','"+Labelid2+"','"+txtLabelidSpan2+"','"+txtLabelid2+"')>"
        cell1.innerHTML=Position2;

        var cell1 = row.insertCell(3);
        var Position3="<span id='"+LabelidSpan3+"' class='ped'>"
        Position3 = "<input type='text'size='5'  maxlength='5' name='"+txtLabelid3+"'  id='"+txtLabelid3+"' "
        Position3 =Position3+" onmouseout=Checkload('"+LabelidSpan3+"','"+Labelid3+"','"+txtLabelidSpan3+"','"+txtLabelid3+"')>"
        cell1.innerHTML=Position3;

        var cell1 = row.insertCell(4);
        var Position4="<span id='"+LabelidSpan4+"' class='ped'>"
        Position4 = "<input type='text'size='5' maxlength='5' name='"+txtLabelid4+"'  id='"+txtLabelid4+"' "
        Position4 =Position4+"  onmouseout=Checkload('"+LabelidSpan4+"','"+Labelid4+"','"+txtLabelidSpan4+"','"+txtLabelid4+"')>"
        cell1.innerHTML=Position4;


        var cell1 = row.insertCell(5);
        Position5="<span id='"+LabelidSpan5+"' class='ped'>"
        var Position5 = "<input type='text' size='5' maxlength='5' name='"+txtLabelid5+"'  id='"+txtLabelid5+"' "
        Position5 =Position5+" onmouseout=Checkload('"+LabelidSpan5+"','"+Labelid5+"','"+txtLabelidSpan5+"','"+txtLabelid5+"')>"

        var strStringDel = "<IMG src='Images/delete.png' "
        strStringDel=strStringDel+"onclick=fnDelete(this,'"+iRowids+"') align='right'>";


        cell1.innerHTML=Position5+strStringDel;
}



function fnDelete(r,TableID_Delete)
{

    var i=r.parentNode.parentNode.rowIndex;
    //var iRowNext=i+Number(1);

    //document.getElementById("tblSample").deleteRow(iRowNext);
    document.getElementById("tblSample").deleteRow(i);


    /*var HdnDynRowIdsObj=document.getElementById("HdnDynRowIds");
    var HdnDynRowIdsVal=HdnDynRowIdsObj.value;

        if(HdnDynRowIdsVal.indexOf(TableID_Delete) !=-1)
        {
             HdnDynRowIdsVal = HdnDynRowIdsVal.replace(TableID_Delete,'');
             HdnDynRowIdsVal = HdnDynRowIdsVal.replace(',,',',');
             HdnDynRowIdsObj.value=HdnDynRowIdsVal;
        }
        */
}



function addRowToTable_who_gets_PointSystem()
{

 if(parent.document.getElementById("Show_type").value=='')
        return false;
        //var frmheader=parent.document.getElementById("HdnfrmHeader").value;
        var tabObj=parent.document.getElementById("tblSample");

        var nextRow = tabObj.rows.length;

        var iRowids=document.getElementById('HdnRecSize').value;

        iRowids=Number(iRowids)+1;

        parent.document.getElementById("HdnRecSize").value=iRowids;

        var Labelid1;
        var Labelid2;
        var Labelid3;
        var Labelid4;
        
        var txtLabelid1;
        var txtLabelid2;
        var txtLabelid3;
        var txtLabelid4;
        var txtLabelid0;
       

        Labelid1="LblPos"+iRowids+"1";
        LabelidSpan1=Labelid1+"span";
        Labelid2="LblPos"+iRowids+"2";
        LabelidSpan2=Labelid2+"span";
        Labelid3="LblPos"+iRowids+"3";
        LabelidSpan3=Labelid3+"span";
        Labelid4="LblPos"+iRowids+"4";
        LabelidSpan4=Labelid4+"span";
       

        txtLabelid1="TxtPos"+iRowids+"1";
        var txtLabelidSpan1=txtLabelid1+"span"
        txtLabelid2="TxtPos"+iRowids+"2";
        var txtLabelidSpan2=txtLabelid2+"span"
        txtLabelid3="TxtPos"+iRowids+"3";
        var txtLabelidSpan3=txtLabelid3+"span"
        //txtLabelid4="TxtPos"+iRowids+"4";
       // var txtLabelidSpan4=txtLabelid4+"span"
      

        txtLabelid0="TxtHdnSeq"+iRowids;
        txtLabelid4="TxtHdnCategory"+iRowids;

        //parent.document.getElementById("HdnMTotRow").value=iRowids;

        var row = tabObj.insertRow(nextRow);

        var cell1 = row.insertCell(0);
        var Position0="<span id='"+LabelidSpan4+"' class='ped'>"
        Position0 = "<input type='text'  name='"+txtLabelid4+"'  id='"+txtLabelid4+"' "
        Position0 =Position0+" size='20' onmouseout=Checkload('"+LabelidSpan1+"','"+Labelid1+"','"+txtLabelidSpan1+"','"+txtLabelid1+"')>"
        var HdnPosition0 = "<input type='hidden'  name='"+txtLabelid0+"'  id='"+txtLabelid0+"' value=0> "

        cell1.innerHTML=Position0+HdnPosition0;

        var cell1 = row.insertCell(1);
        var Position1="<span id='"+LabelidSpan1+"' class='ped'>"
        Position1 = "<input type='text'  size='5' name='"+txtLabelid1+"'  id='"+txtLabelid1+"' "
        Position1 =Position1+"  onmouseout=Checkload('"+LabelidSpan1+"','"+Labelid1+"','"+txtLabelidSpan1+"','"+txtLabelid1+"')>"
        cell1.innerHTML=Position1;


        var cell1 = row.insertCell(2);
        var Position2="<span id='"+LabelidSpan2+"' class='ped'>"
        Position2 = "<input type='text' size='5' name='"+txtLabelid2+"'  id='"+txtLabelid2+"' "
        Position2 =Position2+" onmouseout=Checkload('"+LabelidSpan2+"','"+Labelid2+"','"+txtLabelidSpan2+"','"+txtLabelid2+"')>"
        cell1.innerHTML=Position2;

        var cell1 = row.insertCell(3);
        var Position3="<span id='"+LabelidSpan3+"' class='ped'>"
        Position3 = "<input type='text'size='5'  name='"+txtLabelid3+"'  id='"+txtLabelid3+"' "
        Position3 =Position3+" onmouseout=Checkload('"+LabelidSpan3+"','"+Labelid3+"','"+txtLabelidSpan3+"','"+txtLabelid3+"')>"
        //cell1.innerHTML=Position3;

        var strStringDel = "<IMG src='Images/delete.png' "
        strStringDel=strStringDel+"onclick=fnDelete(this,'"+iRowids+"') align='right'>";
        cell1.innerHTML=Position3+strStringDel;
    
}



function fnDelete(r,TableID_Delete)
{

    var i=r.parentNode.parentNode.rowIndex;
    //var iRowNext=i+Number(1);

    //document.getElementById("tblSample").deleteRow(iRowNext);
    document.getElementById("tblSample").deleteRow(i);


    /*var HdnDynRowIdsObj=document.getElementById("HdnDynRowIds");
    var HdnDynRowIdsVal=HdnDynRowIdsObj.value;

        if(HdnDynRowIdsVal.indexOf(TableID_Delete) !=-1)
        {
             HdnDynRowIdsVal = HdnDynRowIdsVal.replace(TableID_Delete,'');
             HdnDynRowIdsVal = HdnDynRowIdsVal.replace(',,',',');
             HdnDynRowIdsObj.value=HdnDynRowIdsVal;
        }
        */
}