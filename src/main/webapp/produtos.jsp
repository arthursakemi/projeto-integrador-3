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
        <title>Produtos - TableTop</title>
    </head>
    <body>
        <div id="header">
            <h1>TableTop</h1>
            <p id="user-name">Nome do Usuário</p>
        </div>
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
                <!-- esperar servlet para renderizar categorias do banco
                
                <button id="todos">Todos</button>
                <button id="cartas">Cartas</button>
                <button id="infantis">Infantis</button>
                <button id="logica">Logica</button>
                <button id="rpg">RPG</button>
                <button id="coop">Cooperativo</button>
                
                -->
            </div>
            <div id="produtos-categoria">
                <!-- esperar servlet pra renderizar produtos disponíveis no banco -->
            </div>
        </div>
    </body>
</html>
