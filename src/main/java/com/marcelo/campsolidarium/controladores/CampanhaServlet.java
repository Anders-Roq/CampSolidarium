package com.marcelo.campsolidarium.controladores;

import com.marcelo.campsolidarium.entidades.Campanha;
import com.marcelo.campsolidarium.entidades.Emergencia;
import com.marcelo.campsolidarium.entidades.Insumos;
import com.marcelo.campsolidarium.entidades.ONGs;
import com.marcelo.campsolidarium.repositorios.RepositorioCampanha;
import com.marcelo.campsolidarium.repositorios.RepositorioEmergencia;
import com.marcelo.campsolidarium.repositorios.RepositorioInsumos;
import com.marcelo.campsolidarium.repositorios.RepositorioONGs;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

public class CampanhaServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
            Campanha camp = RepositorioCampanha.read(codigo);
            RepositorioCampanha.delete(camp);
            session.setAttribute("msg", "Campanha excluída com sucesso!");
            response.sendRedirect("CampanhaServlet");
            return;
        }

        if ("editar".equals(op)) {
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            Campanha camp = RepositorioCampanha.read(codigo);
            session.setAttribute("campEditar", camp);
            session.setAttribute("ongs", RepositorioONGs.readAll());
            session.setAttribute("emergencias", RepositorioEmergencia.readAll());
            session.setAttribute("insumosDisponiveis", RepositorioInsumos.readAll());
            response.sendRedirect("CadastroDeCampanhas.jsp");
            return;
        }

        session.setAttribute("campanhas", RepositorioCampanha.readAll());
        session.setAttribute("ongs", RepositorioONGs.readAll());
        session.setAttribute("emergencias", RepositorioEmergencia.readAll());
        session.setAttribute("insumosDisponiveis", RepositorioInsumos.readAll());
        response.sendRedirect("Campanhas.jsp");

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
        String dataInicio = request.getParameter("dataInicio");
        String dataFinal = request.getParameter("dataFinal");
        String objetivo = request.getParameter("objetivo");
        String descricao = request.getParameter("descricao");
        int codigoOng = Integer.parseInt(request.getParameter("codigoOng"));
        int codigoEmergencia = Integer.parseInt(request.getParameter("codigoEmergencia"));
        String[] codigosInsumos = request.getParameterValues("codigosInsumos");

        ONGs ong = RepositorioONGs.readPorCodigo(codigoOng);
        Emergencia emergencia = RepositorioEmergencia.read(codigoEmergencia);

        List<Insumos> insumos = new ArrayList();
        if (codigosInsumos != null) {
            for (String codigoInsumo : codigosInsumos) {
                insumos.add(RepositorioInsumos.read(Integer.parseInt(codigoInsumo)));
            }
        }

        if ("editar".equals(op)) {
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            Campanha camp = RepositorioCampanha.read(codigo);
            camp.setDataInicio(dataInicio);
            camp.setDataFinal(dataFinal);
            camp.setObjetivo(objetivo);
            camp.setDescricao(descricao);
            camp.setOng(ong);
            camp.setEmergencia(emergencia);
            camp.setInsumos(insumos);
            RepositorioCampanha.update(camp);
            session.setAttribute("msg", "Campanha atualizada com sucesso!");
        } else {
            Campanha camp = new Campanha();
            camp.setDataInicio(dataInicio);
            camp.setDataFinal(dataFinal);
            camp.setObjetivo(objetivo);
            camp.setDescricao(descricao);
            camp.setOng(ong);
            camp.setEmergencia(emergencia);
            camp.setInsumos(insumos);
            RepositorioCampanha.create(camp);
            session.setAttribute("msg", "Campanha cadastrada com sucesso!");
        }

        response.sendRedirect("CampanhaServlet");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
 


    }
