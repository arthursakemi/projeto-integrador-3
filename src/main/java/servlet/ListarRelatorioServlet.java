/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.ClienteDAO;
import dao.RelatorioDAO;
import dao.UnidadesDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cliente;
import model.RelatorioProduto;
import model.RelatorioVenda;
import model.Unidade;

/**
 *
 * @author Marcelo
 */
public class ListarRelatorioServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        List<RelatorioVenda> vendas = RelatorioDAO.listarVendas();
        request.setAttribute("vendas", vendas);

        List<RelatorioProduto> produtosVenda = RelatorioDAO.listarProdutosVenda();
        request.setAttribute("produtosVenda", produtosVenda);

        List<Unidade> unidades = UnidadesDAO.listarUnidades();
        request.setAttribute("unidades", unidades);

        List<Cliente> clientes = ClienteDAO.listarClientes();
        request.setAttribute("clientes", clientes);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/relatorios.jsp");
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
