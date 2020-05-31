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
import model.Credencial;
import utils.GerenciadorConexao;

/**
 *
 * @author Marcelo
 */
public class CredencialDAO {
    public static boolean salvar(Credencial newCredencial) {
        return true;
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
                boolean isAdmin = rs.getString("nivel_acesso").equals("1");
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