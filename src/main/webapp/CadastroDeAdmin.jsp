<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>

        <meta charset="UTF-8">

        <link rel="stylesheet" href="css/style.css">

        <title>Cadastro de Admin</title>

    </head>

    <body>

        <%@ include file="Navbar.jsp" %>

        <div class="container">

            <h1>Cadastro de Admin</h1>

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

            <form method="post" action="AdminServlet">

                <label>Login</label>
                <input type="text" name="login" required>

                <label>Senha</label>
                <input type="password" name="senha" required>

                <div class="botoes">

                    <button class="botao salvar">
                        Cadastrar
                    </button>

                    <a class="botao voltar" href="index.jsp">
                        Cancelar
                    </a>

                </div>

            </form>

        </div>

    </body>

</html>
