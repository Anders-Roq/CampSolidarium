<%-- 
    Document   : Index
    Created on : 2 de jul. de 2026, 16:07:00
    Author     : marcelo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>CampSolidárium</title>

        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: Arial, Helvetica, sans-serif;
            }

            body {
                background-color: #f4f6f9;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
            }

            .container {
                width: 90%;
                max-width: 900px;
                background: white;
                padding: 50px;
                border-radius: 15px;
                box-shadow: 0 8px 20px rgba(0,0,0,0.1);
                text-align: center;
            }

            h1 {
                color: #2c3e50;
                margin-bottom: 15px;
                font-size: 2.5rem;
            }

            h2 {
                color: #666;
                font-weight: normal;
                margin-bottom: 40px;
            }

            .menu {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
                gap: 20px;
                margin-top: 20px;
            }

            .menu a {
                text-decoration: none;
                background-color: #2d89ef;
                color: white;
                padding: 20px;
                border-radius: 10px;
                font-size: 1.2rem;
                font-weight: bold;
                transition: 0.3s;
            }

            .menu a:hover {
                background-color: #1b5fa7;
                transform: translateY(-3px);
            }

        </style>
    </head>

    <body>

        <div class="container">

            <h1>Bem Vindo ao CampSolidárium!</h1>

            <h2>Abaixo escolha a opção de deseja:</h2>

            <div class="menu">
                <a href="ONGsServlet">ONGs</a>
                <a href="EmergenciaServlet">Emergências</a>
                <a href="InsumosServlet">Insumos</a>
                <a href="CampanhaServlet">Campanhas</a>
            </div>

        </div>

    </body>
</html>
