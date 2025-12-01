<%-- 
    Document   : ModalPop_Show
    Created on : May 17, 2011, 11:23:10 PM
    Author     : raju
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <link href="Shows.css" rel="stylesheet" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body backgroun>

  <div align="center">
    <table width="65%" border="0" align="center" class="tableWTBorder" bordercolor="#FFFFFF">
      <tr  valign="middle">
        <td width="35%">NAME</td>
        <td width="65%">
          <input type="text" name="TxtLastName"  maxlength="35"  size="35"   >
        </td>
      </tr>
      <tr  valign="middle">
        <td width="35%">PLACE</td>
        <td width="65%">
          <input type="text" name="TxtPatientMRN"  maxlength="35"  class="BillTextBox" size="35"  )" >
        </td>
      </tr>
      <tr  valign="middle">
        <td width="35%">DATE</td>
        <td width="65%">
          <input type="text" name="TxtPatientSSN"  maxlength="20" size="35"  >
        </td>
      </tr>

    </table>
    <table width="65%" border="0" align="center" class="tableWTBorder">
      <tr >
        <td class="TDWTBorder" width="93%">
          <div align="center">
            <input type="submit" value="Search" name="search" >
          </div>
        </td>
      </tr>
    </table>
    </body>
</html>
