/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function trimRegister (str) {
	str = str.replace(/^\s+/, '');
	for (var i = str.length - 1; i >= 0; i--) {
		if (/\S/.test(str.charAt(i))) {
			str = str.substring(0, i + 1);
			break;
		}
	}
	return str;
}


function fnSearch()
{  
    bViewAll=parent.document.forms[0].HdnViewAll.value;    
    document.forms[0].HdnViewAll.value='N';
    
    document.forms[0].method="post";
    document.forms[0].action="frmRegistrationSearch.jsp?Mode=1&ViewAll="+bViewAll;
    document.forms[0].target="_self";
    document.forms[0].submit();   
}

$(function() {       
                     
               $("#datepickerFrom").datepicker({
                    changeMonth: true,
                    changeYear: true
                });

                $( "#datepickerTo" ).datepicker({
                    changeMonth: true,
                    changeYear: true
                });

                $( "#DOBFrom" ).datepicker({
                    changeMonth: true,
                    changeYear: true
                });

                $( "#DOBTo" ).datepicker({
                    changeMonth: true,
                    changeYear: true
                });
                
                $( "#DODFrom" ).datepicker({
                    changeMonth: true,
                    changeYear: true
                });
                
                $( "#DODTo" ).datepicker({
                    changeMonth: true,
                    changeYear: true
                });

             $( "#BtnRegistrationPrint" )
                .click(function() {
                document.forms[0].method="post";
                document.forms[0].target="_Blank"
		document.forms[0].action="PDFServlet";
		document.forms[0].submit();

             });

             $( "#BtnRegistrationViewAll" ).click(function() {

                document.forms[0].datepickerFrom.value="";
                document.forms[0].datepickerTo.value="";
                document.forms[0].regno.value="";
                document.forms[0].DOBFrom.value="";
                document.forms[0].DOBTo.value="";
                document.forms[0].MicroChipNo.value="";
                document.forms[0].AgeFrom.value="";
                document.forms[0].AgeTo.value="";
                document.forms[0].registrytype.value="";
                document.forms[0].Horsegender.value="";
                document.forms[0].Emb_Transfer.value="";
                document.forms[0].TxtANO.value="";
                document.forms[0].DNACer.value="";                
                document.forms[0].TxtSire.value="";
                document.forms[0].TxtSireName.value="";
                document.forms[0].TxtSireSeq.value="";                
                document.forms[0].TxtDamName.value="";
                document.forms[0].TxtDam.value="";
                document.forms[0].TxtDamSeq.value="";                
                document.forms[0].modality.value="";
                document.forms[0].Owner.value="";
                document.forms[0].OwnerName.value="";
                document.forms[0].InPedigree.value="";
                document.forms[0].InPedigreeName.value="";
                document.forms[0].Breeder.value="";
                document.forms[0].BreederName.value="";
                document.forms[0].FeuroDeConcurso.value="";
                document.forms[0].Status.value="";
                document.forms[0].HdnRegSeq.value="";
                document.forms[0].HorseName.value="";
                document.forms[0].DODFrom.value="";
                document.forms[0].DODTo.value="";
                //document.forms[0].TxtPlaceSeq.value="";
                document.forms[0].TxtPlaceName.value="";
                document.forms[0].TxtObservationType.value="";
                
                
                document.forms[0].method="post";
                document.forms[0].action="frmRegistrationSearch.jsp?Mode=2";
                document.forms[0].target="_self";
                document.forms[0].submit();

             });




             $( "#BtnRegistrationReset" )
                .click(function() {
                    document.forms[0].method="post";
                    document.forms[0].action="frmRegistrationSearch.jsp?Mode=";
                    document.forms[0].target="_self";
                    document.forms[0].submit();

             });
             $( "#BtnRegistrationClose")
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
             $( "#BtnRegistrationETE" )
                .click(function() {

                document.forms[0].target="_blank";
                document.forms[0].method="post";
                document.forms[0].action="PDFServletExcel?PAGEID=REGISTRATIONSEARCH";
                document.forms[0].submit();

             });

             $( "#SireSearchbtn" )
                    .click(function() {

                        bViewAll=document.forms[0].HdnViewAll_Sire.value;    
                        document.forms[0].HdnViewAll_Sire.value='N';
                        
                        document.forms[0].method="post";
                        //document.forms[0].action="frmSireSearchPopupInclude.jsp";
                        //document.forms[0].action="SireSample.jsp?Mode=1";
                        document.forms[0].action="frmSireSearchPopup.jsp?Mode=1&ViewAll="+bViewAll;
                        document.forms[0].target="_self";
                        document.forms[0].submit();

            });

            $( "#DamSearchbtn" )
            .click(function() {
                
                bViewAll=document.forms[0].HdnViewAll_Dam.value;    
                        document.forms[0].HdnViewAll_Dam.value='N';
                        
                document.forms[0].method="post";
                //document.forms[0].action="frmDamSearchPopupInclude.jsp";
                document.forms[0].action="frmDamSearchPopup.jsp?Mode=1&ViewAll="+bViewAll;
                document.forms[0].target="_self";
                document.forms[0].submit();

            });
            
            $( "#BreederSearchbtn" )
            .click(function() {
                
                bViewAll=document.forms[0].HdnViewAll_Breeder.value;    
                document.forms[0].HdnViewAll_Breeder.value='N';
                
                document.forms[0].method="post";               
                document.forms[0].action="frmBreederSearchPopup.jsp?Mode=1&ViewAll="+bViewAll;
                document.forms[0].target="_self";
                document.forms[0].submit();
                    
                /*
                if(document.forms[0].Org_Name.value=='')
                {
                    document.forms[0].method="post";               
                    document.forms[0].action="frmBreederSearchPopup.jsp?Mode=1&ViewAll="+bViewAll+"&Type=PER";
                    document.forms[0].target="_self";
                    document.forms[0].submit();
                }
                else
                {                    
                    document.forms[0].method="post";               
                    document.forms[0].action="frmBreederSearchPopup.jsp?Mode=1&ViewAll="+bViewAll+"&Type=ORG";
                    document.forms[0].target="_self";
                    document.forms[0].submit();
                }
                */
            });
            
            
             $( "#OwnerSearchbtn" )
             .click(function() {                   
                
                bViewAll=document.forms[0].HdnViewAll_Owner.value;    
                document.forms[0].HdnViewAll_Owner.value='N';
                
                document.forms[0].method="post";               
                document.forms[0].action="frmReg_OwnerSearchPopup.jsp?Mode=1&ViewAll="+bViewAll;
                document.forms[0].target="_self";
                document.forms[0].submit();
                
                
                /*
                  if(document.forms[0].Org_Name.value=='')
                {      
                document.forms[0].method="post";               
                document.forms[0].action="frmReg_OwnerSearchPopup.jsp?Mode=1&ViewAll="+bViewAll+"&Type=PER";
                document.forms[0].target="_self";
                document.forms[0].submit();
                }
                else
                {
                        document.forms[0].method="post";               
                        document.forms[0].action="frmReg_OwnerSearchPopup.jsp?Mode=1&ViewAll="+bViewAll+"&Type=ORG";
                        document.forms[0].target="_self";
                        document.forms[0].submit();
                    }
                    */
            });
            
            $( "#SireSearchSelectbtn" )
            .click(function() {
                
                var frmName=document.forms[0].name;
               
                
                var keyVals='';

                var SeqVals='';
                var RegNumVals='';
                var RegNameVals='';

                var Count=0;
                if(frmName=='frmSireSearchPopup')
                {
                if (document.forms[0].ChkSelected.checked && Count==0)
                    {
                        SelectedVals= document.forms[0].ChkSelected.value;                       
                                              
                        var SelectedValsSplit=SelectedVals.split("@#@");

                        SeqVals=SelectedValsSplit[5]+"; ";

                        RegNumVals=SelectedValsSplit[1]+"; ";

                        RegNameVals=SelectedValsSplit[0]+"; ";                        
                    
                        Count=Count+1;
                        
                        var TextSeqVal=window.parent.document.getElementById("TxtSireSeq").value;
                        var TextNameVal=window.parent.document.getElementById("TxtSireName").value;
                        var TextRegNumVal=window.parent.document.getElementById("TxtSire").value;

                        window.parent.document.getElementById("TxtSireSeq").value="";
                        window.parent.document.getElementById("TxtSire").value="";
                        window.parent.document.getElementById("TxtSireName").value="";

                        window.parent.document.getElementById("TxtSireSeq").value=TextSeqVal+SeqVals;
                        window.parent.document.getElementById("TxtSire").value=TextRegNumVal+RegNumVals;
                        window.parent.document.getElementById("TxtSireName").value=TextNameVal+RegNameVals;
                         window.parent.jQuery('#dialog-SireReg').dialog('close')
                    }                    
                   
                   
                   
            else
                {
                for (counter = 0;  counter <= document.forms[0].ChkSelected.length; counter++)
                {   
                    if (document.forms[0].ChkSelected[counter].checked)
                    {
                        SelectedVals= document.forms[0].ChkSelected[counter].value;                       
                        
                        var SelectedValsSplit=SelectedVals.split("@#@");

                        SeqVals=SelectedValsSplit[5]+"; ";

                        RegNumVals=SelectedValsSplit[1]+"; ";

                        RegNameVals=SelectedValsSplit[0]+"; ";                        
                    
                        Count=Count+1;
                        
                        var TextSeqVal=window.parent.document.getElementById("TxtSireSeq").value;
                        var TextNameVal=window.parent.document.getElementById("TxtSireName").value;
                        var TextRegNumVal=window.parent.document.getElementById("TxtSire").value;

                        window.parent.document.getElementById("TxtSireSeq").value="";
                        window.parent.document.getElementById("TxtSire").value="";
                        window.parent.document.getElementById("TxtSireName").value="";

                        window.parent.document.getElementById("TxtSireSeq").value=TextSeqVal+SeqVals;
                        window.parent.document.getElementById("TxtSire").value=TextRegNumVal+RegNumVals;
                        window.parent.document.getElementById("TxtSireName").value=TextNameVal+RegNameVals;
                    }                    
                    window.parent.jQuery('#dialog-SireReg').dialog('close')
                }
                }
                }
                else
               {
                    
                if (document.forms[0].ChkSelected.checked && Count==0)
                    {
                        SelectedVals= document.forms[0].ChkSelected.value;                       
                                              
                        var SelectedValsSplit=SelectedVals.split("@#@");

                        SeqVals=SelectedValsSplit[5]+"; ";

                        RegNumVals=SelectedValsSplit[1]+"; ";

                        RegNameVals=SelectedValsSplit[0]+"; ";                        
                    
                        Count=Count+1;
                        
                        /*var TextSeqVal=window.parent.document.getElementById("TxtSireSeq").value;
                        var TextNameVal=window.parent.document.getElementById("TxtSireName").value;
                        var TextRegNumVal=window.parent.document.getElementById("TxtSire").value;

                        window.parent.document.getElementById("TxtSireSeq").value="";
                        window.parent.document.getElementById("TxtSire").value="";
                        window.parent.document.getElementById("TxtSireName").value="";

                        window.parent.document.getElementById("TxtSireSeq").value=TextSeqVal+SeqVals;
                        window.parent.document.getElementById("TxtSire").value=TextRegNumVal+RegNumVals;
                        window.parent.document.getElementById("TxtSireName").value=TextNameVal+RegNameVals;
                        window.parent.jQuery('#dialog-SireSearchPopupList').dialog('close')
                        */
                        window.parent.document.getElementById("TxtSireSeq").value="";
                        window.parent.document.getElementById("TxtSire").value="";
                        window.parent.document.getElementById("TxtSireName").value="";

                        window.parent.document.getElementById("TxtSireSeq").value=SeqVals;
                        window.parent.document.getElementById("TxtSire").value=RegNumVals;
                        window.parent.document.getElementById("TxtSireName").value=RegNameVals;
                        window.parent.jQuery('#dialog-SireSearchPopupList').dialog('close')
                        
                        
                    }                                       
            else
                {
                for (counter = 0;  counter <= document.forms[0].ChkSelected.length; counter++)
                {   
                    if (document.forms[0].ChkSelected[counter].checked)
                    {
                        SelectedVals= document.forms[0].ChkSelected[counter].value;                       
                        
                        var SelectedValsSplit=SelectedVals.split("@#@");

                        SeqVals=SelectedValsSplit[5]+"; ";

                        RegNumVals=SelectedValsSplit[1]+"; ";

                        RegNameVals=SelectedValsSplit[0]+"; ";                        
                    
                        Count=Count+1;
                        
                        /*var TextSeqVal=window.parent.document.getElementById("TxtSireSeq").value;
                        var TextNameVal=window.parent.document.getElementById("TxtSireName").value;
                        var TextRegNumVal=window.parent.document.getElementById("TxtSire").value;

                        window.parent.document.getElementById("TxtSireSeq").value="";
                        window.parent.document.getElementById("TxtSire").value="";
                        window.parent.document.getElementById("TxtSireName").value="";

                        window.parent.document.getElementById("TxtSireSeq").value=TextSeqVal+SeqVals;
                        window.parent.document.getElementById("TxtSire").value=TextRegNumVal+RegNumVals;
                        window.parent.document.getElementById("TxtSireName").value=TextNameVal+RegNameVals;*/
                        
                        window.parent.document.getElementById("TxtSireSeq").value="";
                        window.parent.document.getElementById("TxtSire").value="";
                        window.parent.document.getElementById("TxtSireName").value="";

                        window.parent.document.getElementById("TxtSireSeq").value=SeqVals;
                        window.parent.document.getElementById("TxtSire").value=RegNumVals;
                        window.parent.document.getElementById("TxtSireName").value=RegNameVals;                        
                        
                    }                    
                    window.parent.jQuery('#dialog-SireSearchPopupList').dialog('close')
                }
                }
                }
                /*if(Count==0)
                {
                   alert('Please select Horse')
                     return false;
                }
                               
                /*
                var TextSeqVal=window.parent.document.getElementById("TxtSireSeq").value;
                var TextNameVal=window.parent.document.getElementById("TxtSireName").value;
                var TextRegNumVal=window.parent.document.getElementById("TxtSire").value;
                
                window.parent.document.getElementById("TxtSireSeq").value="";
                window.parent.document.getElementById("TxtSire").value="";
                window.parent.document.getElementById("TxtSireName").value="";
                
                window.parent.document.getElementById("TxtSireSeq").value=TextSeqVal+SeqVals;
                window.parent.document.getElementById("TxtSire").value=TextRegNumVal+RegNumVals;
                window.parent.document.getElementById("TxtSireName").value=TextNameVal+RegNameVals;
                
                */
                
                /*window.parent.document.getElementById("TxtSireSeq").value=SeqVals;
                window.parent.document.getElementById("TxtSire").value=RegNumVals;
                window.parent.document.getElementById("TxtSireName").value=RegNameVals;*/

                //window.parent.jQuery('#dialog-SireReg').dialog('close')


            });

            $( "#DamSearchSelectbtn" )
            .click(function() {
               
               var frmName=document.forms[0].name;
               var keyVals='';

                var SeqVals='';
                var RegNumVals='';
                var RegNameVals='';

                var Count=0;
                
                 if(frmName=='frmDamSearchPopup')
                {
        
                    if (document.forms[0].ChkSelected.checked && Count==0)
                    {
                        SelectedVals= document.forms[0].ChkSelected.value;
                       
                        var SelectedValsSplit=SelectedVals.split("@#@");
                    
                        SeqVals=SelectedValsSplit[5]+"; ";

                        RegNumVals=SelectedValsSplit[1]+"; ";

                        RegNameVals=SelectedValsSplit[0]+"; ";                        
                    
                        Count=Count+1;
                        
                        var TextSeqVal=window.parent.document.getElementById("TxtDamSeq").value;
                        var TextNameVal=window.parent.document.getElementById("TxtDamName").value;
                        var TextRegNumVal=window.parent.document.getElementById("TxtDam").value;

                        window.parent.document.getElementById("TxtDamSeq").value="";
                        window.parent.document.getElementById("TxtDam").value="";
                        window.parent.document.getElementById("TxtDamName").value="";

                        window.parent.document.getElementById("TxtDamSeq").value=TextSeqVal+SeqVals;
                        window.parent.document.getElementById("TxtDam").value=TextRegNumVal+RegNumVals;
                        window.parent.document.getElementById("TxtDamName").value=TextNameVal+RegNameVals;
                                        
                    window.parent.jQuery('#dialog-DamReg').dialog('close')
             }else{
        
                for (counter = 0;  counter <= document.forms[0].ChkSelected.length; counter++)
                {                    
                    if (document.forms[0].ChkSelected[counter].checked)
                    {
                        SelectedVals= document.forms[0].ChkSelected[counter].value;
                       
                        var SelectedValsSplit=SelectedVals.split("@#@");
                    
                        SeqVals=SelectedValsSplit[5]+"; ";

                        RegNumVals=SelectedValsSplit[1]+"; ";

                        RegNameVals=SelectedValsSplit[0]+"; ";                        
                    
                        Count=Count+1;
                        
                        var TextSeqVal=window.parent.document.getElementById("TxtDamSeq").value;
                        var TextNameVal=window.parent.document.getElementById("TxtDamName").value;
                        var TextRegNumVal=window.parent.document.getElementById("TxtDam").value;

                        window.parent.document.getElementById("TxtDamSeq").value="";
                        window.parent.document.getElementById("TxtDam").value="";
                        window.parent.document.getElementById("TxtDamName").value="";

                        window.parent.document.getElementById("TxtDamSeq").value=TextSeqVal+SeqVals;
                        window.parent.document.getElementById("TxtDam").value=TextRegNumVal+RegNumVals;
                        window.parent.document.getElementById("TxtDamName").value=TextNameVal+RegNameVals;
                    }                    
                    window.parent.jQuery('#dialog-DamReg').dialog('close')
                }
                }
                }
                else
                {
                    if (document.forms[0].ChkSelected.checked && Count==0)
                    {
                        SelectedVals= document.forms[0].ChkSelected.value;
                       
                        var SelectedValsSplit=SelectedVals.split("@#@");
                    
                        SeqVals=SelectedValsSplit[5]+"; ";

                        RegNumVals=SelectedValsSplit[1]+"; ";

                        RegNameVals=SelectedValsSplit[0]+"; ";                        
                    
                        Count=Count+1;
                        /*
                        var TextSeqVal=window.parent.document.getElementById("TxtDamSeq").value;
                        var TextNameVal=window.parent.document.getElementById("TxtDamName").value;
                        var TextRegNumVal=window.parent.document.getElementById("TxtDam").value;

                        window.parent.document.getElementById("TxtDamSeq").value="";
                        window.parent.document.getElementById("TxtDam").value="";
                        window.parent.document.getElementById("TxtDamName").value="";

                        window.parent.document.getElementById("TxtDamSeq").value=TextSeqVal+SeqVals;
                        window.parent.document.getElementById("TxtDam").value=TextRegNumVal+RegNumVals;
                        window.parent.document.getElementById("TxtDamName").value=TextNameVal+RegNameVals;
                                        
                    window.parent.jQuery('#dialog-DamSearchPopupList').dialog('close')
                    */
                    
                    window.parent.document.getElementById("TxtDamSeq").value="";
                    window.parent.document.getElementById("TxtDam").value="";
                    window.parent.document.getElementById("TxtDamName").value="";

                    window.parent.document.getElementById("TxtDamSeq").value=SeqVals;
                    window.parent.document.getElementById("TxtDam").value=RegNumVals;
                    window.parent.document.getElementById("TxtDamName").value=RegNameVals;

                    window.parent.jQuery('#dialog-DamSearchPopupList').dialog('close')
                    
             }else{
        
                for (counter = 0;  counter <= document.forms[0].ChkSelected.length; counter++)
                {                    
                    if (document.forms[0].ChkSelected[counter].checked)
                    {
                        SelectedVals= document.forms[0].ChkSelected[counter].value;
                       
                        var SelectedValsSplit=SelectedVals.split("@#@");
                    
                        SeqVals=SelectedValsSplit[5]+"; ";

                        RegNumVals=SelectedValsSplit[1]+"; ";

                        RegNameVals=SelectedValsSplit[0]+"; ";                        
                    
                        Count=Count+1;
                        /*
                        var TextSeqVal=window.parent.document.getElementById("TxtDamSeq").value;
                        var TextNameVal=window.parent.document.getElementById("TxtDamName").value;
                        var TextRegNumVal=window.parent.document.getElementById("TxtDam").value;

                        window.parent.document.getElementById("TxtDamSeq").value="";
                        window.parent.document.getElementById("TxtDam").value="";
                        window.parent.document.getElementById("TxtDamName").value="";

                        window.parent.document.getElementById("TxtDamSeq").value=TextSeqVal+SeqVals;
                        window.parent.document.getElementById("TxtDam").value=TextRegNumVal+RegNumVals;
                        window.parent.document.getElementById("TxtDamName").value=TextNameVal+RegNameVals;*/
                        
                        window.parent.document.getElementById("TxtDamSeq").value="";
                        window.parent.document.getElementById("TxtDam").value="";
                        window.parent.document.getElementById("TxtDamName").value="";

                        window.parent.document.getElementById("TxtDamSeq").value=SeqVals;
                        window.parent.document.getElementById("TxtDam").value=RegNumVals;
                        window.parent.document.getElementById("TxtDamName").value=RegNameVals;

                    
                    }                    
                    window.parent.jQuery('#dialog-DamSearchPopupList').dialog('close')
                }
                }
                
                }
                
                /*if(Count==0)
                {
                   alert('Please select Horse')
                     return false;
                }
                */
                

                /*var keyVals='';

                var SeqVals='';
                var RegNumVals='';
                var RegNameVals='';

                var Count=0;
    
        
                for (counter = 1;  counter < document.forms[0].ChkSelected.length; counter++)
                {
                    if (document.forms[0].ChkSelected[counter].checked)
                    {
                        SelectedVals= document.forms[0].ChkSelected[counter].value;
                        keyVals=keyVals+SelectedVals+"@#@";

                        var SelectedValsSplit=SelectedVals.split("@@@");

                        SeqVals=SeqVals+SelectedValsSplit[0]+"; ";

                        RegNumVals=RegNumVals+SelectedValsSplit[2]+"; ";

                        RegNameVals=RegNameVals+SelectedValsSplit[1]+"; ";

                        Count=Count+1;
                    }
                }


                if(Count==0)
                {
                   alert('Please select Horse')
                     return false;
                }
                
                
                
                var TextSeqVal=window.parent.document.getElementById("TxtDamSeq").value;
                var TextNameVal=window.parent.document.getElementById("TxtDamName").value;
                var TextRegNumVal=window.parent.document.getElementById("TxtDam").value;
                
                window.parent.document.getElementById("TxtDamSeq").value="";
                window.parent.document.getElementById("TxtDam").value="";
                window.parent.document.getElementById("TxtDamName").value="";
                
                window.parent.document.getElementById("TxtDamSeq").value=TextSeqVal+SeqVals;
                window.parent.document.getElementById("TxtDam").value=TextRegNumVal+RegNumVals;
                window.parent.document.getElementById("TxtDamName").value=TextNameVal+RegNameVals;
                
                
                
                /*window.parent.document.getElementById("TxtSireSeq").value=SeqVals;
                window.parent.document.getElementById("TxtSire").value=RegNumVals;
                window.parent.document.getElementById("TxtSireName").value=RegNameVals;*/

                //window.parent.jQuery('#dialog-DamReg').dialog('close')


            });


       $( "#OwnerSearchSelectbtn" )
            .click(function() {
                
                var frmName=document.forms[0].name;
                
                //alert(frmName)
                
                var keyVals='';
                var SeqVals='';
                var RegNumVals='';
                var RegNameVals='';

                var Count=0;
                if(frmName=='frmReg_OwnerSearchPopup')
                {
                    if (document.forms[0].ChkSelected.checked && Count==0)
                    {
                        //alert("Veera")
                        SelectedVals= document.forms[0].ChkSelected.value;
                        
                        var SelectedValsSplit=SelectedVals.split("@#@");

                       // alert(SelectedVals)
                        //SeqVals=SelectedValsSplit[4]+"; ";
                        SeqVals=SelectedValsSplit[2]+"; ";
                        
                        //alert(SeqVals);

                        //var Name=SelectedValsSplit[0]+' '+SelectedValsSplit[1];
                        var Name=SelectedValsSplit[0];
                        
                        RegNameVals=Name+"; ";

                        //alert(RegNameVals);
                        
                        Count=Count+1;
                        
                        var TextSeqVal=window.parent.document.getElementById("Owner").value;
                        var TextNameVal=window.parent.document.getElementById("OwnerName").value;


                        window.parent.document.getElementById("Owner").value="";                
                        window.parent.document.getElementById("OwnerName").value="";

                        window.parent.document.getElementById("Owner").value=TextSeqVal+SeqVals;                
                        window.parent.document.getElementById("OwnerName").value=TextNameVal+RegNameVals;
                    
                    window.parent.jQuery('#dialog-OwnerSearch').dialog('close');
                    }
                    else
                        {
                
                
                for (counter = 0;  counter <= document.forms[0].ChkSelected.length; counter++)
                {
                    if (document.forms[0].ChkSelected[counter].checked)
                    {
                        SelectedVals= document.forms[0].ChkSelected[counter].value;
                                             
                        var SelectedValsSplit=SelectedVals.split("@#@");

                        //SeqVals=SelectedValsSplit[4]+"; ";
                        SeqVals=SelectedValsSplit[2]+"; ";

                        //var Name=SelectedValsSplit[0]+' '+SelectedValsSplit[1];
                        var Name=SelectedValsSplit[0];

                        RegNameVals=Name+"; ";

                        Count=Count+1;
                        
                        var TextSeqVal=window.parent.document.getElementById("Owner").value;
                        var TextNameVal=window.parent.document.getElementById("OwnerName").value;


                        window.parent.document.getElementById("Owner").value="";                
                        window.parent.document.getElementById("OwnerName").value="";

                        window.parent.document.getElementById("Owner").value=TextSeqVal+SeqVals;                
                        window.parent.document.getElementById("OwnerName").value=TextNameVal+RegNameVals;
                    }
                    window.parent.jQuery('#dialog-OwnerSearch').dialog('close');
                }
                }
            }
            else
            {
                //alert();
                
                if (document.forms[0].ChkSelected.checked && Count==0)
                    {                        
                        SelectedVals= document.forms[0].ChkSelected.value;
                        
                        var SelectedValsSplit=SelectedVals.split("@#@");

                        SeqVals=SelectedValsSplit[2]+"; ";
                        
                        //alert(SeqVals)

                        var Name=SelectedValsSplit[0];
                        
                        RegNameVals=Name+"; ";

                        //alert(RegNameVals)

                        Count=Count+1;
                        
                        var TextSeqVal=window.parent.document.getElementById("Owner").value;
                        var TextNameVal=window.parent.document.getElementById("OwnerName").value;


                        window.parent.document.getElementById("Owner").value="";                
                        window.parent.document.getElementById("OwnerName").value="";

                        //window.parent.document.getElementById("Owner").value=TextSeqVal+SeqVals;                
                        //window.parent.document.getElementById("OwnerName").value=TextNameVal+RegNameVals;
                        
                        window.parent.document.getElementById("Owner").value=SeqVals;                
                        window.parent.document.getElementById("OwnerName").value=RegNameVals;
                    
                        window.parent.jQuery('#dialog-OwnerSearchList').dialog('close');
                    }
                    else
                    {
                
                
                for (counter = 0;  counter <= document.forms[0].ChkSelected.length; counter++)
                {
                    if (document.forms[0].ChkSelected[counter].checked)
                    {
                        SelectedVals= document.forms[0].ChkSelected[counter].value;
                                             
                        var SelectedValsSplit=SelectedVals.split("@#@");

                        SeqVals=SelectedValsSplit[2]+"; ";

                        var Name=SelectedValsSplit[0];

                        RegNameVals=Name+"; ";

                        Count=Count+1;
                        
                        var TextSeqVal=window.parent.document.getElementById("Owner").value;
                        var TextNameVal=window.parent.document.getElementById("OwnerName").value;


                        window.parent.document.getElementById("Owner").value="";                
                        window.parent.document.getElementById("OwnerName").value="";

                        //window.parent.document.getElementById("Owner").value=TextSeqVal+SeqVals;                
                        //window.parent.document.getElementById("OwnerName").value=TextNameVal+RegNameVals;
                        
                        window.parent.document.getElementById("Owner").value=SeqVals;                
                        window.parent.document.getElementById("OwnerName").value=RegNameVals;
                    }
                    window.parent.jQuery('#dialog-OwnerSearchList').dialog('close');
                }
                }               
            }
/*
                var keyVals='';
                var SeqVals='';
                var RegNumVals='';
                var RegNameVals='';

                var Count=0;

                for (counter = 1;  counter < document.forms[0].ChkSelected.length; counter++)
                {
                    if (document.forms[0].ChkSelected[counter].checked)
                    {
                        SelectedVals= document.forms[0].ChkSelected[counter].value;
                        keyVals=keyVals+SelectedVals+"@#@";

                        var SelectedValsSplit=SelectedVals.split("@@@");

                        SeqVals=SeqVals+SelectedValsSplit[0]+"; ";

                        var Name=SelectedValsSplit[1]+' '+SelectedValsSplit[2];

                        RegNameVals=RegNameVals+Name+"; ";

                        Count=Count+1;
                    }
                }

                if(Count==0)
                {
                   alert('Please select Owner')
                     return false;
                }
                
                var TextSeqVal=window.parent.document.getElementById("Owner").value;
                var TextNameVal=window.parent.document.getElementById("OwnerName").value;
                
                
                window.parent.document.getElementById("Owner").value="";                
                window.parent.document.getElementById("OwnerName").value="";
                
                window.parent.document.getElementById("Owner").value=TextSeqVal+SeqVals;                
                window.parent.document.getElementById("OwnerName").value=TextNameVal+RegNameVals;
                               
                
                /*window.parent.document.getElementById("Owner").value=SeqVals;
                window.parent.document.getElementById("OwnerName").value=RegNameVals;*/

               // window.parent.jQuery('#dialog-OwnerSearch').dialog('close');


            });           
            
            
            
            $( "#BreederSearchSelectbtn" )
            .click(function() {
                
                 var frmName=document.forms[0].name;
                
                var keyVals='';

                var SeqVals='';
                var RegNumVals='';
                var RegNameVals='';

                var Count=0;
                
                if(frmName=='frmBreederSearchPopup')
                {
                        if (document.forms[0].ChkSelected.checked && Count==0)
                        {
                            SelectedVals= document.forms[0].ChkSelected.value;

                            var SelectedValsSplit=SelectedVals.split("@#@");

                            SeqVals=SelectedValsSplit[3]+"; ";

                            var Name=SelectedValsSplit[0];

                            RegNameVals=Name+"; ";

                            Count=Count+1;

                            var TextSeqVal=window.parent.document.getElementById("Breeder").value;
                            var TextNameVal=window.parent.document.getElementById("BreederName").value;

                            window.parent.document.getElementById("Breeder").value="";                
                            window.parent.document.getElementById("BreederName").value="";

                            window.parent.document.getElementById("Breeder").value=TextSeqVal+SeqVals;                
                            window.parent.document.getElementById("BreederName").value=TextNameVal+RegNameVals;

                        window.parent.jQuery('#dialog-Breeder').dialog('close'); 

                    }else{

                    for (counter = 0;  counter <= document.forms[0].ChkSelected.length; counter++)
                    {
                        if (document.forms[0].ChkSelected[counter].checked)
                        {
                            SelectedVals= document.forms[0].ChkSelected[counter].value;

                            var SelectedValsSplit=SelectedVals.split("@#@");

                            SeqVals=SelectedValsSplit[3]+"; ";

                            var Name=SelectedValsSplit[0];

                            RegNameVals=Name+"; ";

                            Count=Count+1;

                            var TextSeqVal=window.parent.document.getElementById("Breeder").value;
                            var TextNameVal=window.parent.document.getElementById("BreederName").value;


                            window.parent.document.getElementById("Breeder").value="";                
                            window.parent.document.getElementById("BreederName").value="";

                            window.parent.document.getElementById("Breeder").value=TextSeqVal+SeqVals;                
                            window.parent.document.getElementById("BreederName").value=TextNameVal+RegNameVals;
                        }
                        window.parent.jQuery('#dialog-Breeder').dialog('close');                    
                    }
                    }
                }
                else
                {
                    if (document.forms[0].ChkSelected.checked && Count==0)
                        {
                            SelectedVals= document.forms[0].ChkSelected.value;

                            var SelectedValsSplit=SelectedVals.split("@#@");

                            SeqVals=SelectedValsSplit[3]+"; ";

                            var Name=SelectedValsSplit[0];

                            RegNameVals=Name+"; ";

                            Count=Count+1;

                            var TextSeqVal=window.parent.document.getElementById("Breeder").value;
                            var TextNameVal=window.parent.document.getElementById("BreederName").value;

                            window.parent.document.getElementById("Breeder").value="";                
                            window.parent.document.getElementById("BreederName").value="";

                            //window.parent.document.getElementById("Breeder").value=TextSeqVal+SeqVals;                
                            //window.parent.document.getElementById("BreederName").value=TextNameVal+RegNameVals;
                            
                            window.parent.document.getElementById("Breeder").value=SeqVals;                
                            window.parent.document.getElementById("BreederName").value=RegNameVals;
                            

                        window.parent.jQuery('#dialog-BreederList').dialog('close'); 

                    }else{

                    for (counter = 0;  counter <= document.forms[0].ChkSelected.length; counter++)
                    {
                        if (document.forms[0].ChkSelected[counter].checked)
                        {
                            SelectedVals= document.forms[0].ChkSelected[counter].value;

                            var SelectedValsSplit=SelectedVals.split("@#@");

                            SeqVals=SelectedValsSplit[3]+"; ";

                            var Name=SelectedValsSplit[0];

                            RegNameVals=Name+"; ";

                            Count=Count+1;

                            var TextSeqVal=window.parent.document.getElementById("Breeder").value;
                            var TextNameVal=window.parent.document.getElementById("BreederName").value;


                            window.parent.document.getElementById("Breeder").value="";                
                            window.parent.document.getElementById("BreederName").value="";

                            //window.parent.document.getElementById("Breeder").value=TextSeqVal+SeqVals;                
                            //window.parent.document.getElementById("BreederName").value=TextNameVal+RegNameVals;
                            
                            window.parent.document.getElementById("Breeder").value=SeqVals;                
                            window.parent.document.getElementById("BreederName").value=RegNameVals;
                            
                        }
                        window.parent.jQuery('#dialog-BreederList').dialog('close');                    
                    }
                    }                    
                }
                
                /*
                var keyVals='';

                var SeqVals='';
                var RegNumVals='';
                var RegNameVals='';

                var Count=0;

                for (counter = 1;  counter < document.forms[0].ChkSelected.length; counter++)
                {
                    if (document.forms[0].ChkSelected[counter].checked)
                    {
                        SelectedVals= document.forms[0].ChkSelected[counter].value;
                        keyVals=keyVals+SelectedVals+"@#@";

                        var SelectedValsSplit=SelectedVals.split("@@@");

                        SeqVals=SeqVals+SelectedValsSplit[3]+"; ";

                        var Name=SelectedValsSplit[0];

                        RegNameVals=RegNameVals+Name+"; ";

                        Count=Count+1;
                    }
                }

                if(Count==0)
                {
                   alert('Please select Breeder')
                     return false;
                }
                
                
                var TextSeqVal=window.parent.document.getElementById("Breeder").value;
                var TextNameVal=window.parent.document.getElementById("BreederName").value;
                
                
                window.parent.document.getElementById("Breeder").value="";                
                window.parent.document.getElementById("BreederName").value="";
                
                window.parent.document.getElementById("Breeder").value=TextSeqVal+SeqVals;                
                window.parent.document.getElementById("BreederName").value=TextNameVal+RegNameVals;
                
                /*
                window.parent.document.getElementById("Breeder").value=SeqVals;
                window.parent.document.getElementById("BreederName").value=RegNameVals;
                */
               // window.parent.jQuery('#dialog-Breeder').dialog('close');
            });
            
            
            
            $( "#SireSearchResetbtn" )
            .click(function() {                
                if(document.forms[0].name=="frmSireSearchPopup")
                {
                    document.getElementById("regno").value="";
                    document.getElementById("hor_name").value="";
                    document.getElementById("dob").value="";
                    document.getElementById("owner").value="";
                    document.getElementById("microchip_num").value="";
                    document.getElementById("Registration_Type").value="";
                    document.getElementById("Assigned_Num").value="";
                    
                    
                    document.forms[0].method="post";
                    document.forms[0].action="frmSireSearchPopup.jsp?Mode=2";                
                    document.forms[0].submit();
                }
                else
                {                    
                    document.forms[0].method="post";
                    document.forms[0].action="frmSireSearchPopupList.jsp?Mode=2";                
                    document.forms[0].submit();
                }
                
            });
            
            $( "#DamSearchResetbtn" )
            .click(function() {
                
                  if(document.forms[0].name=="frmDamSearchPopup")
                    {
                        document.getElementById("regno").value="";
                        document.getElementById("hor_name").value="";
                        document.getElementById("dob").value="";
                        document.getElementById("owner").value="";
                        document.getElementById("microchip_num").value="";
                        document.getElementById("Registration_Type").value="";
                        document.getElementById("Assigned_Num").value="";
                        
                        document.forms[0].method="post";
                        document.forms[0].action="frmDamSearchPopup.jsp?Mode=2";                
                        document.forms[0].submit();
                    }
                    else
                    {
                        document.forms[0].method="post";
                        document.forms[0].action="frmDamSearchPopupList.jsp?Mode=2";                
                        document.forms[0].submit();
                    }
                    
                
            });
            
            $( "#OwnerSearchResetbtn" )
            .click(function() {
                if(document.forms[0].name=="frmReg_OwnerSearchPopup")
                {
                    document.getElementById("Org_Name").value="";
                    //document.getElementById("FName").value="";
                    //document.getElementById("LName").value="";
                    document.getElementById("Phone").value="";                    
                    document.getElementById("Owner_Num").value="";       
                        
                    document.forms[0].method="post";
                    document.forms[0].action="frmReg_OwnerSearchPopup.jsp?Mode=2";                
                    document.forms[0].submit();
                    }
                    else
                    {
                        document.forms[0].method="post";
                        document.forms[0].action="frmReg_OwnerSearchPopupList.jsp?Mode=2";                
                        document.forms[0].submit();
                    }
            });
            
            $( "#BreederSearchResetbtn" )
            .click(function() {                
                if(document.forms[0].name=="frmBreederSearchPopup")
                {
                    //document.getElementById("breederfname").value="";
                    //document.getElementById("breederlname").value="";
                    document.getElementById("phone").value=""; 
                    document.getElementById("Breeder_Num").value=""; 
                    document.getElementById("Org_Name").value=""; 
                                       
                    document.forms[0].method="post";
                    document.forms[0].action="frmBreederSearchPopup.jsp?Mode=2";                
                    document.forms[0].submit();
                }
                else
                {
                    document.forms[0].method="post";
                    document.forms[0].action="frmBreederSearchPopupList.jsp?Mode=2";                
                    document.forms[0].submit();
                }
            });
            
   
    
    function formatItem(row) {
		 finalVal_formatItem=row[0].split('#@#')
		 return finalVal_formatItem[0] ;
                  
                  //return row[0];
	}
	function formatResult(row) {
		 finalVal_formatResult=row[0].split('[REG:]')
		return finalVal_formatResult[0].replace(/(<.+?>)/gi, '') +'; ';
	}
         function formatResult_1(row) {
		 finalVal_formatResult=row[0].split('[REG:]')
		return finalVal_formatResult[0].replace(/(<.+?>)/gi, '');
	}

    
  
        $("#HorseName").autocomplete("frmAutoHorseNameList.jsp", {
		width: 340,
		matchContains: true,
		formatItem: formatItem,
		formatResult: formatResult_1
	});
         
         
         $("#HorseName").result(function(event, data, formatted) {
            /*
            var hiddenRegSeq = $("#HdnRegSeq");
            var value = data.toString().split('#@#');
            hiddenRegSeq.val(value[1]);
            */
             
            var hiddenSeq = $("#HdnRegSeq");
            var RegNum = $("#regno");
            var value = data.toString().split('[REG:]');            
            var seq= value[1].split('#@#');
            hiddenSeq.val(trimRegister(seq[1]));
            RegNum.val(trimRegister(seq[0]));
             
             
             });
             
             $("#InPedigreeName").autocomplete("frmAutoHorseNameList.jsp", {
		width: 320,
		matchContains: true,
		formatItem: formatItem,
		formatResult: formatResult
	});
         
         
         $("#InPedigreeName").result(function(event, data, formatted) {
            /*
            var hiddenRegSeq = $("#InPedigreeSeq");
            var value = data.toString().split('#@#');
             hiddenRegSeq.val(value[1]);
             */
            var hiddenSeq = $("#InPedigreeSeq");
            var RegNum = $("#InPedigree");
            var value = data.toString().split('[REG:]');            
            var seq= value[1].split('#@#');
            hiddenSeq.val(trimRegister(seq[1]));
            RegNum.val(trimRegister(seq[0]));
             
             
             });
             
             
        $("#TxtSireName").autocomplete("frmAutoSireDamNameList.jsp?ExpType=1", {
		width: 250,
		matchContains: true,
		formatItem: formatItem,
		formatResult: formatResult
	});
         
         
  
        $("#TxtSireName").result(function(event, data, formatted) {
            
            /*
            var hiddenRegSeq = $("#TxtSireSeq");
            var value = data.toString().split('[REG:]');            
            */
            
            
            var hiddenSeq = $("#TxtSireSeq");
            var RegNum = $("#TxtSire");
            var value = data.toString().split('[REG:]');            
            var seq= value[1].split('#@#');
            hiddenSeq.val(trimRegister(seq[1])+";");
            RegNum.val(trimRegister(seq[0]));
            
        });
  
        $("#TxtDamName").autocomplete("frmAutoSireDamNameList.jsp?ExpType=2", {
		width: 320,
		matchContains: true,
		formatItem: formatItem,
		formatResult: formatResult
	});
         
        $("#TxtDamName").result(function(event, data, formatted) {
            /*var hiddenRegSeq = $("#TxtDamSeq");
            var value = data.toString().split('#@#');
             hiddenRegSeq.val(value[1]+"; ");
             */
             
            var hiddenSeq = $("#TxtDamSeq");
            var RegNum = $("#TxtDam");
            var value = data.toString().split('[REG:]');            
            var seq= value[1].split('#@#');
            hiddenSeq.val(trimRegister(seq[1])+";");
            RegNum.val(trimRegister(seq[0]));
             
        });
        
        
        
        function formatItem_O(row_1) {
		 finalVal_formatItem=row_1[0].split('#@#')
		 return finalVal_formatItem[0] ;                 
	}
	function formatResult_O(row_1) {
		 finalVal_formatResult=row_1[0].split('[ID:]')
		return finalVal_formatResult[0].replace(/(<.+?>)/gi, '') +'; ';
	}
         
        
        
        $("#OwnerName").autocomplete("frmAutoOwnerBreederNameList.jsp", {
		width: 250,
		matchContains: true,
		formatItem: formatItem_O,
		formatResult: formatResult_O
	});
         
        $("#OwnerName").result(function(event, data, formatted) {
            /*var hiddenRegSeq = $("#Owner");
            var value = data.toString().split('#@#');
             hiddenRegSeq.val(value[1]+"; ");*/
             
            var hiddenSeq = $("#Owner");
            var value = data.toString().split('[ID:]');            
            var seq= value[1].split('#@#');
            hiddenSeq.val(trimRegister(seq[1])+";");
        });
        
        $("#BreederName").autocomplete("frmAutoOwnerBreederNameList.jsp", {
		width: 250,
		matchContains: true,
		formatItem: formatItem_O,
		formatResult: formatResult_O
	});
         
        $("#BreederName").result(function(event, data, formatted) {
            /*
            var hiddenRegSeq = $("#Breeder");
            var value = data.toString().split('#@#');
             hiddenRegSeq.val(value[1]+"; ");
             */
             
            var hiddenSeq = $("#Breeder");
            var value = data.toString().split('[ID:]');            
            var seq= value[1].split('#@#');
            hiddenSeq.val(trimRegister(seq[1])+";");
             
        });               
});


