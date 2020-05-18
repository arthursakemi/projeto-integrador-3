/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.FuncionarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Funcionario;

/**
 *
 * @author Marcelo
 */
public class EditarFuncionarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String unidadeString = request.getParameter("unidade");
        String area = request.getParameter("area");
        String cargo = request.getParameter("cargo");
        String salarioString = request.getParameter("salario");
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String cpf = request.getParameter("cpf");
        String cidade = request.getParameter("cidade");
        String uf = request.getParameter("uf");
        String telefone = request.getParameter("telefone");
        String celular = request.getParameter("celular");
        String cep = request.getParameter("cep");
        String endereco = request.getParameter("endereco");
        String complemento = request.getParameter("complemento");
        String idString = request.getParameter("id");
        
        //Cast to change type
        int id = Integer.parseInt(idString);
        int unidade = Integer.parseInt(unidadeString);
        double salario = Double.parseDouble(salarioString);
        
        //int unidade, String area, String cargo, double salario, int id, String nome, String email, String cpf, String cidade, String uf, String telefone, String celular, String cep, String endereco, String complemento, boolean ativo
        Funcionario funcionario = new Funcionario(unidade, area, cargo, salario, id, nome, email, cpf, cidade, uf, telefone, celular, cep, endereco, complemento, true);
        boolean gravacaoDB = FuncionarioDAO.alterar(funcionario);
        
        String url = "";
        if (gravacaoDB) {
            request.setAttribute("cadastroOK", true);
            url = "/ListarFuncionarioServlet";
        } else {
            url = "/erro.jsp";
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
    }
}
