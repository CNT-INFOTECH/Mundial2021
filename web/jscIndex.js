function trimRegister(str){
	str = str.replace(/^\s+/, '');
	for (var i = str.length - 1; i >= 0; i--) {
		if (/\S/.test(str.charAt(i))) {
			str = str.substring(0, i + 1);
			break;
		}
	}
	return str;
}

/*$.fx.speeds._default=1000;*/
$(function() {
		$( "#Preg_HDOB" ).datepicker({
changeMonth: true,
changeYear: true
});

	    $( "#Preg_HDeath" ).datepicker({
changeMonth: true,
changeYear: true
});

        $( "#datepicker" ).datepicker({
changeMonth: true,
changeYear: true
});
        $( "#datepicker_Dategelded" ).datepicker({
changeMonth: true,
changeYear: true
});
        $( "#datepicker_DOB" ).datepicker({
changeMonth: true,
changeYear: true
});
        $( "#Deathdate_datepicker" ).datepicker({
changeMonth: true,
changeYear: true
});


        // a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
        $( "#dialog:ui-dialog" ).dialog( "destroy" );

                var name = $( "#name" ),
                email = $( "#email" ),
                password = $( "#password" ),
                allFields = $( [] ).add( name ).add( email ).add( password ),
                tips = $( ".validateTips" );

        function updateTips( t ) {
                tips
                        .text( t )
                        .addClass( "ui-state-highlight" );
                setTimeout(function() {
                        tips.removeClass( "ui-state-highlight", 1500 );
                }, 500 );
        }

        function checkLength( o, n, min, max ) {
                if ( o.val().length > max || o.val().length < min ) {
                        o.addClass( "ui-state-error" );
                        updateTips( "Length of " + n + " must be between " +
                                min + " and " + max + "." );
                        return false;
                } else {
                        return true;
                }
        }

        function checkRegexp( o, regexp, n ) {
                if ( !( regexp.test( o.val() ) ) ) {
                        o.addClass( "ui-state-error" );
                        updateTips( n );
                        return false;
                } else {
                        return true;
                }
        }


        $( "#dialog-form" ).dialog({
                autoOpen: false,
                height: 300,
                width: 550, 
                modal: true,
                buttons: {

                        Save : function() {                                                                           
if(document.getElementById('OWNER_TYPE').value =='Individual')
{
   if(document.getElementById('MEMBER_NAME').value.length==0) 
   {
       alert("Please Enter Name");
       return false;
   }
}
if(document.getElementById('OWNER_TYPE').value =='Organisation')
{ 

   if(document.getElementById('MEMBER_NAME').value.length==0 || document.getElementById('ORG_NAME').value.length==0) 
   {
       alert("Please Enter Name and Organization Name");
       return false;
   }
}


document.getElementById('HDNOWNER_TYPE_VAL').innerHTML=document.getElementById('OWNER_TYPE').value
document.getElementById('HDNOWNER_TYPE').value=document.getElementById('OWNER_TYPE').value

document.getElementById('HDNORG_NAME_VAL').innerHTML=document.getElementById('ORG_NAME').value
document.getElementById('HDNORG_NAME').value=document.getElementById('ORG_NAME').value

document.getElementById('MEMBER_NUM_VAL').innerHTML=document.getElementById('MEMBER_NUM').value
document.getElementById('HDNMEMBER_NUM').value=document.getElementById('MEMBER_NUM').value

document.getElementById('MEMBER_NAME_VAL').innerHTML=document.getElementById('MEMBER_NAME').value
document.getElementById('HDNMEMBER_NAME').value=document.getElementById('MEMBER_NAME').value

document.getElementById('ADDRESS1_VAL').innerHTML=document.getElementById('ADDRESS1').value
document.getElementById('HDNMEMBER_ADDRESS1').value=document.getElementById('ADDRESS1').value

document.getElementById('ADDRESS2_VAL').innerHTML=document.getElementById('ADDRESS2').value
document.getElementById('HDNMEMBER_ADDRESS2').value=document.getElementById('ADDRESS2').value

document.getElementById('CITY_VAL').innerHTML=document.getElementById('CITY').value
document.getElementById('HDNMEMBER_CITY').value=document.getElementById('CITY').value

document.getElementById('STATE_VAL').innerHTML=document.getElementById('STATE').value
document.getElementById('HDNMEMBER_STATE').value=document.getElementById('STATE').value

document.getElementById('ZIP_VAL').innerHTML=document.getElementById('ZIP').value
document.getElementById('HDNMEMBER_ZIP').value=document.getElementById('ZIP').value

document.getElementById('COUNTRY_VAL').innerHTML=document.getElementById('COUNTRY').value
document.getElementById('HDNMEMBER_COUNTRY').value=document.getElementById('COUNTRY').value

document.getElementById('PHONE_VAL').innerHTML=document.getElementById('PHONE').value
document.getElementById('HDNMEMBER_PHONE').value=document.getElementById('PHONE').value

document.getElementById('EMAIL_VAL').innerHTML=document.getElementById('EMAIL').value
document.getElementById('HDNMEMBER_EMAIL').value=document.getElementById('EMAIL').value                           

                        $( this ).dialog( "close" );

                        },
                        Cancel: function() {
                                $( this ).dialog( "close" );
                        }
                },
                close: function() {
                        allFields.val( "" ).removeClass( "ui-state-error" );
                }
   });
            $( "#create-user" )			
                    .click(function() {
                            $( "#dialog-form" ).dialog( "open" );
                            return false;

                    });

                $( "#Transfer-user" )			
                .click(function() {
                        $( "#dialog-form" ).dialog( "open" );
                    return false;

                });

                $( '#default' ).click(function(){alert();
                $.msg();
                });


                $( "#AddCountryBtn" )
                .click(function() {                           
                var textb = document.getElementById("txtCountry_add");
                var TextSeq = document.getElementById("HdnCountrySeq");
                var combo = parent.opener.document.getElementById('place');

                if(textb.value=="")
                {                            
                    return false;
                }

                if(TextSeq.value=='0')
                {

                    var option = parent.opener.document.createElement("option");
                    option.text = textb.value;
                    option.value = textb.value;
                    option.selected=textb.value;           


                    try {                
                    combo.add(option, null); //Standard                                    
                    }catch(error) {
                    combo.add(option); // IE only
                    }
                }
                else
                 {
                     var comboSelected = parent.opener.document.getElementById('place').selectedIndex                             
                      combo.options[comboSelected].text=textb.value
                      combo.options[comboSelected].value=comboSelected
                 }
                //textb.value = ""       
                //parent.opener.document.getElementId('Horsecolor').selected=option.value;

                document.forms[0].method="post";
                document.forms[0].action="ReferenceValueServlet";
                document.forms[0].target="_self";  
                document.forms[0].submit();

                childWindow=close("frmCountryAddPopup.jsp");
                });   
                $( "#AddModalityBtn" )
                .click(function() {
                var textb = document.getElementById("txtModality_add");
                var TextSeq = document.getElementById("HdnModalitySeq");
                var combo = parent.opener.document.getElementById('modality');

                if(textb.value=="")
                {                            
                return false;
                }

                if(TextSeq.value=='0')
                {
                    var option = parent.opener.document.createElement("option");
                    option.text = textb.value;
                    option.value = textb.value;
                    option.selected=textb.value;           

                    try {                
                    combo.add(option, null); //Standard                                    
                    }catch(error) {
                    combo.add(option); // IE only
                    }
                }
                else
                 {
                     var comboSelected = parent.opener.document.getElementById('modality').selectedIndex                             
                      combo.options[comboSelected].text=textb.value
                      combo.options[comboSelected].value=comboSelected
                 }
                //textb.value = ""                            

                document.forms[0].method="post";
                document.forms[0].action="ReferenceValueServlet";
                document.forms[0].target="_self";
                document.forms[0].submit();

                childWindow=close("frmModalityAddPopup.jsp");
                });

               $( "#AddColorBtn" )
                .click(function() {                           
                var textb = document.getElementById("txtColor_add");
                var TextSeq = document.getElementById("HdnColorSeq");
                var combo = parent.opener.document.getElementById('Horsecolor');

                if(textb.value=="")
                {                            
                    return false;
                }

                if(TextSeq.value=='0')
                {
                    var option = parent.opener.document.createElement("option");
                    option.text = textb.value;
                    option.value = textb.value;
                    option.selected=textb.value;           

                    try {               
                    combo.add(option, null); //Standard                                    
                    }catch(error) {
                    combo.add(option); // IE only
                    }
                }
                else
                 {
                     var comboSelected = parent.opener.document.getElementById('Horsecolor').selectedIndex                             
                      combo.options[comboSelected].text=textb.value
                      combo.options[comboSelected].value=comboSelected
                 }
                //textb.value = ""       
                //parent.opener.document.getElementId('Horsecolor').selected=option.value;
                document.forms[0].method="post";
                document.forms[0].action="ReferenceValueServlet";
                document.forms[0].target="_self"; 
                document.forms[0].submit();

                childWindow=close("frmColorAddPopup.jsp");
                });                                                

               $( "#AddOrganisationBtn" )
                .click(function() {                           
                var textb = document.getElementById("txtOrganisation_add");
                var TextSeq = document.getElementById("HdnOrgSeq");
                var combo = parent.opener.document.getElementById('org');

                if(textb.value=="")
                {                            
                return false;
                }

                if(TextSeq.value=='0')
                {
                    var option = parent.opener.document.createElement("option");
                    option.text = textb.value;
                    option.value = textb.value;
                    option.selected=textb.value;           


                    try {                
                    combo.add(option, null); //Standard                                    
                    }catch(error) {
                    combo.add(option); // IE only
                    }
                }
                else
                 {
                      var comboSelected = parent.opener.document.getElementById('org').selectedIndex                             
                      combo.options[comboSelected].text=textb.value
                      combo.options[comboSelected].value=comboSelected
                 }
                //textb.value = ""                            

                document.forms[0].method="post";
                document.forms[0].action="ReferenceValueServlet";
                document.forms[0].target="_self";
                document.forms[0].submit();

                childWindow=close("frmOrganisationAddPopup.jsp");
                });

                $( "#AddBreederBtn" )
                .click(function() {                           
                var textb = document.getElementById("txtBreeder_add");
                var TextSeq = document.getElementById("HdnBreederSeq");
                var combo = parent.opener.document.getElementById('breeder');

                if(textb.value=="")
                {                            
                return false;
                }

                if(TextSeq.value=='0')
                {
                    var option = parent.opener.document.createElement("option");
                    option.text = textb.value;
                    option.value = textb.value;
                    option.selected=textb.value;           

                    try {                
                    combo.add(option, null); //Standard                                    
                    }catch(error) {
                    combo.add(option); // IE only
                    }
                }
                else
                 {
                     var comboSelected = parent.opener.document.getElementById('breeder').selectedIndex                             
                     combo.options[comboSelected].text=textb.value
                     combo.options[comboSelected].value=comboSelected
                 }
                //textb.value = ""                            
                document.forms[0].method="post";
                document.forms[0].action="ReferenceValueServlet";
                document.forms[0].target="_self";
                document.forms[0].submit();
                
                childWindow=close("frmBreederAddPopup.jsp");
                });
                 $( "#Save_Images" )			
                 .click(function() {                           
                        document.forms[0].method="post";
                        document.forms[0].action="Gettostore.jsp"
                        document.forms[0].target="_self";
                        document.forms[0].submit();              
    });                         
                 $( "#Reset_Head" )			
                 .click(function() {  
                        document.forms[0].method="post";
                        document.forms[0].action="Markings.jsp?Mode=1";
                        document.forms[0].target="_self";
                        document.forms[0].submit();
     });   
                 $( "#Reset_FL" )			
                 .click(function() {   
                        document.forms[0].method="post";
                        document.forms[0].action="frmForeLeg.jsp?Mode=1";
                        document.forms[0].target="_self";
                        document.forms[0].submit();
     });        
                 $( "#Reset_HL" )			
                 .click(function() {   
                        document.forms[0].method="post";
                        document.forms[0].action="frmHindLeg.jsp?Mode=1";
                        document.forms[0].target="_self";
                        document.forms[0].submit();
     });        
                 $( "#Reset_OtherMarkings" )			
                 .click(function() {   
                        document.forms[0].method="post";
                        document.forms[0].action="frmOtherMarkings.jsp?Mode=1";
                        document.forms[0].target="_self";
                        document.forms[0].submit();
     });
                 $( "#Reset_Pedigree" )			
                 .click(function() {   
                        document.forms[0].method="post";
                        document.forms[0].action="frmPedigree.jsp?Mode=1";
                        document.forms[0].target="_self";
                        document.forms[0].submit();
     });              
                 /*$( "#Previous" )			
                 .click(function() {   
                        document.forms[0].method="post";
                        document.forms[0].action="frmObservations.jsp";
                        document.forms[0].target="_self";
                        document.forms[0].submit();
     });
                 $( "#Next" )			
                 .click(function() {   
                        document.forms[0].method="post";
                        document.forms[0].action="Images.jsp";
                        document.forms[0].target="_self";
                        document.forms[0].submit();
     });*/
                $( "#Previous_Images" )			
                 .click(function() {   
                        document.forms[0].method="post";
                        document.forms[0].action="index.jsp";
                        document.forms[0].target="_self";
                        document.forms[0].submit();
     });
                 $( "#Next_Images" )			
                 .click(function() {   
                        document.forms[0].method="post";
                        document.forms[0].action="Markings.jsp";
                        document.forms[0].target="_self";
                        document.forms[0].submit();
     });
                $( "#PreviousShow_History" )			
                .click(function() {
                        document.forms[0].method="post";
                        document.forms[0].action="frmOwnersHistory.jsp";
                        document.forms[0].target="_self";
                        document.forms[0].submit();
     });			                                                      
                $( "#NextShow_History" )			
                .click(function() {
                        document.forms[0].method="post";
                        document.forms[0].action="frmChampionship.jsp";
                        document.forms[0].target="_self";
                        document.forms[0].submit();
     });                                                                            
                $( "#Previous_Championship" )			
                .click(function() {
                        document.forms[0].method="post";
                        document.forms[0].action="frmShowHistory.jsp";
                        document.forms[0].target="_self";
                        document.forms[0].submit();
     });			                                                      
                $( "#Next_Championship" )			
                .click(function() {
                        document.forms[0].method="post";
                        document.forms[0].action="frmDocuments.jsp";
                        document.forms[0].target="_self";
                        document.forms[0].submit();
     }); 
                $( "#Previous_Documents" )			
                .click(function() {
                        document.forms[0].method="post";
                        document.forms[0].action="frmChampionship.jsp";
                        document.forms[0].target="_self";
                        document.forms[0].submit();
     });			                                                      
                $( "#Next_Documents" )			
                .click(function() {
                        document.forms[0].method="post";
                        document.forms[0].action="frmObservations.jsp";
                        document.forms[0].target="_self";
                        document.forms[0].submit();
     }); 
                $( "#Searchbtn" )			
                .click(function() {                                        
                    document.forms[0].method="post";
                    document.forms[0].action="regsearchpopup_include.jsp?srch=1";
                    document.forms[0].target="_self";
                    document.forms[0].submit();                               
     });                                                                        
                
                $( "#Search_Pedigree_Dam" )			
                .click(function() {                           
                document.forms[0].method="post";
                document.forms[0].action="frmPedigree_DamSearchPopupInclude.jsp";
                document.forms[0].target="_self";
                document.forms[0].submit();
     });
                $( "#view" )
                .click(function(){
                document.forms[0].regno.value="";
                document.forms[0].dob.value="";
                document.forms[0].owner.value="";
                document.forms[0].microchip_num.value="";
                document.forms[0].hor_name.value="";

                document.forms[0].method="post";
                document.forms[0].action="frmReg_SearchViewAll.jsp";
                document.forms[0].target="_self";
                document.forms[0].submit();
    });   

			$( "#Resetbtn" )			
                .click(function() { 
				
					document.forms[0].regno.value="";
					document.forms[0].dob.value="";
					document.forms[0].owner.value="";
					document.forms[0].microchip_num.value="";
					document.forms[0].hor_name.value="";
					document.forms[0].Assigned_Num.value="";
					document.forms[0].Registration_Type.value="";
					document.forms[0].RegSeqHidden.value="";
					


                    document.forms[0].method="post";
                    document.forms[0].action="regsearchpopup.jsp";
                    document.forms[0].target="_self";
                    document.forms[0].submit();                               
     });                                                                        
             


  /****************** kumar ************************/         

        $( "#Upload" )
        .click(function() {
        //01082011 kumar added-start
        var regno=document.getElementById("HdnRegNo").value;
        if(regno=="")
        {
            alert("Please select the Registration number");
            return false;
        }
        //01082011 kumar added-end
        if(document.getElementById("checkfile").value=='')
        {
            alert("Please Select The File Name")
            return false;
        }        
        var regsq=document.getElementById("HdnRegSeq").value;        
        document.forms[0].method="post";
        //document.forms[0].action="frmPasoFileUpload_Success.jsp?Mode=4";
        document.forms[0].action="frmPasoFileUpload_Success.jsp?SeqNo="+regsq;
        document.forms[0].target="_self";
        });
        
        $( "#Download" )
        .button()
        .click(function() {alert("download") ;                        
        document.forms[0].method="post";
        document.forms[0].action="frmPasoDownload.jsp";
        document.forms[0].target="_self";
        });   
        /************Kumar End*************************/
        
     

    /*$('#dock').Fisheye(
    {
        maxWidth: 50,
        items: 'a',
        itemsText: 'span',
        container: '.dock-container',
        itemWidth: 40,
        proximity: 90,
        halign : 'center'
    });*/

});


                
function Open() {
    $("#div1").dialog({modal: true, height: 'auto',Width: 500,title: 'comments'});
    $("#div1").dialog('open');
}

