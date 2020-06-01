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
        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
        <script src="./JS/vendas.js" defer></script>
        <script src="./JS/base.js" defer></script>
        <title>Vendas - TableTop</title>
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
                <c:if test="${sessionScope.usuario.isAdmin}">
                    <a class="button" href="./ListarFuncionarioServlet">Funcionarios</a>
                    <a class="button" href="./ListarUnidadesServlet">Unidades</a>
                    <a class="button" href="./ListarRelatorioServlet">Relatorios</a>
                </c:if>
            </aside>
            <div id="content">
                <div id="sale-search-bar">
                    <input id="sale-search-field" type="text" placeholder="buscar..." />
                    <button id="sale-search-button">Buscar</button>
                </div>
                <div id="card-galery">
                    <c:forEach var="c" items="${estoque}" >
                        <div class="product-card stock-card" key="${c.id}" pid="${c.idProduto}" uid="${c.idUnidade}" quantity="${c.quantidade}" onclick="addItemToCart(`${c.id}`, `${c.nomeProduto}`, ${c.valor})">
                            <div class="product-img"></div>
                            <h1 class="product-name">${c.nomeProduto}</h1>
                            <h4 class="unidade-txt">${c.nomeUnidade}</h4>
                            <div class="card-text">
                                <span>Qt. ${c.quantidade}</span>
                                <span class="price">R$ ${c.valor}</span>
                            </div>
                        </div>
                    </c:forEach>
                </div>

            </div>
            <div id="shop-cart-sidebar">
                <select class="input-field" id="cliente-input" name="cliente">
                    <option value="">Selecione um Cliente</option>
                    <c:forEach var="c" items="${clientes}">
                        <option value='${c.id}'>${c.nome}</option>
                    </c:forEach>
                </select>
                <select class="input-field" id="unidade-input" name="unidade" onchange="unityFilter(this.value)" >
                    <option value="">Selecione uma Unidade</option>
                    <c:forEach var="c" items="${unidades}">
                        <option value='${c.id}'>${c.nome}</option>
                    </c:forEach>
                </select>
                <div id="shop-cart-container">
                    <h2 id="shop-cart-title">Carrinho</h2>
                    <div id="shop-cart">

                    </div>
                </div>
                <div id="sale-totals">
                    <span>Total:</span>
                    <span id="total-value">R$ 00,00</span>
                </div>
                <div id="cart-buttons">
                    <button class="sale-button" id="cancel-button" type="button" onclick="clearCart()">Cancelar</button>
                    <button class="sale-button" id="submit-button" type="button" onclick="executeSale(3, document.getElementById('cliente-input').value, document.getElementById('unidade-input').value)">Concluir</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
