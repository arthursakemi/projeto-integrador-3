<%--
    Document   : menu
    Created on : 09/05/2020, 22:17:57
    Author     : Marcelo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="./CSS/base-style.css" />
        <link rel="stylesheet" href="./CSS/menu.css" />
        <script src="./JS/home.js" defer></script>
        <script src="./JS/base.js" defer></script>
        <title>Home</title>
    </head>
    <body>
        <header id="header">
            <a id="logo-container" href="./menu.jsp">
                <img id="logo" src="../images/ten-sided-dice-hi.png" alt="" />
            </a>
            <div id="title-container">
                <img id="title" src="../images/title.svg" />
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
                <c:if test="${sessionScope.usuario.isIsAdmin()}">
                    <a class="button" href="./ListarFuncionarioServlet">Funcionarios</a>
                    <a class="button" href="./ListarUnidadesServlet">Unidades</a>
                    <a class="button" href="./ListarRelatorioServlet">Relatorios</a>
                </c:if>
            </aside>
            <div id="content">
                <div id="home-background">
                    <a class="card-text-box" href="./ListarProdutoVendaServlet">
                        <p class="card-text">Nova Venda</p>
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
