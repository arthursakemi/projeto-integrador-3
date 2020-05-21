<%--
    Document   : relatorios
    Created on : 09/05/2020, 22:19:57
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
        <link rel="stylesheet" href="./CSS/relatorios.css" />
        <script src="./JS/base.js" defer></script>
        <script src="./JS/relatorios.js" defer></script>
        <title>Home</title>
    </head>
    <body>
        <header id="header">
            <a id="logo-container" href="./menu.jsp">
                <img id="logo" src="./images/ten-sided-dice-hi.png" alt="" />
            </a>
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
                <a class="button" href="./ListarClienteServlet">Clientes</a>
                <a class="button" href="./ListarEstoqueServlet">Estoque</a>
                <a class="button" href="./ListarFuncionarioServlet">Funcionarios</a>
                <a class="button" href="./ListarUnidadesServlet">Unidades</a>
                <a class="button" href="./ListarProdutoServlet">Produtos</a>
                <a class="button" href="./ListarProdutoVendaServlet">Vendas</a>
                <a class="button" href="./relatorios.jsp">Relatorios</a>
            </aside>
            <div id="content">
                <div id="search-bar">
                    <button id="new-customer">+ Cadastrar Cliente</button>
                    <input id="search-field" type="text" placeholder="buscar..." />
                    <button id="search-button">Buscar</button>
                </div>
                <div id="sales-table">
                    <div class="sale-row" >
                        <span>Cliente</span>
                        <span>Unidade</span>
                        <span>CPF</span>
                        <span>Data</span>
                        <span>Total</span>
                        <div class="options"></div>
                    </div>
                    <c:forEach var="c" items="${vendas}">
                        <div class="sale-row" >
                            <span>${c.nomeCliente}</span>
                            <span>${c.nomeUnidade}</span>
                            <span>${c.cpfCliente}</span>
                            <span>${c.celCliente}</span>
                            <span>${c.total}</span>
                            <div class="options"></div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </body>
</html>
