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
                    + "(nome, categoria, fabricante, valor, descricao, ativo) "
                    + "VALUES(?, ?, ?, ?, ?, ?);",
                    Statement.RETURN_GENERATED_KEYS);

            instrucaoSQL.setString(1, produto.getNome());
            instrucaoSQL.setString(2, produto.getCategoria());
            instrucaoSQL.setString(3, produto.getFabricante());
            instrucaoSQL.setDouble(4, produto.getValor());
            instrucaoSQL.setString(5, produto.getDescricao());
            instrucaoSQL.setBoolean(6, produto.isAtivo());

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

    public static List<Produto> listarProdutos() {
        List<Produto> produtos = new ArrayList<>();
        Connection conexao;
        PreparedStatement instrucaoSQL = null;

        try {
            conexao = GerenciadorConexao.abrirConexao();
            instrucaoSQL = conexao.prepareStatement("SELECT * FROM produtos;");
            ResultSet rs = instrucaoSQL.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String nome = rs.getString("nome");
                String categoria = rs.getString("categoria");
                String fabricante = rs.getString("fabricante");
                String descricao = rs.getString("descricao");
                double valor = rs.getDouble("valor");
                boolean ativo = rs.getBoolean("ativo");

                produtos.add(new Produto(id, nome, categoria, fabricante, descricao, valor, ativo));
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UnidadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (instrucaoSQL != null) {
                    instrucaoSQL.close();
                }
                GerenciadorConexao.fecharConexao();
            } catch (SQLException ex) {
            }
        }
        return produtos;
    }
}
