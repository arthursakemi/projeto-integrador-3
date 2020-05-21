/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.FuncionarioDAO;
import dao.UnidadesDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Funcionario;
import model.Unidade;

/**
 *
 * @author Marcelo
 */
public class ListarFuncionarioServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        List<Funcionario> funcionarios = FuncionarioDAO.listarFuncionarios();
        request.setAttribute("funcionarios", funcionarios);

        List<Unidade> unidades = UnidadesDAO.listarUnidades();
        request.setAttribute("unidades", unidades);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/funcionarios.jsp");
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
