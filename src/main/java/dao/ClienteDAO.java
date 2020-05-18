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
import model.Cliente;
import utils.GerenciadorConexao;

/**
 *
 * @author Marcelo
 */
public class ClienteDAO {

    public static boolean salvar(Cliente cliente) {
        boolean retorno = false;
        Connection conexao = null;
        PreparedStatement instrucaoSQL = null;

        try {
            conexao = GerenciadorConexao.abrirConexao();
            instrucaoSQL = conexao.prepareStatement("INSERT INTO clientes "
                    + "(nome, email, cpf, cidade, uf, telefone, celular, cep, endereco, complemento, ativo) "
                    + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);",
                    Statement.RETURN_GENERATED_KEYS);

            instrucaoSQL.setString(1, cliente.getNome());
            instrucaoSQL.setString(2, cliente.getEmail());
            instrucaoSQL.setString(3, cliente.getCpf());
            instrucaoSQL.setString(4, cliente.getCidade());
            instrucaoSQL.setString(5, cliente.getUf());
            instrucaoSQL.setString(6, cliente.getTelefone());
            instrucaoSQL.setString(7, cliente.getCelular());
            instrucaoSQL.setString(8, cliente.getCep());
            instrucaoSQL.setString(9, cliente.getEndereco());
            instrucaoSQL.setString(10, cliente.getComplemento());
            instrucaoSQL.setBoolean(11, cliente.isAtivo());

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

    public static List<Cliente> listarClientes() {
        List<Cliente> clientes = new ArrayList<>();
        Connection conexao;
        PreparedStatement instrucaoSQL = null;

        try {
            conexao = GerenciadorConexao.abrirConexao();
            instrucaoSQL = conexao.prepareStatement("SELECT * FROM clientes WHERE ativo = true;");
            ResultSet rs = instrucaoSQL.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String nome = rs.getString("nome");
                String email = rs.getString("email");
                String cpf = rs.getString("cpf");
                String cidade = rs.getString("cidade");
                String uf = rs.getString("uf");
                String telefone = rs.getString("telefone");
                String celular = rs.getString("celular");
                String cep = rs.getString("cep");
                String endereco = rs.getString("endereco");
                String complemento = rs.getString("complemento");
                boolean ativo = rs.getBoolean("ativo");

                clientes.add(new Cliente(id, nome, email, cpf, cidade, uf, telefone, celular, cep, endereco, complemento, ativo));
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
            } finally {
                try {
                    if (instrucaoSQL != null) {
                        instrucaoSQL.close();
                    }
                    GerenciadorConexao.fecharConexao();
                } catch (SQLException ex) {
                }
            }
        }
        return clientes;
    }
}
