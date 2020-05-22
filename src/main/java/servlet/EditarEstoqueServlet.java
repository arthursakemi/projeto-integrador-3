/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.EstoqueDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Estoque;

/**
 *
 * @author Sakemi
 */
public class EditarEstoqueServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        int id = Integer.parseInt(request.getParameter("id"));
        int idProduto = Integer.parseInt(request.getParameter("idProduto"));
        int idUnidade = Integer.parseInt(request.getParameter("idUnidade"));
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));

        Estoque estoque = new Estoque(id, idProduto, idUnidade, quantidade);
        boolean gravacaoDB = EstoqueDAO.atualizar(estoque);

        String url = "";
        if (gravacaoDB) {
            request.setAttribute("cadastroOK", true);
            url = "/ListarEstoqueServlet";
        } else {
            url = "/erro.jsp";
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
