<%-- 
    Document   : adminpanel
    Created on : Nov 25, 2024, 5:58:38 PM
    Author     : Chani
--%>
<%@page import="abc_cinema.db.connection.ConnectionDB"%>
<% ConnectionDB db = new ConnectionDB();%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
    </head>
    <body>
        <header>
            <!-- Placeholder for reusable header -->
        </header>
        
        <h1>Hello World!</h1>
        <%= db.getCon() %>
        <footer>
            <!-- Placeholder for reusable footer -->
        </footer>
        
        <div id="scripts-container">
        <!-- Placeholder for reusable scripts -->
        </div>
        <script src="../main/loadComponents.js" defer></script>
    </body>
</html>
