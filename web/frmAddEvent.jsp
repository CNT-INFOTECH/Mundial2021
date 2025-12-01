<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE> New Document </TITLE>
  <META NAME="Generator" CONTENT="EditPlus">
  <META NAME="Author" CONTENT="">
  <META NAME="Keywords" CONTENT="">
  <META NAME="Description" CONTENT="">

        <link rel="stylesheet" href="Shows_Pop.css">
        <link href="buttons.css" rel="stylesheet" type="text/css" />

        <link rel="stylesheet" href="themes/base/jquery.ui.all.css">

        <script  type="text/javascript" src="jquery-1.5.1.js"></script>
        <script  type="text/javascript" src="external/jquery.bgiframe-2.1.2.js"></script>
        <script  type="text/javascript" src="ui/jquery.ui.core.js"></script>
        <script  type="text/javascript" src="ui/jquery.ui.widget.js"></script>
        <script  type="text/javascript" src="ui/jquery.ui.mouse.js"></script>
        <script  type="text/javascript" src="ui/jquery.ui.button.js"></script>
        <script  type="text/javascript" src="ui/jquery.ui.draggable.js"></script>
        <script  type="text/javascript" src="ui/jquery.ui.position.js"></script>
        <script  type="text/javascript" src="ui/jquery.ui.resizable.js"></script>
        <script  type="text/javascript" src="ui/jquery.ui.dialog.js"></script>
        <script  type="text/javascript" src="ui/jquery.effects.core.js"></script>

        <script  type="text/javascript" src="ui/jquery.ui.datepicker.js"></script>
        <script  type="text/javascript"src="scripts/jscAddEvent.js"></script>
        
        


</HEAD>
<jsp:useBean id="eventBean" class="beans.EventBean" scope="session" />

 <BODY onLoad="CopyShow()">



     <form Name="frmAddEvent">

       <%@ include file="frmAddEvents_Include.jsp"%>


  <table class="altRow">
    <tr>
      <th width="25">ORDER</th>
      <th width="33">DATE</th>
      <th width="33">CATEGORY</th>
      <th width="78">AIRE</th>
      <th width="58">GENDER</th>
      <th width="110" colspan="2">AGE RANGE</th>
      <th>RIDER </th>
      <th>TYPE</th>
    </tr>
    <tr class="altRow1">
      <td width="45">
        <input type="hidden" name="ShowSeqNo" Size="5" 
              value='<% if(eventBean.getShowSeqNo()!=null){ out.println(eventBean.getShowSeqNo().trim()); }%>' >

        <input type="hidden" name="SeqNo" Size="5"
              value='<% if(eventBean.getSeqNo()!=null){ out.println(eventBean.getSeqNo().trim()); }%>' >


        <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;"
               name="EventOrder" Size="5" 
             value='<%=strOrder.trim()%>' onKeyPress="checkIt(event)">
      </td>
      <td width="33">
        <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;" name="Date" id="datepicker"  size="10"
             value='<%=strDate.trim()%>' >
      </td>
      
      <td width="78">
        <Select name="Category" style="background-color:  #FFF8DC; border:  1px solid #000000; width:120px"
                onBlur="eventName(),GetAire(this.value)"
              >
          <% if(eventBean.getCategory()!=null){%>
          <option Selected> <%=eventBean.getCategory()%> </option>
          <% }%>
        <option value="">Select</option>
        <option>PasoFino</option>
        <option>Equitation</option>
        <option>Performance</option>
        <option>Pleasure</option>
        <option>Amateur Owner</option>
        <option>Trocha</option>
        <option>Trocha y galope</option>
        <option>Trote y galope</option>
        <option>Bellas Formas</option>
        <option>Cuerda</option>
        <option>GRUPO DE YEGUAS CON CRIA</option>
        <option>GRUPO DE YEGUAS PARA CRIA</option>
        <option>Geldings</option>
         <option>MEJOR DESCENDENCIA DE UNA YEGUA</option>
		 <option>Mejor Potro o Potranca en Proceso de Adiestramiento</option>
		 <option>Mejor Caballo Castrado</option>
        <option>JEFE DE RAZA</option>
		<option>Paso Trail</option>
		<option>Paso Western Pleasure</option>
		<option>Paso Versatility</option>
		<option>Paso Country Pleasure</option>
		<option>Amateur Owner Performance</option>
		<option>Amateur Owner Pleasure</option>
       
       
        
        </Select>
      </td>

      <td width="33">


         <Select name="Air" style="background-color:  #FFF8DC; border:  1px solid #000000;" 
              >
          <% if(eventBean.getAir()!=null){%>
          <option Selected> <%=eventBean.getAir()%> </option>
          <% }%>

            <option value="">Select</option>
            <option>All</option>
            <option >PasoFino</option>
            <option>Trocha</option>
            <option>Trocha y galope</option>
            <option>Trote y galope</option>

        </Select>


      </td>
      <td width="58">
        <Select name="Gender" style="background-color:  #FFF8DC; border:  1px solid #000000;"   onBlur="eventName()" >
          <% if(eventBean.getGender()!=null){%>
          <option Selected> <%=eventBean.getGender()%> </option>
          <% }%>
          <option>Select</option>
          <option>Male</option>
          <option>Female</option>
          <option>Gelding</option>
        </Select>
      </td>
      <td width="55">
        <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;" name="AgeFrom" Size="2"
             onBlur="eventName()"   onKeyPress="checkIt(event)"
             value='<%=strFromAge.trim()%>'   >
      </td>
      <td width="55">
        <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;" name="AgeTo" size="2"
             onBlur="eventName()"   onKeyPress="checkIt(event)"
             value='<%=strToAge.trim()%>'>
      </td>
      <td>
        <Select name="Rider" style="background-color:  #FFF8DC; border:  1px solid #000000;"   onBlur="eventName()">
          <% if(eventBean.getRider()!=null){%>
          <option Selected> <%=eventBean.getRider()%> </option>
          <% }%>
          <option>Select</option>
          <option>Open/Professional</option>
          <option>Amatuer Owner</option>
          <option>N/A</option>
        </Select>
      </td>
      <td>
        <Select name="EventType" style="background-color:  #FFF8DC; border:  1px solid #000000;width:120px">
          <% if(eventBean.getType()!=null){%>
          <option Selected> <%=eventBean.getType()%> </option>
          <% }%>
          <option>Select</option>
          <option>Regular</option>
          <option>Championship</option>
          <option>Campeon(a) de Campeon(a)es</option>
           <option>Ratificacion FC</option>
          <option>Group</option>
          </Select>
      </td>
    </tr>
    <tr class="altRow1">
        <td width="15" ><font class="label">NAME</font></td>
      <td colspan="8">
        <input type="text"  style="background-color:  #FFF8DC; border:  1px solid #000000;" name="EventName" size="100"
             value='<%=strEventName.trim()%>' >
      </td>
    </tr>
    <tr class="altRow1">
      <td colspan="9">
        <input type="button"  class="button" value="Insert" OnClick="InsertEvent()" >
        <input type="button"  class="button"  value="Close" OnClick="JQueryClose('<%=eventBean.getShowSeqNo()%>')" >
        <input type="button"  class="button"  value="Events list" OnClick="ListEventsTemplate('winPop','400','400','yes',ShowType)">
        <input type="hidden" name="PageID" value="Events">
        <input type="hidden"  name="ShowType">
        <input type="hidden" name="DontChange" value="N" />


      </td>
    </tr>
  </table>

      
</form>
</BODY>
</HTML>
