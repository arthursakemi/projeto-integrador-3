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
import model.Estoque;
import utils.GerenciadorConexao;

/**
 *
 * @author Marcelo
 */
public class EstoqueDAO {
    public static boolean salvar(Estoque estoque) {
        boolean retorno = false;
        Connection conexao = null;
        PreparedStatement instrucaoSQL = null;

        try {
            conexao = GerenciadorConexao.abrirConexao();
            instrucaoSQL = conexao.prepareStatement("INSERT INTO estoque "
                    + "(id_produto, id_unidade, quantidade) "
                    + "VALUES(?, ?, ?);",
                    Statement.RETURN_GENERATED_KEYS);

            instrucaoSQL.setInt(1, estoque.getIdProduto());
            instrucaoSQL.setInt(2, estoque.getIdUnidade());
            instrucaoSQL.setInt(3, estoque.getQuantidade());

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
    
    public static boolean atualizar(Estoque estoque) {
        boolean retorno = false;
        Connection conexao = null;
        PreparedStatement instrucaoSQL = null;

        try {
            conexao = GerenciadorConexao.abrirConexao();
            instrucaoSQL = conexao.prepareStatement("UPDATE estoque "
                    + "SET id_produto = ?, id_unidade = ?, quantidade = ? "
                    + "WHERE id = ?;",
                    Statement.RETURN_GENERATED_KEYS);

            instrucaoSQL.setInt(1, estoque.getIdProduto());
            instrucaoSQL.setInt(2, estoque.getIdUnidade());
            instrucaoSQL.setInt(3, estoque.getQuantidade());
            instrucaoSQL.setInt(4, estoque.getId());

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
