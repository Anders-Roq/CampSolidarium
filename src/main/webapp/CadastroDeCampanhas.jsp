<%@page import="com.marcelo.campsolidarium.entidades.Campanha"%>
<%@page import="com.marcelo.campsolidarium.entidades.ONGs"%>
<%@page import="com.marcelo.campsolidarium.entidades.Emergencia"%>
<%@page import="com.marcelo.campsolidarium.entidades.Insumos"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>

        <meta charset="UTF-8">

        <link rel="stylesheet" href="css/style.css">

        <title>Cadastro de Campanhas</title>

    </head>

    <body>

        <%@ include file="Navbar.jsp" %>

        <div class="container">

            <h1>Cadastro de Campanhas</h1>

            <%

                Campanha campEditar = (Campanha) session.getAttribute("campEditar");
                session.removeAttribute("campEditar");

                List<ONGs> ongs = (List<ONGs>) session.getAttribute("ongs");
                List<Emergencia> emergencias = (List<Emergencia>) session.getAttribute("emergencias");
                List<Insumos> insumosDisponiveis = (List<Insumos>) session.getAttribute("insumosDisponiveis");

                boolean editando = (campEditar != null);

            %>

            <% if (editando) {%>

            <h2>Editar Campanha</h2>

            <form method="post" action="CampanhaServlet">

                <input type="hidden" name="operacao" value="editar"/>

                <input type="hidden" name="codigo" value="<%= campEditar.getCodigo()%>"/>

            <% } else {%>

            <h2>Cadastrar Campanha</h2>

            <form method="post" action="CampanhaServlet">

                <input type="hidden" name="operacao" value="cadastrar"/>

            <% }%>

                <label>Data de Início</label>
                <input type="text" name="dataInicio" placeholder="dd/mm/aaaa"
                       value="<%= editando ? campEditar.getDataInicio() : ""%>">

                <label>Data de Término</label>
                <input type="text" name="dataFinal" placeholder="dd/mm/aaaa"
                       value="<%= editando ? campEditar.getDataFinal() : ""%>">

                <label>Objetivo</label>
                <input type="text" name="objetivo"
                       value="<%= editando ? campEditar.getObjetivo() : ""%>">

                <label>Descrição</label>
                <input type="text" name="descricao"
                       value="<%= editando ? campEditar.getDescricao() : ""%>">

                <label>ONG responsável</label>
                <select name="codigoOng">
                    <option value="">Selecione...</option>
                    <%
                        if (ongs != null) {
                            for (ONGs ong : ongs) {
                                boolean selecionada = editando && campEditar.getOng() != null
                                        && campEditar.getOng().getCodigo() == ong.getCodigo();
                    %>
                    <option value="<%= ong.getCodigo()%>" <%= selecionada ? "selected" : ""%>>
                        <%= ong.getNome()%>
                    </option>
                    <%
                            }
                        }
                    %>
                </select>

                <label>Emergência</label>
                <select name="codigoEmergencia">
                    <option value="">Selecione...</option>
                    <%
                        if (emergencias != null) {
                            for (Emergencia emerg : emergencias) {
                                boolean selecionada = editando && campEditar.getEmergencia() != null
                                        && campEditar.getEmergencia().getCodigo() == emerg.getCodigo();
                    %>
                    <option value="<%= emerg.getCodigo()%>" <%= selecionada ? "selected" : ""%>>
                        <%= emerg.getTipo()%> - <%= emerg.getLocal()%>
                    </option>
                    <%
                            }
                        }
                    %>
                </select>

                <label>Insumos utilizados</label>
                <div class="checkbox-group">
                    <%
                        if (insumosDisponiveis != null) {
                            for (Insumos insumo : insumosDisponiveis) {
                                boolean marcado = false;
                                if (editando && campEditar.getInsumos() != null) {
                                    for (Insumos insumoCampanha : campEditar.getInsumos()) {
                                        if (insumoCampanha.getCodigo() == insumo.getCodigo()) {
                                            marcado = true;
                                            break;
                                        }
                                    }
                                }
                    %>
                    <label class="checkbox-item">
                        <input type="checkbox" name="codigosInsumos" value="<%= insumo.getCodigo()%>"
                               <%= marcado ? "checked" : ""%>>
                        <%= insumo.getNome()%> (<%= insumo.getCategoria()%>)
                    </label>
                    <%
                            }
                        }
                    %>
                </div>

                <div class="botoes">

                    <button class="botao salvar">
                        <%= editando ? "Salvar" : "Cadastrar"%>
                    </button>

                    <a class="botao voltar" href="CampanhaServlet">
                        Cancelar
                    </a>

                </div>

            </form>

        </div>

    </body>

</html>