function fnGetPedigree(id,Seq)
{

        var details = 'titlebar=no,status=no,menubar=no,resizable=no,width=700,height=800,scrollbars=yes,left=230,top=100';
        childWindow=open("frmPedigreeDetails.jsp?Seq="+Seq,"Cal",details);
        if (childWindow.opener == null)
        childWindow.opener = self;
        childWindow.focus();
}



function fnGetDetails(id,Seq)
{

        var details = 'titlebar=no,status=no,menubar=no,resizable=no,width=750,height=800,scrollbars=yes,left=230,top=100';
        childWindow=open("frmRegistryDetails.jsp?Mode=2&RegSeq="+Seq,"Cal",details);
        if (childWindow.opener == null)
        childWindow.opener = self;
        childWindow.focus();
}

function SearchType(Values)
{
    document.getElementById("HdnRegSearchType").value=Values;
}

function BreederSearch()
{
    $('#dialog-Breeder').dialog({autoOpen: false,height: 550,width: 680, modal: true});
    $('#dialog-Breeder').dialog('open');
    $("#modalIFrame_Breeder").attr('src','frmBreederSearchPopup.jsp?Mode=2');
    return false;

}


function RegSearch()
{
    $('#dialog-Reg').dialog({autoOpen: false,height: 550,width: 735, modal: true});
    $('#dialog-Reg').dialog('open');
    return false;
}

