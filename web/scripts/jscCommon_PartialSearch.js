$().ready(function() {

        function formatItem(row) {
                return row[0] ;
	}
	function formatResult(row) {
                finalVal_formatResult=row[0].split('[REG:]')
		return finalVal_formatResult[0].replace(/(<.+?>)/gi, '');
	}



      $("#hor_name").autocomplete('Auto_HorseNames.jsp', {
		width: 300,
		matchContains: true,
		formatItem: formatItem,
		formatResult: formatResult
	});

         $("#hor_name").result(function(event, data, formatted) {
            var hiddenregno = $("#regno");
            var value = data.toString().split('[REG:]');
             hiddenregno.val(value[1]);

            });

//  FOR OWNER NAME

         function formatItem_1(row1) {
                return row1[0] ;
	}
	function formatResult_1(row1) {
                finalVal_formatResult=row1[0].split('[ID]')
		return finalVal_formatResult[0].replace(/(<.+?>)/gi, '');
	}


        $("#owner").autocomplete('Auto_Persons.jsp', {
		width: 300,
		matchContains: true,
		formatItem: formatItem_1,
		formatResult: formatResult_1
	});

         $("#owner").result(function(event1, data1, formatted1) {
               var hiddenOwnerSeq = $("#OwnerSeq");
                var value1 = data1.toString().split('[ID]');
                hiddenOwnerSeq.val(value1[1]);

           });

});


