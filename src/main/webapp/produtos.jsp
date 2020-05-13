<%--
    Document   : produtos
    Created on : 09/05/2020, 22:19:03
    Author     : Marcelo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./CSS/base-style.css" />
        <title>Produtos - TableTop</title>
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
        <div id="lista-menu">
            <a href="produtos.jsp" id="produtos-menu">Produtos</a>
            <a href="clientes.jsp" id="clientes-menu">Clientes</a>
            <a href="funcionarios.jsp" id="funcionarios-menu">Funcionários</a>
            <a href="unidades.jsp" id="unidades-menu">Unidades</a>
            <a href="vendas.jsp" id="vendas-menu">Vendas</a>
            <a href="relatorios.jsp" id="relatorios-menu">Relatorios</a>
        </div>
        <div id="content">
            <a href="">+ Cadastrar Produto</a>
            <input type="text" placeholder="Buscar Produto">
            <button id="buscar">Buscar</button>
            <!-- Divs que serão renderizadas ou não (categorias - produtos) -->
            <div id="categorias">

            </div>
            <div id="produtos-categoria">
                <!-- esperar servlet pra renderizar produtos disponíveis no banco -->
            </div>
        </div>
    </body>
</html>