function RegSireSearch()
{
    /*
    $('#dialog-SireReg').dialog({autoOpen: false,height: 550,width: 800, modal: true});
    $('#dialog-SireReg').dialog('open');    
    return false;
    */
    
    $('#dialog-SireReg').dialog({ autoOpen: false,height: 550,width: 755, modal: true });
    $('#dialog-SireReg').dialog('open');
    $("#modalIFrame_Sire").attr('src','frmSireSearchPopup.jsp?Mode=2');
    return false;
    
}

function RegDamSearch()
{
    $('#dialog-DamReg').dialog({autoOpen: false,height: 550,width: 755, modal: true});
    $('#dialog-DamReg').dialog('open');
    $("#modalIFrame_Dam").attr('src','frmDamSearchPopup.jsp?Mode=2');
    return false;
}


function OwnerSearch()
{
    $('#dialog-OwnerSearch').dialog({autoOpen: false,height: 550,width: 680, modal: true});
    $('#dialog-OwnerSearch').dialog('open');
    $("#modalIFrame_OwnerSearch").attr('src','frmReg_OwnerSearchPopup.jsp?Mode=2');
    return false;    
}


function Check_Num(objEvent)
{
        var iKeyCode, strKey;

        if (isIE)
            iKeyCode = objEvent.keyCode;
        else
            iKeyCode = objEvent.which;

        strKey = String.fromCharCode(iKeyCode);

        if (!reValidChars.test(strKey) && !reKeyboardChars.test(strKey) && !checkClipboardCode(objEvent, strKey))
        {
                if (iKeyCode != 46)
                        return false;
        }
}



