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
        <script src="./JS/base.js" defer></script>
        <title>Produtos - TableTop</title>
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
                <div id="search-bar">
                    <button id="new-product">+ Cadastrar Produto</button>
                    <input id="search-field" type="text" placeholder="Buscar por nome ou categoria do produto..." oninput="filterProductList(this.value)"/>
                    <button id="clear-button">Limpar Filtros</button>
                </div>
                <div id="card-galery">
                    <c:forEach var="c" items="${produtos}" >
                        <div class="product-card" key="${c.id}" nome=`${c.nome}` categoria=`${c.categoria}` onclick="showEditModal(`${c.id}`, `${c.nome}`, `${c.categoria}`, `${c.fabricante}`, `${c.descricao}`, `${c.valor}`)">
                            <div class="product-img"></div>
                            <h1 class="product-name">${c.nome}</h1>
                            <div class="card-text">
                                <span class="price">R$ ${c.valor}</span>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div id="overlay">
                <div class="modal" id="product-modal">
                    <h1 class="modal-title">Cadastro de Produtos</h1>
                    <form action="./CadastroProdutoServlet" method="POST">
                        <div class="field-wrapper">
                            <label>Nome: *</label>
                            <input class="input-field" id="name" name="nome" type="text" maxlength="30"/>
                        </div>
                        <div class="field-wrapper">
                            <label>Categoria *</label>
                            <select class="input-field" id="category" name="categoria">
                                <option value=""></option>
                                <option value="Estrategia">Estrategia</option>
                                <option value="Cartas">Cartas</option>
                                <option value="Infantil">Infantil</option>
                                <option value="Logica">Logica</option>
                                <option value="RPG">RPG</option>
                                <option value="Cooperativo">Cooperativo</option>
                            </select>
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
                            <input class="input-field" id="price" name="valor" type="number" maxlength="7" step="0.01"/>
                        </div>
                        <div class="field-wrapper">
                            <button class="form-button" id="cancel-button" type="reset">Cancelar</button>
                            <button class="form-button" id="submit-button " type="submit">Cadastrar</button>
                        </div>
                    </form>
                </div>

                <div class="modal" id="edit-product-modal">
                    <h1 class="modal-title">Editar Produto</h1>
                    <form action="./EditarProdutoServlet" method="POST">
                        <div class="field-wrapper" style="display:none">
                            <input class="input-field" id="edit-id" name="id" type="text" />
                        </div>
                        <div class="field-wrapper">
                            <label>Nome: *</label>
                            <input class="input-field" id="edit-name" name="nome" type="text" maxlength="30"/>
                        </div>
                        <div class="field-wrapper">
                            <label>Categoria *</label>
                            <select class="input-field" id="edit-category" name="categoria">
                                <option value=""></option>
                                <option value="Estrategia">Estrategia</option>
                                <option value="Cartas">Cartas</option>
                                <option value="Infantil">Infantil</option>
                                <option value="Logica">Logica</option>
                                <option value="RPG">RPG</option>
                                <option value="Cooperativo">Cooperativo</option>
                            </select>
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
                            <input class="input-field" id="edit-price" name="valor" type="number" maxlength="7" step="0.01"/>
                        </div>
                        <div class="field-wrapper">
                            <button class="form-button" id="edit-cancel-button" type="reset">Cancelar</button>
                            <button class="form-button" id="edit-submit-button " type="submit">Atualizar</button>
                        </div>
                    </form>
                    <form action="./DeletarProdutoServlet" method="POST">
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
