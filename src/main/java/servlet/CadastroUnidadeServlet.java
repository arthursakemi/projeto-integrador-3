/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.UnidadesDAO;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Unidade;

/**
 *
 * @author Marcelo
 */
public class CadastroUnidadeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String nome = request.getParameter("nome");
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("estado");
        
        Unidade unidade = new Unidade(nome, cidade, estado, true);
        UnidadesDAO.salvar(unidade);
    }
}
