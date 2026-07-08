<%@page import="com.marcelo.campsolidarium.entidades.ONGs"%>
<%@page import="com.marcelo.campsolidarium.entidades.Campanha"%>
<%@page import="com.marcelo.campsolidarium.entidades.Insumos"%>
<%@page import="com.marcelo.campsolidarium.repositorios.RepositorioCampanha"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="css/style.css">

        <title>CampSolidárium</title>

    </head>

    <body>

        <%@ include file="Navbar.jsp" %>

        <div class="container">

            <h1>Bem Vindo ao CampSolidárium!</h1>

            <%
                String msg = (String) session.getAttribute("msg");
                if (msg != null) {
            %>

            <div class="mensagem">
                <%= msg%>
            </div>

            <%
                    session.removeAttribute("msg");
                }
            %>

            <h2>O que deseja fazer?</h2>

            <div class="menu">
                <a class="<%= logada ? "" : "disabled"%>" href="<%= logada ? "ONGsServlet" : "#"%>">ONGs</a>
                <a class="<%= logada ? "" : "disabled"%>" href="<%= logada ? "EmergenciaServlet" : "#"%>">Emergências</a>
                <a class="<%= logada ? "" : "disabled"%>" href="<%= logada ? "InsumosServlet" : "#"%>">Insumos</a>
                <a class="<%= logada ? "" : "disabled"%>" href="<%= logada ? "CampanhaServlet" : "#"%>">Campanhas</a>
            </div>

            <h2>Campanhas Cadastradas</h2>

            <%    List<Campanha> campanhas = RepositorioCampanha.readAll();
            %>

            <table>

                <tr>
                    <th>Código</th>
                    <th>Período</th>
                    <th>Objetivo</th>
                    <th>ONG</th>
                    <th>Emergência</th>
                    <th>Insumos</th>
                </tr>

                <%    for (Campanha camp : campanhas) {

                %>

                <tr>

                    <td><%= camp.getCodigo()%></td>

                    <td><%= camp.getDataInicio()%> a <%= camp.getDataFinal()%></td>

                    <td><%= camp.getObjetivo()%></td>

                    <td><%= camp.getOng() != null ? camp.getOng().getNome() : ""%></td>

                    <td><%= camp.getEmergencia() != null ? camp.getEmergencia().getTipo() : ""%></td>

                    <td>

                        <%    List<Insumos> insumos = camp.getInsumos();

                            if (insumos != null) {

                                for (int i = 0; i < insumos.size(); i++) {

                        %>

                        <%= insumos.get(i).getNome()%><%= i < insumos.size() - 1 ? ", " : ""%>

                        <%

                                }

                            }

                        %>

                    </td>

                </tr>

                <%

                    }

                %>

            </table>

        </div>

    </body>
</html>