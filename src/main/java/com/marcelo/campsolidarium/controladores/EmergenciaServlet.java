package com.marcelo.campsolidarium.controladores;

import com.marcelo.campsolidarium.entidades.Emergencia;
import com.marcelo.campsolidarium.repositorios.RepositorioEmergencia;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class EmergenciaServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EmergenciaServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EmergenciaServlet at " + request.getContextPath() + "</h1>");
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
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            Emergencia emerg = RepositorioEmergencia.read(codigo);
            RepositorioEmergencia.delete(emerg);
            session.setAttribute("msg", "Emergência excluída com sucesso!");
            response.sendRedirect("EmergenciaServlet");
            return;
        }

        if ("editar".equals(op)) {
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            Emergencia emerg = RepositorioEmergencia.read(codigo);
            session.setAttribute("emergEditar", emerg);
            response.sendRedirect("CadastroDeEmergencias.jsp");
            return;
        }

        session.setAttribute("emergencias", RepositorioEmergencia.readAll());
        response.sendRedirect("Emergencia.jsp");
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        String op = request.getParameter("operacao");
        String local = request.getParameter("local");
        String tipo = request.getParameter("tipo");
        String descricao = request.getParameter("descricao");

        if ("editar".equals(op)) {
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            Emergencia emerg = RepositorioEmergencia.read(codigo);
            emerg.setLocal(local);
            emerg.setTipo(tipo);
            emerg.setDescricao(descricao);
            RepositorioEmergencia.update(emerg);
            session.setAttribute("msg", "Emergência atualizada com sucesso!");
        } else {
            Emergencia emerg = new Emergencia();
            emerg.setLocal(local);
            emerg.setTipo(tipo);
            emerg.setDescricao(descricao);
            RepositorioEmergencia.create(emerg);
            session.setAttribute("msg", "Emergência cadastrada com sucesso!");
        }

        response.sendRedirect("EmergenciaServlet");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
