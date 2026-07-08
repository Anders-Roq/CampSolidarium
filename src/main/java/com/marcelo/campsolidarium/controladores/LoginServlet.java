package com.marcelo.campsolidarium.controladores;

import com.marcelo.campsolidarium.entidades.Admin;
import com.marcelo.campsolidarium.repositorios.RepositorioAdmin;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String login = request.getParameter("login");
        String senha = request.getParameter("senha");

        Admin admin = RepositorioAdmin.read(login);

        if (admin != null && admin.getSenha().equals(senha)) {
            session.setAttribute("adminLogado", admin);
            session.setAttribute("msg", "Login realizado com sucesso!");
        } else {
            session.setAttribute("msg", "Login ou senha inválidos.");
        }

        response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Servlet responsável pela autenticação do Admin";
    }

}
