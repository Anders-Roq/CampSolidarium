<%@page import="com.marcelo.campsolidarium.entidades.Insumos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>

        <meta charset="UTF-8">
        
        <link rel="stylesheet" href="css/style.css">
        
        <title>Cadastro de Insumos</title>
                
    </head>

    <body>

        <%@ include file="Navbar.jsp" %>

        <div class="container">

            <h1>Cadastro de Insumos</h1>

            <%

                Insumos insuEditar = (Insumos) session.getAttribute("insuEditar");
                session.removeAttribute("insuEditar");

                if (insuEditar != null) {

            %>

            <h2>Editar Insumo</h2>

            <form method="post" action="InsumosServlet">

                <input type="hidden" name="operacao" value="editar"/>
                <input type="hidden" name="codigo" value="<%= insuEditar.getCodigo()%>"/>

                <label>Nome</label>
                <input type="text" name="nome" value="<%= insuEditar.getNome()%>">

                <label>Marca</label>
                <input type="text" name="marca" value="<%= insuEditar.getMarca()%>">

                <label>Categoria</label>
                <input type="text" name="categoria" value="<%= insuEditar.getCategoria()%>">

                <div class="botoes">

                    <button class="botao salvar">
                        Salvar
                    </button>

                    <a class="botao voltar" href="InsumosServlet">
                        Cancelar
                    </a>

                </div>

            </form>

            <%

            } else {

            %>

            <h2>Cadastrar Insumo</h2>

            <form method="post" action="InsumosServlet">

                <input type="hidden" name="operacao" value="cadastrar"/>

                <label>Nome</label>
                <input type="text" name="nome">

                <label>Marca</label>
                <input type="text" name="marca">

                <label>Categoria</label>
                <input type="text" name="categoria">

                <div class="botoes">

                    <button class="botao salvar">
                        Cadastrar
                    </button>

                    <a class="botao voltar" href="InsumosServlet">
                        Cancelar
                    </a>

                </div>

            </form>

            <%    }

            %>

        </div>

    </body>

</html>