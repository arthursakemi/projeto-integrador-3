<%--
    Document   : funcionarios
    Created on : 09/05/2020, 22:19:26
    Author     : Marcelo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="./CSS/base-style.css" />
        <link rel="stylesheet" href="./CSS/funcionarios.css" />
        <script src="./JS/funcionarios.js" defer></script>
        <title>Home</title>
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
                    <button id="new-employee">+ Cadastrar Funcionario</button>
                    <input id="search-field" type="text" placeholder="buscar..." />
                    <button id="search-button">Buscar</button>
                </div>
                <div id="employee-table">
                    <c:forEach var="c" items="${funcionarios}">
                        <div class="employee-row" key="${c.id}">
                            <span>${c.nome}</span>
                            <span>${c.cidade} - ${c.uf}</span>
                            <span>${c.cpf}</span>
                            <span>${c.celular}</span>
                            <div class="options"></div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div id="overlay">
            <div class="modal" id="employee-modal">
                <h1 class="modal-title">Cadastro de Funcionarios</h1>
                <form action="CadastroFuncionarioServlet" method="POST">
                    <div class="field-wrapper">
                        <label>Nome: *</label>
                        <input class="input-field" name="nome" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-name">Email *</label>
                        <input class="input-field" name="email" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label>CPF: *</label>
                        <input class="input-field" name="cpf" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label>CEP: *</label>
                        <input class="input-field" name="cep" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label>Cidade: *</label>
                        <input class="input-field" name="cidade" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label>Estado: *</label>
                        <input class="input-field" name="uf" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label>Telefone: </label>
                        <input class="input-field" name="telefone" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label>Celular: *</label>
                        <input class="input-field" name="celular" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label>Endereço: *</label>
                        <input class="input-field" name="endereco" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label>Complemento: *</label>
                        <input class="input-field" name="complemento" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label>Unidade: *</label>
                        <input class="input-field" name="unidade" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label>Area: *</label>
                        <input class="input-field" name="area" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label>Cargo: *</label>
                        <input class="input-field" name="cargo" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label>Salario: *</label>
                        <input class="input-field" name="salario" type="text" />
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
