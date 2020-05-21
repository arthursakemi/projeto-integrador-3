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
        <script src="./JS/base.js" defer></script>
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
                <a class="button" href="./ListarProdutoVendaServlet">Vendas</a>
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
                        <div class="employee-row" key="${c.id}" onclick="showEditModal(`${c.id}`, `${c.nome}`, `${c.email}`, `${c.cpf}`, `${c.cep}`, `${c.cidade}`, `${c.uf}`, `${c.telefone}`, `${c.celular}`, `${c.endereco}`, `${c.complemento}`, `${c.unidade}`, `${c.area}`, `${c.cargo}`, `${c.salario}`)">
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
                        <label for="customer-name">Nome: *</label>
                        <input class="input-field" id="name" name="nome" type="text" maxlength="50"/>
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-name">Email *</label>
                        <input class="input-field" id="email" name="email" type="email" maxlength="50"/>
                    </div>
                    <div class="field-wrapper">
                        <label for="cpf">CPF: *</label>
                        <input class="input-field" id="cpf" name="cpf" type="number" maxlength="11"/>
                    </div>
                    <div class="field-wrapper">
                        <label for="cep">CEP: *</label>
                        <input class="input-field" id="cep" name="cep" type="number" maxlength="8"/>
                    </div>
                    <div class="field-wrapper">
                        <label for="city">Cidade: *</label>
                        <input class="input-field" id="city" name="cidade" type="text" maxlength="20"/>
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-estate">Estado: *</label>
                        <input class="input-field" id="estate" name="uf" type="text" maxlength="2"/>
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-estate">Telefone: </label>
                        <input class="input-field" id="tel" name="telefone" type="number" maxlength="10" placeholder="1155554444"/>
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-estate">Celular: *</label>
                        <input class="input-field" id="cel" name="celular" type="number" maxlength="11" placeholder="11955554444"/>
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-estate">Endereço: *</label>
                        <input class="input-field" id="address" name="endereco" type="text" maxlength="100"/>
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-estate">Complemento: *</label>
                        <input class="input-field" id="complement" name="complemento" type="text" maxlength="20"/>
                    </div>
                    <div class="field-wrapper">
                        <label>Unidade: *</label>
                        <input class="input-field" id="unity" name="unidade" type="number" maxlength="4"/>
                    </div>
                    <div class="field-wrapper">
                        <label>Area: *</label>
                        <input class="input-field" id="area" name="area" type="text" maxlength="20"/>
                    </div>
                    <div class="field-wrapper">
                        <label>Cargo: *</label>
                        <input class="input-field" id="position" name="cargo" type="text" maxlength="20"/>
                    </div>
                    <div class="field-wrapper">
                        <label>Salario: *</label>
                        <input class="input-field" id="salary" name="salario" type="number" maxlength="7" placeholder="1500.00"/>
                    </div>
                    <div class="field-wrapper">
                        <button class="form-button" id="cancel-button" type="reset">Cancelar</button>
                        <button class="form-button" id="submit-button " type="submit">Cadastrar</button>
                    </div>
                </form>
            </div>

            <div class="modal" id="edit-modal">
                <h1 class="modal-title">Editar Funcionario</h1>
                <form action="EditarFuncionarioServlet" method="POST">
                    <div class="field-wrapper" style="display:none">
                        <input class="input-field" id="edit-id" name="id" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label for="customer-name">Nome: *</label>
                        <input class="input-field" id="edit-name" name="nome" type="text" maxlength="50"/>
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-name">Email *</label>
                        <input class="input-field" id="edit-email" name="email" type="email" maxlength="50"/>
                    </div>
                    <div class="field-wrapper">
                        <label for="cpf">CPF: *</label>
                        <input class="input-field" id="edit-cpf" name="cpf" type="number" maxlength="11"/>
                    </div>
                    <div class="field-wrapper">
                        <label for="cep">CEP: *</label>
                        <input class="input-field" id="edit-cep" name="cep" type="number" maxlength="8"/>
                    </div>
                    <div class="field-wrapper">
                        <label for="city">Cidade: *</label>
                        <input class="input-field" id="edit-city" name="cidade" type="text" maxlength="20"/>
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-estate">Estado: *</label>
                        <input class="input-field" id="edit-estate" name="uf" type="text" maxlength="2"/>
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-estate">Telefone: </label>
                        <input class="input-field" id="edit-tel" name="telefone" type="number" maxlength="10" placeholder="1155554444"/>
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-estate">Celular: *</label>
                        <input class="input-field" id="edit-cel" name="celular" type="number" maxlength="11" placeholder="11955554444"/>
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-estate">Endereço: *</label>
                        <input class="input-field" id="edit-address" name="endereco" type="text" maxlength="100"/>
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-estate">Complemento: *</label>
                        <input class="input-field" id="edit-complement" name="complemento" type="text" maxlength="20"/>
                    </div>
                    <div class="field-wrapper">
                        <label>Unidade: *</label>
                        <input class="input-field" id="edit-unity" name="unidade" type="number" maxlength="4"/>
                    </div>
                    <div class="field-wrapper">
                        <label>Area: *</label>
                        <input class="input-field" id="edit-area" name="area" type="text" maxlength="20"/>
                    </div>
                    <div class="field-wrapper">
                        <label>Cargo: *</label>
                        <input class="input-field" id="edit-position" name="cargo" type="text" maxlength="20"/>
                    </div>
                    <div class="field-wrapper">
                        <label>Salario: *</label>
                        <input class="input-field" id="edit-salary" name="salario" type="number" maxlength="7" placeholder="1500.00"/>
                    </div>
                    <div class="field-wrapper">
                        <button class="form-button" id="edit-cancel-button" type="reset">Cancelar</button>
                        <button class="form-button" id="edit-submit-button " type="submit">Atualizar</button>
                    </div>
                </form>
                <form action="DeletarFuncionarioServlet" method="POST">
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
