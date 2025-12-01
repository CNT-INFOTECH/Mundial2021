function LeftForeLeg_Values(obVal)
       {   
         if(obVal.checked==false)
        {
        obVal.checked=false;
        document.forms[0].LeftForeLeg.value='';
        return false;
        }
             
           
        document.forms[0].CUARTILLA_LEFT_FL.checked=false;
        document.forms[0].NUDILLO_LEFT_FL.checked=false;
        document.forms[0].CALZADO_LEFT_FL.checked=false;
        document.forms[0].PATIBLANCO_LEFT_FL.checked=false;
        document.forms[0].CORONA_LEFT_FL.checked=false;
        
        obVal.checked=true;
        strLeftForeLeg=obVal.name
        var strRepl = strLeftForeLeg.replace("LEFT_FL", "MANO_IZQ","gi");
        document.forms[0].LeftForeLeg.value=strRepl.toUpperCase();
       }
       function RightForeLeg_Values(obVal)
       {    
           if(obVal.checked==false)
        {
        obVal.checked=false;
        document.forms[0].RightForeLeg.value='';
        return false;
        }
            
        document.forms[0].CUARTILLA_RIGHT_FL.checked=false;
        document.forms[0].NUDILLO_RIGHT_FL.checked=false;
        document.forms[0].CALZADO_RIGHT_FL.checked=false;
        document.forms[0].PATIBLANCO_RIGHT_FL.checked=false;
        document.forms[0].CORONA_RIGHT_FL.checked=false;
           
        obVal.checked=true;
        strRightForeLeg=obVal.name
        
		var strRepl = strRightForeLeg.replace("RIGHT_FL", "MANO_DER","gi");
        document.forms[0].RightForeLeg.value=strRepl.toUpperCase();
       }