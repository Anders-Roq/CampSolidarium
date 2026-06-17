<%-- 
    Document   : CadastroDeInsumos
    Created on : 16 de jun. de 2026, 09:36:49
    Author     : marcelo
--%>
<%@page import="com.marcelo.campsolidarium.entidades.Insumos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <title>Cadastro de Insumos</title>

    </head>
    <body>
        <h1>Cadastro de Insumo</h1>

        <%

            Insumos insuEditar = (Insumos) session.getAttribute("insuEditar");
            session.removeAttribute("insuEditar");
            if (insuEditar != null) {%>

        <h2>Editar Insumo</h2>
        <form method="post" action="InsumosServlet">
            <input type="hidden" name="operacao" value="editar"/>
            <input type="hidden" name="codigo" value="<%= insuEditar.getCodigo()%>"/> 
            Nome: <input type="text" name="nome" value="<%= insuEditar.getNome()%>"/><br/>
            Marca: <input type="text" name="marca" value="<%= insuEditar.getMarca()%>"/><br/>
            Categoria: <input type="text" name="categoria" value="<%= insuEditar.getCategoria()%>"/><br/>
            <button type="submit">Salvar</button>
        </form>

        <% } else { %>

        <h2>Cadastrar Insumo</h2>
        <form method="post" action="InsumosServlet">
            <input type="hidden" name="operacao" value="cadastrar"/>
            Nome: <input type="text" name="nome"/><br/>
            Marca: <input type="text" name="marca"/><br/>
            Categoria: <input type="text" name="categoria"/><br/>
            <button type="submit">Cadastrar</button>
        </form>

        <% }%>
        <br>
        <a href="InsumosServlet"><button>Ver insumos cadastrados</button></a>
        <br>
        <a href="index.html"><button>Página Inicial</button></a>
    </body>
    
</html>
