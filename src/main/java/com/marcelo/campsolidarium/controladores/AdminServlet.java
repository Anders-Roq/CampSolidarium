package com.marcelo.campsolidarium.controladores;

import com.marcelo.campsolidarium.entidades.Admin;
import com.marcelo.campsolidarium.repositorios.RepositorioAdmin;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("CadastroDeAdmin.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String login = request.getParameter("login");
        String senha = request.getParameter("senha");

        if (RepositorioAdmin.read(login) != null) {
            session.setAttribute("msg", "Já existe um admin com esse login.");
            response.sendRedirect("CadastroDeAdmin.jsp");
            return;
        }

        Admin admin = new Admin();
        admin.setLogin(login);
        admin.setSenha(senha);
        RepositorioAdmin.create(admin);

        session.setAttribute("msg", "Admin cadastrado com sucesso! Faça login para continuar.");
        response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Servlet responsável pelo cadastro de administradores";
    }

}
