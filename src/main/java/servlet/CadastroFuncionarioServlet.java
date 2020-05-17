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
import model.Funcionario;

/**
 *
 * @author Marcelo
 */
public class CadastroFuncionarioServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        String unidadeString = request.getParameter("unidade");
        String area = request.getParameter("area");
        String cargo = request.getParameter("cargo");
        String salarioString = request.getParameter("salario");
        
        double salario = Double.parseDouble(salarioString);
        
        //Casting unidadeString to int
        int unidade = Integer.parseInt(unidadeString);
        
        //int unidade, String area, String cargo, double salario, String nome, String email, String cpf, String cidade, String uf, String telefone, String celular, String cep, String endereco, String complemento, boolean ativo
        Funcionario funcionario = new Funcionario(unidade, area, cargo, salario, nome, email, cpf, cidade, uf, telefone, celular, cep, endereco, complemento, true);
        boolean cadastroDB = dao.FuncionarioDAO.salvar(funcionario);
        
        String url = "";
        if(cadastroDB) {
            url = "/funcionarios.jsp";
        } else {
            url = "/erro.jsp";
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
    }
}
