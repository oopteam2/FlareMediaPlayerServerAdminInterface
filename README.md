# FlareMediaPlayerServerAdminInterface
<h3> 1. Prepare FlareMediaPlayerServer to interface it with this project </h3>
    First of all, make sure that your FlareMediaPlayerServer in netbeans is updated to the last changes. Then, change the working directory to your working directory in run properties.
    Next, clean and build the project. Once the project is cleaned and build, clone the new FlareMediaPlayerServerAdminInterface Project
<h3> 2. Import FlareMediaPlayerServer jar into your new cloned  FlareMediaPlayerServerAdminInterface Project </h3>
    In order to import FlareMediaPlayerServer jar, right click on the folder libraries from FlareMediaPlayerServerAdminInterface, and click on add jar.
    Brownse in your local directory where your FlareMediaPlayerServer is located. Inside of the folder dist, you'll find the FlareMediaPlayerServer
    jar file and a lib folder containing all the jars from the project (jcoded, jcommons .. etc ). Then add the FlareMediaPlayerServer jar
    and the lib folder to your Libraries folder on FlareMediaPlayerServerAdminInterface project. 
<h3> 3. Tomcat Configuration </h3>
    You may or may not need to have tomcat. In my case, netbeans already ran a tomcat instance automatically from my tomcat installtion when I run the project.
    If you are using mac, you may or may not need to run MAMP before runing the project.
<h3> 3. Run the project </h3>
    After running the project on the index.jsp page, you'll see in your brownser our admin login page for our server and a message informing
    if the server is already running. If the server is not running enter the admin username and password, and run the server, if the page freezes then the server is running
    then you can refresh the page and see the mensage of the server running. The page will be freezed becuase once the server run, it keeps running.
