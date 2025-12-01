
function ExistsDiagCode(ChkValue, searchKey, IDElement, DescElement, FocusElement, hdnIDValue, hdnIDName,
	UserID, dtServiceDate, isPartialSearch)
{    	
    var FrmName=document.forms[0].name

 	var bOk = false;
	if (ChkValue.length > 0 && ChkValue != hdnIDValue)
		bOk = true;
	if(hdnIDName == null)
		hdnIDName ="";
	var strMsg="";

	if(searchKey=='DIAGNOSISCODE_TREATMENT' && FrmName != "frmInterfaceProcess")
	{
	
		if(dtServiceDate == null || dtServiceDate =="")
		{
			if(ChkValue.length >0)
			{
				alert("Please enter the servicedate first");
				if (IDElement != "")
					document.forms[0].elements[parseInt(IDElement)].value = "";
				if(FocusElement != "")
					document.forms[0].elements[parseInt(FocusElement)].focus();
				ChkValue="";
				return;
			}
		}
	}
	else
		dtServiceDate ="";

	if (ChkValue.length == 0)
	{
		strArrName = DescElement.split(',');
		for (var i =0;i<strArrName.length;i++ )
		{
			if(parseInt(strArrName[i]) >= 0)
				document.forms[0].elements[parseInt(strArrName[i])].value = "";
		}
	}

	if (!bOk)
		return;

	http_request = false;
	strIDElement = IDElement;
	strDescElement = DescElement;
	strFocusElement = FocusElement;
	strhdnIDValue = hdnIDValue;
	strhdnIDName = hdnIDName;
    strChkValue = ChkValue;
	strSearchKey=searchKey;
        if (window.XMLHttpRequest)
	{ // Mozilla, Safari,...
            http_request = new XMLHttpRequest();
            if (http_request.overrideMimeType)
            {
                http_request.overrideMimeType('text/xml'); // See note below about this line
            }
	}
	else if (window.ActiveXObject)
	{ // IE
            try
            {
                    http_request = new ActiveXObject("Msxml2.XMLHTTP");
            }
            catch (e)
            {
                try
                {
                        http_request = new ActiveXObject("Microsoft.XMLHTTP");
                }
                catch (e)
                {}
            }
	}
	if (!http_request)
	{
            alert('Giving up :( Cannot create an XMLHTTP instance');
            return false;
	}
        if(isPartialSearch == 'Y')
            http_request.onreadystatechange = alertContents_Part;
        else
            http_request.onreadystatechange = alertContents;

	var url ="servlet/com.techdoc.billing.serValidate?ChkValue="+ChkValue+"&searchKey="+searchKey+"&IDElement="+IDElement+"&DescElement="+DescElement+"&FocusEL="+FocusElement+"&hdnIDName="+hdnIDName+"&UserID="+UserID+"&ServDate="+dtServiceDate

	http_request.open('GET', url, true);
	http_request.send(null);
}
