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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Credencial;
import utils.GerenciadorConexao;

/**
 *
 * @author Marcelo
 */
public class CredencialDAO {
    public static boolean salvar(Credencial newCredencial) {
        boolean retorno = false;
        Connection conexao = null;
        PreparedStatement instrucaoSQL = null;
        ResultSet rs = null;

        try {
            conexao = GerenciadorConexao.abrirConexao();
            instrucaoSQL = conexao.prepareStatement("INSERT INTO credenciais "
                    + "(id_funcionario, usuario, senha, nivel_acesso) "
                    + "VALUES(?, ?, ?, ?);",
                    Statement.RETURN_GENERATED_KEYS);

            int accessLevel = newCredencial.isIsAdmin() ? 1 : 0;
            
            instrucaoSQL.setInt(1, newCredencial.getId_funcionario());
            instrucaoSQL.setString(2, newCredencial.getUsuario());
            instrucaoSQL.setString(3, newCredencial.encodeSenha(newCredencial.getSenha()));
            instrucaoSQL.setInt(4, accessLevel);

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

    public static Credencial getCredencialByUsuario(String usuario) throws ClassNotFoundException {
        Credencial cred = null;
        Connection conexao = null;
        PreparedStatement instrucaoSQL = null;
        try{
            conexao = GerenciadorConexao.abrirConexao();
            instrucaoSQL = conexao.prepareStatement("SELECT * FROM credenciais WHERE usuario = ?;");
            instrucaoSQL.setString(1, usuario);
            ResultSet rs = instrucaoSQL.executeQuery();
            
            if (rs.next()) {
                String login = rs.getString("usuario");
                String senha = rs.getString("senha");
                int isAdminDB = rs.getInt("nivel_acesso");
                boolean isAdmin = isAdminDB == 1 ? true : false;
                cred = new Credencial(login, senha, isAdmin);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (instrucaoSQL != null) {
                    instrucaoSQL.close();
                }
                GerenciadorConexao.fecharConexao();
            } catch (SQLException ex) {
            }
        }
        
        return cred;
    }

    public static boolean alterar(Credencial credencial) {
        return true;
    }

    public static boolean deletar(int id) {
        return true;
    }
}