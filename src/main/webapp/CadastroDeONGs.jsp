<%@page import="com.marcelo.campsolidarium.entidades.ONGs"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>

        <meta charset="UTF-8">
        
        <link rel="stylesheet" href="css/style.css">

        <title>Cadastro de ONG</title>

    </head>

    <body>

        <div class="container">

            <h1>Cadastro de ONG</h1>

            <%

                ONGs ongEditar = (ONGs) session.getAttribute("ongEditar");
                session.removeAttribute("ongEditar");

                if (ongEditar != null) {

            %>

            <h2>Editar ONG</h2>

            <form method="post" action="ONGsServlet">

                <input type="hidden" name="operacao" value="editar"/>

                <input type="hidden" name="login" value="<%= ongEditar.getLogin()%>"/>

                <label>Nome</label>
                <input type="text" name="nome" value="<%= ongEditar.getNome()%>">

                <label>Login</label>
                <input type="text" name="login_novo" value="<%= ongEditar.getLogin()%>">

                <label>Senha</label>
                <input type="password" name="senha" value="<%= ongEditar.getSenha()%>">

                <div class="botoes">

                    <button class="botao salvar">
                        Salvar
                    </button>

                    <a class="botao voltar" href="ONGsServlet">
                        Cancelar
                    </a>

                </div>

            </form>

            <%

            } else {

            %>

            <h2>Cadastrar ONG</h2>

            <form method="post" action="ONGsServlet">

                <input type="hidden" name="operacao" value="cadastrar"/>

                <label>Nome</label>
                <input type="text" name="nome">

                <label>Login</label>
                <input type="text" name="login_novo">

                <label>Senha</label>
                <input type="password" name="senha">

                <div class="botoes">

                    <button class="botao salvar">
                        Cadastrar
                    </button>

                    <a class="botao voltar" href="ONGsServlet">
                        Cancelar
                    </a>

                </div>

            </form>

            <%    }

            %>

        </div>

    </body>

</html>