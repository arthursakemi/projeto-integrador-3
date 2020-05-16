/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.ClienteDAO;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cliente;

/**
 *
 * @author Sakemi
 */
public class CadastroClienteServlet extends HttpServlet {
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

        Cliente cliente = new Cliente(nome, email, cpf, cidade, uf, telefone, celular, cep, endereco, complemento, true);
        
        ClienteDAO.salvar(cliente);
    }
}
