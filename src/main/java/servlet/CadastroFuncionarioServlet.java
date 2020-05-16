/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Funcionario;
import model.Unidade;

/**
 *
 * @author Marcelo
 */
public class CadastroFuncionarioServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
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
        
        //Casting unidadeString to int
        int unidade = Integer.parseInt(unidadeString);
                
        Funcionario funcionario = new Funcionario(unidade, area, cargo, nome, email, cpf, cidade, uf, telefone, celular, cep, endereco, complemento, true);
        dao.FuncionarioDAO.salvar(funcionario);
    }
}
