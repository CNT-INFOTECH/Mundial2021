<%-- 
    Document   : frmGetHorseDetails
    Created on : Jun 29, 2011, 1:16:27 PM
    Author     : veera
--%>


<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>

<html>
<head></head>
<script type="text/javascript">


</script>
    <%@ page import="java.util.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.rowset.*" %>
    <%@ page import="pasotracker.DBConnection" %>
    <%@ page import="pasotracker.GeneralServlet" %>
<body>

    <form>

        <div id="maincontent_Breeder">
       
        <div class="innertube">
    <%

    List BreederList = new ArrayList();
     try
        {

            GeneralServlet gen=new GeneralServlet();
 RowSetFactory factory2 = RowSetProvider.newFactory();
   CachedRowSet crs= factory2.createCachedRowSet();
          //  CachedRowSetImpl crs = new CachedRowSetImpl();

            crs = gen.GET_OwnerInformation(strBreederName, strBreederLName, null, strPhone);

            Map MpHorseDetails = new TreeMap();

            while (crs.next())
            {
                strBreederName="";
                strFirstName="";
                strLastName="";
                strMiddleName="";
                strAddress="";
                strAddress1="";
                strAddress2="";
                strPhone="";
                city="";
                state="";
                zip="";
                country="";


                if(crs.getString("FIRSTNAME")!=null)
                    strFirstName= crs.getString("FIRSTNAME").trim();
                else
                    strFirstName="";

                if(crs.getString("LASTNAME")!=null)
                    strLastName= crs.getString("LASTNAME").trim();
                else
                    strLastName="";

                if(crs.getString("SUFFIX")!=null)
                    strMiddleName= crs.getString("SUFFIX").trim();
                else
                    strMiddleName="";


                if(crs.getString("ADDRESS1")!=null)
                    strAddress1= crs.getString("ADDRESS1").trim();
               else
                    strAddress2="";

                if(crs.getString("ADDRESS2")!=null)
                    strAddress2= crs.getString("ADDRESS2").trim();
                else
                    strAddress2="";

                if(crs.getString("CITY")!=null)
                    city= crs.getString("CITY").trim();

                if(crs.getString("STATE")!=null)
                    state= crs.getString("STATE").trim();

                if(crs.getString("ZIP")!=null)
                    zip= crs.getString("ZIP").trim();

                if(crs.getString("COUNTRY")!=null)
                    country= crs.getString("COUNTRY").trim();

                if(crs.getString("PHONE")!=null)
                    strPhone= crs.getString("PHONE").trim();


                strBreederName=strFirstName+" "+strMiddleName+" "+strLastName;
                strAddress =strAddress1+" "+strAddress2+" "+city+" "+state+" "+zip+" "+country;


               /* if(strAddress.equals(", , , , , "))
                             strAddress="";
                 */
                    MpHorseDetails = new TreeMap();


                    MpHorseDetails.put("BREEDERNAME",strBreederName);

                    MpHorseDetails.put("ADDRESS",strAddress);

                    MpHorseDetails.put("PHONE",strPhone);

                   ///Added By Veera for Null Values//////////////

                    if(!strBreederName.trim().equals("") ||!strAddress.trim().equals("") || !strPhone.trim().equals("") )
                        BreederList.add(MpHorseDetails);

                    //////END

                        //BreederList.add(MpHorseDetails);

            }
        }
        catch(Exception ex)
        {
                ex.printStackTrace();

        }

        request.setAttribute("BreederList", BreederList);
%>


<display:table  id="Details" name="requestScope.BreederList"
                        pagesize="100" defaultsort="2" defaultorder="ascending"
                        class="grid"
                        style="border-color:Black;border-width:0px;border-style:None;width:100%;border-collapse:collapse;">

        <display:column style="width:1%" headerClass="Grid_Header">
        <input type="radio" name="checkedVal" onclick="returnBreederValue('${Details.BREEDERNAME}','${Details.ENTITYSEQ}')" /></display:column>
        <display:column style="width:25%;Height:30px;"   title="BREEDER NAME" property="BREEDERNAME" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:25%"  property="ADDRESS" sortable="true" headerClass="Grid_Header" />
        <display:column style="width:10%" property="PHONE"  sortable="true" headerClass="Grid_Header" />

        </display:table>
</div>
</div>
    </form>
</body>
</html>

