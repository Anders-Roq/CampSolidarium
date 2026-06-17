<%-- 
    Document   : CadastroDeEmergencias
    Created on : 16 de jun. de 2026, 09:36:36
    Author     : marcelo
--%>

<%@page import="com.marcelo.campsolidarium.entidades.Emergencia"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <title>Cadastro de Emergências</title>

    </head>
    <body>
        <h1>Cadastro de Emergências</h1>

        <%

            Emergencia emergEditar = (Emergencia) session.getAttribute("emergEditar");
            session.removeAttribute("emergEditar");
            if (emergEditar != null) {%>

        <h2>Editar Emergência</h2>
        <form method="post" action="EmergenciaServlet">
            <input type="hidden" name="operacao" value="editar"/>
            <input type="hidden" name="codigo" value="<%= emergEditar.getCodigo()%>"/> 
            Local: <input type="text" name="local" value="<%= emergEditar.getLocal()%>"/><br/>
            Tipo: <input type="text" name="tipo" value="<%= emergEditar.getTipo()%>"/><br/>
            Descrição: <input type="text" name="descricao" value="<%= emergEditar.getDescricao()%>"/><br/>
            <button type="submit">Salvar</button>
        </form>

        <% } else { %>

        <h2>Cadastrar Emergência</h2>
        <form method="post" action="EmergenciaServlet">
            <input type="hidden" name="operacao" value="cadastrar"/>
            Local: <input type="text" name="local"/><br/>
            Tipo: <input type="text" name="tipo"/><br/>
            Descrição: <input type="text" name="descricao"/><br/>
            <button type="submit">Cadastrar</button>
        </form>

        <% }%>
        <br>
        <a href="EmergenciaServlet"><button>Ver emergências cadastrados</button></a>
        <br>
        <a href="index.html"><button>Página Inicial</button></a>
    </body>
    
</html>
