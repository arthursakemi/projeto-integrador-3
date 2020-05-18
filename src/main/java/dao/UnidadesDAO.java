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
import model.Unidade;
import utils.GerenciadorConexao;

/**
 *
 * @author Marcelo
 */
public class UnidadesDAO {

    public static boolean salvar(Unidade unidade) {
        boolean retorno = false;
        Connection conexao = null;
        PreparedStatement instrucaoSQL = null;

        try {
            conexao = GerenciadorConexao.abrirConexao();
            instrucaoSQL = conexao.prepareStatement("INSERT INTO unidades "
                    + "(nome, cidade, uf, ativo) "
                    + "VALUES(?, ?, ?, ?);",
                    Statement.RETURN_GENERATED_KEYS);

            instrucaoSQL.setString(1, unidade.getNome());
            instrucaoSQL.setString(2, unidade.getCidade());
            instrucaoSQL.setString(3, unidade.getEstado());
            instrucaoSQL.setBoolean(4, true);

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

    public static List<Unidade> listarUnidades() {
        List<Unidade> unidades = new ArrayList<>();
        Connection conexao;
        PreparedStatement instrucaoSQL = null;

        try {
            conexao = GerenciadorConexao.abrirConexao();
            instrucaoSQL = conexao.prepareStatement("SELECT * FROM unidades;");
            ResultSet rs = instrucaoSQL.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String nome = rs.getString("nome");
                String cidade = rs.getString("cidade");
                String uf = rs.getString("uf");
                boolean ativo = rs.getBoolean("ativo");

                unidades.add(new Unidade(id, nome, cidade, uf, ativo));
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
        return unidades;
    }

        public static boolean alterar(Unidade unidade) {
        boolean retorno = false;
        Connection conexao = null;
        PreparedStatement instrucaoSQL = null;

        try {
            conexao = GerenciadorConexao.abrirConexao();
            instrucaoSQL = conexao.prepareStatement("UPDATE unidades "
                    + "SET nome = ?, cidade = ?, estado = ?, ativo = ?"
                    + "WHERE id = ?",
                    Statement.RETURN_GENERATED_KEYS);

            instrucaoSQL.setString(1, unidade.getNome());
            instrucaoSQL.setString(2, unidade.getCidade());
            instrucaoSQL.setString(3, unidade.getEstado());
            instrucaoSQL.setBoolean(4, true);
            instrucaoSQL.setInt(5, unidade.getId());

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
