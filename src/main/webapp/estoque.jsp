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

        <title>Estoque - TableTop</title>
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
                    <button id="new-product">+ Cadastrar Produto</button>
                    <input id="search-field" type="text" placeholder="buscar..." />
                    <button id="search-button">Buscar</button>
                </div>
                <div id="card-galery">
                    <c:forEach var="c" items="${produtos}" >
                        <div class="product-card" key="${c.id}" onclick="showEditModal(`${c.id}`, `${c.nome}`, `${c.categoria}`, `${c.fabricante}`, `${c.descricao}`, `${c.valor}`)">
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
                <div class="modal" id="product-modal">
                    <h1 class="modal-title">Cadastro de Produtos</h1>
                    <form action="CadastroProdutoServlet" method="POST">
                        <div class="field-wrapper">
                            <label>Nome: *</label>
                            <input class="input-field" id="name" name="nome" type="text" maxlength="30"/>
                        </div>
                        <div class="field-wrapper">
                            <label>Categoria *</label>
                            <input class="input-field" id="category" name="categoria" type="text" maxlength="20"/>
                        </div>
                        <div class="field-wrapper">
                            <label>Fabricante *</label>
                            <input class="input-field" id="manufacturer" name="fabricante" type="text" maxlength="30"/>
                        </div>
                        <div class="field-wrapper">
                            <label>Descrição *</label>
                            <input class="input-field" id="description" name="descricao" type="text" maxlength="255"/>
                        </div>
                        <div class="field-wrapper">
                            <label>Valor *</label>
                            <input class="input-field" id="price" name="valor" type="number" maxlength="7"/>
                        </div>
                        <div class="field-wrapper">
                            <button class="form-button" id="cancel-button" type="reset">Cancelar</button>
                            <button class="form-button" id="submit-button " type="submit">Cadastrar</button>
                        </div>
                    </form>
                </div>

                <div class="modal" id="edit-product-modal">
                    <h1 class="modal-title">Editar Produto</h1>
                    <form action="EditarProdutoServlet" method="POST">
                        <div class="field-wrapper" style="display:none">
                            <input class="input-field" id="edit-id" name="id" type="text" />
                        </div>
                        <div class="field-wrapper">
                            <label>Nome: *</label>
                            <input class="input-field" id="edit-name" name="nome" type="text" maxlength="30"/>
                        </div>
                        <div class="field-wrapper">
                            <label>Categoria *</label>
                            <input class="input-field" id="edit-category" name="categoria" type="text" maxlength="20"/>
                        </div>
                        <div class="field-wrapper">
                            <label>Fabricante *</label>
                            <input class="input-field" id="edit-manufacturer" name="fabricante" type="text" maxlength="30"/>
                        </div>
                        <div class="field-wrapper">
                            <label>Descrição *</label>
                            <input class="input-field" id="edit-description" name="descricao" type="text" maxlength="255"/>
                        </div>
                        <div class="field-wrapper">
                            <label>Valor *</label>
                            <input class="input-field" id="edit-price" name="valor" type="number" maxlength="7"/>
                        </div>
                        <div class="field-wrapper">
                            <button class="form-button" id="edit-cancel-button" type="reset">Cancelar</button>
                            <button class="form-button" id="edit-submit-button " type="submit">Atualizar</button>
                        </div>
                    </form>
                    <form action="DeletarProdutoServlet" method="POST">
                        <div class="field-wrapper" style="display:none">
                            <input class="input-field" id="delete-id" name="id" type="text" />
                        </div>
                        <div class="field-wrapper">
                            <button class="form-button" id="delete-submit-button " type="submit">Deletar</button>
                        </div>
                    </form>
                </div>
            </div>
    </body>
</html>
