<%@page import="com.marcelo.campsolidarium.entidades.Insumos"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>

        <meta charset="UTF-8">
        
        <link rel="stylesheet" href="css/style.css">
        
        <title>Insumos Cadastrados</title>     

    </head>

    <body>

        <div class="container">

            <h1>Insumos Cadastrados</h1>

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

            <div class="topo">

                <a class="btn novo" href="CadastroDeInsumos.jsp">
                    Cadastrar novo Insumo
                </a>

                <a class="btn home" href="index.jsp">
                    Página Inicial
                </a>

            </div>

            <%    List<Insumos> insumos = (List<Insumos>) session.getAttribute("insumos");

            %>

            <table>

                <tr>

                    <th>Código</th>

                    <th>Nome</th>

                    <th>Marca</th>

                    <th>Categoria</th>

                    <th>Ações</th>

                </tr>

                <%    if (insumos != null) {

                        for (Insumos insumo : insumos) {

                %>

                <tr>

                    <td><%= insumo.getCodigo()%></td>

                    <td><%= insumo.getNome()%></td>

                    <td><%= insumo.getMarca()%></td>

                    <td><%= insumo.getCategoria()%></td>

                    <td>

                        <a class="acao editar"
                           href="InsumosServlet?operacao=editar&codigo=<%= insumo.getCodigo()%>">
                            Editar
                        </a>

                        <a class="acao excluir"
                           href="InsumosServlet?operacao=excluir&codigo=<%= insumo.getCodigo()%>">
                            Excluir
                        </a>

                    </td>

                </tr>

                <%

                        }

                    }

                %>

            </table>

        </div>

    </body>

</html>