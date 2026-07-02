<%@page import="com.marcelo.campsolidarium.entidades.Emergencia"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>

        <meta charset="UTF-8">
        
        <link rel="stylesheet" href="css/style.css">

        <title>Cadastro de Emergências</title>

    </head>

    <body>

        <div class="container">

            <h1>Cadastro de Emergências</h1>

            <%

                Emergencia emergEditar = (Emergencia) session.getAttribute("emergEditar");
                session.removeAttribute("emergEditar");

                if (emergEditar != null) {

            %>

            <h2>Editar Emergência</h2>

            <form method="post" action="EmergenciaServlet">

                <input type="hidden" name="operacao" value="editar"/>

                <input type="hidden" name="codigo" value="<%= emergEditar.getCodigo()%>"/>

                <label>Local</label>
                <input type="text" name="local" value="<%= emergEditar.getLocal()%>">

                <label>Tipo</label>
                <input type="text" name="tipo" value="<%= emergEditar.getTipo()%>">

                <label>Descrição</label>
                <input type="text" name="descricao" value="<%= emergEditar.getDescricao()%>">

                <div class="botoes">

                    <button class="botao salvar">
                        Salvar
                    </button>

                    <a class="botao voltar" href="EmergenciaServlet">
                        Cancelar
                    </a>

                </div>

            </form>

            <%

            } else {

            %>

            <h2>Cadastrar Emergência</h2>

            <form method="post" action="EmergenciaServlet">

                <input type="hidden" name="operacao" value="cadastrar"/>

                <label>Local</label>
                <input type="text" name="local">

                <label>Tipo</label>
                <input type="text" name="tipo">

                <label>Descrição</label>
                <input type="text" name="descricao">

                <div class="botoes">

                    <button class="botao salvar">
                        Cadastrar
                    </button>

                    <a class="botao voltar" href="EmergenciaServlet">
                        Cancelar
                    </a>

                </div>

            </form>

            <%    }

            %>

        </div>

    </body>

</html>