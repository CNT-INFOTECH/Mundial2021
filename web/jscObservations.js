/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(function() {
   // $("#ShowDate").datepicker();


                    $( "#ShowDate" ).datepicker({
                    changeMonth: true,
                    changeYear: true
                    });

             /*66072011 KUMAR */

             $( "#EndDate" ).datepicker({
                    changeMonth: true,
                    changeYear: true
                    });


             $( "#BtnObservation" )
                .click(function() {

                if(document.getElementById("HdnRegNo").value=="")
                {
                    alert("Please select the Registration number");
                    return false;
                }
//height has changed into 350 from 400
                $('#dialog-Observation').dialog({autoOpen: false,height: 320,width: 600, modal: true});
                $('#dialog-Observation').dialog('open');
                return false;
                
             });

             $( "#BtnSave" ).click(function() {

                 alert(window.parent.document.getElementById("reg_no").value);

             });

             $( "#BtnReset" )
                .click(function() {
                    document.forms[0].method="post";
                    document.forms[0].action="frmObservations.jsp?Mode=2";
                    document.forms[0].target="_self";
                    document.forms[0].submit();

             });
             
             $( "#BtnClose")
                .click(function() {

                var bOK = confirm("Do You Wish to Exit?");
                if (bOK)
                {
                    document.forms[0].target="_self";
                    document.forms[0].method="post";
                    document.forms[0].action="close.jsp";
                    document.forms[0].submit();
                }

             });
             $( "#BtnLeftNavi" )
                .click(function() {

                document.forms[0].method="post";
                document.forms[0].action="frmDocuments.jsp";
                document.forms[0].target="_self";
                document.forms[0].submit();

             });
             $( "#BtnRightNavi" )
                .click(function() {

                 document.forms[0].method="post";
                document.forms[0].action="index.jsp";
                document.forms[0].target="_self";
                document.forms[0].submit();


             });

             $( "#BtnSavePopup" )
                .click(function() {
                  

var val = document.getElementsByName('obsStatus')
//alert("1e"+val.length);
//if(val.length);
if(val[1].checked)
    {
        //alert("temporary");
        //getElementsByName("obsStatus").value="temporary";
        window.parent.document.getElementsByName("obsStatus1").value=document.getElementsByName("obsStatus").value="TEMPORARY";
		if(document.getElementById("EndDate").value=="")
                    {
                        alert("Please Enter the End Date")
                        return false;
                    }
    }
    else
        {
            //alert("permanent");
            //getElementsByName("obsStatus").value="permanent";
            window.parent.document.getElementsByName("obsStatus1").value=document.getElementsByName("obsStatus").value="PERMANENT";
        }
       // alert(document.getElementsByName("obsStatus").value);
                document.getElementById("HdnRegSeq1").value=window.parent.document.getElementById("HdnRegSeq").value;
                document.getElementById("HdnRegNo1").value=window.parent.document.getElementById("HdnRegNo").value;
         //       RegNo=document.getElementById("HdnRegNo1").value;

                //if(document.getElementById("ShowName").value=="")
                //{
                    //alert("Please enter show name");
                    //return false;
                //}
                //if(document.getElementById("ShowDate").value=="")
                //{
                    //alert("Please enter show date");
                   // return false;
                //}
                if(document.getElementById("Observation").value=="")
                {
                    alert("Please enter Observation");
                    return false;
                }

                /* 07072011 kumar added */

                if(document.getElementById("ObservationType").value=="")
                {
                    alert("Please enter ObservationType");
                    return false;
                }
            /*    if(document.getElementById("obsStatus").value=="")
                {
                    alert("please enter obsStatus");
                    return false;
                }*/
             //if(document.getElementsByName("obsStatus").value=="TEMPORARY")
               //{
            /*    if(document.getElementById("EndDate").value=="")
                {
                    alert("please enter EndDate");
                    return false;
                //} *
               }*/
                if(document.getElementById("UserName").value=="")
                {
                    alert("Please enter UserName");
                    return false;
                }

                window.parent.jQuery('#dialog-Observation').dialog('close');
                window.parent.document.getElementById("ShowName1").value=document.getElementById("ShowName").value;
                window.parent.document.getElementById("ShowDate1").value=document.getElementById("ShowDate").value;
                window.parent.document.getElementById("Observation1").value=document.getElementById("Observation").value;
                window.parent.document.getElementById("ObservationSeq1").value=document.getElementById("ObservationSeq").value;

                window.parent.document.getElementById("ObservationType1").value=document.getElementById("ObservationType").value;
                //window.parent.document.getElementById("obsStatus1").value=document.getElementById("obsStatus").value;
                window.parent.document.getElementById("obsStatus1").value=document.getElementsByName("obsStatus").value;
                
                window.parent.document.getElementById("EndDate1").value=document.getElementById("EndDate").value;
                window.parent.document.getElementById("UserName1").value=document.getElementById("UserName").value;


                
                parent.document.forms[0].method="post";
                parent.document.forms[0].action="PasoTrackServlet";
                //document.forms[0].target="_self";
                parent.document.forms[0].submit();    
               // Refresh(RegNo);
                
             });

             $( "#BtnCancel" )
                .click(function() {
                window.parent.jQuery('#dialog-Observation').dialog('close');

             });


/*
	function formatItem(row) {
		 finalVal_formatItem=row[0].split('#@#')
		 return finalVal_formatItem[0] ;
	}
	function formatResult(row) {
		 finalVal_formatResult=row[0].split('#@#')
		return finalVal_formatResult[0].replace(/(<.+?>)/gi, '');
	}


	$("#ShowName").autocomplete('Auto_ShowsList.jsp', {
		width: 200,
		matchContains: true,
		formatItem: formatItem,
		formatResult: formatResult
	});

        $("#ShowName").result(function(event, data, formatted) {
            var hiddenShowSeq = $("#ShowSeq");
            var value = data.toString().split('#@#');
             hiddenShowSeq.val(value[1]);
             });

*/
});

function Refresh(RegNo)
{      

        window.parent.document.forms[0].method="post";
        window.parent.document.forms[0].action="frmObservations.jsp?Mode=1&RegNo="+RegNo;
        window.parent.document.forms[0].target="_self";
        window.parent.document.forms[0].submit();
    
}


function fnEndDate()
  {
        var val = document.getElementsByName('obsStatus');

            if(val[0].checked)
            {
                if(document.getElementsByName("obsStatus").value="PERMENANT")
                {
                //document.getElementById("EndDate").value="";
                document.getElementById("EndDate").style.visibility="hidden";
                }
            }

            if(val[1].checked)
            {

                if(document.getElementsByName("obsStatus").value="TEMPORARY")
                {
                  document.getElementById("EndDate").style.visibility="visible";
                }
            }
}