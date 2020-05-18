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

        <title>Home</title>
    </head>
    <body>
        <jsp:include page="/ListarFuncionarioServlet" flush="true" />
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
                    <button id="new-unity">+ Cadastrar Unidade</button>
                    <input id="search-field" type="text" placeholder="buscar..." />
                    <button id="search-button">Buscar</button>
                </div>
                <div id="card-galery">
                    <c:forEach var="c" items="${unidades}">
                        <div class="unity-card" key="${c.id}">
                            <div class="unity-img"></div>
                            <h1 class="unity-name">Unidade ${c.nome}</h1>
                            <span class="unity-location">Localização - ${c.cidade}-${c.estado}</span>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div id="overlay" style="display:flex">
            <div id="unity-modal">
                <h1 id="modal-title"> Unidade</h1>
                <form action="" method="POST">
                    <div class="field-wrapper">
                        <label for="unity-name">Nome: *</label>
                        <input class="input-field" id="unity-name" name="nome" type="text" disabled/>
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-city">Cidade: *</label>
                        <input class="input-field" id="unity-city" name="cidade" type="text" disabled/>
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-estate">UF: *</label>
                        <input class="input-field" id="unity-estate" name="estado" type="text" disabled/>
                    </div>
                    <div class="field-wrapper">
                        <button class="edit-form-button" id="cancel-button" type="reset">Cancelar</button>
                        <button class="edit-form-button" id="edit-button" type="button">Editar</button>
                        <button class="edit-form-button" id="submit-button " type="submit">Salavar</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>