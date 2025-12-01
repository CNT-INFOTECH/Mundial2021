$(function(){
    $('a').on('click', function(e){
        e.preventDefault();
        $('<div/>', {'class':'myDlgClass', 'id':'link-'+($(this).index()+1)})
        .html($('<iframe/>', {
            'src' : $(this).attr('href'),
            'style' :'width:100%; height:95%;border:none;',
            'id': 'dialogJudgeCard'
        })).appendTo('body')
        .dialog({
            'title' : $(this).text(),
            'width' : 800,
            'height' :400,
            buttons: {
                "Save": SaveInfo,
                Close: function() {                   
                    $( this ).dialog( "close" );
                    $(this).dialog('destroy').remove();                    
                }
                }
             
        });
    });
});


function EditClass()
{
 
        document.getElementById('dialogEditClass').contentWindow.document.forms[0].method = "post";
        document.getElementById('dialogEditClass').contentWindow.document.forms[0].action = "../ShowController?PageID=EditClass";
        document.getElementById('dialogEditClass').contentWindow.document.forms[0].target = "_self";
        document.getElementById('dialogEditClass').contentWindow.document.forms[0].submit();                                     
        
}
function SaveInfo() {
      //ShwVal = document.getElementById('dialogJudgeCard').contentWindow.document.getElementById('Row1Column1').value;
     
        document.getElementById('dialogJudgeCard').contentWindow.document.forms[0].method = "post";
        document.getElementById('dialogJudgeCard').contentWindow.document.forms[0].action = "../ShowController?PageID=JdgCards";
        document.getElementById('dialogJudgeCard').contentWindow.document.forms[0].target = "yourIframe";
        document.getElementById('dialogJudgeCard').contentWindow.document.forms[0].submit();
    }
    
    
    function movePrevious(){
     var counter = 0;
        counter = parseInt(document.forms[0].hidden.value) - 1;
        if(counter < 0){
            alert('This is the First Class for this Show')
            return false;
        }
        
        document.forms[0].hidden.value = counter;
        document.forms[0].method = "post";
        document.forms[0].action = "SM_Placements.jsp";
        document.forms[0].target = "_self";
        document.forms[0].submit();
}

   function movePrevious_Results(){
     var counter = 0;
        counter = parseInt(document.forms[0].hidden.value) - 1;
        if(counter < 0){
            alert('This is the First Class for this Show')
            return false;
        }
        
        document.forms[0].hidden.value = counter;
        document.forms[0].method = "post";
        document.forms[0].action = "SM_Placements_Results.jsp";
        document.forms[0].target = "_self";
        document.forms[0].submit();
}

 function moveCurrent(){
    
   
        counter = document.forms[0].Class_Number.value;        
       
        document.forms[0].method = "post";
        document.forms[0].action = "SM_Placements.jsp?DmdCde="+counter;
        document.forms[0].target = "_self";
        document.forms[0].submit();
}

 function moveCurrent_Results(){
    

        var counter = document.forms[0].Class_Number.value;        
     
        document.forms[0].method = "post";
        document.forms[0].action = "SM_Placements_Results.jsp?DmdCde="+counter;
        document.forms[0].target = "_self";
        document.forms[0].submit();
}


function moveNext(varTotalRecs){

       var counter = 0;
        counter = parseInt(document.forms[0].hidden.value) + 1;
         
        if(varTotalRecs == counter){
            alert('This is the last Class in the show')
            return false;
            
        }
            
        
        document.forms[0].hidden.value = counter;
        document.forms[0].method = "post";
        document.forms[0].action = "SM_Placements.jsp"; 
          document.forms[0].submit();
}
function moveNext_Results(varTotalRecs){

       var counter = 0;
        counter = parseInt(document.forms[0].hidden.value) + 1;
         
        if(varTotalRecs == counter){
            alert('This is the last Class in the show')
            return false;
            
        }
            
        
        document.forms[0].hidden.value = counter;
        document.forms[0].method = "post";
        document.forms[0].action = "SM_Placements_Results.jsp"; 
          document.forms[0].submit();
}

function moveFirst(){

       var counter = 0;
        document.forms[0].hidden.value = counter;
        document.forms[0].method = "post";
        document.forms[0].action = "SM_Placements.jsp"; 
    
        document.forms[0].submit();
}

function moveFirst_Results(){

       var counter = 0;
        document.forms[0].hidden.value = counter;
        document.forms[0].method = "post";
        document.forms[0].action = "SM_Placements_Results.jsp"; 
    
        document.forms[0].submit();
}
function moveLast_Classes(){

        var counter = document.forms[0].TotalRecs.value;
        document.forms[0].hidden.value = counter;
        document.forms[0].method = "post";
        document.forms[0].action = "SM_Placements.jsp"; 
     
        document.forms[0].submit();
}

function moveLast_Classes_Results(){

        var counter = document.forms[0].TotalRecs.value;
        document.forms[0].hidden.value = counter;
        document.forms[0].method = "post";
        document.forms[0].action = "SM_Placements_Results.jsp"; 
     
        document.forms[0].submit();
}


function DisplayClassResults(){
        
        document.forms[0].method = "post";
        document.forms[0].action = "SM_Placements.jsp"; 
        document.forms[0].submit();
}

function DisplayResults(){
        
        document.forms[0].method = "post";
        document.forms[0].action = "SM_Placements_Results.jsp"; 
        document.forms[0].submit();
}

