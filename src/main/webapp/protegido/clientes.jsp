<%--
    Document   : clientes
    Created on : 09/05/2020, 22:19:13
    Author     : Marcelo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="./CSS/base-style.css" />
        <link rel="stylesheet" href="./CSS/clientes.css" />
        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
        <script src="./JS/clientes.js" defer></script>
        <script src="./JS/base.js" defer></script>
        <script src="./JS/consultaCEP.js" defer></script>
        <title>Clientes - TableTop</title>
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
                <p id="username">username</p>
                <img id="avatar" src="../images/avatar.svg" alt="" />
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
                    <button id="new-customer">+ Cadastrar Cliente</button>
                    <input id="search-field" type="text" placeholder="buscar..." />
                    <button id="search-button">Buscar</button>
                </div>
                <div class="client-table">
                    <div class="client-table-head">
                        <span>Nome</span>
                        <span>Cidade</span>
                        <span>CPF</span>
                        <span>Celular</span>
                        <div class="options"></div>
                    </div>
                    <div id="clients-table-body">
                        <c:forEach var="c" items="${clientes}">
                            <div class="client-row" onclick="showEditModal(`${c.id}`, `${c.nome}`, `${c.email}`, `${c.cpf}`, `${c.cep}`, `${c.cidade}`, `${c.uf}`, `${c.telefone}`, `${c.celular}`, `${c.endereco}`, `${c.complemento}`)">
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
        </div>

        <div id="overlay">
            <div class="modal" id="customer-modal">
                <h1 class="modal-title">Cadastro de Cliente</h1>
                <form action="./CadastroClienteServlet" method="POST">
                    <div class="field-wrapper">
                        <label for="customer-name">Nome: *</label>
                        <input class="input-field" id="nome" name="nome" type="text" maxlength="50"/>
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-name">Email *</label>
                        <input class="input-field" id="email" name="email" type="email" maxlength="50"/>
                    </div>
                    <div class="field-wrapper">
                        <label for="cpf">CPF: *</label>
                        <input class="input-field" id="cpf" name="cpf" type="number" placeholder="Apenas números" maxlength="11"/>
                    </div>
                    <div class="field-wrapper">
                        <label for="cep">CEP: *</label>
                        <input class="input-field" id="cep" name="cep" type="number" maxlength="8" onfocusout="consultaCep(this.value)"/>
                    </div>
                    <div class="field-wrapper">
                        <label for="city">Cidade: *</label>
                        <input class="input-field" id="city" name="cidade" type="text" maxlength="20"/>
                    </div>
                    <div class="field-wrapper">
                        <label for="estate">Estado: *</label>
                        <input class="input-field" id="estate" name="uf" type="text" maxlength="2"/>
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-estate">Telefone: </label>
                        <input class="input-field" id="tel" name="telefone" type="number" placeholder="Apenas números" maxlength="10"/>
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-estate">Celular: *</label>
                        <input class="input-field" id="cel" name="celular" type="number" placeholder="Apenas números" maxlength=11/>
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-estate">Endereço: *</label>
                        <input class="input-field" id="address" name="endereco" type="text" maxlength="100"/>
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-estate">Complemento:</label>
                        <input class="input-field" id="complement" name="complemento" type="text" maxlength="20"/>
                    </div>
                    <div class="field-wrapper">
                        <button class="form-button" id="cancel-button" type="reset">Cancelar</button>
                        <button class="form-button" id="submit-button " type="submit">Cadastrar</button>
                    </div>
                </form>
            </div>
            <!-- modal de edição -->
            <div class="modal" id="edit-modal">
                <h1 class="modal-title">Editar Cliente</h1>
                <form action="./EditarClienteServlet" method="POST">
                    <div class="field-wrapper" style="display:none">
                        <input class="input-field" id="edit-id" name="id" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <label for="customer-name">Nome: *</label>
                        <input class="input-field" id="edit-name" name="nome" type="text" maxlength="50"/>
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-name">Email *</label>
                        <input class="input-field" id="edit-email" name="email" type="email" maxlength="50" />
                    </div>
                    <div class="field-wrapper">
                        <label for="cpf">CPF: *</label>
                        <input class="input-field" id="edit-cpf" name="cpf" type="number" placeholder="Apenas números" maxlength="11" />
                    </div>
                    <div class="field-wrapper">
                        <label for="cep">CEP: *</label>
                        <input class="input-field" id="edit-cep" name="cep" type="number" maxlength="8" onfocusout="consultaCep(this.value)"/>
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
                        <input class="input-field" id="edit-tel" name="telefone" type="number" maxlength="10"/>
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-estate">Celular: *</label>
                        <input class="input-field" id="edit-cel" name="celular" type="number" maxlength="11"/>
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-estate">Endereço: *</label>
                        <input class="input-field" id="edit-address" name="endereco" type="text" maxlength="100"/>
                    </div>
                    <div class="field-wrapper">
                        <label for="unity-estate">Complemento:</label>
                        <input class="input-field" id="edit-complement" name="complemento" type="text" maxlength="20"/>
                    </div>
                    <div class="field-wrapper">
                        <button class="form-button" id="edit-cancel-button" type="reset">Cancelar</button>
                        <button class="form-button" id="edit-submit-button " type="submit">Salvar</button>
                    </div>
                </form>
                <!--Form created to submit data of the object to be deleted (updated to ativo false)-->
                <form action="./DeletarClienteServlet" method="POST">
                    <div class="field-wrapper" style="display:none">
                        <input class="input-field" id="delete-id" name="id" type="text" />
                    </div>
                    <div class="field-wrapper">
                        <button class="form-button" id="delete-submit-button " type="submit">Excluir</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
