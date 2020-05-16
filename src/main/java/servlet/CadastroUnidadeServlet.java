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
        System.out.println(request);
        
        Unidade unidade = new Unidade("Grajau", "Sao Paulo", "SP", true);
        UnidadesDAO.salvar(unidade);
    }
}
