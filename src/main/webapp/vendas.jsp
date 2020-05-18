<%--
    Document   : vendas
    Created on : 09/05/2020, 22:19:46
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
        <link rel="stylesheet" href="./CSS/produtos.css" />
        <link rel="stylesheet" href="./CSS/vendas.css" />
        <script src="./JS/produtos.js" defer></script>
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
                <a class="button" href="./ListarProdutoServlet">Produtos</a>
                <a class="button" href="./ListarClienteServlet">Clientes</a>
                <a class="button" href="./ListarFuncionarioServlet">Funcionarios</a>
                <a class="button" href="./ListarUnidadesServlet">Unidades</a>
                <a class="button" href="./vendas.jsp">Vendas</a>
                <a class="button" href="./relatorios.jsp">Relatorios</a>
            </aside>
            <div id="content">
                <div id="sale-search-bar">
                    <input id="sale-search-field" type="text" placeholder="buscar..." />
                    <button id="sale-search-button">Buscar</button>
                </div>
                <div id="card-galery">
                    <c:forEach var="c" items="${produtos}" >
                        <div class="product-card" key="${c.id}" >
                            <div class="product-img"></div>
                            <h1 class="product-name">${c.nome}</h1>
                            <div class="card-text">
                                <span class="quantity">Qt: 10</span>
                                <span class="price">R$ ${c.valor}</span>
                            </div>
                        </div>
                    </c:forEach>
                </div>

            </div>
            <div id="shop-cart-container">

            </div>
        </div>
    </body>
</html>
