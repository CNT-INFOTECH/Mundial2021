<%-- 
    Document   : frmReg_Top
    Created on : Mar 6, 2013, 1:01:49 PM
    Author     : Erzath
--%>
<table class="altRow" width="100%">
    <tr>
        <td width="30px" style="font-weight:bold;">NAME:</td>
        <td colspan="8" >
          <label  id="Horsename"   style="color: <%=FontColor%>; text-transform: uppercase; font-size: 18px;font-weight:bold;"> <%=strHorse_Name%></label>
          <%--<input type="text" name="Horsename" id="Horsename" value="<%=strHorse_Name%>" style="background-color:  #FFF8DC; border:  1px solid #000000;" ReadOnly>--%>
          <img src="Images/Find12.jpg" onClick='RegSearch()' />
        </td>
        <td align="right" width="5px">
          <label  id="RegType"   style="color: <%=FontColor%>; text-transform: uppercase; font-size: 18px;font-weight:bold;"> <%=RegType%></label>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="font-weight:bold;">REGISTRATION#:</td>
        <td width="180px">
            <label  id="reg_no"  style="color: <%=FontColor%>; text-transform: uppercase; font-size: 18px;font-weight:bold;"> <%=Regno%></label>
          <%--<input type="text" name="reg_no" id="reg_no" value="<%=Regno%>" style="background-color:  #FFF8DC; border:  1px solid #000000;">--%>
          <input type="hidden" name="HdnRegSeq" id="HdnRegSeq" value="<%=REGSEQ%>">
        </td>
        <td style="font-weight:bold;">COLOR:</td>
        <td width="180px">
            <label  id="hor_color"  style="color: <%=FontColor%>;  text-transform: uppercase;font-size: 18px;font-weight:bold;"> <%=strHorse_Color%></label>
          <%--<input type="text" name="hor_color" id="hor_color" value="<%=strHorse_Color%>" style="background-color:  #FFF8DC; border:  1px solid #000000;" ReadOnly>--%>
        </td>
        <td style="font-weight:bold;">DOB:</td>
        <td width="180px">
            <label  id="hor_dob" style="color: <%=FontColor%>; text-transform: uppercase; font-size: 18px;font-weight:bold;"> <%=strHorse_DOB%></label>
         <%-- <input type="text" name="hor_dob" id="hor_dob" value="<%=strHorse_DOB%>" style="background-color:  #FFF8DC; border:  1px solid #000000;" ReadOnly>--%>
        </td>
        <td style="font-weight:bold;">AGE:</td>
        <td width="160px" colspan="2" nowrap>
            <label  id="Horseage" style="color: <%=FontColor%>;text-transform: uppercase;  font-size: 18px;font-weight:bold;"> <%=strhor_age%></label>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="font-weight:bold;">GENDER:</td>
        <td >
            <label  id="Horsegender" style="color: <%=FontColor%>; text-transform: uppercase; font-size: 18px;font-weight:bold;">
                <%
                  if(strhor_gender.equals("MALE"))
                      out.println(male);
                  else  if(strhor_gender.equals("FEMALE"))
                      out.println(female);
                  else  if(strhor_gender.equals("GELDING"))
                      out.println(gelding);
                %></label>
        </td>
        <td style="font-weight:bold;">MODALITY:</td>
        <td>
            <label  id="modality" style="color: <%=FontColor%>; text-transform: uppercase; font-size: 18px;font-weight:bold;"> <%=strhor_aire%></label>
        </td>
        <td style="font-weight:bold;">OWNER:</td>
        <td colspan="4" width="100px"  >
            <label  id="Owner" style="color: <%=FontColor%>; text-transform: uppercase; font-size: 18px;font-weight:bold;">
            <%if(strOwn_Type.equals("INDIVIDUAL") ||strOwn_Type.equals("YOUTH RIDER")||(strOwn_Type.equals("") && strOrg_Name.equals("") ))
                out.println(strOwnerName);
            else
                out.println(strOrg_Name);%></label>
        </td>
    </tr>
    <tr>
        <td style="font-weight:bold;">ORGANIZATION:</td>
        <td colspan="8">
            <label  id="HorseOrg" style="color: <%=FontColor%>; text-transform: uppercase; font-size: 18px;font-weight:bold;"> <%=strorg%></label>
        </td>
        <%
        if(strCOUN>0)
        {
        %>
        <td>
        <img src="Images/Obsev_Loader.gif"  alt="O" align="right" />
        </td>
        <%}else{%>
        <td></td>
        <%}%>
    </tr>
</table>