function CalculatorPopUp()
{
    $('#dialog-Calculator').dialog({ autoOpen: false,height: 280,width: 350, modal: true });
    $('#dialog-Calculator').dialog('open');
    return false;
}
function Calculator()
{
   var details = 'titlebar=no,status=no,menubar=no,resizable=no,width=330,height=244,scrollbars=yes,left=230,top=150';

   childWindow=open("frmCalculator.jsp","Cal",details);
}

function DNA_VAL(checkVal)
{
   //alert(checkVal.value)
   if(checkVal.checked==false)
    {
    checkVal.checked=false;            
    return false;
    }

    document.forms[0].RP_dna.checked=false;
    document.forms[0].VP_dna.checked=false;
    document.forms[0].TE_dna.checked=false;
    document.forms[0].TS_dna.checked=false;

    checkVal.checked=true;
}

function HeadMarking_Values(obVal)
{

    if(obVal.checked==false)
    {
    obVal.checked=false;
    document.forms[0].headmark.value='';

    var hdType = [document.forms[0].Lucero_Corrido,document.forms[0].Careto,document.forms[0].Lucero,document.forms[0].Nariz,document.forms[0].Careto_Entero];
    var i=0;
    for(i=0;i<5;i++)
    {
        if(hdType[i].checked==true)
        {
            if(document.forms[0].headmark.value!="")
              document.forms[0].headmark.value+=", "+hdType[i].name;
            else
              document.forms[0].headmark.value=hdType[i].name;
        }
    }
    
    return false;
    }

    /*document.forms[0].Lucero_Corrido.checked=false;
    document.forms[0].Careto.checked=false;
    document.forms[0].Lucero.checked=false;
    document.forms[0].Nariz.checked=false;
    document.forms[0].Careto_Entero.checked=false;*/

    obVal.checked=true;
    strHead=obVal.name                 

    if(document.forms[0].headmark.value!='')
        document.forms[0].headmark.value=document.forms[0].headmark.value+", "+strHead.toUpperCase();
    else
        document.forms[0].headmark.value=strHead.toUpperCase();

}

