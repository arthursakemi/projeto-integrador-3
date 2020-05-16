/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import model.Produto;
import utils.GerenciadorConexao;

/**
 *
 * @author Marcelo
 */
public class ProdutoDAO {
    public static boolean salvar(Produto produto) {

        boolean retorno = false;
        Connection conexao = null;
        PreparedStatement instrucaoSQL = null;

        try {

            conexao = GerenciadorConexao.abrirConexao();
            instrucaoSQL = conexao.prepareStatement("INSERT INTO produtos "
                    + "(nome, categoria, valor, descricao, ativo) "
                    + "VALUES(?, ?, ?, ?, ?);",
                    Statement.RETURN_GENERATED_KEYS);

            instrucaoSQL.setString(1, produto.getNome());
            instrucaoSQL.setString(2, produto.getCategoria());
            instrucaoSQL.setDouble(3, produto.getValor());
            instrucaoSQL.setString(4, produto.getDescricao());
            instrucaoSQL.setBoolean(5, produto.isAtivo());

            int linhasAfetadas = instrucaoSQL.executeUpdate();

            retorno = linhasAfetadas > 0;

        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println(ex.getMessage());
            retorno = false;
        } finally {

            try {
                if (instrucaoSQL != null) {
                    instrucaoSQL.close();
                }

                GerenciadorConexao.fecharConexao();

            } catch (SQLException ex) {
            }
        }

        return retorno;
    }
}
