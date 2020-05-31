<%--
    Document   : produtos
    Created on : 09/05/2020, 22:19:03
    Author     : Marcelo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./CSS/base-style.css" />
        <link rel="stylesheet" href="./CSS/estoque.css" />
        <script src="./JS/estoque.js" defer></script>
        <script src="./JS/base.js" defer></script>
        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
        <title>Estoque - TableTop</title>
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
                <p id="username">${sessionScope.usuario.usuario}</p>
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
                <div id="search-bar">
                    <button id="new-product" type="button" onclick="showStockModal()">+ Atualizar Estoque</button>
                    <select class="input-field" id="unidade-input" name="unidade" onchange="unityFilter(this.value)">
                        <option value="">Selecione uma Unidade</option>
                        <c:forEach var="c" items="${unidades}">
                            <option value='${c.id}'>${c.nome}</option>
                        </c:forEach>
                    </select>
                </div>
                <div id="card-galery">
                    <c:forEach var="c" items="${estoque}" >
                        <div class="product-card stock-card" key="${c.id}" pid="${c.idProduto}" uid="${c.idUnidade}" quantity="${c.quantidade}">
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
            <div id="overlay">
                <div class="modal" id="registro-produtos">
                    <h1>Unidade x</h1>
                    <form>
                        <select class="input-field" id="produto-input" name="produtos">
                            <option value="0">Selecione um Produto</option>
                            <c:forEach var="c" items="${produtos}">
                                <option value='${c.id}'>${c.nome}</option>
                            </c:forEach>
                        </select>
                        <input class="input-field" type="number" id="quantidade" min="0"/>
                        <button type="reset" onclick="closeStockModal()">Cancelar</button>
                        <button type="button" onclick="submitStockUpdate(document.getElementById('produto-input').value, document.getElementById('unidade-input').value, document.getElementById('quantidade').value)">Atualizar</button>
                    </form>
                </div>
            </div>
    </body>
</html>
