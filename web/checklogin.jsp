<%
            String username = "";
            if (request.getParameter("user")!=null)
                username=request.getParameter("user");
            String password="";
            if (request.getParameter("pass")!=null)
                password=request.getParameter("pass");

               
          
             

            // Here you put the check on the username and password
            if (username.trim().equals("pasotracker") && password.trim().equals("Jc@2312")) {
                session.setAttribute( "correctusername", username );
           
                response.sendRedirect("index.jsp");
            }
            
            

           else
               {
                response.sendRedirect("invalidlogin.jsp");
           }


          

%>