function Empty(field)
{    
    
    if(field.name=="TxtSireName" && field.value=="")
    {
        document.forms[0].TxtSire.value="";
         document.forms[0].TxtSireSeq.value="";
    }
    else if(field.name=="TxtDamName" && field.value=="")
    {
        document.forms[0].TxtDam.value="";
        document.forms[0].TxtDamSeq.value="";
    }
    else if(field.name=="OwnerName" && field.value=="")
    {
        document.forms[0].Owner.value="";
    }
    else if(field.name=="InPedigreeName" && field.value=="")
    {
        document.forms[0].InPedigree.value="";
        document.forms[0].InPedigreeSeq.value="";
    }
    else if(field.name=="BreederName" && field.value=="")
    {
        document.forms[0].Breeder.value="";
    }
    else if(field.name=="regno" && field.value=="")
    {
        //document.forms[0].HorseName.value="";
        document.forms[0].HdnRegSeq.value="";
    }
    else if(field.name=="HorseName" && field.value=="")
    {        
        document.forms[0].regno.value="";
        document.forms[0].HdnRegSeq.value="";
    }

}


function checkAll(field)
{
    if(field[0].checked)
    {
        for (i = 1; i < field.length; i++)
        field[i].checked = true ;
    }
    else
    {
        for (i = 1; i < field.length; i++)
        field[i].checked = false ;
    }
}

