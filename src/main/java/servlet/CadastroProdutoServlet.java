package servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Produto;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Marcelo
 */
public class CadastroProdutoServlet extends HttpServlet{
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String categoria = request.getParameter("categoria");
        String fabricante = request.getParameter("fabricante");
        String valorString = request.getParameter("valor");
        String descricao = request.getParameter("descricao");

        //Cast valorString to valor double
        double valor = Double.parseDouble(valorString);
        
        //String nome, String categoria, String fabricante, String descricao, double valor, boolean ativo
        Produto produto = new Produto(nome, categoria, fabricante, valor, descricao, true);
        boolean cadastroDB = dao.ProdutoDAO.salvar(produto);
        
        String url = "";
        if(cadastroDB) {
            url = "/protegido/ListarProdutoServlet";
        } else {
            url = "/erro.jsp";
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
    }
}
