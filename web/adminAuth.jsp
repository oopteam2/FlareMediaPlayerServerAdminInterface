<%-- 
    Document   : runServer.jsp
    Created on : May 7, 2016, 3:06:55 PM
    Author     : Jose Ortiz Costa
    Description: Authentification Login and run server
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Core.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Validation</title>
    </head>
    <body>
        <%   
            FlareMediaPlayerServer mediaplayer = new FlareMediaPlayerServer ();
            boolean isServerRunning = mediaplayer.isServerRunning(6661);
            // 0 = running, 1 = Incorrect password, 2 = stopped
            int status=0; 
            
            if (request.getParameter("run") != null) // start server button
            {
                if (!isServerRunning)
                {
                   // try to run server
                   mediaplayer.runFlareMediaPlayerServer(request.getParameter("admin"), 
                                                  request.getParameter("password"));
                   isServerRunning  = mediaplayer.isServerRunning(6661);
                   if (isServerRunning) status = 0; // running
                }
                
                if (mediaplayer.getAuthStatus() == false)
                {
                   // Server Password was incorrect
                   // stop server until a correct password is given
                   mediaplayer.stopServer(6661);
                   status=1; // incorrect password
                   out.println("Server stopped: Incorrect Password");
                } 
            }
            
            else // stop server button
            {
                // stop server
                mediaplayer.stopServer(6661);
                status = 2; // running
                
            }
            // redirect to login page
            if (status > 0)
            {
                String site = new String("index.jsp?status=" + status);
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site); 
            }
            
         %>
    </body>
</html>