function PlaceOfBirthSearch()
{   
   $('#dialog-PlaceOfBirth').dialog({ autoOpen: false,height: 400,width: 540, modal: true });
    $('#dialog-PlaceOfBirth').dialog('open');
    $("#modalIFrame_PlaceOfBirth_RegSrch").attr('src','frmReg_CommonRef_Place.jsp?page=RegSrch');
}
  
function ReturnPedigree(RegNo,RegSeq)
{
    $('#dialog-RegPedigree').dialog({ autoOpen: false,height: 700,width: 800, modal: true });
    $('#dialog-RegPedigree').dialog('open');
    $("#modalIFrame_PedigreeDetails").attr('src','frmPedigreeDetails.jsp?Seq='+RegSeq);
    return false;
}

function ReturnHorseDetails(RegSeq)
{    
    $('#dialog-RegistryDetails').dialog({ autoOpen: false,height: 500,width: 800, modal: true });
    $('#dialog-RegistryDetails').dialog('open');
    $("#modalIFrame_RegistryDetails").attr('src','frmRegistryDetails.jsp?Mode=1&Seq='+RegSeq);

    return false;
}

function AjaxAutoComplete(Obj,Seq)
{       
    var ObjName=Obj;
    var ObjSeq =Seq;
    
    var ObjNamevalue=document.getElementById(ObjName).value
    
    if(ObjNamevalue=="")
        return false;
    
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
      if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {  
        if(xmlhttp.responseText==0)
      {
            document.getElementById(ObjName).value="";
            document.getElementById(ObjSeq).value="";
            document.getElementById(ObjName).focus();
            return false;
      }
      else if (xmlhttp.responseText==2)
      { 
          HorseNameSearch(ObjNamevalue,ObjName);
      }
      else
      {
        var Items=xmlhttp.responseText.split('#@#');              
        var Name= Items[0].trim()+"; ";
        var Seq= Items[1].trim()+"; ";

        document.getElementById(ObjName).value=Name;
        document.getElementById(ObjSeq).value=Seq;
      }
    }
  }
  if(ObjName=="OwnerName" || ObjName=="BreederName")  
        xmlhttp.open("GET","frmReg_OwnerNameCheck.jsp?Name="+ObjNamevalue,true);  
    else
        xmlhttp.open("GET","frmHorseNameCheck.jsp?Name="+ObjNamevalue,true);

    xmlhttp.send();
}

