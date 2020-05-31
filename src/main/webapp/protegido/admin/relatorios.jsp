<%--
    Document   : relatorios
    Created on : 09/05/2020, 22:19:57
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
        <link rel="stylesheet" href="./CSS/relatorios.css" />
        <script src="./JS/base.js" defer></script>
        <script src="./JS/relatorios.js" defer></script>
        <title>Home</title>
    </head>
    <body>
        <header id="header">
            <a id="logo-container" href="../menu.jsp">
                <img id="logo" src="../../images/ten-sided-dice-hi.png" alt="" />
            </a>
            <div id="title-container">
                <img id="title" src="../../images/title.svg" />
            </div>
            <div id="user-container">
                <p id="username">${sessionScope.usuario.usuario}</p>
                <img id="avatar" src="../../images/avatar.svg" alt="" />
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
                    <select class="search-field" id="unity" name="unidade" onchange="saleFilter('unity', this.value)">
                        <option value="">Filtro de Unidade</option>
                        <c:forEach var="c" items="${unidades}">
                            <option value='${c.nome}'>${c.nome}</option>
                        </c:forEach>
                    </select>
                    <select class="search-field" id="unity" name="unidade" onchange="saleFilter('customer', this.value)">
                        <option value="">Filtro de Clientes</option>
                        <c:forEach var="c" items="${clientes}">
                            <option value='${c.nome}'>${c.nome}</option>
                        </c:forEach>
                    </select>
                </div>
                <div id="sales-table">
                    <div id="sale-head" >
                        <span>Cliente</span>
                        <span>Unidade</span>
                        <span>CPF</span>
                        <span>Data</span>
                        <span>Total</span>
                        <div class="options"></div>
                    </div>
                    <div id="table-body">
                        <c:forEach var="c" items="${vendas}">
                            <div class="sale-row" unity="${c.nomeUnidade}" customer="${c.nomeCliente}" total=${c.total}>
                                <span>${c.nomeCliente}</span>
                                <span>${c.nomeUnidade}</span>
                                <span>${c.cpfCliente}</span>
                                <span>${c.celCliente}</span>
                                <span>${c.total}</span>
                                <div class="options"></div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div id="total-container">
                    <h1 id="sales-total">Total: R$ 2000.00</h1>
                </div>
            </div>
        </div>

        <div id="overlay">
            <div class="modal" id="synthetic-modal">
                <h1 id="modal-title">Relatório de Vendas</h1>
                <div id="modal-header">
                    <h3>Unidade:</h3>
                    <span>Matriz</span>
                    <h3>Vendas:</h3>
                    <span>20</span>
                </div>
                <div id="sales-list">
                    <div id="modal-list-header">
                        <span>ID</span>
                        <span>Data</span>
                        <span>Valor</span>
                    </div>
                    <div class="modal-row">
                        <span>Venda X</span>
                        <span>21/05/2020</span>
                        <span>R$ 200,00</span>
                    </div>
                    <div class="modal-row">
                        <span>Venda X</span>
                        <span>21/05/2020</span>
                        <span>R$ 200,00</span>
                    </div>
                    <div class="modal-row">
                        <span>Venda X</span>
                        <span>21/05/2020</span>
                        <span>R$ 200,00</span>
                    </div>
                    <div class="modal-row">
                        <span>Venda X</span>
                        <span>21/05/2020</span>
                        <span>R$ 200,00</span>
                    </div>
                </div>
                <div id="total">
                    <h3>Total:</h3>
                    <span>R$ 50000,00</span>
                </div>
            </div>

        </div>
    </body>
</html>
