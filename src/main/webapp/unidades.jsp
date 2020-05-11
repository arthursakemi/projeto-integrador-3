<%--
    Document   : unidades
    Created on : 09/05/2020, 22:19:34
    Author     : Marcelo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="./styles/home.css" />
        <script src="./js/home.js" defer></script>
        <title>Home</title>
    </head>
    <body>
        <header id="header">
            <div id="logo"></div>
            <div id="title"></div>
            <div id="user-container">
                <p id="username"></p>
                <img id="profile-picture" src="" alt="" />
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
    </body>
</html>
