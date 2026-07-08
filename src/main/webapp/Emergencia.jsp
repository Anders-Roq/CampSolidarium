<%@page import="com.marcelo.campsolidarium.entidades.Emergencia"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>

        <meta charset="UTF-8">
        
        <link rel="stylesheet" href="css/style.css">

        <title>Emergências Cadastradas</title>

    </head>

    <body>

        <%@ include file="Navbar.jsp" %>
        
        <div class="container">

            <h1>Emergências Cadastradas</h1>

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

                <a class="btn novo" href="CadastroDeEmergencias.jsp">
                    Cadastrar nova Emergência
                </a>

                <a class="btn home" href="index.jsp">
                    Página Inicial
                </a>

            </div>

            <%    List<Emergencia> emergencias
                        = (List<Emergencia>) session.getAttribute("emergencias");

            %>

            <table>

                <tr>

                    <th>Código</th>

                    <th>Local</th>

                    <th>Tipo</th>

                    <th>Descrição</th>

                    <th>Ações</th>

                </tr>

                <%    if (emergencias != null) {

                        for (Emergencia emerg : emergencias) {

                %>

                <tr>

                    <td><%= emerg.getCodigo()%></td>

                    <td><%= emerg.getLocal()%></td>

                    <td><%= emerg.getTipo()%></td>

                    <td><%= emerg.getDescricao()%></td>

                    <td>

                        <a class="acao editar"
                           href="EmergenciaServlet?operacao=editar&codigo=<%= emerg.getCodigo()%>">
                            Editar
                        </a>

                        <a class="acao excluir"
                           href="EmergenciaServlet?operacao=excluir&codigo=<%= emerg.getCodigo()%>">
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