function HorseNameSearch(ObjVal,Obj)
{   
    if(Obj=="TxtSireName")
    {
        $('#dialog-SireSearchPopupList').dialog({ autoOpen: false,height: 400,width: 800, modal: true });
        $('#dialog-SireSearchPopupList').dialog('open');
        $("#modalIFrame_SireSearchPopupList").attr('src','frmSireSearchPopupList.jsp?Mode=1&Name='+ObjVal);
        return false;
    }

     if(Obj=="TxtDamName")
     {
        $('#dialog-DamSearchPopupList').dialog({ autoOpen: false,height: 400,width: 800, modal: true });
        $('#dialog-DamSearchPopupList').dialog('open');
        $("#modalIFrame_DamSearchPopupList").attr('src','frmDamSearchPopupList.jsp?Mode=1&Name='+ObjVal);
        return false;   
     }
     if(Obj=="OwnerName")
     {         
        $('#dialog-OwnerSearchList').dialog({ autoOpen: false,height: 400,width: 800, modal: true });
        $('#dialog-OwnerSearchList').dialog('open');
        $("#modalIFrame_OwnerSearchList").attr('src','frmReg_OwnerSearchPopupList.jsp?Mode=1&Name='+ObjVal);
        return false;   
     }
     if(Obj=="BreederName")
     {         
        $('#dialog-BreederList').dialog({ autoOpen: false,height: 400,width: 800, modal: true });
        $('#dialog-BreederList').dialog('open');
        $("#modalIFrame_BreederList").attr('src','frmBreederSearchPopupList.jsp?Mode=1&Name='+ObjVal);
        return false;   
     }
     
}