function dropdown_addCountry(val)
{    
    var details = 'titlebar=no,status=no,menubar=no,resizable=no,width=260,height=130,scrollbars=no,left=230,top=150';

    childWindow=open("frmCountryAddPopup.jsp?SeqNo="+val,"Cal",details);
    if (childWindow.opener == null)
        childWindow.opener = self;
    childWindow.focus();

}
function dropdown_addModality(val)
{    
    var details = 'titlebar=no,status=no,menubar=no,resizable=no,width=260,height=130,scrollbars=no,left=230,top=150';

    childWindow=open("frmModalityAddPopup.jsp?SeqNo="+val,"Cal",details);
    if (childWindow.opener == null)
        childWindow.opener = self;
    childWindow.focus();

}
function dropdown_addOrganisation(val)
{    
    var details = 'titlebar=no,status=no,menubar=no,resizable=no,width=300,height=130,scrollbars=no,left=230,top=150';

    childWindow=open("frmOrganisationAddPopup.jsp?SeqNo="+val,"Cal",details);
    if (childWindow.opener == null)
        childWindow.opener = self;
    childWindow.focus();

}
function dropdown_addBreeder(val)
{    
    var details = 'titlebar=no,status=no,menubar=no,resizable=no,width=300,height=130,scrollbars=no,left=230,top=150';

    childWindow=open("frmBreederAddPopup.jsp?SeqNo="+val,"Cal",details);
    if (childWindow.opener == null)
        childWindow.opener = self;
    childWindow.focus();

}
function dropdown_addColor(val)
{   
    var details = 'titlebar=no,status=no,menubar=no,resizable=no,width=300,height=130,scrollbars=no,left=230,top=150';

    childWindow=open("frmColorAddPopup.jsp?SeqNo="+val,"Cal",details);
    if (childWindow.opener == null)
        childWindow.opener = self;
    childWindow.focus();
}

function RegSearch()
{ 
    $('#dialog-Reg').dialog({ autoOpen: false,height: 550,width: 850, modal: true });
    $('#dialog-Reg').dialog('open');
    return false;
}

 function getAgePopup()
 {
	
     if(document.getElementById('datepicker_DOB').value.length==0) 
    {
    alert("Please Enter BirthDate");
    return false;
    }
     $('#dialog-Age').dialog({ autoOpen: false,height: 80,width: 242, modal: true });
    $('#dialog-Age').dialog('open');
    
     $("#modalIFrame_Age").attr('src','frmAgeCalculator.jsp');
    
    return false;
 }
 
     function PedigreeSearch_Sire(Elem1,Elem2,Elem3,Elem4,ElemType,Elem5,Elem6)
{
    $('#dialog-PedigreeSearch_Sire').dialog({ autoOpen: false,height: 550,width: 880, modal: true });
    $('#dialog-PedigreeSearch_Sire').dialog('open');
    
    $("#modalIFrame_Pedigree_Sire").attr('src','frmPedigreeSearchPopup.jsp?HName='+Elem1+'&HReg='+Elem2+'&LabelHor='+Elem3+'&HorSeq='+Elem4+'&HorType='+ElemType+'&HorOrgName='+Elem5+'&HorOrgSeq='+Elem6);
    
    return false;
}
function PedigreeSearch_Dam(Elem1,Elem2,Elem3,Elem4,ElemType,Elem5,Elem6)
{     
    $('#dialog-PedigreeSearch_Dam').dialog({ autoOpen: false,height: 550,width: 880, modal: true });
    $('#dialog-PedigreeSearch_Dam').dialog('open');
    
    $("#modalIFrame_Pedigree_Dam").attr('src','frmPedigreeSearchPopup.jsp?HName='+Elem1+'&HReg='+Elem2+'&LabelHor='+Elem3+'&HorSeq='+Elem4+'&HorType='+ElemType+'&HorOrgName='+Elem5+'&HorOrgSeq='+Elem6);
    
    return false;
}
function OpenCommonRef1(DgTitle,RetnID,RetnValue,RetnTxtValue)
{
$('#dialog-CmmnRef').dialog({ autoOpen: false,height: 400,width: 400, modal: true,title:DgTitle});
$('#dialog-CmmnRef').dialog('open');
$("#modalIFrame_CmmnRef").attr('src','frmReg_CommonRef.jsp?RefType='+DgTitle+'&ReturnID='+RetnID+'&ReturnVal='+RetnValue+'&RetnTxtValue='+RetnTxtValue);

return false;
}
function OpenCommonRef_Pedigree(DgTitle,RetnID,RetnValue,RetnTxtValue)
{
$('#dialog-CmmnRef').dialog({ autoOpen: false,height: 270,width: 400, modal: true,title:DgTitle});
$('#dialog-CmmnRef').dialog('open');
$("#modalIFrame_CmmnRef").attr('src','frmReg_CommonRef.jsp?RefType='+DgTitle+'&ReturnID='+RetnID+'&ReturnVal='+RetnValue+'&RetnTxtValue='+RetnTxtValue);

return false;
}


