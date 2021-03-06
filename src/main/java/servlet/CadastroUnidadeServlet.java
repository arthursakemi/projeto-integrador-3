/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.UnidadesDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("estado");
        
        Unidade unidade = new Unidade(nome, cidade, estado, true);
        boolean gravacaoDB = UnidadesDAO.salvar(unidade);
        
        String url = "";
        if (gravacaoDB) {
            request.setAttribute("cadastroOK", true);
            url = "/protegido/ListarUnidadesServlet";
        } else {
            url = "/erro.jsp";
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
    }
}
