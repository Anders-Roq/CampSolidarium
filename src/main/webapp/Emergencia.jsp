<%-- 
    Document   : emergencia
    Created on : 16 de jun. de 2026, 09:35:06
    Author     : marcelo
--%>

<%@page import="com.marcelo.campsolidarium.entidades.Emergencia"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <title>Emergências Cadastradas</title>
    </head>
    <body>
        <h1>Emergências Cadastradas</h1>

        <%
            String msg = (String) session.getAttribute("msg");
            if (msg != null) {
        %>
        <h4><%= msg%></h4>
        <%
                session.removeAttribute("msg");
            }
        %>

        <a href="CadastroDeEmergencias.jsp">Cadastrar nova Emergência</a>

        <%
            List<Emergencia> emergencias = (List<Emergencia>) session.getAttribute("emergencias");
        %>

        <table border="1">
            <tr>
                <td>Código</td>
                <td>Local</td>
                <td>Tipo</td>
                <td>Descrição</td>
                <td>Ações</td>
            </tr>
            <%
                if (emergencias != null) {
                    for (Emergencia emerg: emergencias) {
            %>
            <tr>
                <td><%= emerg.getCodigo()%></td>
                <td><%= emerg.getLocal()%></td>
                <td><%= emerg.getTipo()%></td>
                <td><%= emerg.getDescricao()%></td>
                <td>
                    <a href="EmergenciaServlet?operacao=excluir&codigo=<%= emerg.getCodigo()%>">Excluir</a>
                    /    
                    <a href="EmergenciaServlet?operacao=editar&codigo=<%= emerg.getCodigo()%>">Editar</a>
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
