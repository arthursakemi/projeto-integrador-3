/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Estoque;
import model.EstoqueControle;
import model.Unidade;
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

    public static List<EstoqueControle> listarEstoque() {
        List<EstoqueControle> estoque = new ArrayList<>();
        Connection conexao;
        PreparedStatement estoqueStmt = null;

        try {
            conexao = GerenciadorConexao.abrirConexao();
            estoqueStmt = conexao.prepareStatement("SELECT estoque.id, produtos.id AS idProduto, produtos.nome AS nomeProduto, produtos.valor, unidades.id AS idUnidade, unidades.nome AS nomeUnidade, estoque.quantidade FROM estoque "
                    + "INNER JOIN produtos ON produtos.id = estoque.id_produto "
                    + "INNER JOIN unidades ON unidades.id = estoque.id_unidade; ");
            ResultSet rs = estoqueStmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                int idProduto = rs.getInt("idProduto");
                String nomeProduto = rs.getString("nomeProduto");
                double valor = rs.getDouble("valor");
                int idUnidade = rs.getInt("idUnidade");
                String nomeUnidade = rs.getString("nomeUnidade");
                int quantidade = rs.getInt("quantidade");

                estoque.add(new EstoqueControle(id, idProduto, nomeProduto, valor, idUnidade, nomeUnidade, quantidade));
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UnidadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (estoqueStmt != null) {
                    estoqueStmt.close();
                }
                GerenciadorConexao.fecharConexao();
            } catch (SQLException ex) {
            }
        }
        return estoque;
    }
}
