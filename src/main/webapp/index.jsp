<%--
    Document   : index
    Created on : 21/05/2020, 18:09:53
    Author     : Marcelo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="./CSS/index.css" />
        <title>Login - Home</title>
    </head>
    <body>
        <header id="header">
            <div id="logo-container">
                <img id="logo" src="./images/ten-sided-dice-hi.png" alt="" />
            </div>
            <div id="title-container">
                <img id="title" src="./images/title.svg" />
            </div>
        </header>
        <div id="body">
            <h1 id="welcome">Bem Vindo de volta!</h1>

            <div id="login-card">
                <form id="login-form" action="LoginServlet" method="POST">
                    <h1 id="login-title">Login</h1>
                    <input class="login-input" type="text" placeholder="usuário" name="usuario"/>
                    <input class="login-input" type="password" placeholder="senha" name="senha"/>
                    <input id="login-button" type="submit" value="Login"></input>
                    <h2 style="color: red"><c:out value="${msgErro}"/></h2>
                </form>
            </div>
        </div>
    </body>
</html>

