<%-- 
    Document   : frmReg_CommonRef_Pop_Place
    Created on : Jul 11, 2011, 4:00:18 PM
    Author     : Erzath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">   
        <link href="Tables_style.css" rel="stylesheet" type="text/css" />
        <link href="buttons.css" rel="stylesheet" type="text/css" />
    </head>
    <script>

        function fnSave()
        {
            val_city =document.forms[0].City.value;
            val_state =document.forms[0].State.value;
            val_zip =document.forms[0].Zip.value;
            val_country =document.forms[0].Country.value;
            
            if(val_city=='' || val_state=='' || val_zip=='' || val_country=='')
             {
                    alert('Please enter All the value')
                    return false
             }
             
            parent.PopWin.hide()
        }

        function fnCancel()
        {
            parent.PopWin.hide()
        }
    </script>
    <body>
<%
        String strHeading=request.getParameter("Action");
        String strFldVal=request.getParameter("fldVal");
        String strFldSeq=request.getParameter("fldSeq");
        
        String strAction=request.getParameter("Action");
        String strCity="";
        String strState="";
        String strZip="";
        String strCountry="";
        
%>
        <form>
            <table  width="100%">        
        <tr>
          <td width="41"><font class="label">CITY&nbsp;</font></td>
          <td width="100" nowrap >           
            <input type="text" id="City"  name="City" value=""  onKeyUp="javascript:this.value=this.value.toUpperCase()"  style="background-color:  #FFF8DC; border:  1px solid #000000;">
          </td>
        </tr>
        <tr>
          <td width="41"><font class="label">STATE&nbsp;</font></td>
          <td width="100" nowrap >           
            <input type="text" id="State"  name="State" value="" onKeyUp="javascript:this.value=this.value.toUpperCase()"  style="background-color:  #FFF8DC; border:  1px solid #000000;">
          </td>
        </tr>
        <tr>
          <td width="41"><font class="label">ZIP&nbsp;</font></td>
          <td width="100" nowrap >           
            <input type="text" id="Zip"  name="Zip" value="" onKeyUp="javascript:this.value=this.value.toUpperCase()"  style="background-color:  #FFF8DC; border:  1px solid #000000;">
          </td>
        </tr>
        <tr>
          <td width="41"><font class="label">COUNTRY&nbsp;</font></td>
          <td width="100" nowrap >           
            <input type="text" id="Country"  name="Country" value="" onKeyUp="javascript:this.value=this.value.toUpperCase()"  style="background-color:  #FFF8DC; border:  1px solid #000000;">
          </td>
        </tr>
        <tr>
          <td colspan="2"  align="right">
            <input type="button" class="button" value="<%=strAction%>" name="Save" onClick="fnSave()" />
            <input type="button" class="button" value="Cancel" name="cancel" onClick="fnCancel()" />
          </td>
        </tr>
        <tr>
            <td  colspan="2"  align="right">
          </td>
        </tr><input type="hidden" name="PAGEID" id="PAGEID" value="ADD_CITYSTATEZIP" />
      </table>
      
        </form>
    </body>
</html>
