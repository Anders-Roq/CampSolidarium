<%@page import="com.marcelo.campsolidarium.entidades.Campanha"%>
<%@page import="com.marcelo.campsolidarium.entidades.Insumos"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>

        <meta charset="UTF-8">

        <link rel="stylesheet" href="css/style.css">

        <title>Campanhas Cadastradas</title>

    </head>

    <body>

        <div class="container">

            <h1>Campanhas Cadastradas</h1>

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

            <div class="topo">

                <a class="btn novo" href="CadastroDeCampanhas.jsp">
                    Cadastrar nova Campanha
                </a>

                <a class="btn home" href="index.jsp">
                    Página Inicial
                </a>

            </div>

            <%    List<Campanha> campanhas
                        = (List<Campanha>) session.getAttribute("campanhas");

            %>

            <table>

                <tr>

                    <th>Código</th>

                    <th>Período</th>

                    <th>Objetivo</th>

                    <th>Descrição</th>

                    <th>ONG</th>

                    <th>Emergência</th>

                    <th>Insumos</th>

                    <th>Ações</th>

                </tr>

                <%    if (campanhas != null) {

                        for (Campanha camp : campanhas) {

                %>

                <tr>

                    <td><%= camp.getCodigo()%></td>

                    <td><%= camp.getDataInicio()%> a <%= camp.getDataFinal()%></td>

                    <td><%= camp.getObjetivo()%></td>

                    <td><%= camp.getDescricao()%></td>

                    <td><%= camp.getOng() != null ? camp.getOng().getNome() : "-"%></td>

                    <td><%= camp.getEmergencia() != null ? camp.getEmergencia().getTipo() + " (" + camp.getEmergencia().getLocal() + ")" : "-"%></td>

                    <td>
                        <%
                            List<Insumos> insumosCampanha = camp.getInsumos();
                            if (insumosCampanha == null || insumosCampanha.isEmpty()) {
                        %>
                        -
                        <%
                            } else {
                                for (int i = 0; i < insumosCampanha.size(); i++) {
                                    Insumos ins = insumosCampanha.get(i);
                        %>
                        <%= ins.getNome()%><%= i < insumosCampanha.size() - 1 ? ", " : ""%>
                        <%
                                }
                            }
                        %>
                    </td>

                    <td>

                        <a class="acao editar"
                           href="CampanhaServlet?operacao=editar&codigo=<%= camp.getCodigo()%>">
                            Editar
                        </a>

                        <a class="acao excluir"
                           href="CampanhaServlet?operacao=excluir&codigo=<%= camp.getCodigo()%>">
                            Excluir
                        </a>

                    </td>

                </tr>

                <%

                        }

                    }

                %>

            </table>

        </div>

    </body>

</html>
