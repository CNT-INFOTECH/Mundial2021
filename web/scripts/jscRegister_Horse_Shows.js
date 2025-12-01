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

$().ready(function() {


	function formatItem(row) {
        	return row[0] ;
	}
	function formatResult(row) {
                finalVal=row[0].split('[REG:]')
                return finalVal[0].replace(/(<.+?>)/gi, '');
	}


	$("#ShowHorses").autocomplete('Auto_HorseNames.jsp', {
		width: 500,
                max:20,
		matchContains: true,
		formatItem: formatItem,
		formatResult: formatResult
	});

            $("#ShowHorses").result(function(event, data, formatted) {
            var hiddenSeq = $("#RegNumHidden_Top");
            var RegNum = $("#RegNum_Top");
            var value = data.toString().split('[REG:]');

            hiddenSeq.val(trimRegister(value[1]));
            RegNum.val(trimRegister(value[1]));

            });

      });



function Register_Event_horse(varEventSeq,VarReg)
{

       
       var RegNum =  document.forms[0].RegNum.value

        if(VarReg!='' && VarReg!='undefined')
          RegNum = VarReg

        if(RegNum=='')
        {
            alert('Please select a horse to Register')
            return false
        }
        else
             document.forms[0].RegNum.value=RegNum


        if(varEventSeq=='')
        {
            alert('Please select an event to Register')
            return false
        }
        else
            document.forms[0].EventSeq.value=varEventSeq



PopBreeder=dhtmlmodal.open('EmailBox', 'iframe', 'frmValidate_Seq_RegNum.jsp?RegNum='+RegNum+'&eventSeq='+varEventSeq, 'RIDER', 'width=630px,height=280px,center=1,scrolling=1')

PopBreeder.onclose=function(){

   if(document.forms[0].CheckRider.value == 'Y')
    {
        document.forms[0].method="post";
        document.forms[0].action="frmRegister_Horse_Shows.jsp?mode=3&RegNum="+RegNum+"&eventSeq="+varEventSeq
        document.forms[0].submit();
    }
        
        return true //allow closing of window

}
 
}



function Register_Search_Icon_Horse_Event(varEventSeq,VarReg,varRegNum)
{
            document.forms[0].method="post";
            document.forms[0].action="frmRegister_Horse_Shows.jsp?mode=6&RegNum="+varRegNum+"&EventSeq="+varEventSeq+"&RegSeq="+VarReg
            document.forms[0].submit();
}

function Register_Search_Icon_Rider_Event(varEventSeq,varSeq)
{
   
            document.forms[0].method="post";
            document.forms[0].action="frmRegister_Rider_Shows.jsp?mode=6&EntitySeq="+varSeq+"&EventSeq="+varEventSeq
            document.forms[0].submit();
}


function ListHorses()
{

            document.forms[0].method="post";
            document.forms[0].action="frmRegister_Horse_Shows.jsp?mode=1"
            document.forms[0].submit();

}

function ListYouthRiders()
{

            document.forms[0].method="post";
            document.forms[0].action="frmRegister_Rider_Shows.jsp?mode=1"
            document.forms[0].submit();

}

function ListEvents(RegNum)
{

        document.forms[0].method="post";
        document.forms[0].action="frmRegister_Horse_Shows.jsp?mode=2&RegNum="+RegNum
        document.forms[0].submit();
 }

 function AddNewHorse(varEventSeq)
 {

            document.forms[0].method="post";
            document.forms[0].action="frmRegister_Horse_Shows.jsp?mode=4&EventSeq="+varEventSeq
            document.forms[0].submit();

}

function AddNewYouthRider(varEventSeq)
{

            document.forms[0].method="post";
            document.forms[0].action="frmRegister_Rider_Shows.jsp?mode=2"
            document.forms[0].submit();

}

function AssginHiddenReg()
{

document.forms[0].RegNumHidden_Top.value= document.forms[0].RegNum_Top.value
}

function ResetSearch(varEventSeq)
{
    document.forms[0].RegNumHidden_Top.value='';
    document.forms[0].HorseName.value='';
    document.forms[0].RegNum_Top.value='';
    document.forms[0].HDOB.value='';
    document.forms[0].Owner_Top.value='';
    document.forms[0].Mchip.value='';

            document.forms[0].method="post";
            document.forms[0].action="frmRegister_Horse_Shows.jsp?EventSeq="+varEventSeq
            document.forms[0].submit();
}

function OverRide_Horse(EventSeq,RegNum,RegSeq)
{
            document.forms[0].method="post";
            document.forms[0].action="frmRegister_Horse_Shows.jsp?mode=4&EventSeq="+EventSeq+"&RegNum="+RegNum+"&RegSeq="+RegSeq
            document.forms[0].submit();
}

function fnViewAll_SrchHorse()
{
	
	document.forms[0].method="post";
	document.forms[0].action="frmRegister_Horse_Shows.jsp?mode=1&view=Y"
	document.forms[0].submit();
}