function CityPopUp()
{
    varcity = document.getElementById('cityvalue').value
    
    var details = 'titlebar=no,status=no,menubar=no,resizable=no,width=400,height=400,scrollbars=YES,left=230,top=150';

    childWindow=open("frmReg_SearchCityStateZip.jsp?city="+varcity,"Cal",details);
    if (childWindow.opener == null)
        childWindow.opener = self;
    childWindow.focus();    
}
function Edit_OwnerInformation()
{   
    var seq=document.getElementById("HdnEntitySeq").value;
    document.forms[0].method="post";
    if(seq!='')
    document.forms[0].action="frmReg_OwnerInformation.jsp?status=enabled&se="+seq;
    else
    document.forms[0].action="frmReg_OwnerInformation.jsp?status=enabled";
    
    document.forms[0].target="_self";                                                                
    document.forms[0].submit();
  
}
function CheckType()
{
    if(document.getElementById('OWNER_TYPE').value =='')
    {
    document.forms[0].method="post";
    document.forms[0].action="frmReg_OwnerInformation.jsp?status=enabled";
    document.forms[0].target="_self";                                                                
    document.forms[0].submit();
    }
}
function SaveOwnerInformation() {   
    if(document.getElementById('OWNER_TYPE').value =='' && 
     (document.getElementById('MEMBER_NAME').value.length!=0 ||     
     document.getElementById('MEMBER_LNAME').value.length!=0 ||
    document.getElementById('ORG_NAME').value.length!=0))
    {
           alert("Please Select The Owner Type");
           return false;

    }
    if(document.getElementById('OWNER_TYPE').value =='INDIVIDUAL')
    {
       if(document.getElementById('MEMBER_NAME').value.length==0) 
       {
           alert("Please Enter Name");
           return false;
       }
    }
    if(document.getElementById('OWNER_TYPE').value =='ORGANIZATION')        
    { 
       if(document.getElementById('ORG_NAME').value.length==0) 
       {
           alert("Please Enter Organization Name");
           return false;
       }
    }
    /*if(document.forms[0].OWNER_TYPE.value=='')
    {
        alert("Please Enter Values To Save.Else Press Cancel To Close Owner Information");
        return false;
    }*/
    
    /*****disabling all the field when pressed save button*********/        
    document.forms[0].OWNER_TYPE.disabled=true;
    document.forms[0].EFFECTIVEDATE.disabled=true;
    document.forms[0].MEMBER_NUM.disabled=true;   
    document.forms[0].ORG_NAME.disabled=true;  
    document.forms[0].MEMBER_NAME.disabled=true;        
    document.forms[0].MEMBER_LNAME.disabled=true;    
    document.forms[0].ADDRESS1.disabled=true;    
    document.forms[0].ADDRESS2.disabled=true;    
    document.forms[0].CITY.disabled=true;    
    document.forms[0].STATE.disabled=true;    
    document.forms[0].ZIP.disabled=true;    
    document.forms[0].COUNTRY.disabled=true;    
    document.forms[0].PHONE.disabled=true;    
    document.forms[0].EMAIL.disabled=true;                    
   
     
    
    GetEntitySeq();
        
    varFullName=document.getElementById('MEMBER_NAME').value+" "+document.getElementById('MEMBER_LNAME').value;
    
    window.parent.document.getElementById('HDNOWNER_NO').value=document.getElementById('Owner_No').innerHTML
     
    window.parent.document.getElementById('HDNOWNERFULLNAME').value=varFullName
        
    varORGNAME =document.getElementById('ORG_NAME').value;
    if(varORGNAME=='')
    {
    window.parent.document.getElementById('OWNER_NAME_VAL').innerHTML='<a onclick="AddOwnerbtn_Index()">'+varFullName+'</a>'
    }
    else
    {
    window.parent.document.getElementById('OWNER_NAME_VAL').innerHTML='<a onclick="AddOwnerbtn_Index()">'+varORGNAME+'</a>'   
    }
    window.parent.document.getElementById('HDNENTITYSEQ_VAL').innerHTML=document.getElementById('HdnEntitySeq').value
    //window.parent.document.getElementById('HDNENTITYSEQ').value=document.getElementById('HdnEntitySeq').value

    window.parent.document.getElementById('HDNMEMBER_LNAME').value=document.getElementById('MEMBER_LNAME').value

    //window.parent.document.getElementById('HDNMEMBER_MNAME').value=document.getElementById('MEMBER_MNAME').value

    window.parent.document.getElementById('HDNOWNER_TYPE_VAL').innerHTML=document.getElementById('OWNER_TYPE').value
    window.parent.document.getElementById('HDNOWNER_TYPE').value=document.getElementById('OWNER_TYPE').value

    window.parent.document.getElementById('HDNORG_NAME_VAL').innerHTML=document.getElementById('ORG_NAME').value
    window.parent.document.getElementById('HDNORG_NAME').value=document.getElementById('ORG_NAME').value
    
    window.parent.document.getElementById('HDNMEMBER_NUM').value=document.getElementById('MEMBER_NUM').value


    window.parent.document.getElementById('HDNMEMBER_NAME').value=document.getElementById('MEMBER_NAME').value

    window.parent.document.getElementById('ADDRESS1_VAL').innerHTML=document.getElementById('ADDRESS1').value
    window.parent.document.getElementById('HDNMEMBER_ADDRESS1').value=document.getElementById('ADDRESS1').value

    window.parent.document.getElementById('ADDRESS2_VAL').innerHTML=document.getElementById('ADDRESS2').value
    window.parent.document.getElementById('HDNMEMBER_ADDRESS2').value=document.getElementById('ADDRESS2').value

    window.parent.document.getElementById('CITY_VAL').innerHTML=document.getElementById('CITY').value
    window.parent.document.getElementById('HDNMEMBER_CITY').value=document.getElementById('CITY').value

    window.parent.document.getElementById('STATE_VAL').innerHTML=document.getElementById('STATE').value
    window.parent.document.getElementById('HDNMEMBER_STATE').value=document.getElementById('STATE').value

    window.parent.document.getElementById('ZIP_VAL').innerHTML=document.getElementById('ZIP').value
    window.parent.document.getElementById('HDNMEMBER_ZIP').value=document.getElementById('ZIP').value

    window.parent.document.getElementById('COUNTRY_VAL').innerHTML=document.getElementById('COUNTRY').value
    window.parent.document.getElementById('HDNMEMBER_COUNTRY').value=document.getElementById('COUNTRY').value

    window.parent.document.getElementById('PHONE_VAL').innerHTML=document.getElementById('PHONE').value
    window.parent.document.getElementById('HDNMEMBER_PHONE').value=document.getElementById('PHONE').value

    window.parent.document.getElementById('EMAIL_VAL').innerHTML=document.getElementById('EMAIL').value
    window.parent.document.getElementById('HDNMEMBER_EMAIL').value=document.getElementById('EMAIL').value

    window.parent.document.getElementById('HDNEFFECTIVE_DATE').value=document.getElementById('EFFECTIVEDATE').value
    
    window.parent.jQuery('#dialog-OwnerInformation').dialog('close')
}

function GetAutoReg()
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
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
        if(xmlhttp.responseText.length >0)
        {               
                regno.value=xmlhttp.responseText;         
        }         
    }
  }
xmlhttp.open("GET","AutoGenerateRegServlet",true);
xmlhttp.send();

}

function SaveRegistration_Index(URL)
{           
    if(document.getElementById('regno').value.length==0) 
    {
    alert("Please Enter Reg#");
    return false;
    }
    
    if(document.forms[0].Horsegender.value =='')
        {
            alert("Please Select The Gender");
            return false;
        }
        
    var HdnValue=document.forms[0].HdnEdit.value;
      
    var regno="";
    if(HdnValue == 'Y')
    {        
    regno=document.getElementById("regno_Edit").value        
    }
    else if(HdnValue == 'N')
    {
    regno=document.getElementById("regno").value;
    }   
  var saveButton = document.getElementById("Save_Index"); // Make sure the button has this ID
                if (saveButton) {
        saveButton.disabled = true;
        }	
    if(URL!='')
    {
    document.forms[0].method="post";
    document.forms[0].action="RegistrationServlet?val=save&HdnValue="+HdnValue+"&REGNO="+regno+"&URL="+URL;
    document.forms[0].target="_self";                                                                
    document.forms[0].submit();
    }
    else
    {
    document.forms[0].method="post";
    document.forms[0].action="RegistrationServlet?val=save&HdnValue="+HdnValue+"&REGNO="+regno;
    document.forms[0].target="_self";                                                                
    document.forms[0].submit();
    }
  //  return false;
  //document.forms[0].SavedYN.value='Y';
}
function Reset_Index()
{                                                                                
    document.forms[0].method="post";
    document.forms[0].action="index.jsp?Mode=1";
    document.forms[0].target="_self";
    document.forms[0].submit();             
}

function Close_Paso(URL) { 
                    //window.reload();
if(document.getElementById('SavedYN').value=='N' )
    {
        //Reload_alert();
        var bConfirm= confirm("Do You Want To Save The Changes?");                                                        
        if (bConfirm)
        {                
            if(document.forms[0].name=="Registrationform")
            {
                SaveRegistration_Index(URL);                
            }
            if(document.forms[0].name=="Head_frm")
            {
                Save_Markings(URL);                
            }
            if(document.forms[0].name=="ForeLeg_frm")
            {
                Save_ForeLeg(URL);                
            }
            if(document.forms[0].name=="HindLeg_frm")
            {
                Save_HindLeg(URL);                
            }
            if(document.forms[0].name=="OtherMarkings_frm")
            {
                Save_OtherMarking(URL);                
            }
            if(document.forms[0].name=="pedigree_frm")
            {
                SavePedigree(URL);                
            }
        }    
        else
        {
        document.forms[0].target="_self";
        document.forms[0].method="post";
        document.forms[0].action="close.jsp";
        document.forms[0].submit();
        }
    }
    else
    {
    var bOK = confirm("Do You Wish to Exit?");
    if (bOK)
    {
    document.forms[0].target="_self";
    document.forms[0].method="post";
    document.forms[0].action="close.jsp";
    document.forms[0].submit();
    }
    }
}        
                                 
