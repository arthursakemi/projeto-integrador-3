<%--
    Document   : unidades
    Created on : 09/05/2020, 22:19:34
    Author     : Marcelo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="./CSS/base-style.css" />
        <link rel="stylesheet" href="./CSS/unidades.css" />
        <script src="./JS/unidades.js" defer></script>
        <script src="./JS/base.js" defer></script>
        <title>Unidades - TableTop</title>
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
                <a class="button" href="./ListarProdutoVendaServlet">Vendas</a>
                <a class="button" href="./relatorios.jsp">Relatorios</a>
            </aside>
            <div id="content">
                <div id="search-bar">
                    <button id="new-unity">+ Cadastrar Unidade</button>
                    <input id="search-field" type="text" placeholder="buscar..." />
                    <button id="search-button">Buscar</button>
                </div>
                <div id="card-galery">
                    <c:forEach var="c" items="${unidades}">
                        <div class="unity-card" key="${c.id}" onclick="showEditModal(`${c.id}`, `${c.nome}`, `${c.cidade}`, `${c.estado}`)">
                            <div class="unity-img"></div>
                            <h1 class="unity-name">Unidade ${c.nome}</h1>
                            <span class="unity-location">Localização - ${c.cidade}-${c.estado}</span>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div id="overlay">
            <div class="modal" id="unity-modal">
                <h1 class="modal-title">Cadastro de Unidade</h1>
                <form action="CadastroUnidadeServlet" method="POST">
                    <div class="field-wrapper">
                        <label for="unity-name">Nome: *</label>
                        <input class="input-field" id="unity-name" name="nome" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-city">Cidade: *</label>
                        <input class="input-field" id="unity-city" name="cidade" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-estate">UF: *</label>
                        <input class="input-field" id="unity-estate" name="estado" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <button class="form-button" id="cancel-button" type="reset">Cancelar </button>
                        <button class="form-button" id="submit-button " type="submit">Cadastrar</button>
                    </div>
                </form>
            </div>
            <div class="modal" id="edit-modal" style="display: none">
                <h1 class="modal-title">Editar Unidade</h1>
                <form action="EditarUnidadeServlet" method="POST">
                    <div class="field-wrapper" style="display: none">
                        <input class="input-field" id="edit-unity-id" name="id" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-name">Nome: *</label>
                        <input class="input-field" id="edit-unity-name" name="nome" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label for="edit-unity-city">Cidade: *</label>
                        <input class="input-field" id="edit-unity-city" name="cidade" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label for="edit-unity-estate">UF: *</label>
                        <input class="input-field" id="edit-unity-estate" name="estado" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <button class="form-button" id="edit-cancel-button" type="reset">Cancelar </button>
                        <button class="form-button" id="edit-submit-button " type="submit">Salvar</button>
                    </div>
                </form>
                <form action="DeletarUnidadeServlet" method="POST">
                    <div class="field-wrapper" style="display: none">
                        <input class="input-field" id="delete-unity-id" name="id" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <button class="form-button" id="delete-submit-button" type="submit">Deletar</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
