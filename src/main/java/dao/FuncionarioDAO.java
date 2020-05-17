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
import model.Funcionario;
import utils.GerenciadorConexao;

/**
 *
 * @author Marcelo
 */
public class FuncionarioDAO {
        
    public static boolean salvar(Funcionario funcionario) {
        boolean retorno = false;
        Connection conexao = null;
        PreparedStatement instrucaoSQL = null;

        try {
            conexao = GerenciadorConexao.abrirConexao();
            instrucaoSQL = conexao.prepareStatement("INSERT INTO funcionarios "
                    + "(nome, email, cpf, cidade, uf, telefone, celular, cep, endereco, complemento, id_unidade, area, cargo, ativo) "
                    + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);",
                    Statement.RETURN_GENERATED_KEYS);

            instrucaoSQL.setString(1, funcionario.getNome());
            instrucaoSQL.setString(2, funcionario.getEmail());
            instrucaoSQL.setString(3, funcionario.getCpf());
            instrucaoSQL.setString(4, funcionario.getCidade());
            instrucaoSQL.setString(5, funcionario.getUf());
            instrucaoSQL.setString(6, funcionario.getTelefone());
            instrucaoSQL.setString(7, funcionario.getCelular());
            instrucaoSQL.setString(8, funcionario.getCep());
            instrucaoSQL.setString(9, funcionario.getEndereco());
            instrucaoSQL.setString(10, funcionario.getComplemento());
            instrucaoSQL.setInt(11, funcionario.getUnidade());
            instrucaoSQL.setString(12, funcionario.getArea());
            instrucaoSQL.setString(13, funcionario.getCargo());
            instrucaoSQL.setBoolean(14, funcionario.isAtivo());
            
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
