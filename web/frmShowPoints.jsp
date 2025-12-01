<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>

<html>
<head>
<title>PASO TRACKER</title>
 <link rel="stylesheet" href="themes/base/jquery.ui.all.css"/>
<link href="Shows.css" rel="stylesheet" type="text/css" />
 <link href="Tables_style.css" rel="stylesheet" type="text/css" />
 <link href="buttons.css" rel="stylesheet" type="text/css" />

 <link href="style.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript" src="jquery-1.5.1.js"></script>
	<script type="text/javascript" src="external/jquery.bgiframe-2.1.2.js"></script>





	<script type="text/javascript" src="ui/jquery.ui.core.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.widget.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.mouse.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.button.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.draggable.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.position.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.resizable.js"></script>
	<script type="text/javascript" src="ui/jquery.ui.dialog.js"></script>
	<script type="text/javascript" src="ui/jquery.effects.core.js"></script>
         <script type="text/javascript" src="ui/jquery.ui.autocomplete.js"></script>
         <script type="text/javascript" src="ui/jquery.ui.accordion.js"></script>
         <script type="text/javascript" src="ui/jquery.ui.datepicker.js"></script>
         <script type="text/javascript" src="js/interface.js"></script>
         <script type="text/javascript" src="scripts/jscShows_Points.js"></script>


<!-- <script type="text/javascript" src="AutoComplete/jquery.js"></script> -->
<script type='text/javascript' src='AutoComplete/jquery.autocomplete.js'></script>
<link rel="stylesheet" type="text/css" href="AutoComplete/jquery.autocomplete.css" />







<script type="text/javascript">

/*$(function() {
		 $('#dock').Fisheye(
				{
					maxWidth: 50,
					items: 'a',
					itemsText: 'span',
					container: '.dock-container',
					itemWidth: 40,
					proximity: 90,
					halign : 'center'
				}
			);
	});*/


$(function() {
		$( "#accordion" ).accordion({
			collapsible: true,
                         autoHeight: false
		});
	});
$(function(){


	function formatItem(row) {
                 finalVal_formatItem=row[0].split('#@#')
		 return finalVal_formatItem[0] ;
	}
	function formatResult(row) {
                finalVal_formatResult=row[0].split('#@#')
		return finalVal_formatResult[0].replace(/(<.+?>)/gi, '');
	}
        
        $("#Shows").autocomplete('Auto_ShowsList.jsp', {
		width: 200,
		matchContains: true,
		formatItem: formatItem,
		formatResult: formatResult
	});

         $("#Shows").result(function(event, data, formatted) {
            var hiddenShowSeq = $("#ShowSeq");
            var value = data.toString().split('#@#');
            hiddenShowSeq.val(value[1]);

            });

});


</script>

</head>
<%
String strCategory="";
String strShowSeq="";
String strShowName="";

String strReset="N";
strReset=request.getParameter("HdnReset");


if(request.getParameter("HdnReset")!=null && strReset.equals("N"))
{
    if(request.getParameter("Category")!=null)
        strCategory=request.getParameter("Category");
     if(request.getParameter("ShowSeq")!=null)
        strShowSeq=request.getParameter("ShowSeq");
    if(request.getParameter("Shows")!=null)
        strShowName=request.getParameter("Shows");
   
}
 String[] _strCategory=strCategory.split(";");
%>
<body>
 <form name="frmShow">
