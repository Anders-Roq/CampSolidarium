package com.marcelo.campsolidarium.controladores;

import com.marcelo.campsolidarium.entidades.Insumos;
import com.marcelo.campsolidarium.repositorios.RepositorioInsumos;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class InsumosServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InsumosServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InsumosServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        if (session.getAttribute("adminLogado") == null) {
            session.setAttribute("msg", "Você precisa estar logada para acessar essa área.");
            response.sendRedirect("index.jsp");
            return;
        }

        String op = request.getParameter("operacao");

        if ("excluir".equals(op)) {
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            Insumos insumo = RepositorioInsumos.read(codigo);
            RepositorioInsumos.delete(insumo);
            session.setAttribute("msg", "Insumo excluído com sucesso!");
            response.sendRedirect("InsumosServlet");
            return;
        }

        if ("editar".equals(op)) {
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            Insumos insumo = RepositorioInsumos.read(codigo);
            session.setAttribute("insuEditar", insumo);
            response.sendRedirect("CadastroDeInsumos.jsp");
            return;
        }

        session.setAttribute("insumos", RepositorioInsumos.readAll());
        response.sendRedirect("Insumos.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        if (session.getAttribute("adminLogado") == null) {
            session.setAttribute("msg", "Você precisa estar logada para acessar essa área.");
            response.sendRedirect("index.jsp");
            return;
        }

        String op = request.getParameter("operacao");
        String nome = request.getParameter("nome");
        String marca = request.getParameter("marca");
        String categoria = request.getParameter("categoria");

        if ("editar".equals(op)) {
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            Insumos insumo = RepositorioInsumos.read(codigo);
            insumo.setNome(nome);
            insumo.setMarca(marca);
            insumo.setCategoria(categoria);
            RepositorioInsumos.update(insumo);
            session.setAttribute("msg", "Insumo atualizado com sucesso!");
        } else {
            Insumos insumo = new Insumos();
            insumo.setNome(nome);
            insumo.setMarca(marca);
            insumo.setCategoria(categoria);
            RepositorioInsumos.create(insumo);
            session.setAttribute("msg", "Insumo cadastrado com sucesso!");
        }

        response.sendRedirect("InsumosServlet");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
