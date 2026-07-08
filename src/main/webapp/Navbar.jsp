<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.marcelo.campsolidarium.entidades.Admin"%>
<%
    Admin adminLogadoNavbar = (Admin) session.getAttribute("adminLogado");
    boolean logada = (adminLogadoNavbar != null);
%>

<div class="navbar">

    <a class="logo" href="index.jsp">CampSolidárium</a>

    <div class="nav-auth">
        <% if (logada) {%>
        <span class="nav-user">Olá, <%= adminLogadoNavbar.getLogin()%></span>
        <a class="btn-admin" href="CadastroDeAdmin.jsp">Cadastrar Admin</a>
        <a class="btn-sair" href="LogoutServlet">Sair</a>
        <% } else {%>
        <button type="button" class="btn-entrar" onclick="abrirModalAuth()">
            Entrar
        </button>
        <% }%>
    </div>

</div>

<div id="modalAuth" class="modal-overlay">

    <div class="modal-box">

        <span class="modal-fechar" onclick="fecharModalAuth()">&times;</span>

        <h2>Login do Admin</h2>

        <form method="post" action="LoginServlet">

            <label>Login</label>
            <input type="text" name="login" required>

            <label>Senha</label>
            <input type="password" name="senha" required>

            <div class="botoes">
                <button class="botao salvar" type="submit">Entrar</button>
            </div>

        </form>

        <p>
            Ainda não tem cadastro?
            <a href="CadastroDeAdmin.jsp">Cadastre-se como Admin</a>
        </p>

    </div>

</div>

<script>
    function abrirModalAuth() {
        document.getElementById('modalAuth').style.display = 'flex';
    }
    function fecharModalAuth() {
        document.getElementById('modalAuth').style.display = 'none';
    }
</script>