<div id="container">

            <div id="header">
            <%@ include file="frmHeader.jsp"%>
            </div>
		<%
		if(!bShows)
		response.sendRedirect("login.jsp");
		%>
 <div id="content">

      <div id="MenuHeader">
      <ul id="primary">
		<li><a href="frmYearlyPoints.jsp">YEARLY</a></li>
		<li><span>SHOWS</span></li>
		<li><a href="frmEquiPoints.jsp">EQUITATION</a></li>

	</ul>
      </div>

     

 <fieldset>
      <table width="655" >
        <tr>
          <td width="97"><font class="label">SHOWS</font></td>
          <td width="372">
            <input type="hidden" id="ShowSeq" name="ShowSeq"  value="<%=strShowSeq%>" />
              <input size="16px" id='Shows' name="Shows"  value="<%=strShowName%>" style=" background:
                     #FFF8DC url(Images/magnifier.png) no-repeat 1px 1px; border: 1px solid #000000;
            height: 16px;
            padding-left: 18px;
            width: 280px !important;" onBlur="EmptyKey(ShowSeq,Shows)"/>
             <img alt="" src="Images/Find.gif" onClick="Search_Shows('ShowSeq','Shows')"/>
            </td>
		  <td width="170">&nbsp;</td>
        </tr>
        <tr>
          <td width="97"><font class="label">CATEGORY</font> </td>
          <td width="372" >
            <input type="text" name="Category"  value="<%=strCategory%>" size="72" style="background-color:  #FFF8DC; border:  1px solid #000000;"/>
         </td>
          <td width="170" nowrap><img alt="" src="Images/Find.gif" onClick="SelCategories()"/></td>
          </tr>
          <tr>
		  <td width="97">&nbsp;</td>
		  <td width="372">&nbsp;</td>
          <td width="170" > <font class="label">
            <input class='button' type="button" name="Search" value="Search" onClick="fnSearch_Shows()"/>
            <input class='button' type="Reset" name="Reset" value="Reset" onClick="fnReset_Shows()"/>
             <input size=1 type="hidden" name="HdnReset" value="N"/>
            </font>
            </td>
          <td>
           <input class='button' type="button" name="Report" value="Report" onClick="Points_Summary()"/>
             <input size=1 type="hidden" name="PageID" value="POINTS"/>
             </td>
        </tr>
      </table>

  </fieldset>
 <%

 HashMap HmDetails=new HashMap();
   HmDetails.put("Best Breeder/ Mejor Criador(Paso Fino)","1");
   HmDetails.put("Best Breeder/ Mejor Criador(Trocha)","2");
   HmDetails.put("Best Breeder/ Mejor Criador(Trocha y Galope)","3");
   HmDetails.put("Best Breeder/ Mejor Criador(Trote y Galope)","4");
   HmDetails.put("Best Owner/ Mejor Expositor","5");

   HmDetails.put("Best Rider/ Mejor Montador","6");
   HmDetails.put("Mejor Padrote / Best Sire","7");
   HmDetails.put("Mejor Yegua Madre / Best Dam","8");
   HmDetails.put("Potrillos/ Yearling Colts 13 - 18 months, halter","9");
   HmDetails.put("Potrillas/ Yearling Fillies 13 - 18 months, halter","10");

   HmDetails.put("Potrillos/ Yearling Colts 19 - 24 months, halter","11");
   HmDetails.put("Potrillas/ Yearling Fillies 19 - 24 months, halter","12");
   HmDetails.put("Potrancas y Yeguas / Fillies and Mares - Bellas Formas","13");
   HmDetails.put("Potros y Caballos / Colts and Stallions - Bellas Formas)","14");
   HmDetails.put("Potrancas de Paso Fino de 28 a 36 meses / Paso Fino Fillies 28 - 36 months","15");

   HmDetails.put("Potros de Paso Fino de 28 a 36 meses / Paso Fino Colts 28 - 36 months","16");
   HmDetails.put("Potrancas de Paso Fino de 37 a 48 meses / Paso Fino Fillies 37 - 48 months","17");
   HmDetails.put("Potrancas de Placer de 28 a 59 meses / Pleasure Fillies 28 - 59 months","18");
   HmDetails.put("Potrancas de Performance de 28 a 59 meses / Performance Fillies 28 - 59 months","19");
   HmDetails.put("Potros de Placer de 28 a 59 meses / Pleasure Colts 28 - 59 months","20");

   HmDetails.put("Potros de Performance de 28 a 59 meses  / Performance Colts 28 - 59 months","21");
   HmDetails.put("Potros de Paso Fino de 37 a 48 meses / Paso Fino Colts 37 - 48 months","22");
   HmDetails.put("Potrancas de Paso Fino de 49 a 59 meses / Paso Fino Fillies 49 - 59 months","23");
   HmDetails.put("Potros de Paso Fino de 49 a 59 meses / Paso Fino Colts 49 - 59 months","24");
   HmDetails.put("Yeguas de Paso Fino de 60 a 72 meses / Paso Fino Mares 60 - 72 months","25");

   HmDetails.put("Caballos de Paso Fino de 60 a 72 meses / Paso Fino Stallions 60 - 72 months","26");
   HmDetails.put("Yeguas de Paso Fino de 73 a 90 meses / Paso Fino Mares 73 - 90 months","27");
   HmDetails.put("Caballos de Paso Fino de 73 a 90 meses / Paso Fino Stallions 73 - 90 months","28");
   HmDetails.put("Yeguas de Paso Fino de 91 meses en adelante - Paso Fino Mares 91+ months","29");
   HmDetails.put("Caballos de Paso Fino de 91 meses en adelante - Paso Fino Stallions 91+ months","30");


   HmDetails.put("Potros y Caballos Castrados de Paso Fino  - Paso Fino Geldings ","31");
   HmDetails.put("Potros y Caballos de Trocha - Trocha Colts and Stallions","32");
   HmDetails.put("Potrancas y Yeguas de Trocha - Trocha Fillies and Mares","33");
   HmDetails.put("Potros y Caballos de Trote y Galope - Trote y Galope Colts and Stallions","34");
   HmDetails.put("Potrancas y Yeguas de Trote y Galope - Trote y Galope Fillies and Mares","35");

   HmDetails.put("Potros y Caballos de Paso Fino montados por su dueño - Paso Fino Colts and Stallions Amateur Owners","36");
   HmDetails.put("Potrancas y Yeguas de Paso Fino montadas por su dueño - Paso Fino Fillies and Mares Amateur Owners","37");
   HmDetails.put("Mejor dueño montados Caballos - Best A/O Rider Male","38");
   HmDetails.put("Mejor dueño montados Yeguas - Best A/O Rider FeMale","39");
   HmDetails.put("Yeguas de Condiciones Generales (Performance) mayores de 60 meses - Performance Mares 60 + months","40");

   HmDetails.put("Caballos de Condiciones Generales (Performance) mayores de 60 meses - Performance Stallions 60 + months","41");
   HmDetails.put("Yeguas de Placer mayores de 60 meses - Pleasure Mares 60 + months","42");
   HmDetails.put("Caballos de Placer mayores de 60 meses - Pleasure Stallions 60 + months","43");
   HmDetails.put("Potrancas y Yeguas de Trocha y Galope - Trocha y Galope Fillies and Mares","44");
   HmDetails.put("Potros y Caballo de Trocha y Galope - Trocha y Galope Colts and Stallions","45");

   HmDetails.put("Lote de Yeguas para cría - Group of Mares for Breeding","46");
   HmDetails.put("Lote de Yeguas con cría - Mares with Offspring","47");
   HmDetails.put("Campeona de Campeonas para Yeguas Fuera de Concurso - Champion of Champions for Fuera de Concurso Mares","48");
   HmDetails.put("Campeón de Campeones para Caballos Fuera de Concurso - Champion of Champions for Fuera de Concurso Stallions","49");
   HmDetails.put("Jefe de Raza","50");
   HmDetails.put("Best Mare/Mejor Descendencies de una yegua","51");


    ArrayList AlList = new ArrayList();

     if (request.getParameter("Category")!=null && strCategory.length() >0)
      {
             for(int i=0; i<_strCategory.length;i++)
             {
                 AlList.add(_strCategory[i]);
             }
      }
    else
        {
     AlList.add("Best Breeder/ Mejor Criador(Paso Fino)");
    AlList.add("Best Breeder/ Mejor Criador(Trocha)");
    AlList.add("Best Breeder/ Mejor Criador(Trocha y Galope)");
    AlList.add("Best Breeder/ Mejor Criador(Trote y Galope)");
    AlList.add("Best Owner/ Mejor Expositor");

    AlList.add("Best Rider/ Mejor Montador");
    AlList.add("Mejor Padrote / Best Sire");
    AlList.add("Mejor Yegua Madre / Best Dam");
    AlList.add("Potrillos/ Yearling Colts 13 - 18 months, halter");
    AlList.add("Potrillas/ Yearling Fillies 13 - 18 months, halter");

    AlList.add("Potrillos/ Yearling Colts 19 - 24 months, halter");
    AlList.add("Potrillas/ Yearling Fillies 19 - 24 months, halter");
    AlList.add("Potrancas y Yeguas / Fillies and Mares - Bellas Formas");
    AlList.add("Potros y Caballos / Colts and Stallions - Bellas Formas)");
    AlList.add("Potrancas de Paso Fino de 28 a 36 meses / Paso Fino Fillies 28 - 36 months");

    AlList.add("Potros de Paso Fino de 28 a 36 meses / Paso Fino Colts 28 - 36 months");
    AlList.add("Potrancas de Paso Fino de 37 a 48 meses / Paso Fino Fillies 37 - 48 months");
    AlList.add("Potrancas de Placer de 28 a 59 meses / Pleasure Fillies 28 - 59 months");
    AlList.add("Potrancas de Performance de 28 a 59 meses / Performance Fillies 28 - 59 months");
    AlList.add("Potros de Placer de 28 a 59 meses / Pleasure Colts 28 - 59 months");

    AlList.add("Potros de Performance de 28 a 59 meses  / Performance Colts 28 - 59 months");
    AlList.add("Potros de Paso Fino de 37 a 48 meses / Paso Fino Colts 37 - 48 months");
    AlList.add("Potrancas de Paso Fino de 49 a 59 meses / Paso Fino Fillies 49 - 59 months");
    AlList.add("Potros de Paso Fino de 49 a 59 meses / Paso Fino Colts 49 - 59 months");
    AlList.add("Yeguas de Paso Fino de 60 a 72 meses / Paso Fino Mares 60 - 72 months");

    AlList.add("Caballos de Paso Fino de 60 a 72 meses / Paso Fino Stallions 60 - 72 months");
    AlList.add("Yeguas de Paso Fino de 73 a 90 meses / Paso Fino Mares 73 - 90 months");
    AlList.add("Caballos de Paso Fino de 73 a 90 meses / Paso Fino Stallions 73 - 90 months");
    AlList.add("Yeguas de Paso Fino de 91 meses en adelante - Paso Fino Mares 91+ months");
    AlList.add("Caballos de Paso Fino de 91 meses en adelante - Paso Fino Stallions 91+ months");


    AlList.add("Potros y Caballos Castrados de Paso Fino  - Paso Fino Geldings ");
    AlList.add("Potros y Caballos de Trocha - Trocha Colts and Stallions");
    AlList.add("Potrancas y Yeguas de Trocha - Trocha Fillies and Mares");
    AlList.add("Potros y Caballos de Trote y Galope - Trote y Galope Colts and Stallions");
    AlList.add("Potrancas y Yeguas de Trote y Galope - Trote y Galope Fillies and Mares");

    AlList.add("Potros y Caballos de Paso Fino montados por su dueño - Paso Fino Colts and Stallions Amateur Owners");
    AlList.add("Potrancas y Yeguas de Paso Fino montadas por su dueño - Paso Fino Fillies and Mares Amateur Owners");
    AlList.add("Mejor dueño montados Caballos - Best A/O Rider Male");
    AlList.add("Mejor dueño montados Yeguas - Best A/O Rider FeMale");
    AlList.add("Yeguas de Condiciones Generales (Performance) mayores de 60 meses - Performance Mares 60 + months");

    AlList.add("Caballos de Condiciones Generales (Performance) mayores de 60 meses - Performance Stallions 60 + months");
    AlList.add("Yeguas de Placer mayores de 60 meses - Pleasure Mares 60 + months");
    AlList.add("Caballos de Placer mayores de 60 meses - Pleasure Stallions 60 + months");
    AlList.add("Potrancas y Yeguas de Trocha y Galope - Trocha y Galope Fillies and Mares");
    AlList.add("Potros y Caballo de Trocha y Galope - Trocha y Galope Colts and Stallions");

    AlList.add("Lote de Yeguas para cría - Group of Mares for Breeding");
    AlList.add("Lote de Yeguas con cría - Mares with Offspring");
    AlList.add("Campeona de Campeonas para Yeguas Fuera de Concurso - Champion of Champions for Fuera de Concurso Mares");
    AlList.add("Campeón de Campeones para Caballos Fuera de Concurso - Champion of Champions for Fuera de Concurso Stallions");
    AlList.add("Jefe de Raza");
    AlList.add("Best Mare/Mejor Descendencies de una yegua");
}

 %>
