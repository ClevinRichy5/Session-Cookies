<%-- 
    Document   : result
    Created on : 20 déc. 2024, 19:08:05
    Author     : Mr Richy
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.Cookie" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <title>Résultats</title>
</head>
<body>
<h1>Informations de l'Utilisateur</h1>

<%
    // Récupérer la session
    HttpSession Session = request.getSession(false);
    String name = (session != null) ? (String) session.getAttribute("name") : "Inconnu";
    String email = (session != null) ? (String) session.getAttribute("email") : "Inconnu";

    // Afficher les informations de la session
%>

<div>
    <p>Nom (Session) : <%= name %></p>
    <p>Email (Session) : <%= email %></p>
</div>

<hr>

<%
    // Récupérer et afficher les cookies
    Cookie[] cookies = request.getCookies();
    String nameFromCookie = "";
    String emailFromCookie = "";

    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("name".equals(cookie.getName())) {
                nameFromCookie = cookie.getValue();
            } else if ("email".equals(cookie.getName())) {
                emailFromCookie = cookie.getValue();
            }
        }
    }
%>

<div>
    <p>Nom (Cookie) : <%= nameFromCookie %></p>
    <p>Email (Cookie) : <%= emailFromCookie %></p>
</div>

<a href="index.jsp">Retourner au formulaire</a>
</body>
</html>