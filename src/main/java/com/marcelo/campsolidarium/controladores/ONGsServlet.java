package com.marcelo.campsolidarium.controladores;

import com.marcelo.campsolidarium.entidades.ONGs;
import com.marcelo.campsolidarium.repositorios.RepositorioONGs;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ONGsServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ONGsServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ONGsServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String op = request.getParameter("operacao");

        if ("excluir".equals(op)) {
            String login = request.getParameter("login");
            ONGs ong = RepositorioONGs.read(login);
            RepositorioONGs.delete(ong);
            session.setAttribute("msg", "ONG excluída com sucesso!");
            response.sendRedirect("ONGsServlet");
            return;
        }

        if ("editar".equals(op)) {
            String login = request.getParameter("login");
            ONGs ong = RepositorioONGs.read(login);
            session.setAttribute("ongEditar", ong);
            response.sendRedirect("CadastroDeONGs.jsp");
            return;
        }

        session.setAttribute("ongs", RepositorioONGs.readAll());
        response.sendRedirect("ONGs.jsp");
    }


     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String op = request.getParameter("operacao");
        String nome = request.getParameter("nome");
        String login = request.getParameter("login_novo");
        String senha = request.getParameter("senha");

        if ("editar".equals(op)) {
            ONGs ong = RepositorioONGs.read(request.getParameter("login"));
            ong.setNome(nome);
            ong.setLogin(login);
            ong.setSenha(senha);
            RepositorioONGs.update(ong);
            session.setAttribute("msg", "ONG atualizada com sucesso!");
        } else {
            ONGs ong = new ONGs();
            ong.setNome(nome);
            ong.setLogin(login);
            ong.setSenha(senha);
            RepositorioONGs.create(ong);
            session.setAttribute("msg", "ONG cadastrada com sucesso!");
        }

        response.sendRedirect("ONGsServlet");
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
