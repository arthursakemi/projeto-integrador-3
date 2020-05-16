<%--
    Document   : clientes
    Created on : 09/05/2020, 22:19:13
    Author     : Marcelo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="./CSS/base-style.css" />
        <link rel="stylesheet" href="./CSS/clientes.css" />
        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
        <script src="./JS/clientes.js" defer></script>
        <title>Clientes - TableTop</title>
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
                <a class="button" href="./produtos.jsp">Produtos</a>
                <a class="button" href="./clientes.jsp">Clientes</a>
                <a class="button" href="./funcionarios.jsp">Funcionarios</a>
                <a class="button" href="./unidades.jsp">Unidades</a>
                <a class="button" href="./vendas.jsp">Vendas</a>
                <a class="button" href="./relatorios.jsp">Relatorios</a>
            </aside>
            <div id="content">
                <div id="search-bar">
                    <button id="new-customer">+ Cadastrar Cliente</button>
                    <input id="search-field" type="text" placeholder="buscar..." />
                    <button id="search-button">Buscar</button>
                </div>
                <div id="client-table"></div>
            </div>
        </div>

        <div id="overlay">
            <div id="customer-modal">
                <h1 id="modal-title">Cadastro de Cliente</h1>
                <form action="CadastroClienteServlet" method="POST">
                    <div class="field-wrapper">
                        <label for="customer-name">Nome: *</label>
                        <input class="input-field" id="customer-name" name="nome" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-name">Email *</label>
                        <input class="input-field" id="unity-name" name="email" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label for="cpf">CPF: *</label>
                        <input class="input-field" id="cpf" name="cpf" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label for="cep">CEP: *</label>
                        <input class="input-field" id="cep" name="cep" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label for="city">Cidade: *</label>
                        <input class="input-field" id="city" name="cidade" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-estate">Estado: *</label>
                        <input class="input-field" id="unity-estate" name="uf" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-estate">Telefone: </label>
                        <input class="input-field" id="unity-estate" name="telefone" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-estate">Celular: *</label>
                        <input class="input-field" id="unity-estate" name="celular" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-estate">Endereço: *</label>
                        <input class="input-field" id="unity-estate" name="endereco" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-estate">Complemento: *</label>
                        <input class="input-field" id="unity-estate" name="complemento" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <button class="form-button" id="cancel-button">Cancelar</button>
                        <button class="form-button" id="submit-button " type="submit">Cadastrar</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
