<%-- 
    Document   : CadastroDeONGs
    Created on : 16 de jun. de 2026, 09:36:59
    Author     : marcelo
--%>
<%@page import="com.marcelo.campsolidarium.entidades.ONGs"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Cadastro de ONG</title>
        
    </head>
    <body>
        <h1>Cadastro de ONG</h1>

        <%

            ONGs ongEditar = (ONGs) session.getAttribute("ongEditar");
            session.removeAttribute("ongEditar");
            if (ongEditar != null) {%>

        <h2>Editar ONG</h2>
        <form method="post" action="ONGsServlet">
            <input type="hidden" name="operacao" value="editar"/>
            <input type="hidden" name="login" value="<%= ongEditar.getLogin()%>"/>
            Nome: <input type="text" name="nome" value="<%= ongEditar.getNome()%>"/><br/>
            Login: <input type="text" name="login_novo" value="<%= ongEditar.getLogin()%>"/><br/>
            Senha: <input type="password" name="senha" value="<%= ongEditar.getSenha()%>"/><br/>
            <button type="submit" class="btn btn-primary" >Salvar</button>
        </form>

        <% } else { %>

        <h2>Cadastrar ONG</h2>
        <form method="post" action="ONGsServlet">
            <input type="hidden" name="operacao" value="cadastrar"/>
            Nome: <input type="text" name="nome"/><br/>
            Login: <input type="text" name="login_novo"/><br/>
            Senha: <input type="password" name="senha"/><br/>
            <button type="submit" class="btn btn-primary" >Cadastrar</button>
        </form>

        <% }%>
        <br>
        <a href="ONGsServlet"><button>Ver ONGs cadastradas</button></a>
        <br>
        <a href="index.html"><button>Página Inicial</button></a>
    </body>
    
    
</html>
