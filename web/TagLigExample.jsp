<%@ taglib uri="/WEB-INF/tlds/displaytag.tld" prefix="display"%>

  <link href="Tables_style.css" rel="stylesheet" type="text/css" />
 <%@ page import = "org.displaytag.sample.*" %>
 <%@ page import = "java.util.*" %>


 
  <%




    List testData = new ArrayList();
    Map map1 = new TreeMap();
    for (int i=0;i<200;i++)
    {
         map1 = new TreeMap();
        map1.put("id",i);
        map1.put("name","Bill");
        map1.put("email","Gates");
        map1.put("status","Gates");

        testData.add(map1);
    }

    

    session.setAttribute( "test", testData);
%>


  <display:table  id="gradient-style" name="sessionScope.test" pagesize="10" defaultsort="1" defaultorder="descending" >
    <display:column property="id" title="ID" sortable="true" headerClass="sortable"  />
    <display:column property="name" />
    <display:column property="email" />
    <display:column property="status" />
  </display:table>