/*****************Ramani Start****************************/
/*function Certificate_Registration()
{                 		
    if(document.forms[0].regno.value =="")
    {        
        alert("Before Clicking Certificate, Please Enter the Registration Number");
        return false;
    }   
	var RegSeq=document.getElementById("HdnRegSeq").value;
	document.forms[0].method="post";
    document.forms[0].target="_Blank"
    document.forms[0].action="PDFServlet?Value=CERTIFICATEONE";
    document.forms[0].submit();

  

}*/
function Certificate_Registration(prntState)
{                 		
    if(document.forms[0].regno.value =="")
    {        
        alert("Please Enter Reg#");
        return false;
    }
    var RegSeq=document.getElementById("HdnRegSeq").value;
    document.getElementById("KeyValue").value=""
    if(prntState == "Y")
        document.getElementById("KeyValue").value="DRAFTREGISTRATION";
    else if(prntState == "IC")
        document.getElementById("KeyValue").value="ISSUECERTIFICATE";
    else
        document.getElementById("KeyValue").value="CertificatePrintCnt";
    if(prntState == "IC"){
        var xmlhttp;
        /*var rep = confirm('Do you want to issue certificate, that will bill you?');
        if(rep==true){*/
            if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
              xmlhttp=new XMLHttpRequest();
            }
            else{// code for IE6, IE5
              xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
            }        
            xmlhttp.onreadystatechange=function(){
              if (xmlhttp.readyState==4 && xmlhttp.status==200){
                  Items = xmlhttp.responseText.trim();
                  /*document.getElementById("txtTranOwnCertIssuStat1").innerHTML ="YES"*/
              }
            }
            xmlhttp.open("GET","Ajax_GetPost.jsp?AllVal="+RegSeq+"&Key=IssueCertificate&ExpType=",true); 
            xmlhttp.send();
        /*}
        else
            return false;*/
    }
    document.forms[0].method="post";
    document.forms[0].target="_Blank"
    document.forms[0].action="PDFServlet?Value=CERTIFICATEONE";
    document.forms[0].submit();

   /*$('#dialog-Certificate').dialog({autoOpen: false,height: 160,width: 240, modal: true});
   $('#dialog-Certificate').dialog('open');
   $("#modalIFrame_Certificate").attr('src','frmCertificatePopup.jsp?Seq='+RegSeq);*/

}
function OpenCertificate(value)
{  
    window.parent.document.getElementById('HdnCertificate').value=value;

    servlet(value);

    window.parent.jQuery('#dialog-Certificate').dialog('close');
}
function servlet(value)
{
    document.forms[0].method="post";
    document.forms[0].target="_Blank"
    document.forms[0].action="PDFServlet?Value="+value;
    document.forms[0].submit();
}
/************************************Ramani End********************/

/*
	Purpose: Date Should not be less than Todays date
	*/
	function checkToDayDate(givenDate, givenFeildName, Flg, msg1)
		{
                     //alert("");
		if (givenDate.value.length == 0)
		{
			return true;
		}
		var bOk = "1";
		// Date Validation
		var lsDate = givenDate.value;
		var idx = lsDate.indexOf("/");
		var sMonth = lsDate.substring(0,idx);
		lsDate = lsDate.substring((idx+1));
		idx = lsDate.indexOf("/");
		var sDay = lsDate.substring(0,idx);
		var sYear = lsDate.substring((idx+1));
		if (!monthCheck(givenDate.value))
			{
				givenDate.value="";
				givenDate.focus();
				return false
			}
		if (parseInt(sMonth) > 12 || sMonth.length > 2 )
		{
			bOk = "0";
		}
		else if (parseInt(sDay) >= 32 || sDay.length > 2 )
		{
		  bOk = "0";
		}
		else if (sYear.length != 4 )
		{
		  bOk = "0";
		}

		if (bOk == "1")
		{
			var curDate = new Date();
			var chkDate = givenDate.value

			var curMonth = curDate.getMonth();
			endMonth = parseInt(curMonth)+1;
			var endDay = curDate.getDate();
			var endYear = curDate.getYear();

			if (Flg == "CD" )
			{
				if(parseInt(endMonth.toString().length) == 1 )
					{
					  endMonth = "0" + endMonth;
					}
				if(parseInt(endDay.toString().length) == 1 )
					{
					  endDay = "0" + endDay;
					}
				if (parseInt(endYear) < parseInt(sYear))
				{
					if (msg1 != null)
						alert(givenFeildName + msg1);
					else
						alert(givenFeildName + " should not be greater than Current Date!");
					givenDate.value = "";
					givenDate.focus();
// added 05/24/2005 - Rajib
//						document.frmPatientSetup.TxtPolicyStatus1.value="";

				}
				if (parseInt(sYear) < 1900)
				{
					alert(givenFeildName+" should not be Less than "+1900+"!");
					givenDate.value = "";
					givenDate.focus();
				}
				if (sYear == endYear)
				{
					if (endMonth < sMonth )
					{
						if (msg1 != null)
							alert(givenFeildName + msg1);
						else
							alert(givenFeildName +" should not be greater than Current Date!");
						givenDate.value = "";
						givenDate.focus();
					}
				else if (endMonth == sMonth)
					{
//					if (parseInt(endDay) < parseInt(sDay))
//Changed on 04/09/2005 by vengates
					if (endDay < sDay)
						{
						if (msg1 != null)
							alert(givenFeildName + msg1);
						else
							alert(givenFeildName+" should not be greater than current Date!");

							givenDate.value = "";
							givenDate.focus();
						}
					}
				}
			}
		}
		else
			{
				alert("Date is not correct ");
				givenDate.value = "";
				givenDate.focus();
				return false;
			}

}
//added by erzath july 8 -- start
function CityStateZipDetails(varCity,varState,varZip,varCountry,Value,varFocus)
{   
    if(Value.trim()=='')
    {   
        return false;
    }    
    var City=document.getElementById(varCity).value
    var State=document.getElementById(varState).value
    var Zip=document.getElementById(varZip).value

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
          return false
      else if (xmlhttp.responseText==2)
          CityStateZipDetailsSearch(City,State,Zip,Value)
      else
          {
          var Items=xmlhttp.responseText.split('#@#');              
          document.getElementById(varCity).value=trimRegister(Items[0])
          document.getElementById(varState).value=trimRegister(Items[1])              
          document.getElementById(varZip).value=trimRegister(Items[2])              
          document.getElementById(varCountry).value=trimRegister(Items[3])      
          document.getElementById(varFocus).focus();
          }
    }
  }
xmlhttp.open("GET","frmReg_CheckCityState.jsp?City="+City+"&State="+State+"&Zip="+Zip,true);
xmlhttp.send();
}
function CityStateZipDetailsSearch(city,state,zip,Country)
{
    var w=500;
    var h=400;
    var scroll='yes'

     var winPopZip = null;

    LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
    TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
    Details ='height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable'
    winPopZip = window.open('frmReg_CityStateZipDetails.jsp?City='+city+'&State='+state+'&Zip='+zip,'CityStateZip',Details)

}


function GetEntitySeq()
{
  /*code for using special characters         
  var queryStringText = escape(Text).replace(/\+/g,'%2b');   
  */
  window.parent.document.getElementById('HDNEFFECTIVE_DATE').value=document.getElementById('EFFECTIVEDATE').value
      
  var ENTITYSEQ = document.getElementById('HdnEntitySeq').value;
  
  var MEMBER_LNAME = document.getElementById('MEMBER_LNAME').value;
  
  //var MEMBER_MNAME = document.getElementById('MEMBER_MNAME').value;
  
  var OWNER_TYPE = document.getElementById('OWNER_TYPE').value;
  
  var ORG_NAME = document.getElementById('ORG_NAME').value;
  
  var MEMBER_NUM = document.getElementById('MEMBER_NUM').value;
  
  var MEMBER_NAME = document.getElementById('MEMBER_NAME').value;
  
  var ADDRESS1 = document.getElementById('ADDRESS1').value;    
  
  var strADDRESS2 = document.getElementById('ADDRESS2').value;  
  var ADDRESS2 = escape(strADDRESS2).replace(/\#/g,'%23');   
  
  var CITY = document.getElementById('CITY').value;  
  
  var STATE = document.getElementById('STATE').value;  
  
  var ZIP = document.getElementById('ZIP').value;
  
  var COUNTRY = document.getElementById('COUNTRY').value;
  
  var PHONE = document.getElementById('PHONE').value;
  
  var EMAIL = document.getElementById('EMAIL').value;     
  
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
        if(xmlhttp.responseText.length >0)
        {
                HdnEntitySeq.value=xmlhttp.responseText;                  
                Ajax_GetAssignedNum(trimRegister(HdnEntitySeq.value));                                
                window.parent.document.getElementById('HDNENTITYSEQ').value=trimRegister(HdnEntitySeq.value)
                if(window.parent.document.getElementById('HDNENTITYSEQ').value!='')
                    window.parent.document.getElementById('SavedYN').value='N';
                
                
        }         
    }
  }
