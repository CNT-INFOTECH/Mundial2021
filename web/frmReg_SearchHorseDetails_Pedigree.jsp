<%@page import="javax.sql.rowset.RowSetProvider"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
<%@page import="javax.sql.rowset.RowSetFactory"%>
<%

try{

    String strSire="";
    String strSireSeq="";
    String strDam="";
    String strDamSeq="";
    String strSire_Name="";
    String strDam_Name="";
    String strSireAño="";
    String strDamAño="";

    String strSire_1="";
    String strSireSeq_1="";
    String strSireAño_1="";
    String strDam_1="";
    String strDamSeq_1="";
    String strDamAño_1="";
    String strSire_Name_1="";
    String strDam_Name_1="";

    String strSire_1_2="";
    String strSireSeq_1_2="";
    String strSireAño_1_2="";
    String strDam_1_2="";
    String strDamSeq_1_2="";
    String strDamAño_1_2="";
    String strSire_Name_1_2="";
    String strDam_Name_1_2="";

    String strSire_2_1="";
    String strSireSeq_2_1="";
    String strSireAño_2_1="";
    String strDam_2_1="";
    String strDamSeq_2_1="";
    String strDamAño_2_1="";
    String strSire_Name_2_1="";
    String strDam_Name_2_1="";

    String strSire_2_2="";
    String strSireSeq_2_2="";
    String strSireAño_2_2="";
    String strDam_2_2="";
    String strDamSeq_2_2="";
    String strDamAño_2_2="";
    String strSire_Name_2_2="";
    String strDam_Name_2_2="";

    String strSire_2_3="";
    String strSireSeq_2_3="";
    String strSireAño_2_3="";
    String strDam_2_3="";
    String strDamSeq_2_3="";
    String strDamAño_2_3="";
    String strSire_Name_2_3="";
    String strDam_Name_2_3="";

    String strSire_2_4="";
    String strSireSeq_2_4="";
    String strSireAño_2_4="";
    String strDam_2_4="";
    String strDamSeq_2_4="";
    String strDamAño_2_4="";
    String strSire_Name_2_4="";
    String strDam_Name_2_4="";

    String str_reggno="";
    String strRegSeq="";
    String strRegNum="";
    //String strHorseName="";
    String strGender="";
    String strDOB="";
    String strColor="";
    String strModality="";
    String strAño="";
    String strAge="";
    String strOwnerName="";
    String  strPrimaryName="";
    String strSecondaryName="";

    String age_Months="";
    String age_Days="";

    //if(request.getParameter("Seq")!=null)
        //str_reggno=request.getParameter("Seq");
RowSetFactory factory28 = RowSetProvider.newFactory();
   CachedRowSet crsGetPedigreeDetails= factory28.createCachedRowSet();
           // CachedRowSetImpl crsGetPedigreeDetails = new CachedRowSetImpl();

            //GeneralServlet gen=new GeneralServlet();\

            
            if(strHdnRegSeq!=null)
            crsGetPedigreeDetails = gen.GetPedigree(strHdnRegSeq);

            if(crsGetPedigreeDetails.next())
            {
                if(crsGetPedigreeDetails.getString("SIRE")!=null)
                    strSire=crsGetPedigreeDetails.getString("SIRE").trim();

                if(crsGetPedigreeDetails.getString("SIRESEQ")!=null)
                    strSireSeq=crsGetPedigreeDetails.getString("SIRESEQ").trim();


                if(crsGetPedigreeDetails.getString("Sire_Name")!=null)
                    strSire_Name=crsGetPedigreeDetails.getString("Sire_Name").trim();

                if(crsGetPedigreeDetails.getString("DAM")!=null)
                    strDam=crsGetPedigreeDetails.getString("DAM").trim();

                if(crsGetPedigreeDetails.getString("DAMSEQ")!=null)
                    strDamSeq=crsGetPedigreeDetails.getString("DAMSEQ").trim();

                if(crsGetPedigreeDetails.getString("Dam_name")!=null)
                    strDam_Name=crsGetPedigreeDetails.getString("Dam_name").trim();

                if(crsGetPedigreeDetails.getString("REGSEQ")!=null)
                    strRegSeq=crsGetPedigreeDetails.getString("REGSEQ").trim();

                if(crsGetPedigreeDetails.getString("REGISTRATION_NUM")!=null)
                    strRegNum=crsGetPedigreeDetails.getString("REGISTRATION_NUM").trim();


//                if(crsGetPedigreeDetails.getString("HORSENAME")!=null)
  //                  strHorseName=crsGetPedigreeDetails.getString("HORSENAME").trim();

				if(crsGetPedigreeDetails.getString("HORSE_PRIMARYNAME")!=null)
				strPrimaryName=crsGetPedigreeDetails.getString("HORSE_PRIMARYNAME").trim();


				if(crsGetPedigreeDetails.getString("HORSE_SECONDARYNAME")!=null)
				strSecondaryName=crsGetPedigreeDetails.getString("HORSE_SECONDARYNAME").trim();

				strHorseName=strPrimaryName+' '+strSecondaryName;



                if(crsGetPedigreeDetails.getString("HORSE_GENDER")!=null)
                    strGender=crsGetPedigreeDetails.getString("HORSE_GENDER").trim();




                //if(crsGetPedigreeDetails.getString("HORSE_DOB")!=null)
                  //  strDOB=crsGetPedigreeDetails.getString("HORSE_DOB").trim();

                if(crsGetPedigreeDetails.getString("DOB")!=null)
                    strDOB=crsGetPedigreeDetails.getString("DOB").trim();

                //if(crsGetPedigreeDetails.getString("HORSE_COLOR")!=null)
                  //  strColor=crsGetPedigreeDetails.getString("HORSE_COLOR").trim();

                if(crsGetPedigreeDetails.getString("COLOR")!=null)
                    strColor=crsGetPedigreeDetails.getString("COLOR").trim();

                //if(crsGetPedigreeDetails.getString("HORSE_AIRE")!=null)
                  //  strModality=crsGetPedigreeDetails.getString("HORSE_AIRE").trim();

                if(crsGetPedigreeDetails.getString("MODALITY")!=null)
                    strModality=crsGetPedigreeDetails.getString("MODALITY").trim();


                if(crsGetPedigreeDetails.getString("AñO")!=null)
                    strAño=crsGetPedigreeDetails.getString("AñO").trim();


                if(crsGetPedigreeDetails.getString("MONTH")!=null)
                    age_Months= crsGetPedigreeDetails.getString("MONTH").trim()+"M";
                else
                    age_Months="";

                if(crsGetPedigreeDetails.getString("DAYS")!=null)
                    age_Days= crsGetPedigreeDetails.getString("DAYS").trim()+"D";
                else
                    age_Days="";

                strAge=age_Months+' '+age_Days;

                if(crsGetPedigreeDetails.getString("OwnerName")!=null)
                    strOwnerName=crsGetPedigreeDetails.getString("OwnerName").trim();

            }


            //1st generation sire
            crsGetPedigreeDetails = gen.GetPedigree(strSireSeq);

            if(crsGetPedigreeDetails.next())
            {
                if(crsGetPedigreeDetails.getString("SIRE")!=null)
                    strSire_1=crsGetPedigreeDetails.getString("SIRE").trim();

                if(crsGetPedigreeDetails.getString("SIRESEQ")!=null)
                    strSireSeq_1=crsGetPedigreeDetails.getString("SIRESEQ").trim();

                if(crsGetPedigreeDetails.getString("Sire_Name")!=null)
                    strSire_Name_1=crsGetPedigreeDetails.getString("Sire_Name").trim();

                if(crsGetPedigreeDetails.getString("DAM")!=null)
                    strDam_1=crsGetPedigreeDetails.getString("DAM").trim();

                if(crsGetPedigreeDetails.getString("DAMSEQ")!=null)
                    strDamSeq_1=crsGetPedigreeDetails.getString("DAMSEQ").trim();

                if(crsGetPedigreeDetails.getString("Dam_name")!=null)
                    strDam_Name_1=crsGetPedigreeDetails.getString("Dam_name").trim();


            }


            //1st generation dam
            crsGetPedigreeDetails = gen.GetPedigree(strDamSeq);

            if(crsGetPedigreeDetails.next())
            {
                if(crsGetPedigreeDetails.getString("SIRE")!=null)
                    strSire_1_2=crsGetPedigreeDetails.getString("SIRE").trim();

                if(crsGetPedigreeDetails.getString("SIRESEQ")!=null)
                    strSireSeq_1_2=crsGetPedigreeDetails.getString("SIRESEQ").trim();

                if(crsGetPedigreeDetails.getString("Sire_Name")!=null)
                    strSire_Name_1_2=crsGetPedigreeDetails.getString("Sire_Name").trim();

                if(crsGetPedigreeDetails.getString("DAM")!=null)
                    strDam_1_2=crsGetPedigreeDetails.getString("DAM").trim();

                if(crsGetPedigreeDetails.getString("DAMSEQ")!=null)
                    strDamSeq_1_2=crsGetPedigreeDetails.getString("DAMSEQ").trim();

                if(crsGetPedigreeDetails.getString("Dam_name")!=null)
                    strDam_Name_1_2=crsGetPedigreeDetails.getString("Dam_name").trim();
            }



            //2nd generation 1
            crsGetPedigreeDetails = gen.GetPedigree(strSireSeq_1);

            if(crsGetPedigreeDetails.next())
            {
                if(crsGetPedigreeDetails.getString("SIRE")!=null)
                    strSire_2_1=crsGetPedigreeDetails.getString("SIRE").trim();

                if(crsGetPedigreeDetails.getString("SIRESEQ")!=null)
                    strSireSeq_2_1=crsGetPedigreeDetails.getString("SIRESEQ").trim();


                if(crsGetPedigreeDetails.getString("Sire_Name")!=null)
                    strSire_Name_2_1=crsGetPedigreeDetails.getString("Sire_Name").trim();

                if(crsGetPedigreeDetails.getString("DAM")!=null)
                    strDam_2_1=crsGetPedigreeDetails.getString("DAM").trim();

                if(crsGetPedigreeDetails.getString("DAMSEQ")!=null)
                    strDamSeq_2_1=crsGetPedigreeDetails.getString("DAMSEQ").trim();

                if(crsGetPedigreeDetails.getString("Dam_name")!=null)
                    strDam_Name_2_1=crsGetPedigreeDetails.getString("Dam_name").trim();

            }

            //2nd generation 2
            crsGetPedigreeDetails = gen.GetPedigree(strDamSeq_1);

            if(crsGetPedigreeDetails.next())
            {
                if(crsGetPedigreeDetails.getString("SIRE")!=null)
                    strSire_2_2=crsGetPedigreeDetails.getString("SIRE").trim();

                if(crsGetPedigreeDetails.getString("SIRESEQ")!=null)
                    strSireSeq_2_2=crsGetPedigreeDetails.getString("SIRESEQ").trim();


                if(crsGetPedigreeDetails.getString("Sire_Name")!=null)
                    strSire_Name_2_2=crsGetPedigreeDetails.getString("Sire_Name").trim();

                if(crsGetPedigreeDetails.getString("DAM")!=null)
                    strDam_2_2=crsGetPedigreeDetails.getString("DAM").trim();

                if(crsGetPedigreeDetails.getString("DAMSEQ")!=null)
                    strDamSeq_2_2=crsGetPedigreeDetails.getString("DAMSEQ").trim();

                if(crsGetPedigreeDetails.getString("Dam_name")!=null)
                    strDam_Name_2_2=crsGetPedigreeDetails.getString("Dam_name").trim();

            }

            //2nd generation 3
            crsGetPedigreeDetails = gen.GetPedigree(strSireSeq_1_2);

            if(crsGetPedigreeDetails.next())
            {
                if(crsGetPedigreeDetails.getString("SIRE")!=null)
                    strSire_2_3=crsGetPedigreeDetails.getString("SIRE").trim();

                if(crsGetPedigreeDetails.getString("SIRESEQ")!=null)
                    strSireSeq_2_3=crsGetPedigreeDetails.getString("SIRESEQ").trim();

                if(crsGetPedigreeDetails.getString("Sire_Name")!=null)
                    strSire_Name_2_3=crsGetPedigreeDetails.getString("Sire_Name").trim();

                if(crsGetPedigreeDetails.getString("DAM")!=null)
                    strDam_2_3=crsGetPedigreeDetails.getString("DAM").trim();

                if(crsGetPedigreeDetails.getString("DAMSEQ")!=null)
                    strDamSeq_2_3=crsGetPedigreeDetails.getString("DAMSEQ").trim();

                if(crsGetPedigreeDetails.getString("Dam_name")!=null)
                    strDam_Name_2_3=crsGetPedigreeDetails.getString("Dam_name").trim();


            }

            //2nd generation 4
            crsGetPedigreeDetails = gen.GetPedigree(strDamSeq_1_2);

            if(crsGetPedigreeDetails.next())
            {
                if(crsGetPedigreeDetails.getString("SIRE")!=null)
                    strSire_2_4=crsGetPedigreeDetails.getString("SIRE").trim();

                if(crsGetPedigreeDetails.getString("SIRESEQ")!=null)
                    strSireSeq_2_4=crsGetPedigreeDetails.getString("SIRESEQ").trim();

                if(crsGetPedigreeDetails.getString("Sire_Name")!=null)
                    strSire_Name_2_4=crsGetPedigreeDetails.getString("Sire_Name").trim();

                if(crsGetPedigreeDetails.getString("DAM")!=null)
                    strDam_2_4=crsGetPedigreeDetails.getString("DAM").trim();

                if(crsGetPedigreeDetails.getString("DAMSEQ")!=null)
                    strDamSeq_2_4=crsGetPedigreeDetails.getString("DAMSEQ").trim();


                if(crsGetPedigreeDetails.getString("Dam_name")!=null)
                    strDam_Name_2_4=crsGetPedigreeDetails.getString("Dam_name").trim();

            }

%>

        <table  width="100%" class="altRow_Pedigree">
            <tr>
               <td width="25%" >
                    &nbsp;
                </td>
                <td width="25%">
                    &nbsp;
                </td>
                <td width="25%">
                    &nbsp;
                </td>
                <td class="bottom" width="25%" ><!-- 3rd generation---sire sire sire-->
                    Sire:
                    <!--<a href="frmPedigreeDetails.jsp?Seq=<%=strSire_2_1%>"><input type="text" name="Sire_Name_2_1" size="25" value='<%=strSire_Name_2_1%>'Readonly ></a>-->
                    <%--<font color="#000000"  style="font-weight:bold;"><a href="frmPedigreeDetails.jsp?Seq=<%=strSire_2_1%>"><%=strSire_Name_2_1%></a></font>--%>
                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a   href="frmReg_SearchHorseDetails.jsp?sch=y&rseq=<%=strSireSeq_2_1%>" > <%=strSire_Name_2_1%></a></font>


                </td>
            </tr>

<!-- *****************************************************11111111111111111111111111 -->
            <tr>
                <td >
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="bottom right" width="200px"><!--2nd generation----sire sire -->
                    Sire:
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strSire_1%>"><input type="text" name="Sire_Name_1" size="20"  value='<%=strSire_Name_1%>'Readonly ></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a   href="frmReg_SearchHorseDetails.jsp?sch=y&rseq=<%=strSireSeq_1%>" > <%=strSire_Name_1%></a></font>

                </td>
                <td width="200px">
                    <!--#Aso <input type="text" name="Aso_Sire_2_1" size="5" >-->
                    #Reg
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strSire_2_1%>"><input type="text" name="Sire_2_1" id="Sire_2_1"  onblur="returnHor_Name()" value='<%=strSire_2_1%>'Readonly size="10" ></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a   href="frmReg_SearchHorseDetails.jsp?sch=y&rseq=<%=strSireSeq_2_1%>" > <%=strSire_2_1%></a></font>
                </td>
            </tr>
<!-- ******************************************************22222222222222222222 -->
            <tr>
               <td >
                    &nbsp;
                </td>
                <td class="right">
                    &nbsp;
                </td>
                <td class="right" width="200px">
                     <!--#Aso <input type="text" name="Aso_Sire_1" size="5" >-->
                    #Reg
                    <%---<a href="frmPedigreeDetails.jsp?Seq=<%=strSire_1%>"><input type="text" name="Sire_1" id="Sire_1" onblur="returnHor_Name()" value='<%=strSire_1%>'Readonly size="10" ></a>&nbsp;--%>
                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a   href="frmReg_SearchHorseDetails.jsp?sch=y&rseq=<%=strSireSeq_1%>" > <%=strSire_1%></a></font>


                </td>
                <td class="bottom" width="200px"><!-- 3rd generation---sire sire dam-->
                    Dam:
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strDam_2_1%>"><input type="text" name="Dam_Name_2_1" size="25"  value='<%=strDam_Name_2_1%>'Readonly ></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a   href="frmReg_SearchHorseDetails.jsp?sch=y&rseq=<%=strDamSeq_2_1%>" > <%=strDam_Name_2_1%></a></font>
                </td>
            </tr>
<!-- *****************************1st generation*************************3333333333333333331 -->
            <tr>
               <td >
                    &nbsp;
                </td>
                <td class="bottom right" width="200px">
                    Sire:

                    <%--<font color="#000000" style="font-weight:bold;"><a   href="frmPedigreeDetails.jsp?Seq=<%=strSire%>" > <%=strSire_Name%></a></font>--%>
                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a   href="frmReg_SearchHorseDetails.jsp?sch=y&rseq=<%=strSireSeq%>" > <%=strSire_Name%></a></font>


                </td>
                <td>
                    &nbsp;
                </td>
                <td width="200px">
                     <!--#Aso <input type="text" name="Aso_Dam_2_1" size="5" >-->
                     #Reg

                     <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strDam_2_1%>" ><input type="text" name="Dam_2_1" id="Dam_2_1" onblur="returnHor_Name()"  Readonly value='<%=strDam_2_1%>' size="10" ></a>--%>
                     <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a   href="frmReg_SearchHorseDetails.jsp?sch=y&rseq=<%=strDamSeq_2_1%>" > <%=strDam_2_1%></a></font>
                </td>
            </tr>

<!-- ******************************************************44444444444444444444444444 -->
            <tr>
               <td class="right">
                    &nbsp;
                </td>
                <td class="right" width="200px">
                     <!--#Aso <input type="text" name="Aso_Sire" size="5" >-->
                     #Reg

                     <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strSire%>"><input type="text" name="Sire" id="Sire" onblur="regSearch_Sire()" value='<%=strSire%>' Readonly size="10" ></a>>&nbsp;--%>

                     <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a   href="frmReg_SearchHorseDetails.jsp?sch=y&rseq=<%=strSireSeq%>" > <%=strSire%></a></font>
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="bottom" width="200px"><!-- 3rd generation sire dam sire -->
                    Sire:

                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strSire_2_2%>"><input type="text" name="Sire_Name_2_2"  size="25" value='<%=strSire_Name_2_2%>'Readonly ></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a   href="frmReg_SearchHorseDetails.jsp?sch=y&rseq=<%=strSireSeq_2_2%>" > <%=strSire_Name_2_2%></a></font>
                </td>
            </tr>
<!-- ******************************************************55555555555555555 -->
            <tr>
               <td class="right">
                    &nbsp;
                </td>
                <td class="right">
                    &nbsp;
                </td>
                <td class="bottom right" width="200px"><!-- 2nd generation sire dam -->
                    Dam:
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strDam_1%>"><input type="text" name="Dam_Name_1" size="20" value='<%=strDam_Name_1%>'Readonly ></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a   href="frmReg_SearchHorseDetails.jsp?sch=y&rseq=<%=strDamSeq_1%>" > <%=strDam_Name_1%></a></font>

                </td>
                <td width="200px">
                     <!--#Aso <input type="text" name="Aso_Sire_2_2" size="5" >-->
                    #Reg
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strSire_2_2%>"><input type="text" name="Sire_2_2" id="Sire_2_2" onblur="returnHor_Name()" value='<%=strSire_2_2%>'Readonly size="10" ></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a   href="frmReg_SearchHorseDetails.jsp?sch=y&rseq=<%=strSireSeq_2_2%>" > <%=strSire_2_2%></a></font>

                </td>
            </tr>
<!-- ******************************************************666666666666 -->
            <tr>
                <td class="right">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="right" width="200px">
                     <!--#Aso <input type="text" name="Aso_Dam_1" size="5" >-->
                    #Reg
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strDam_1%>"><input type="text" name="Dam_1" id="Dam_1" onblur="returnHor_Name()" value='<%=strDam_1%>'Readonly size="10" ></a>&nbsp;--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a   href="frmReg_SearchHorseDetails.jsp?sch=y&rseq=<%=strDamSeq_1%>" > <%=strDam_1%></a></font>

                </td>
                <td class="bottom" width="200px"><!-- 3rd generatin sire dam dam -->
                    Dam:
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strDam_2_2%>"><input type="text" name="Dam_Name_2_2" size="25"  value='<%=strDam_Name_2_2%>'Readonly ></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a   href="frmReg_SearchHorseDetails.jsp?sch=y&rseq=<%=strDamSeq_2_2%>" > <%=strDam_Name_2_2%></a></font>

                </td>
            </tr>
<!-- ******************************************************7777777777777 -->
            <tr>
               <td class="bottom right">
                    <label  id="horseName"  style="text-transform: uppercase; font-size: 15px;font-weight:normal;"><%=strHorseName%></label>
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td width="200px">
                     <!--#Aso <input type="text" name="Aso_Dam_2_2" size="5" >-->
                    #Reg
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strDam_2_2%>"><input type="text" name="Dam_2_2"  id="Dam_2_2" onblur="returnHor_Name()" value='<%=strDam_2_2%>'Readonly size="10" ></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a   href="frmReg_SearchHorseDetails.jsp?sch=y&rseq=<%=strDamSeq_2_2%>" > <%=strDam_2_2%></a></font>
                </td>
            </tr>
<!-- ******************************************************888 -->
            <tr>
               <td class="right" >
                   &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="bottom" width="200px"><!-- 3rd generation dam sire sire -->
                    Sire:

                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strSire_2_3%>"><input type="text" name="Sire_Name_2_3" size="25" value='<%=strSire_Name_2_3%>'Readonly ></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a   href="frmReg_SearchHorseDetails.jsp?sch=y&rseq=<%=strSireSeq_2_3%>" > <%=strSire_Name_2_3%></a></font>
                </td>
            </tr>
<!-- ******************************************************9999 -->
            <tr>
                <td class="right" >
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="bottom right" width="200px"><!-- 2nd generation dam sire -->
                    Sire:
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strSire_1_2%>"><input type="text" name="Sire_Name_1_2" size="20" value='<%=strSire_Name_1_2%>'Readonly ></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a   href="frmReg_SearchHorseDetails.jsp?sch=y&rseq=<%=strSireSeq_1_2%>" > <%=strSire_Name_1_2%></a></font>
                </td>
                <td width="150px">
                    <!-- #Aso <input type="text" name="Aso_Sire_2_3" size="5" >-->
                    #Reg
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strSire_2_3%>"><input type="text" name="Sire_2_3"  id="Sire_2_3" onblur="returnHor_Name()" value='<%=strSire_2_3%>' Readonly size="10" ></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a   href="frmReg_SearchHorseDetails.jsp?sch=y&rseq=<%=strSireSeq_2_3%>" > <%=strSire_2_3%></a></font>
                </td>
            </tr>

<!-- ******************************************************10 -->
            <tr>
               <td class="right" >
                    &nbsp;
                </td>
                <td class="right">
                    &nbsp;
                </td>
                <td class="right">
                    <!-- #Aso <input type="text" name="Aso_Sire_1_2" size="5" >-->
                    #Reg
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strSire_1_2%>"><input type="text" name="Sire_1_2" id="Sire_1_2" onblur="returnHor_Name()" value='<%=strSire_1_2%>' Readonly size="10" ></a>&nbsp;--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a   href="frmReg_SearchHorseDetails.jsp?sch=y&rseq=<%=strSireSeq_1_2%>" > <%=strSire_1_2%></a></font>

                </td>
                <td class="bottom" width="200px"><!-- 3rd generation dam sire dam -->

                    Dam:

                   <%-- <a href="frmPedigreeDetails.jsp?Seq=<%=strDam_2_3%>"><input type="text" name="Dam_Name_2_3" size="25" value='<%=strDam_Name_2_3%>'Readonly ></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a   href="frmReg_SearchHorseDetails.jsp?sch=y&rseq=<%=strDamSeq_2_3%>" > <%=strDam_Name_2_3%></a></font>
                </td>
            </tr>
<!-- ******************************************************11 -->
            <tr>
                <td class="right" >
                    &nbsp;
                </td>
                <td class="bottom right" width="200px"><!-- 1st generation dam -->

                    Dam:
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strDam%>"><input type="text" name="Dam_Name" size="20" value='<%=strDam_Name%>' Readonly ></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a   href="frmReg_SearchHorseDetails.jsp?sch=y&rseq=<%=strDamSeq%>" > <%=strDam_Name%></a></font>
                </td>
                <td>
                    &nbsp;
                </td>
                <td width="200px">
                    <!-- #Aso <input type="text" name="Aso_Dam_2_3" size="5" >-->
                    #Reg

                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strDam_2_3%>"><input type="text" name="Dam_2_3" id="Dam_2_3" onblur="returnHor_Name()" value='<%=strDam_2_3%>' Readonly size="10" ></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a   href="frmReg_SearchHorseDetails.jsp?sch=y&rseq=<%=strDamSeq_2_3%>" > <%=strDam_2_3%></a></font>

                </td>
            </tr>
<!-- ******************************************************12 -->
            <tr>
               <td>
                    &nbsp;
                </td>
                <td class="right" width="200px">
                     <!--#Aso <input type="text" name="Aso_Dam" size="5" >-->
                    #Reg
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strDam%>"><input type="text" name="Dam"  id="Dam" onblur="regSearch_Dam()" value='<%=strDam%>' size="10" Readonly ></a>&nbsp;--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a   href="frmReg_SearchHorseDetails.jsp?sch=y&rseq=<%=strDamSeq%>" > <%=strDam%></a></font>

                </td>
                <td>
                    &nbsp;
                </td>
                <td class="bottom" width="200px"><!-- 3rd generation  dam dam sire -->
                    Sire:
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strSire_2_4%>"><input type="text" name="Sire_Name_2_4" size="25" value='<%=strSire_Name_2_4%>'  Readonly></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a   href="frmReg_SearchHorseDetails.jsp?sch=y&rseq=<%=strSireSeq_2_4%>" > <%=strSire_Name_2_4%></a></font>
                </td>
            </tr>
<!-- ******************************************************13 -->
            <tr>
                <td>
                    &nbsp;
                </td>
                <td class="right">
                    &nbsp;
                </td>
                <td class="bottom right" width="200px"><!-- 2nd generation dam dam  -->
                    Dam:
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strDam_1_2%>"><input type="text" name="Dam_Name_1_2" size="20" value='<%=strDam_Name_1_2%>'  Readonly></a>&nbsp;--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a   href="frmReg_SearchHorseDetails.jsp?sch=y&rseq=<%=strDamSeq_1_2%>" > <%=strDam_Name_1_2%></a></font>
                </td>
                <td width="200px">
                     <!--#Aso <input type="text" name="Aso_Sire_2_4" size="5" >-->
                    #Reg
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strSire_2_4%>"><input type="text" name="Sire_2_4" id="Sire_2_4" onblur="returnHor_Name()" value='<%=strSire_2_4%>'Readonly size="10" ></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a   href="frmReg_SearchHorseDetails.jsp?sch=y&rseq=<%=strSireSeq_2_4%>" > <%=strSire_2_4%></a></font>
                </td>
            </tr>
<!-- ******************************************************14 -->
            <tr>
               <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="right" width="200px">
                    <!-- #Aso <input type="text" name="Aso_Dam_1_2" size="5" >-->
                    #Reg
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strDam_1_2%>"><input type="text" name="Dam_1_2" id="Dam_1_2" onblur="returnHor_Name()" value='<%=strDam_1_2%>'Readonly size="10" ></a>&nbsp;--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a   href="frmReg_SearchHorseDetails.jsp?sch=y&rseq=<%=strDamSeq_1_2%>" > <%=strDam_1_2%></a></font>

                </td>
                <td class="bottom" width="200px"><!-- 3rd generation  dam dam dam -->
                    Dam:
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strDam_2_4%>"><input type="text" name="Dam_Name_2_4" size="25"  value='<%=strDam_Name_2_4%>' Readonly ></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a   href="frmReg_SearchHorseDetails.jsp?sch=y&rseq=<%=strDamSeq_2_4%>" > <%=strDam_Name_2_4%></a></font>

                </td>
            </tr>
    <!-- ******************************************************14 -->
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td >
                     &nbsp;
                </td>
                <td width="200px">
                   <!--#Aso <input type="text" name="Aso_Dam_2_4" size="5" >-->
                    #Reg
                    <%--<a href="frmPedigreeDetails.jsp?Seq=<%=strDam_2_4%>"><input type="text" name="Dam_2_4" id="Dam_2_4" onblur="returnHor_Name()" value='<%=strDam_2_4%>'Readonly size="10" ></a>--%>

                    <font color="#000000" style="font-weight:bold;text-transform:uppercase;"><a   href="frmReg_SearchHorseDetails.jsp?sch=y&rseq=<%=strDamSeq_2_4%>" > <%=strDam_2_4%></a></font>
                </td>
            </tr>            
        </table>

<%
          }
            catch (Exception e) {
            System.err.println("Got an exception! ");
            System.err.println("++frmReg_SearchHorseDetails_Pedigree.jsp+++"+e);
        }
%>