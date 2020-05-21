<%-- 
    Document   : index
    Created on : 21/05/2020, 18:09:53
    Author     : Marcelo
--%>

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
        </header>
        <div id="body">
            <h1 id="welcome">Bem Vindo de volta!</h1>

            <div id="login-card">
                <form id="login-form" action="">
                    <h1 id="login-title">Login</h1>
                    <input class="login-input" type="text" placeholder="usuário" />
                    <input class="login-input" type="text" placeholder="senha" />
                    <a id="login-button" href="./menu.jsp">Login</a>
                </form>
            </div>
        </div>
    </body>
</html>

