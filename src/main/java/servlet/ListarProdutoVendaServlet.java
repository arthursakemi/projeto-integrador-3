/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.ClienteDAO;
import dao.EstoqueDAO;
import dao.ProdutoDAO;
import dao.UnidadesDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cliente;
import model.EstoqueControle;
import model.Produto;
import model.Unidade;

/**
 *
 * @author Sakemi
 */
public class ListarProdutoVendaServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        List<EstoqueControle> estoque = EstoqueDAO.listarEstoque();
        request.setAttribute("estoque", estoque);

        List<Cliente> clientes = ClienteDAO.listarClientes();
        request.setAttribute("clientes", clientes);

        List<Unidade> unidades = UnidadesDAO.listarUnidades();
        request.setAttribute("unidades", unidades);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/protegido/vendas.jsp");
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
