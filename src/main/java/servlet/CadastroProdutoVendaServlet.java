/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.util.Date;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Venda;
import model.ProdutoVenda;

/**
 *
 * @author Marcelo
 */
public class CadastroProdutoVendaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int qtdProdutos = Integer.parseInt(request.getParameter("size"));
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        int clientId = Integer.parseInt(request.getParameter("clientId"));
        int unityId = Integer.parseInt(request.getParameter("unityId"));
        double total = Double.parseDouble(request.getParameter("total"));
        ArrayList<ProdutoVenda> produtos = new ArrayList<>();
        Date now = new Date();

        for (int i = 1; i <= qtdProdutos; i++) {
            int idProduto = Integer.parseInt(request.getParameter("id" + i));
            int quantidade = Integer.parseInt(request.getParameter("amount" + i));
            produtos.add(new ProdutoVenda(idProduto, quantidade));//int idProduto, int quantidade
        }
        //int idFuncionario, int idCliente, int idUnidade, double valor, Date dataVenda, List<ProdutoVenda> produtos
        Venda venda = new Venda(employeeId, clientId, unityId, total, now, produtos);
        boolean cadastroDB = dao.VendasDAO.salvar(venda);

        String url = "";
        if (cadastroDB) {
            url = "/ListarProdutoVendaServlet";
        } else {
            url = "/erro.jsp";
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}
