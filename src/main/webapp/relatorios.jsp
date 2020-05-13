<%--
    Document   : relatorios
    Created on : 09/05/2020, 22:19:57
    Author     : Marcelo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="./CSS/base-style.css" />
        <script src="./js/home.js" defer></script>
        <title>Home</title>
    </head>
    <body>
        <header id="header">
            <div id="logo-container">
                <img id="logo" src="./images/ten-sided-dice-hi.png" alt="" />
            </div>
            <div id="title-container">
                <img id="title" src="./images/title.svg" />
            </div>
            <div id="user-container">
                <p id="username">username</p>
                <img id="avatar" src="./images/avatar.svg" alt="" />
            </div>
        </header>
        <div id="body">
            <aside id="menu">
                <div class="button">Produtos</div>
                <div class="button">Clientes</div>
                <div class="button">Funcionarios</div>
                <div class="button">Unidades</div>
                <div class="button">Vendas</div>
                <div class="button">Relatorios</div>
            </aside>
            <div id="content"></div>
        </div>
        <div id="lista-menu">
            <a href="produtos.jsp" id="produtos-menu">Produtos</a>
            <a href="clientes.jsp" id="clientes-menu">Clientes</a>
            <a href="funcionarios.jsp" id="funcionarios-menu">Funcionários</a>
            <a href="unidades.jsp" id="unidades-menu">Unidades</a>
            <a href="vendas.jsp" id="vendas-menu">Vendas</a>
            <a href="relatorios.jsp" id="relatorios-menu">Relatorios</a>
        </div>
        <div id="body"
</body>
</html>
