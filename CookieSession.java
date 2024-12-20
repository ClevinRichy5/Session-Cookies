/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Mr Richy
 */

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/process")
public class CookieSession extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        // Créer un cookie pour stocker le nom et l'email
        Cookie nameCookie = new Cookie("name", name);
        Cookie emailCookie = new Cookie("email", email);
        
        // Définir la durée de vie du cookie (1 heure)
        nameCookie.setMaxAge(60 * 60);
        emailCookie.setMaxAge(60 * 60);
        
        // Ajouter les cookies à la réponse
        response.addCookie(nameCookie);
        response.addCookie(emailCookie);

        // Gérer la session
        HttpSession session = request.getSession();
        session.setAttribute("name", name);
        session.setAttribute("email", email);

        // Rediriger vers la page de résultats
        response.sendRedirect("result.jsp");
    }
}