/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function trimValues(str) {
	str = str.replace(/^\s+/, '');
	for (var i = str.length - 1; i >= 0; i--) {
		if (/\S/.test(str.charAt(i))) {
			str = str.substring(0, i + 1);
			break;
		}
	}
	return str;
        }


   //for horse name 
   function formatItem(row) {      
      var finalVal_formatItem;      
      finalVal_formatItem=row[0].split('[DETAIL]')
      return finalVal_formatItem[0];
   }
   
   function formatResult(row) {
      finalVal=row[0].split('[REG:]')
      return finalVal[0].replace(/(<.+?>)/gi, '');
   }

   function formatItem_1(row1) {
      var finalVal_formatItem;
      finalVal_formatItem=row1[0].split('#@#')
      return finalVal_formatItem[0] ;
   }
   
   function formatResult_1(row1) {
      finalVal_formatResult=row1[0].split('[ID]');
      return finalVal_formatResult[0].replace(/(<.+?>)/gi, '');
   }


$(function() {
   

   $( "#hrsDob" ).datepicker({
         changeMonth: true,
         changeYear: true
   });
        
   $("#hrsName").autocomplete("SM_AutoHrsName.jsp", {      
         width: 500,               
         matchContains: true,
         highlight:false,
         formatItem: formatItem,
         formatResult: formatResult
   });


   $("#hrsName").result(function(event, data, formatted) {       
       var RegNum = $("#regNo");       
       var HrsDob = $("#hrsDob");

       var value = data.toString().split('[REG:]');
       var details=value[1].split("[DETAIL]");
       var splitVal =details[1].split("#@#");
      RegNum.val(trimValues(details[0])); 
      
      $("#regSeq").val(trimValues(splitVal[0]));
      HrsDob.val(trimValues(splitVal[1]));
      $("#hrsColor").val(trimValues(splitVal[2]));
      $("#hrsGender").val(trimValues(splitVal[3]));
      $("#hrsAge").val(trimValues(splitVal[4]));
       
       $("#hrsAge").focus();
         
   });
   
  
   // Person List
   $("#hrsOwner0").autocomplete('SM_AutoOwner.jsp?', {
           width: 300,
           matchContains: true,
           formatItem: formatItem_1,
           formatResult: formatResult_1
   });

   $("#hrsOwner0").result(function(event1, data1, formatted1) {


          var value1 = data1.toString().split('[ID]');
          var value2=value1[1].split('#@#');

            $("#ownEntySeq0").val(trimValues(value2[1]));

     });

}); 
