function LeftHindLeg_Values(obVal)
       {    
           
        if(obVal.checked==false)
        {
        obVal.checked=false;
        document.forms[0].LeftHindLeg.value='';
        return false;
        }
        
        document.forms[0].CUARTILLA_LEFT_HL.checked=false;
        document.forms[0].NUDILLO_LEFT_HL.checked=false;
        document.forms[0].CALZADO_LEFT_HL.checked=false;
        document.forms[0].PATIBLANCO_LEFT_HL.checked=false;
        document.forms[0].CORONA_LEFT_HL.checked=false;

        obVal.checked=true;
        strLeftHindLeg=obVal.name
		
		var strRepl = strLeftHindLeg.replace("LEFT_HL", "PATA_IZQ","gi");
        document.forms[0].LeftHindLeg.value=strRepl.toUpperCase();
       }
       function RightHindLeg_Values(obVal)
       {    
        
        if(obVal.checked==false)
        {
        obVal.checked=false;
        document.forms[0].RightHindLeg.value='';
        return false;
        }
        
        document.forms[0].CUARTILLA_RIGHT_HL.checked=false;
        document.forms[0].NUDILLO_RIGHT_HL.checked=false;
        document.forms[0].CALZADO_RIGHT_HL.checked=false;
        document.forms[0].PATIBLANCO_RIGHT_HL.checked=false;
        document.forms[0].CORONA_RIGHT_HL.checked=false;

        obVal.checked=true;
        strRightHindLeg=obVal.name
        
		var strRepl = strRightHindLeg.replace("RIGHT_HL", "PATA_DER","gi");

		document.forms[0].RightHindLeg.value=strRepl.toUpperCase();
       }