<div id="accordion" >
  <%
  for (int i=0; i< AlList.size(); i++)
     {%>
	<h3 ><a href="#" onClick="getPoints('<%=HmDetails.get(""+AlList.get(i))%>','','','',ShowSeq.value,'<%=AlList.get(i)%>')" ><b><%=HmDetails.get(""+AlList.get(i))%></b> &nbsp;<%=AlList.get(i)%></a></h3>

    <div style="background:url('Images/trans-wood-1.png')" >

    <div id="<%=HmDetails.get(""+AlList.get(i))%>" >

    </div>
    </div>
   <%}%>

 </div> <!-- accordion End -->
 
			</div> <!-- Content End -->


<div id="sidebar">
<%@ include file="Shows_ListHorses_Side.jsp"%>

</div>



</div>  <!-- Container -->

<div id="dialog_Categories" title="Awards" style="display:none; background:url('Images/trans-wood-1.png')">
<iframe  id="modalIFrame_Categories" width="100%" height="520"
          marginwidth="0" marginheight="0" frameborder="0" >
</iframe>


<input class='button' type="button" name="Search" value="Accept" onClick="Accept_Multiple_Awards()"/>
<input class='button' type="button" name="PopClose" value="Close" onClick="Close_Multiple_Awards()"/>

</div>

<div id="dialog-Show" style="display:none; background:url('Images/trans-wood-1.png')">
<iframe  src="blank.jsp"  id="modalIFrame_ShowList" width="100%" height="100%" marginwidth="0" marginheight="0"
         frameborder="0"  >
</iframe>
</div>

 <div id="dialog_Points" title="Awards"    style="display:none; background:url('Images/trans-wood-1.png');">
<iframe   src="blank.jsp" id="modalIFrame_Points" width="100%"  height="100%"
          marginwidth="0" marginheight="0" frameborder="0" >
</iframe>
</div>

</form>



</body>
</html>