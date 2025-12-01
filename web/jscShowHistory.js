/*$.fx.speeds._default=1000;*/
$(function() {
               
               
                $( "#TxtEventFrom" ).datepicker({
                changeMonth: true,
                changeYear: true
                });

                             $( "#TxtEventTo" ).datepicker({
                changeMonth: true,
                changeYear: true
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
                       
                                 
                $( "#ShowHistorySearch" )                
                .click(function() {
                    
                document.forms[0].method="post";
                document.forms[0].action="frmShowHistory.jsp?Mode=3";
                document.forms[0].target="_self";
                document.forms[0].submit();
                });   
                
                
                
                $( "#ShowHistoryReset" )                
                .click(function() {
                    
                document.forms[0].method="post";
                document.forms[0].action="frmShowHistory.jsp?Mode=1";
                document.forms[0].target="_self";
                document.forms[0].submit();
                });   
            
             
	});
        
function RegSearch()
{ 
    $('#dialog-Reg').dialog({ autoOpen: false,height: 550,width: 730, modal: true });
    $('#dialog-Reg').dialog('open');
    return false;

}


function ClosePage()
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