function PublishEventResults(){
    
        document.forms[0].method = "post";
        document.forms[0].action = "../ShowController?PageID=PUBLISH";
        document.forms[0].target = "_self";
        document.forms[0].submit();
}

function EditClassEntry(PageUrl){

     $('<div/>', {'class':'myDlgClass', 'id':'link-'+($(this).index()+1)})
        .html($('<iframe/>', {
            'src' : PageUrl,
            'style' :'width:100%; height:95%;border:none;',
            'id': 'dialogEditClass'
        })).appendTo('body')
        .dialog({
            'title' : $(this).text(),
            'width' : 600,
            'height' :400,
            buttons: {
                "Save": EditClass,
                Close: function() {                   
                    $( this ).dialog( "close" );
                    $(this).dialog('destroy').remove();                    
                }
                }
             
        });
    
}



function ScratchClassEntry(ValHrsMstSeq,ValRiderSeq){
    
    
        document.forms[0].method = "post";
        document.forms[0].action = "../ShowController?PageID=CLASS_ENTRY_SCRATCH&HrsMstSeq="+ValHrsMstSeq+"&RiderSeq="+ValRiderSeq;
        document.forms[0].target = "_self";
        document.forms[0].submit();
}

function DeleteClassEntry(ValHrsMstSeq,ValRiderSeq){
   
        document.forms[0].method = "post";
        document.forms[0].action = "../ShowController?PageID=CLASS_ENTRY_DELETE&HrsMstSeq="+ValHrsMstSeq+"&RiderSeq="+ValRiderSeq;
        document.forms[0].target = "_self";
        document.forms[0].submit();
}

function OpenF1(ShowVal,EventVal)
{
    
    var randomVal = randomString();
    NewWindow("SM_Score_Olympic_F1.jsp?" + randomVal + "&SIdent=" + ShowVal+ "&EIdent=" + EventVal, 'mywin', '900', '480', 'no', 'center')
}

function OpenF2(ShowVal,EventVal)
{
    
    var randomVal = randomString();
    NewWindow("SM_Score_Olympic.jsp?" + randomVal + "&SIdent=" + ShowVal+ "&EIdent=" + EventVal, 'mywin', '900', '480', 'no', 'center')
}


function OpenAddWork(ShowVal,EventVal)
{
    
    var randomVal = randomString();
    NewWindow("SM_Score_Olympic_AddWork.jsp?" + randomVal + "&SIdent=" + ShowVal+ "&EIdent=" + EventVal, 'mywin', '800', '480', 'no', 'center')
}

function AddFlag_ClassEntry(PageUrl){

     $('<div/>', {'class':'myDlgClass', 'id':'link-'+($(this).index()+1)})
        .html($('<iframe/>', {
            'src' : PageUrl,
            'style' :'width:100%; height:95%;border:none;',
            'id': 'dialogFlag'
        })).appendTo('body')
        .dialog({
            'title' : 'Flag',
            'width' : 200,
            'height' :180
             
        });
    
}

function Add_ClassEntry(PageUrl){

     $('<div/>', {'id':'link-'+($(this).index()+1)})
        .html($('<iframe/>', {
            'src' : PageUrl,
            'style' :'width:100%; height:95%;border:none;',
            'id': 'dialogAddEntry'
        })).appendTo('body')
        .dialog({
            'title' : 'Add Entry',
            'width' : 800,
            'height' :280
        });
    
}

function OpenF1_NC1D(ShowVal,EventVal)
{
      var randomVal = randomString();
    NewWindow("Judging/NC1D/SM_F1_NC_1D.jsp?" + randomVal + "&SIdent=" + ShowVal+ "&EIdent=" + EventVal, 'mywin', '900', '480', 'no', 'center')
    
    

}

function OpenF2_NC1D(ShowVal,EventVal)
{
    
    var randomVal = randomString();
    NewWindow("Judging/NC1D/SM_F2_NC_1D.jsp?" + randomVal + "&SIdent=" + ShowVal+ "&EIdent=" + EventVal, 'mywin', '900', '480', 'no', 'center')
}

function OpenF2_NC1D_MOS(ShowVal,EventVal)
{
    var randomVal = randomString();
    NewWindow("Judging/NC1D/SM_F2_MOS.jsp?" + randomVal + "&SIdent=" + ShowVal+ "&EIdent=" + EventVal, 'mywin', '900', '480', 'no', 'center')
}

function OpenAddWork_NC1D(ShowVal,EventVal)
{
    
    var randomVal = randomString();
    NewWindow("Judging/NC1D/SM_AddWork_NC_1D.jsp?" + randomVal + "&SIdent=" + ShowVal+ "&EIdent=" + EventVal, 'mywin', '900', '480', 'no', 'center')
}

function OpenResultsVerification_SP(ShowSeq) {

    var options_PayBack = {
        url: "SM_Results_Verification.jsp",
        title: 'Results Verification',
        size: eModal.size.lg,
        buttons: [
            {text: 'Close', style: 'info', close: true},
            {text: 'Publish All Results Entered', style: 'info', close: true, click: function() {
                    var jqxhr = $.post("SM_Results_Verification_Submit.jsp", function(data) {
                })

                    .fail(function() {
                        alert("Problem publishing results");
                   })
                    
                }
            }
        ]
    };

    eModal.ajax(options_PayBack);
}