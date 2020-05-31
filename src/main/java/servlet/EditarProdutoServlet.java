/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Produto;

/**
 *
 * @author Marcelo
 */
public class EditarProdutoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String categoria = request.getParameter("categoria");
        String fabricante = request.getParameter("fabricante");
        String valorString = request.getParameter("valor");
        String descricao = request.getParameter("descricao");
        String idString = request.getParameter("id");
        System.out.println(request.getParameter("id"));
        //Cast valorString to valor double
        double valor = Double.parseDouble(valorString);
        int id = Integer.parseInt(idString);

        //int id, String nome, String categoria, String fabricante, String descricao, double valor, boolean ativo
        Produto produto = new Produto(id, nome, categoria, fabricante, descricao, valor, true);
        boolean cadastroDB = dao.ProdutoDAO.alterar(produto);

        String url = "";
        if (cadastroDB) {
            url = "/protegido/ListarProdutoServlet";
        } else {
            url = "/erro.jsp";
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}
