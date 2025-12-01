noRows=0;
function addPlan(src)
{

   
    FILE_TableID_PLAN=src.name;
    noRows = noRows + 1;
 
    var tbody = document.getElementById(FILE_TableID_PLAN)
    PlanSize=document.forms[0].hdnRowSize.value

	var iteration=parseInt(PlanSize)+1;
	Organization='organization'+iteration;       
	

    var newRowID='Row'+iteration;
    var newRow = tbody.insertRow(-1);
    newRow.setAttribute('id', newRowID);
    
    var OrgSeqID="OrgSeq"+iteration
    var OrgNameID="Organization"+iteration
    


        var Cell = newRow.insertCell(-1);
//onClick=deleteRow(this,FILE_TableID_PLAN)
	Cell.innerHTML = '<img src=Images/delete.png  name="PlanTab" onClick=deleteRow(this,FILE_TableID_PLAN) >'
        Cell = newRow.insertCell(-1);

        Cell.innerHTML = '<font class="label">ORGANIZATION</font>';
        Cell = newRow.insertCell(-1);

        Cell.innerHTML = '<img src="Images/dropdown_icon4.gif"  onClick=OpenCommonRef("Organization","'+OrgSeqID+'","'+OrgNameID+'")>'
     

        Cell = newRow.insertCell(-1);

       
        Cell.innerHTML = '<input type="hidden"  size="2" id="'+OrgSeqID +'" name="'+OrgSeqID +'" >\n\
                          <input type="text" id="'+OrgNameID +'"  name="'+OrgNameID +'" style="text-transform: uppercase;background-color:#FFF8DC;width:143px;border: 1px solid #000000;" value="" Readonly >'



        Cell = newRow.insertCell(-1);
        Cell.innerHTML = '&nbsp;'


      document.forms[0].hdnRowSize.value=iteration
}



//function deleteRow(r,TableID_Delete)
//{
    //var userid=document.forms[0].userId.value;
   // var org=document.forms[0].Organization[i].value;
    
//    var i=r.parentNode.parentNode.rowIndex;
    
    
//    var bok=confirm('Do you want to delete this Record?')
     
//   if(bok==true)
//     {


//         var userid=document.forms[0].userId.value;
//         var org=document.forms[0].Organization[i].value;
       
//     if (org==null)
//            {
            
//                document.getElementById(TableID_Delete).deleteRow(i);
//            }
            //else{
              //  alert(i);
            //}
         //document.getElementById(TableID_Delete).deleteRow(i);
//        else if(org!=null)
//            {
            
//            var myjsp2call = 'DeleteOrg.jsp?userid='+userid+'&Organization='+org;
//            window.location.href = myjsp2call;
            
//            window.parent.location('DeleteOrg.jsp?userid='+userid+'&Organization='+org);
            
//            }
            
//        document.getElementById(TableID_Delete).deleteRow(i);
        
        
//     }
//   return true

//}




function OpenCommonRef(DgTitle,RetnID,RetnSeqID)
{
   
    $('#dialog-CmmnRef').dialog({autoOpen: false,height: 400,width: 400, modal: true,title:DgTitle});
    $('#dialog-CmmnRef').dialog('open');
    $("#modalIFrame_CmmnRef").attr('src','frmCommonRefOrg.jsp?RefType='+DgTitle+'&ReturnID='+RetnID+'&ReturnVal='+RetnSeqID);

    return false;

}

noRows_roles=0;

function addPlan_roles(src)
{


    FILE_TableID_PLAN_roles=src.name;
    noRows_roles = noRows_roles + 1;

	var tbody_roles = document.getElementById(FILE_TableID_PLAN_roles);
    PlanSize_roles=document.forms[0].hdnRowSize_roles.value

   
	var iteration=parseInt(PlanSize_roles)+1;
	Role='role'+iteration;	

    var newRowID_roles='Row_role'+iteration;
    
    var newRow_roles = tbody_roles.insertRow(-1);
    newRow_roles.setAttribute('id_roles', newRowID_roles);
    
    var RoleSeqID="RoleSeq"+iteration
    var RoleNameID="Role"+iteration



        var Cell = newRow_roles.insertCell(-1);
//onClick=deleteRow(this,FILE_TableID_PLAN)
	Cell.innerHTML = '<img src=Images/delete.png  name="PlanTab_roles" onClick=deleteRow(this,FILE_TableID_PLAN_roles) >'
        Cell = newRow_roles.insertCell(-1);

        Cell.innerHTML = '<font class="label">USER ROLE</font>'
        Cell = newRow_roles.insertCell(-1);

        Cell.innerHTML = '<img src="Images/Find12.jpg"  onClick=OpenUserSearch("Role","'+RoleSeqID+'","'+RoleNameID+'")>'


        Cell = newRow_roles.insertCell(-1);


        Cell.innerHTML = '<input type="hidden"  size="2" id="'+RoleSeqID +'" name="'+RoleSeqID +'" >\n\
                          <input type="text" id="'+RoleNameID +'"  name="'+RoleNameID +'" style="text-transform: uppercase;background-color:#FFF8DC;width:143px;border: 1px solid #000000;" value="" Readonly >'



        Cell = newRow_roles.insertCell(-1);
        Cell.innerHTML = '&nbsp;'

      document.forms[0].hdnRowSize_roles.value=iteration
}

