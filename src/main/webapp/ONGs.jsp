<%-- 
    Document   : ongs
    Created on : 16 de jun. de 2026, 09:35:51
    Author     : marcelo
--%>
<%@page import="java.util.List"%>
<%@page import="com.marcelo.campsolidarium.entidades.ONGs"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
        <title>ONGs Cadastradas</title>
    </head>
    <body>
        <h1>ONGs Cadastradas</h1>

        <%
            String msg = (String) session.getAttribute("msg");
            if (msg != null) {
        %>
        <h4><%= msg%></h4>
        <%
                session.removeAttribute("msg");
            }
        %>

        <a href="CadastroDeONGs.jsp">Cadastrar nova ONG</a>

        <%
            List<ONGs> ongs = (List<ONGs>) session.getAttribute("ongs");
        %>

        <table border="1">
            <tr>
                <td>Código</td>
                <td>Nome</td>
                <td>Ações</td>
            </tr>
            <%
                if (ongs != null) {
                    for (ONGs ong : ongs) {
            %>
            <tr>
                <td><%= ong.getCodigo()%></td>
                <td><%= ong.getNome()%></td>
                <td>
                    <a href="ONGsServlet?operacao=excluir&login=<%= ong.getLogin()%>">Excluir</a>
                    /    
                    <a href="ONGsServlet?operacao=editar&login=<%= ong.getLogin()%>">Editar</a>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </table>
        <a href="index.html">Página Inicial</a>
    </body>
</html>
