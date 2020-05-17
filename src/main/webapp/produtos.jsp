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
        <link rel="stylesheet" href="./CSS/produtos.css" />
        <script src="./JS/produtos.js" defer></script>
        <title>Produtos - TableTop</title>
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
                <div id="search-bar">
                    <button id="new-product">+ Cadastrar Produto</button>
                    <input id="search-field" type="text" placeholder="buscar..." />
                    <button id="search-button">Buscar</button>
                </div>
                <div id="card-galery">
                    <c:forEach var="c" items="${produtos}">
                        <div class="product-card" key="${c.id}">
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
            <div id="overlay">
                <div id="employee-modal">
                    <h1 id="modal-title">Cadastro de Produtos</h1>
                    <form action="CadastroProdutoServlet" method="POST">
                        <div class="field-wrapper">
                            <label>Nome: *</label>
                            <input class="input-field" name="nome" type="text" />
                        </div>
                        <div class="field-wrapper">
                            <label for="unity-name">Categoria *</label>
                            <input class="input-field" name="categoria" type="text" />
                        </div>
                        <div class="field-wrapper">
                            <label>Fabricante *</label>
                            <input class="input-field" name="fabricante" type="text" />
                        </div>
                        <div class="field-wrapper">
                            <label>Descrição *</label>
                            <input class="input-field" name="descricao" type="text" />
                        </div>
                        <div class="field-wrapper">
                            <label>Valor *</label>
                            <input class="input-field" name="valor" type="text" />
                        </div>
                        <div class="field-wrapper">
                            <button class="form-button" id="cancel-button" type="reset">Cancelar</button>
                            <button class="form-button" id="submit-button " type="submit">Cadastrar</button>
                        </div>
                    </form>
                </div>
            </div>
    </body>
</html>
