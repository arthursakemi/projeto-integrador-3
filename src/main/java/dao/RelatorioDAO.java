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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.RelatorioProduto;
import model.RelatorioVenda;
import utils.GerenciadorConexao;

/**
 *
 * @author Marcelo
 */
public class RelatorioDAO {

    public static List<RelatorioVenda> listarVendas() {
        List<RelatorioVenda> vendas = new ArrayList<>();
        Connection conexao;
        PreparedStatement vendaStmt = null;

        try {
            conexao = GerenciadorConexao.abrirConexao();
            vendaStmt = conexao.prepareStatement("SELECT vendas.id, unidades.nome AS unidade, funcionarios.nome AS vendedor, vendas.data_venda AS Data, clientes.nome AS cliente, clientes.cpf, clientes.celular, vendas.valor AS total FROM vendas "
                    + "INNER JOIN clientes ON vendas.id_cliente = clientes.id "
                    + "INNER JOIN funcionarios ON vendas.id_funcionario = funcionarios.id "
                    + "INNER JOIN unidades ON vendas.id_unidade = unidades.id; ");
            ResultSet vendasRs = vendaStmt.executeQuery();

            while (vendasRs.next()) {
                int id = vendasRs.getInt("id");
                String nomeUnidade = vendasRs.getString("unidade");
                String nomeVendedor = vendasRs.getString("vendedor");
                String dataVenda = vendasRs.getString("Data");
                String nomeCliente = vendasRs.getString("cliente");
                String cpfCliente = vendasRs.getString("cpf");
                String celCliente = vendasRs.getString("celular");
                double total = vendasRs.getDouble("total");

                vendas.add(new RelatorioVenda(id, nomeUnidade, nomeVendedor, dataVenda, nomeCliente, cpfCliente, celCliente, total));
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UnidadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (vendaStmt != null) {
                    vendaStmt.close();
                }
                GerenciadorConexao.fecharConexao();
            } catch (SQLException ex) {
            }
        }
        return vendas;
    }

    public static List<RelatorioProduto> listarProdutosVenda(int id) {
        List<RelatorioProduto> produtos = new ArrayList<>();
        Connection conexao;
        PreparedStatement produtosStmt = null;

        try {
            conexao = GerenciadorConexao.abrirConexao();
            produtosStmt = conexao.prepareStatement("SELECT produtos.nome, venda_produto.quantidade, (venda_produto.quantidade*produtos.valor) AS subtotal FROM venda_produto "
                    + "INNER JOIN produtos ON venda_produto.id_produto = produtos.id "
                    + "WHERE venda_produto.id_venda = ?; ");

            produtosStmt.setInt(1, id);
            ResultSet produtosRs = produtosStmt.executeQuery();

            while (produtosRs.next()) {
                String nome = produtosRs.getString("nome");
                int quantidade = produtosRs.getInt("quantidade");
                double subtotal = produtosRs.getDouble("subtotal");

                produtos.add(new RelatorioProduto(nome, quantidade, subtotal));
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UnidadesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (produtosStmt != null) {
                    produtosStmt.close();
                }
                GerenciadorConexao.fecharConexao();
            } catch (SQLException ex) {
            }
        }
        return produtos;
    }
}
