<%--
    Document   : unidades
    Created on : 09/05/2020, 22:19:34
    Author     : Marcelo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="./CSS/base-style.css" />
        <link rel="stylesheet" href="./CSS/unidades.css" />
        <script src="./JS/unidades.js" defer></script>
        <title>Home</title>
    </head>
    <body>
        <header id="header">
            <div id="logo-container">
                <img id="logo" src="./images/ten-sided-dice-hi.png" alt="" />
            </div>
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
                <a class="button" href="./produtos.jsp">Produtos</a>
                <a class="button" href="./clientes.jsp">Clientes</a>
                <a class="button" href="./funcionarios.jsp">Funcionarios</a>
                <a class="button" href="./unidades.jsp">Unidades</a>
                <a class="button" href="./vendas.jsp">Vendas</a>
                <a class="button" href="./relatorios.jsp">Relatorios</a>
            </aside>
            <div id="content">
                <div id="search-bar">
                    <button id="new-unity">+ Cadastrar Unidade</button>
                    <input id="search-field" type="text" placeholder="buscar..." />
                    <button id="search-button">Buscar</button>
                </div>
                <div id="card-galery"></div>
            </div>
        </div>
        <div id="overlay">
            <div id="unity-modal">
                <h1 id="modal-title">Cadastro de Unidade</h1>
                <form action="/CadastroUnidadeServlet" method="POST">
                    <div class="field-wrapper">
                        <label for="unity-name">Nome: *</label>
                        <input class="input-field" id="unity-name" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-city">Cidade: *</label>
                        <input class="input-field" id="unity-city" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-estate">Estado: *</label>
                        <input class="input-field" id="unity-estate" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <button class="form-button" id="cancel-button">Cancelar</button>
                        <input class="form-button" id="submit-button " type="submit" value="Cadastrar" />
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
