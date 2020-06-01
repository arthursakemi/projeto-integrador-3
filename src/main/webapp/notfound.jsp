<%--
    Document   : erro
    Created on : 18/05/2020, 12:00:05
    Author     : Marcelo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="./CSS/base-style.css" />
        <link rel="stylesheet" href="./CSS/notfound.css" />
        <script src="./JS/base.js" defer></script>
        <title>404 Page Not Found - TableTop</title>
    </head>
    <body>
        <header id="header">
            <a id="logo-container" href="./protegido/menu.jsp">
                <img id="logo" src="./images/ten-sided-dice-hi.png" alt="logotipo tabletop" />
            </a>
            <div id="title-container">
                <img id="title" src="./images/title.svg" />
            </div>
            <div id="user-container">
                <div>
                    <p id="username">${sessionScope.usuario.usuario}</p>
                    <a href="./LogoutServlet">sair</a>
                </div>
                <img id="avatar" src="./images/avatar.svg" alt="profile picture" />
            </div>
        </header>
        <div id="body">
            <aside id="menu">
                <a class="button" href="./ListarClienteServlet">Clientes</a>
                <a class="button" href="./ListarEstoqueServlet">Estoque</a>
                <a class="button" href="./ListarProdutoServlet">Produtos</a>
                <a class="button" href="./ListarProdutoVendaServlet">Vendas</a>
                <c:if test="${sessionScope.usuario.isAdmin}">
                    <a class="button" href="./ListarFuncionarioServlet">Funcionarios</a>
                    <a class="button" href="./ListarUnidadesServlet">Unidades</a>
                    <a class="button" href="./ListarRelatorioServlet">Relatorios</a>
                </c:if>
            </aside>
            <div id="content">
                <img id="error-gif" src="./images/dino-google-error-animated.gif" alt="animated image of error code" />
                <h1>Ops! O Dino não foi capaz de encontrar a página.</h1>
                <p>Verifique a URL e tente novamente.</p>
            </div>
        </div>
    </body>
</html>
