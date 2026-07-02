<%@page import="java.util.List"%>
<%@page import="com.marcelo.campsolidarium.entidades.ONGs"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="css/style.css">
        
        <title>ONGs Cadastradas</title>

    </head>

    <body>

        <div class="container">

            <h1>ONGs Cadastradas</h1>

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

                <a class="btn novo" href="CadastroDeONGs.jsp">
                    Cadastrar nova ONG
                </a>

                <a class="btn home" href="index.jsp">
                    Página Inicial
                </a>

            </div>

            <%
                List<ONGs> ongs = (List<ONGs>) session.getAttribute("ongs");
            %>

            <table>

                <tr>
                    <th>Código</th>
                    <th>Nome</th>
                    <th>Ações</th>
                </tr>

                <%
                    if (ongs != null) {

                        for (ONGs ong : ongs) {

                %>

                <tr>

                    <td><%= ong.getCodigo()%></td>

                    <td><%= ong.getNome()%></td>

                    <td>

                        <a class="acao editar"
                           href="ONGsServlet?operacao=editar&login=<%= ong.getLogin()%>">
                            Editar
                        </a>

                        <a class="acao excluir"
                           href="ONGsServlet?operacao=excluir&login=<%= ong.getLogin()%>">
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