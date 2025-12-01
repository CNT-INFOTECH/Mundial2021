function calen() {
    
alert(temp);

  if(temp==undefined)
	  temp=document.forms[0]

  var yHeight = "";
  var xWidth = parseInt(xLeft - 200);

  var avilTH = window.screen.availHeight;
  var avilH = parseInt(yTop + 200);

  if(parseInt(avilTH) < parseInt(avilH) ) {
    yHeight = parseInt(yTop - 220);
  }
  else {
    yHeight = parseInt(yTop + 15);
  }

  var Ts_var = "";
  var formlen = temp.elements.length;
  for(var Ti=0; Ti<(parseInt(formlen)); Ti++) {
    var Ts_na=temp.elements[Ti].name;
    if ( Ts_na == "Dt" && Val != "0" ) {
      temp.elements[Ti+1].value = "";
    }
    if ( Ts_na == tName ) {
      Ts_var = Ti;
      if( Val != "0" ) {
        temp.elements[Ti-1].checked = true;
      }
    }
  }