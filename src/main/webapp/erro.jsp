<%-- 
    Document   : erro
    Created on : 18/05/2020, 10:59:05
    Author     : Marcelo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="./CSS/base-style.css" />
        <link rel="stylesheet" href="./CSS/erro.css" />
        <script src="./JS/base.js" defer></script>
        <title>500 Internal Error - TableTop</title>
    </head>
    <body>
        <header id="header">
            <a id="logo-container" href="./menu.jsp">
                <img id="logo" src="./images/ten-sided-dice-hi.png" alt="logotipo tabletop" />
            </a>
            <div id="title-container">
                <img id="title" src="./images/title.svg" />
            </div>
            <div id="user-container">
                <p id="username">username</p>
                <img id="avatar" src="./images/avatar.svg" alt="profile picture" />
            </div>
        </header>
        <div id="body">
            <aside id="menu">
                <a class="button" href="./ListarClienteServlet">Clientes</a>
                <a class="button" href="./ListarEstoqueServlet">Estoque</a>
                <a class="button" href="./ListarFuncionarioServlet">Funcionarios</a>
                <a class="button" href="./ListarUnidadesServlet">Unidades</a>
                <a class="button" href="./ListarProdutoServlet">Produtos</a>
                <a class="button" href="./ListarProdutoVendaServlet">Vendas</a>
                <a class="button" href="./ListarRelatorioServlet">Relatorios</a>
            </aside>
            <div id="content">
                <img id="error-gif" src="./images/http-500-animated.gif" alt="animated image of error code" />
                <h1>Desculpe, ocorreu um erro inesperado.</h1>
                <p>Se o erro persistir, contate a equipe de suporte.</p>
            </div>
        </div>
    </body>
</html>