xmlhttp.open("GET","RegistrationServlet?PAGEID=OWNERREGISTRATION&MEMBER_LNAME="+MEMBER_LNAME+"&MEMBER_NAME="+MEMBER_NAME+"&OWNER_TYPE="+OWNER_TYPE+"&ORG_NAME="+ORG_NAME+"&MEMBER_NUM="+MEMBER_NUM+"&ADDRESS1="+ADDRESS1+"&ADDRESS2="+ADDRESS2+"&CITY="+CITY+"&STATE="+STATE+"&ZIP="+ZIP+"&COUNTRY="+COUNTRY+"&PHONE="+PHONE+"&EMAIL="+EMAIL+"&ENTITYSEQ="+ENTITYSEQ,true);
xmlhttp.send();

}
function Ajax_GetAssignedNum(Seq)
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
    if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
      if(xmlhttp.responseText == 0)       
           return false;
      else 
      {  
        var Items=xmlhttp.responseText.split("#@#");                                     
        window.parent.document.getElementById('HDNOWNER_NO').value=trimRegister(Items[1]);              
        document.getElementById(varFocus).focus();
      }
    }
    }
    xmlhttp.open("GET","frmReg_SearchEntitySeq.jsp?enty="+Seq,true);
    xmlhttp.send(); 
}
//added by erzath july 8 -- End
function PlaceOfBirthSearch()
{    
    $('#dialog-PlaceOfBirth').dialog({autoOpen: false,height: 400,width: 567, modal: true});
    $('#dialog-PlaceOfBirth').dialog('open');
    $("#modalIFrame_PlaceOfBirth").attr('src','frmReg_CommonRef_Place.jsp?page=Reg');
    
}
function OpenCommonRef1_Place(DgTitle,RetnID,RetnValue)
{
   

$('#dialog-CmmnRef').dialog({ autoOpen: false,height: 400,width: 400, modal: true,title:DgTitle});
$('#dialog-CmmnRef').dialog('open');
$("#modalIFrame_CmmnRef").attr('src','frmReg_CommonRef_Place.jsp?RefType='+DgTitle+'&ReturnID='+RetnID+'&ReturnVal='+RetnValue);

return false;

}



function SaveMode()
{
    document.getElementById('SavedYN').value='N'; 
    
    if(document.forms[0].hdnregseq.value =="")
    {        
        document.getElementById('SavedYN').value='N'; 
        return false;
    }    
    if(document.forms[0].hdnregseq.value =="")
    {        
        document.getElementById('SavedYN').value='N'; 
        return false;
    }   
}

function Save_ForeLeg(URL)
{    
    document.forms[0].method="post";
    document.forms[0].action="Markings_SPServlet?URL="+URL;
    document.forms[0].target="_self";
    document.forms[0].submit();
}
function Save_HindLeg(URL)			
{
    
    document.forms[0].method="post";
    document.forms[0].action="Markings_SPServlet?URL="+URL;
    document.forms[0].target="_self";
    document.forms[0].submit(); 
    
}
function Save_OtherMarking(URL) 
{
    
    document.forms[0].method="post";
    document.forms[0].action="Markings_SPServlet?URL="+URL;
    document.forms[0].target="_self";
    document.forms[0].submit();
    
}
function Save_Markings(URL)		
{    
    document.forms[0].target="_self";
    document.forms[0].method="post";
    document.forms[0].action="Markings_SPServlet?URL="+URL;    
    document.forms[0].submit();
    
}
function SavePedigree(URL)
{       
    
    valSave = document.getElementById('SavedYN').value;
    if(valSave=="N")
    {
    document.forms[0].method="post";
    document.forms[0].action="PedigreeServlet?URL="+URL;
    document.forms[0].target="_self";
    document.forms[0].submit();              
    }    
}

function CheckSave(URL)
{        
    if(document.getElementById('SavedYN').value=='N' )
    {
        //window.reload();        
        var bConfirm= confirm("Doing so will close this page,And you will lose your unsaved changes.\n Are you sure you want to leave this page?");          
        if (bConfirm)
        {
            document.forms[0].method="post";
            document.forms[0].action=URL;
            document.forms[0].target="_self";  
            document.forms[0].submit();
        }
        else
        {
            return false;
        }
        //This is to save when they say to save in the alert--start
        /*var bConfirm= confirm("Do You Want To save The Changes?"); 
        if (bConfirm)
        {                
            if(document.forms[0].name=="Registrationform")
            {
                SaveRegistration_Index(URL);                
            }
            if(document.forms[0].name=="Head_frm")
            {
                Save_Markings(URL);                
            }
            if(document.forms[0].name=="ForeLeg_frm")
            {
                Save_ForeLeg(URL);                
            }
            if(document.forms[0].name=="HindLeg_frm")
            {
                Save_HindLeg(URL);                
            }
            if(document.forms[0].name=="OtherMarkings_frm")
            {
                Save_OtherMarking(URL);                
            }
            if(document.forms[0].name=="pedigree_frm")
            {
               SavePedigree(URL)           
            }
        }
        else
        {
        document.forms[0].method="post";
        document.forms[0].action=URL;
        document.forms[0].target="_self";  
        document.forms[0].submit();
        }*/
        //This is to save when they say to save in the alert--end
    }
    else
    {
        if(document.getElementById('HdnRegSeq').value=='')
        {
            if(document.forms[0].name=='frmRegistrationSearch')
            {
                document.forms[0].method="post";
                document.forms[0].action=URL+"?EnableRegNo=R";
                document.forms[0].target="_self";  
                document.forms[0].submit();
            }
            else
            {
                document.forms[0].method="post";
                document.forms[0].action=URL;
                document.forms[0].target="_self";  
                document.forms[0].submit();
            }
        }
        else
        {
        document.forms[0].method="post";
        document.forms[0].action=URL+"?EnableRegNo=R";
        document.forms[0].target="_self";  
        document.forms[0].submit();
        }
    }
}
function RegEdit()
{
    document.getElementById("regno_Edit").style.visibility='visible';
    document.getElementById("regno_Edit").style.width='190px';
    document.getElementById("regno_Edit").style.border='1px  solid #000000';
    document.getElementById("regno").style.width='0px';
    document.getElementById("regno").style.border='0px';    
    document.getElementById("regno").style.visibility='hidden';
    
    var seq_val = document.getElementById("HdnRegSeq") .value
    if(seq_val=='')
    {
        //alert("Please Enter all the values to save");
        return false;
    }
    else if(seq_val!='')
    {    
        var bConfirm= confirm("Do You Want To Update Your Reg#?");                                                        
        if (bConfirm)
        {
            
        }
    }
}

