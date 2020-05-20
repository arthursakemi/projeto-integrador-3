/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Venda;

/**
 *
 * @author Marcelo
 */
public class CadastroProdutoVendaServlet extends HttpServlet{
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String qtdProdutosString = request.getParameter("size");

        
        //Cast variables to the correct type
        int qtdProdutos = Integer.parseInt(qtdProdutosString);
        double valor = Double.parseDouble(valorString);
        
        //String nome, String categoria, String fabricante, String descricao, double valor, boolean ativo
        Produto produto = new Produto(nome, categoria, fabricante, valor, descricao, true);
        boolean cadastroDB = dao.ProdutoDAO.salvar(produto);
        
        String url = "";
        if(cadastroDB) {
            url = "/ListarProdutoServlet";
        } else {
            url = "/erro.jsp";
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
    }
}
