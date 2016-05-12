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
            FlareMediaPlayerServer mediaplayer = new FlareMediaPlayerServer();
            boolean isServerRunning = mediaplayer.isServerRunning(8000);
            // 0 = running, 1 = Incorrect password, 2 = stopped
            int status = 1;
            String admin = request.getParameter("admin");
            String password = request.getParameter("password");
            if (FlareMediaServerAuthentificator.serverAuthentification(admin, password)) {
                if (request.getParameter("run") != null) // start server button
                {
                    if (!isServerRunning) {
                        // run server
                        mediaplayer.runFlareMediaPlayerServer(admin,
                                password);

                        isServerRunning = mediaplayer.isServerRunning(8000);
                        if (isServerRunning) {
                            status = 0; // running
                        }
                    }
                    else 
                    {
                        
                        status = 0;
                    }

                    
                } else if (request.getParameter("stop") != null) // stop server button
                {
                    // stop server
                    mediaplayer.stopServer(8000);
                    status = 2; // running

                }
            }
            else
            {
                // Server Password was incorrect
                status = 1; // incorrect password
                        
            }
            // redirect to login page
            
            String site = new String("index.jsp?status=" + status);
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);
            

        %>
    </body>
</html>
