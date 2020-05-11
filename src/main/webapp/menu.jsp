<%-- 
    Document   : menu
    Created on : 09/05/2020, 22:17:57
    Author     : Marcelo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu - TableTop</title>
        <link rel="stylesheet" type="text/css" href="./CSS/base-style.css" />
    </head>
    <body>
        <div id="main">
            <header>
                <h1><a href="menu.jsp">TableTop</a></h1>
                <div id="user-info">
                    <p id="user-name">Nome do Usuário</p>
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
        </div>
    </body>
</html>
