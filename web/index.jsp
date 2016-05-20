<%-- 
    Document   : index.jsp
    Created on : May 7, 2016, 12:21:00 PM
    Author     : Jose Ortiz Costa
    Description: Access Server Interface By Login
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FlareMediaPlayerServer Admin Access</title>
    </head>
    <body>
        <!Import our Core package >
        <%@ page import="Core.*" %> 
        <%
            FlareMediaPlayerServer mediaplayer = new FlareMediaPlayerServer();
        %>
        <%-- Form interface for the admin authentification --%>
    <h1><center> FlareMediaPlayerServer Admin Site </center></h1>
    <form method="post" action="adminAuth.jsp">
        <center>
            <table border="1" cellpadding="5" cellspacing="2">
                <thead>

                    <tr>
                        <th colspan="2">Server Management</th>
                    </tr>
                </thead>
                <tbody>

                    <tr>
                        <td>Username</td>
                        <td><input type="text" name="admin" required/></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" required/></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" value="Run Server" name="run" />
                            &nbsp;&nbsp;
                            <input type="submit" value="Stop Server" name="stop" />
                        </td>                        
                    </tr>                    
                </tbody>
            </table>
        </center>
    </form>
    <%
        // output the status of the server when login page is loaded
        out.print("<br>");
        if (request.getParameter("status") != null) {
            if (request.getParameter("status").equals("0")) {
                // run server
                out.print("<h3><center><font color='blue'>FlareMediaPlayerServer was succesfully started, and listening on port 6661.</font></center></h3>");
                Runtime.getRuntime().exec("/bin/bash -c exit");
                mediaplayer.runFlareMediaPlayerServer(FlareMediaServerAuthentificator.ADMIN,
                        FlareMediaServerAuthentificator.PASSWORD);
            } else if (request.getParameter("status").equals("2")) {

                out.print("<h3><center><font color='orange'>FlareMediaPlayerServer is stopped.</font></center></h3>");
                Runtime.getRuntime().exec("/bin/bash -c kill -9 6661");
            } else if (request.getParameter("status").equals("1")) {
                out.print("<h3><font color='red'><center>Incorrect Admin or Password.</font></center></h3>");
            }
        }

        if (request.getParameter("status") == null && mediaplayer.isServerRunning(6661)) {
            out.print("<h3><center><font color='blue'>FlareMediaPlayerServer is already running, and listening on port 6661.</font></center></h3>");
        } else if (request.getParameter("status") == null && !mediaplayer.isServerRunning(6661)) {
            out.print("<h3><center><font color='orange'>FlareMediaPlayerServer has not been started yet.</font></center></h3>");
        }

    %>
</body>
</html>