/*
function RegEdit()
{   var seq_val = document.getElementById("HdnRegSeq") .value
    if(seq_val=='')
    {
        //alert("Please Enter all the values to save");
        return false;
    }
    else if(seq_val!='')
    {    
        var bConfirm= confirm("Do You Want To Update Your Reg#?");                                                        
        if (bConfirm)
        {    
        document.getElementById("NonEdit").style.display='none';
        document.getElementById("Edit").style.visibility='';
        document.getElementById("Edit").style.display='block';    
        document.getElementById("HdnEdit").value='Y';    
        
        //document.forms[0].regno.focus();
        }
        else
        {
            //document.getElementById("regno").value
        }
    }
}

function frmOnload()
{
    document.getElementById("Edit").style.display='none';
    
}
*/
function AjaxRegNumCheck(Obj,Elem1_Txt,Elem2_Edit_Txt)
{ 
    
    var txtregno_value = document.getElementById(Elem1_Txt).value;    
    var value=Obj.value;
    if(Obj.value=='')
     return false;
 
    if(txtregno_value == value)//This part if the user uses the same Reg# while updating
    {
        return false;
    }
    else//This part if the user changes the Reg# in the updation
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
            if (xmlhttp.readyState==4 && xmlhttp.status==200)
            {
              if(xmlhttp.responseText==0)
              {   
                  document.getElementById(Elem1_Txt).value=trimRegister(value);
                  return false             
              }
              else
              {
                  var Items=xmlhttp.responseText; 
                  alert("Registration Number Already Exist.");
                  document.getElementById(Elem2_Edit_Txt).value=document.getElementById(Elem1_Txt).value;                               
              }
            }
        }
        xmlhttp.open("GET","RegistrationServlet?PAGEID=REGISTRATION_NUM_CHECK&RegNo="+value,true);
        xmlhttp.send(); 
    }
}
/*function EditBreederInformation1()
{
    var textb =window.parent.document.getElementById("breeder");   
    var varfname = textb.value.split(" ")[0]
    var varmname = textb.value.split(" ")[1]
    var varlname = textb.value.split(" ")[2]
    
    var ENTITYSEQ = window.parent.document.getElementById("breederSeq").value;
    if(ENTITYSEQ=='')
    {
        alert("Please Select Breeder Value to Edit1");
        return false;
    }
    document.getElementById("ENTITYSEQ").value  =  window.parent.document.getElementById("breederSeq").value;
    document.getElementById("FName").value = varfname;
    document.getElementById("LName").value = varlname;
    //document.getElementById("LName").value
    document.forms[0].method="post";
    document.forms[0].action="frmReg_BreederAddPopUp.jsp?srch=1&ENTITYSEQ="+ENTITYSEQ;
    document.forms[0].target="_self";                                                                
    document.forms[0].submit();
}*/
function Reset_Images()
{
    document.forms[0].method="post";
    document.forms[0].action="Images.jsp?Mode=1";
    document.forms[0].target="_self";                                                                
    document.forms[0].submit();
}
function BreederAddPopUp(varfname,varlname,varphone,Action,value_BredSeq)
{          
    if(Action=='New')
    {
    $('#dialog-BreederAdd').dialog({ autoOpen: false,height: 455,width: 640, modal: true });
    $('#dialog-BreederAdd').dialog('open');
    $("#modalIFrame_BreederAdd").attr('src','frmReg_BreederAddPopUp.jsp?STATUS=&Action=Add');    
    return false;
    }
    else
    {
    //var value_BredSeq = window.parent.document.getElementById("breederSeq").value;        
    if(value_BredSeq=='')
    {
        alert("Please Select Breeder Value to Edit");
        return false;
    }
    $('#dialog-BreederAdd').dialog({ autoOpen: false,height: 400,width: 640, modal: true });
    $('#dialog-BreederAdd').dialog('open');    
    $("#modalIFrame_BreederAdd").attr('src','frmReg_BreederAddPopUp.jsp?STATUS=&srch=1&ENTITYSEQ='+value_BredSeq+'&Action='+Action);   
    return false;
    }       
}
function newreg_Ped(Gender)
{    
    $('#dialog-NewReg').dialog({ autoOpen: false,height: 475,width: 700, modal: true });
    $('#dialog-NewReg').dialog('open');
    $("#modalIFrame_NewReg").attr('src','frmReg_Pedigree_NewRegistration.jsp?Gen='+Gender);
    return false;
}
function OwnerSearch(state,type,objVal,srchtype)
{                
    if(state!='')
        return false;
        
    var details = 'titlebar=no,status=no,menubar=no,resizable=no,width=785,height=500,scrollbars=no,left=230,top=150';

    if(type=='pop')
    {
        if(document.forms[0].name=="Person_Search")
            childWindow=open("frmReg_NewOwnerInformationSearch.jsp?frmType=SEARCH&tpe="+srchtype,"Cal",details);
        else
            childWindow=open("frmReg_NewOwnerInformationSearch.jsp?tpe="+srchtype,"Cal",details);
    }
    if(type=='partial')
    {        
    if(objVal.name=='ORG_NAME')
        varName='Org_Name';
    if(objVal.name=='MEMBER_NAME')
        varName='FName';
    if(objVal.name=='MEMBER_LNAME')
        varName='LName'; 
    
    if(objVal.value=='' )
        return false;
    childWindow=open("frmReg_NewOwnerInformationSearch.jsp?srch=1&typ=1&"+varName+"="+objVal.value,"Cal",details);
    }
    if (childWindow.opener == null)
        childWindow.opener = self;
    childWindow.focus();    
}

function Ajax_PopulateOwnerInfm(obj,hdnEntSeq,txtOwnNo,HdnOwmTyp,HdnMemNo,lblOwnNam,lblAd1,lblAd2,lblCity,lblState,lblZip,lblCountry,lblPhone,lblEmail)
{     
    if(trimRegister(obj)=='')
    {
        document.getElementById(hdnEntSeq).value="";              
        document.getElementById(txtOwnNo).value="";
        document.getElementById(lblOwnNam).innerHTML="";
        document.getElementById(HdnOwmTyp).value="";                        
        document.getElementById(HdnMemNo).value="";
        document.getElementById(lblAd1).innerHTML="";     
        document.getElementById(lblAd2).innerHTML="";      
        document.getElementById(lblCity).innerHTML="";      
        document.getElementById(lblState).innerHTML="";     
        document.getElementById(lblZip).innerHTML="";      
        document.getElementById(lblCountry).innerHTML="";      
        document.getElementById(lblPhone).innerHTML="";      
        document.getElementById(lblEmail).innerHTML="";                   
        return false;    
    }
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
      if(xmlhttp.responseText == 0)       
      { 
        alert("Owner, Does not Exist");               
        document.getElementById(txtOwnNo).value=obj;              
        return false;
      }
      else 
      {  
        var Items=xmlhttp.responseText.split("#@#");                             
        document.getElementById(hdnEntSeq).value=trimRegister(Items[0]);              
        document.getElementById(txtOwnNo).value=trimRegister(Items[1]);              
        document.getElementById(HdnOwmTyp).value=trimRegister(Items[2]);                        
        document.getElementById(HdnMemNo).value=trimRegister(Items[4]);
        document.getElementById(lblAd1).innerHTML=trimRegister(Items[7]);     
        document.getElementById(lblAd2).innerHTML=trimRegister(Items[8]);      
        document.getElementById(lblCity).innerHTML=trimRegister(Items[9]);      
        document.getElementById(lblState).innerHTML=trimRegister(Items[10]);     
        document.getElementById(lblZip).innerHTML=trimRegister(Items[11]);      
        document.getElementById(lblCountry).innerHTML=trimRegister(Items[12]);      
        document.getElementById(lblPhone).innerHTML=trimRegister(Items[13]);      
        document.getElementById(lblEmail).innerHTML=trimRegister(Items[14]);           
        document.getElementById(lblOwnNam).innerHTML="<a onclick='EditOwner("+trimRegister(Items[0])+")'>"+trimRegister(Items[16])+"</a>";          
        document.getElementById('SavedYN').value='N';
        document.getElementById(varFocus).focus();
      }
    }
    }
    xmlhttp.open("GET","frmReg_AjaxOwnerNo.jsp?ON="+obj,true);
    xmlhttp.send();    
}  
function Ajax_Owner(obj,hdnEntSeq,txtOwnNo,lblOwnNam)
{     
    if(obj=='')
    {
        document.getElementById(hdnEntSeq).value="";              
        document.getElementById(txtOwnNo).value="";
        document.getElementById(lblOwnNam).innerHTML="";
        return false;    
    }
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
      if(xmlhttp.responseText == 0)       
      {
        if(txtOwnNo=='OwnerNo')
            alert("Owner, Does not Exist"); 
        else
            alert("Breeder, Does not Exist"); 
        
        document.getElementById(hdnEntSeq).value="";              
        document.getElementById(txtOwnNo).value="";
        document.getElementById(lblOwnNam).innerHTML="";
        return false;
      }  
      else 
      {  
        var Items=xmlhttp.responseText.split("#@#");                             
        document.getElementById(hdnEntSeq).value=trimRegister(Items[0]);              
        document.getElementById(txtOwnNo).value=trimRegister(Items[1]);                                
        document.getElementById(lblOwnNam).innerHTML="<a onclick='EditOwner("+trimRegister(Items[0])+")'>"+trimRegister(Items[16])+"</a>";          
        document.getElementById(varFocus).focus();
      }
    }
    }
    xmlhttp.open("GET","frmReg_AjaxOwnerNo.jsp?ON="+obj,true);
    xmlhttp.send();    
}  
function EditOwner(valEntitySeq)
{   
    var winPop = null;   
    w=700;
    h=500;
    scroll='yes';
    LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
    TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
    Details ='height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable'
    
    winPop = window.open('frmReg_NewOwner_Pop.jsp?entyseq='+valEntitySeq,"OWNER",Details)

}



