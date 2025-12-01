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
    $(function() {

//		$.ajaxSetup({ cache:false });

  $( "#dob" ).datepicker({
            changeMonth: true,
            changeYear: true
        });
 //for horse name 
	function formatItem(row) {
        	return row[0];
	}
	function formatResult(row) {		
                finalVal=row[0].split('[REG:]')
                return finalVal[0].replace(/(<.+?>)/gi, '');
	}


	$("#hor_name").autocomplete('Auto_HorseNames.jsp', {
		width: 500,
//startsWith: true,
		matchContains: true,
			highlight:false,
		formatItem: formatItem,
		formatResult: formatResult
	});

            $("#hor_name").result(function(event, data, formatted) {

            var hiddenSeq = $("#RegSeqHidden");
            var RegNum = $("#regno");
            var value = data.toString().split('[REG:]');

            hiddenSeq.val(trimRegister(value[1]));
            RegNum.val(trimRegister(value[1]));

            });
//for owner name
         function formatItem_1(row1) {
                return row1[0];
	}
	function formatResult_1(row1) {
                finalVal_formatResult=row1[0].split('[ID]');
		return finalVal_formatResult[0].replace(/(<.+?>)/gi, '');
	}
         //frmAutoOwnerBreederNameList
        $("#Org_Name").autocomplete('Auto_Persons.jsp', {
		cache:false,
		width: 300,
		matchContains: true,
		formatItem: formatItem_1,
		formatResult: formatResult_1
	});

         $("#Org_Name").result(function(event1, data1, formatted1) {
               var hiddenOwnerSeq = $("#Owner_No");
                var value1 = data1.toString().split('[ID]');
                hiddenOwnerSeq.val(value1[1]);

           });
           //for City state zip country details
         function formatItem_2(row1) {             
                return row1[0];
	}
	function formatResult_2(row1) {
                finalVal_formatResult=row1[0].split('[ST:]')                
		return finalVal_formatResult[0].replace(/(<.+?>)/gi, '');
	}


        $("#CITY").autocomplete('frmReg_CityList.jsp', {
		width: 340,
		matchContains: true,
		formatItem: formatItem_2,
		formatResult: formatResult_2
	});

         $("#CITY").result(function(event1, data1, formatted1) {
               var varPhone=$("#PHONE");
               var varPhoneB=$("#Phone");
               var varState = $("#STATE");
               var varZip = $("#ZIP");
               var varCountry = $("#COUNTRY");
                var value1 = data1.toString().split('[COUNTRY:]');
                var value2 = value1[0].toString().split('[ZIP:]');
                //var value2_1 = value2[1].toString().split(',');
                var value3 = value2[0].toString().split('[ST:]');                
                             
                varCountry.val(trimRegister(value1[1]));
                varZip.val(trimRegister(value2[1]));
                varState.val(trimRegister(value3[1]));
                if(document.forms[0].name=='frmReg_BreederAddPopup')
                    varPhoneB.focus();
                else
                    varPhone.focus();
           });
        
        //for sire & dam  horse name 	


	$("#MALE").autocomplete('Auto_Reg_Sire.jsp', {
		width: 500,
		matchContains: true,
		formatItem: formatItem,
		formatResult: formatResult
	});

            $("#MALE").result(function(event, data, formatted) {
            var hiddenSeq = $("#RegSeqHidden");
            var RegNum = $("#regno");
            var value = data.toString().split('[REG:]');

            hiddenSeq.val(trimRegister(value[1]));
            RegNum.val(trimRegister(value[1]));

            });
            //for dam horse name 
	$("#FEMALE").autocomplete('Auto_Reg_Dam.jsp', {
		width: 500,
		matchContains: true,
		formatItem: formatItem,
		formatResult: formatResult
	});

            $("#FEMALE").result(function(event, data, formatted) {
            var hiddenSeq = $("#RegSeqHidden");
            var RegNum = $("#regno");
            var value = data.toString().split('[REG:]');

            hiddenSeq.val(trimRegister(value[1]));
            RegNum.val(trimRegister(value[1]));

            });
            
        $("#Name").autocomplete('frmAuto_Member.jsp', {
		width: 300,
		matchContains: true,
		formatItem: formatItem_1,
		formatResult: formatResult_1
	});

         $("#Name").result(function(event1, data1, formatted1) {
               var hiddenOwnerSeq1 = $("#MemberNum");
                var value1 = data1.toString().split('[ID]');
                hiddenOwnerSeq1.val(trimRegister(value1[1]));

           });
});  



