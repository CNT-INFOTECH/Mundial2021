<%-- 
    Document   : frmAwardsList
    Created on : Jul 6, 2011, 11:29:10 AM
    Author     : CNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PASO TRACKER</title>

<link href="Shows_Pop.css" rel="stylesheet" type="text/css" />
<link href="Tables_style.css" rel="stylesheet" type="text/css" />
<link href="buttons.css" rel="stylesheet" type="text/css" />

    </head>
    <body>
        <form name="frmAwardsList">
            
     <table class="grid" width="100%" style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">
     <%
       boolean bColor=true;
      ArrayList AlList = new ArrayList();
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
      AlList.add("Mejor dueño montados Caballos / Best A/O Rider Colts and Stallions");
      AlList.add("Mejor dueño montados Yeguas / Best A/O Rider Fillies and Mares");
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

    for (int i=0; i <AlList.size(); i++)
        {
        if(bColor){  bColor=false;%>
        <tr class="odd">
        <%} else {  bColor=true; %>
        <tr class="even">
        <%}%>
         <td>
             <%=AlList.get(i)%>;
         </td>

         <td>
             <input type="checkbox" name="ChkAwards" value="<%=AlList.get(i)%>">
         </td>

         <td>
            &nbsp;
         </td>
     </tr>

     <%}%>
 </table>
</form>
    </body>
</html>
