package servlet;

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String nome = request.getParameter("nome");
        String categoria = request.getParameter("categoria");
        String fabricante = request.getParameter("fabricante");
        String descricao = request.getParameter("descricao");
        String valorString = request.getParameter("valor");

        //Cast valorString to valor double
        double valor = Double.parseDouble(valorString);
        
        //String nome, String categoria, String fabricante, String descricao, double valor, boolean ativo
        Produto produto = new Produto(nome, categoria, fabricante, descricao, valor, true);
        dao.ProdutoDAO.salvar(produto);
    }
}
