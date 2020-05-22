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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import model.Venda;
import model.ProdutoVenda;
import utils.GerenciadorConexao;

/**
 *
 * @author Marcelo
 */
public class VendasDAO {

    public static boolean salvar(Venda venda) {
        boolean retorno = true;
        Connection conexao = null;
        PreparedStatement vendaStmt = null;
        PreparedStatement produtosStmt = null;
        PreparedStatement estoqueStmt = null;
        ResultSet rs = null;
        ArrayList<ProdutoVenda> produtos = venda.getProdutos();

        try {
            conexao = GerenciadorConexao.abrirConexao();
            conexao.setAutoCommit(false);

            vendaStmt = conexao.prepareStatement(
                    "INSERT INTO vendas (id_funcionario, id_cliente, id_unidade, valor, data_venda) "
                    + "VALUES (?, ?, ?, ?, ?); ",
                    Statement.RETURN_GENERATED_KEYS);

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

            vendaStmt.setInt(1, venda.getIdFuncionario());
            vendaStmt.setInt(2, venda.getIdCliente());
            vendaStmt.setInt(3, venda.getIdUnidade());
            vendaStmt.setDouble(4, venda.getValor());
            vendaStmt.setString(5, formatter.format(venda.getDataVenda()));

            vendaStmt.executeUpdate();

            rs = vendaStmt.getGeneratedKeys();
            rs.next();
            int saleId = rs.getInt(1);

            for (int i = 0; i < produtos.size(); i++) {
                produtosStmt = conexao.prepareStatement(
                        "INSERT INTO venda_produto (id_venda, id_produto, quantidade) "
                        + "VALUES (?, ?, ?); ");

                produtosStmt.setInt(1, saleId);
                produtosStmt.setInt(2, produtos.get(i).getIdProduto());
                produtosStmt.setInt(3, produtos.get(i).getQuantidade());

                produtosStmt.executeUpdate();

                estoqueStmt = conexao.prepareStatement("UPDATE estoque "
                        + "SET quantidade = quantidade - ? "
                        + "WHERE id_produto = ? AND id_unidade = ?; ");

                estoqueStmt.setInt(1, produtos.get(i).getQuantidade());
                estoqueStmt.setInt(2, venda.getIdUnidade());
                estoqueStmt.setInt(3, produtos.get(i).getIdProduto());

                estoqueStmt.executeUpdate();
            }

        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println(ex.getMessage());
            retorno = false;

        } finally {
            try {
                if (vendaStmt != null && produtosStmt != null) {
                    conexao.setAutoCommit(true);
                    vendaStmt.close();
                    produtosStmt.close();
                }
                GerenciadorConexao.fecharConexao();
            } catch (SQLException ex) {
            }
        }

        return retorno;
    }

    public static boolean salvarAntigo(Venda venda) {
        boolean retorno = false;
        Connection conexao = null;
        PreparedStatement instrucaoSQL = null;

        try {
            conexao = GerenciadorConexao.abrirConexao();
            instrucaoSQL = conexao.prepareStatement("START TRANSACTION; "
                    + "INSERT INTO vendas (id_funcionario, id_cliente, id_unidade, valor, data_venda) "
                    + "VALUES (?, ?, ?, ?, ?); "
                    + "SET @sale_id = LAST_INSERT_ID(); "
                    + generateQueryProduto(venda.getProdutos())
                    + "COMMIT; ",
                    Statement.RETURN_GENERATED_KEYS);

            System.out.println(generateQueryProduto(venda.getProdutos()));
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

            instrucaoSQL.setInt(1, venda.getIdFuncionario());
            instrucaoSQL.setInt(2, venda.getIdCliente());
            instrucaoSQL.setInt(3, venda.getIdUnidade());
            instrucaoSQL.setDouble(4, venda.getValor());
            instrucaoSQL.setString(5, formatter.format(venda.getDataVenda()));

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

    public static String generateQueryProduto(ArrayList<ProdutoVenda> produtos) {
        String queryFinal = "";

        for (int i = 0; i < produtos.size(); i++) {
            //Sabemos da possibilidade de SQL Injection, mas foi o que deu para o momento.
            queryFinal += "INSERT INTO venda_produto (id_venda, id_produto, quantidade) VALUES (@sale_id, " + produtos.get(i).getIdProduto() + ", " + produtos.get(i).getQuantidade() + "); ";
        }

        return queryFinal;
    }
}
