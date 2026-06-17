<%-- 
    Document   : insumos
    Created on : 16 de jun. de 2026, 09:34:40
    Author     : marcelo
--%>
<%@page import="com.marcelo.campsolidarium.entidades.Insumos"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Insumos Cadastradas</title>
    </head>
    <body>
        <h1>Insumos Cadastradas</h1>

        <%
            String msg = (String) session.getAttribute("msg");
            if (msg != null) {
        %>
        <h4><%= msg%></h4>
        <%
                session.removeAttribute("msg");
            }
        %>

        <a href="CadastroDeInsumos.jsp">Cadastrar novo Insumo</a>

        <%
            List<Insumos> insumos = (List<Insumos>) session.getAttribute("insumos");
        %>

        <table border="1">
            <tr>
                <td>Código</td>
                <td>Nome</td>
                <td>Marca</td>
                <td>Categoria</td>
                <td>Ações</td>
            </tr>
            <%
                if (insumos != null) {
                    for (Insumos insumo : insumos) {
            %>
            <tr>
                <td><%= insumo.getCodigo()%></td>
                <td><%= insumo.getNome()%></td>
                <td><%= insumo.getMarca()%></td>
                <td><%= insumo.getCategoria()%></td>
                <td>
                    <a href="InsumosServlet?operacao=excluir&codigo=<%= insumo.getCodigo()%>">Excluir</a>
                    /    
                    <a href="InsumosServlet?operacao=editar&codigo=<%= insumo.getCodigo()%>">Editar</a>
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