<!-- Script FOR AGE CALCULATION -->
function checkleapyear(datea)
{
	if(datea.getYear()%4 == 0)
	{
		if(datea.getYear()% 10 != 0)
		{
			return true;
		}
		else
		{
			if(datea.getYear()% 400 == 0)
				return true;
			else
				return false;
		}
	}
  return false;
}
function DaysInMonth(Y, M) {
    with (new Date(Y, M, 1, 12)) {
        setDate(0);
        return getDate();
    }
}
function datediff(date1, date2) {
    var y1 = date1.getFullYear(), m1 = date1.getMonth(), d1 = date1.getDate(),
	 y2 = date2.getFullYear(), m2 = date2.getMonth(), d2 = date2.getDate();
    if (d1 < d2) {
        m1--;
        d1 += DaysInMonth(y2, m2);
    }
    if (m1 < m2) {
        y1--;
        m1 += 12;
    }
    return [y1 - y2, m1 - m2, d1 - d2];
}
function agecal(varDob,varDeath)
{      
    var dString = document.getElementById(varDob).value;      
    var deathdate= document.getElementById(varDeath).value;//deathdate Or dategelded
    
    var calmon=dString.split("/")[0]
    var calday=dString.split("/")[1]
    var calyear=dString.split("/")[2]   
    
    var currentdate = new Date();
    
    if (Date.parse(dString) > Date.parse(deathdate)) {
    if(varDeath=="Deathdate_datepicker")    
        alert("Invalid Date Range!\n Death Date cannot be before Birth Date!")
    else
        alert("Invalid Date Range!\n Date Gelded cannot be before Birth Date!")

    document.getElementById(varDeath).value="";
    return false;
    }
    else if(Date.parse(dString) > Date.parse(currentdate))
    {
    alert("Invalid Date Range!\n Birth Date cannot be Future Date!")
    document.getElementById(varDob).value="";
    return false;    
    }
    else if(Date.parse(deathdate) > Date.parse(currentdate))
    {
        if(varDeath=="Deathdate_datepicker")    
            alert("Invalid Date Range!\n Death Date cannot be Future Date!")
        else
            alert("Invalid Date Range!\n Date Gelded cannot be Future Date!")

    document.getElementById(varDeath).value="";
    return false;    
    }
    if(deathdate=="" && dString!="")
    {
    var curday  = currentdate.getDate();
    var curmon  = currentdate.getMonth()+1;
    var curyear = currentdate.getFullYear();        
    }
    else if(deathdate!="" && dString!="")
    {
    var d2 = new Date(deathdate);
    var curday  = d2.getDate();
    var curmon  = d2.getMonth()+1;
    var curyear = d2.getFullYear();        
    }
    else
    {
        alert("Please Enter BirthDate");
        document.getElementById(varDeath).value="";
        document.forms[0].Horseage.value="";    
        document.getElementById("Horseage_Lbl").innerHTML="";
        return false;
    }
    if(varDeath!="datepicker_Dategelded")
    {
    
        var curd = new Date(curyear,curmon-1,curday);
        var cald = new Date(calyear,calmon-1,calday);
        var diff =  Date.UTC(curyear,curmon,curday,0,0,0) - Date.UTC(calyear,calmon,calday,0,0,0);
        var dife = datediff(curd,cald);
        //document.birthday.age.value=dife[0]+" years, "+dife[1]+" months, and "+dife[2]+" days";
        var monleft = (dife[0]*12)+dife[1];
        var secleft = diff/1000/60;
        var hrsleft = secleft/60;
        var daysleft = hrsleft/24;
        //document.birthday.months.value=monleft+" Month since your birth";	
        
        document.forms[0].Horseage.value=monleft+" MONTHS";
        
        document.getElementById("Horseage_Lbl").innerHTML=monleft+" M  ";
        
        document.getElementById("Hor_daysDiff").innerHTML=dife[2]+" D"; //for days
        /*document.birthday.daa.value=daysleft+" days since your birth";	
        document.birthday.hours.value=hrsleft+" hours since your birth";
        document.birthday.min.value=secleft+" minutes since your birth";
        var as = parseInt(calyear)+dife[0]+1;
        var diff =  Date.UTC(as,calmon,calday,0,0,0) - Date.UTC(curyear,curmon,curday,0,0,0);
        var datee = diff/1000/60/60/24;
        document.birthday.nbday.value=datee+" days left for your next birthday";	*/
    }    
}
<!--     Script FOR AGE CALCULATION  -->
        
/*
function agecal(varDob,varDeath){

var dString = document.getElementById(varDob).value;
var deathdate= document.getElementById(varDeath).value;//deathdate Or dategelded
var currentdate = new Date();
if (Date.parse(dString) > Date.parse(deathdate)) {
if(varDeath=="Deathdate_datepicker")    
    alert("Invalid Date Range!\n Death Date cannot be before Birth Date!")
else
    alert("Invalid Date Range!\n Date Gelded cannot be before Birth Date!")

document.getElementById(varDeath).value="";
return false;
}
else if(Date.parse(dString) > Date.parse(currentdate))
{
alert("Invalid Date Range!\n Birth Date cannot be Future Date!")
document.getElementById(varDob).value="";
return false;    
}
else if(Date.parse(deathdate) > Date.parse(currentdate))
{
    if(varDeath=="Deathdate_datepicker")    
        alert("Invalid Date Range!\n Death Date cannot be Future Date!")
    else
        alert("Invalid Date Range!\n Date Gelded cannot be Future Date!")

document.getElementById(varDeath).value="";
return false;    
}
if(deathdate=="" && dString!="")
{
var d2 = new Date();
}
else if(deathdate!="" && dString!="")
{
var d2 = new Date(deathdate);
}
else
{
    alert("Please Enter BirthDate");
    document.getElementById(varDeath).value="";
    document.forms[0].Horseage.value="";    
    document.getElementById("Horseage_Lbl").innerHTML="";
    return false;
}
if(varDeath!="datepicker_Dategelded")
{
var d1 = new Date(dString);

    DateDiff = {
    inDays: function(d1, d2) {
        var t2 = d2.getTime();
        var t1 = d1.getTime();
 
        return parseInt((t2-t1)/(24*3600*1000));
    },
 
    inWeeks: function(d1, d2) {
        var t2 = d2.getTime();
        var t1 = d1.getTime();
 
        return parseInt((t2-t1)/(24*3600*1000*7));
    },
 
    inMonths: function(d1, d2) {
        var d1Y = d1.getFullYear();
        var d2Y = d2.getFullYear();
        var d1M = d1.getMonth();
        var d2M = d2.getMonth();
 
        return (d2M+12*d2Y)-(d1M+12*d1Y);
    },
 
    inYears: function(d1, d2) {
        return d2.getFullYear()-d1.getFullYear();
    }
}
 var ageinmonths= DateDiff.inMonths(d1, d2);
 
 dateCalculator(dString,deathdate);
 
 document.forms[0].Horseage.value=ageinmonths+" MONTHS";
 document.getElementById("Horseage_Lbl").innerHTML=ageinmonths+" M  ";
//document.write("<br />Number of <b>months</b> since : "+DateDiff.inMonths(d1, d2));
}
}
function dateCalculator(textb,deathdate)
{   
    //var textb = document.getElementById("datepicker_DOB");
    var month1=textb.split("/")[0]
    var date=textb.split("/")[1]
    var year=textb.split("/")[2]
    var month=Number(month1)-1;
    
    //var deathdate = parent.document.getElementById("Deathdate_datepicker");

    if(deathdate=='')
    {    
     today = new Date();
     dateStr = today.getDate();
     monthStr = today.getMonth();
     yearStr = today.getFullYear();
    }
    else
    { 
     monthStr1 = deathdate.split("/")[0]
     dateStr  = deathdate.split("/")[1]
     yearStr = deathdate.split("/")[2]
     monthStr = Number(monthStr1)-1;
     }
     
     theYear = yearStr - year;
     theMonth = monthStr - month;
     theDate = dateStr - date;
   
     var days = "";
     if (monthStr == 0 || monthStr == 2 || monthStr == 4 || monthStr == 6 || monthStr == 7 || monthStr == 9 || monthStr == 11) days = 31;
     if (monthStr == 3 || monthStr == 5 || monthStr == 8 || monthStr == 10) days = 30;
     if (monthStr == 1) days = 28;
    
     if (date < dateStr) {     
         document.getElementById("Hor_daysDiff").innerHTML = theDate+" D"; 
     }
} 
*/
function EmptyAll_Autocomplete(Name,No,Seq)
{       
    
    if(document.forms[0].name=="frm_Pedigreesearchpopup")
    {    
        if(trimRegister(document.forms[0].hor_name.value)=='')
        {
            document.forms[0].hor_name.value='';
            document.getElementById(No).value='';
            document.getElementById(Seq).value='';
        }           
    }
    else
    {   //alert(document.getElementById(Name).value+"===value");
        if(trimRegister(document.getElementById(Name).value)=='')
        {
            document.getElementById(Name).value='';
            document.getElementById(No).value='';
            document.getElementById(Seq).value='';
        }
    }
}
function  Empty_CityDetails(val,city,state,zip,country)
{    
    if(val=='')
    {
        document.getElementById(city).value='';
        document.getElementById(state).value='';
        document.getElementById(zip).value='';
        document.getElementById(country).value='';
    }    
}