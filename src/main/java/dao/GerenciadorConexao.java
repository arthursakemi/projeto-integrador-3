/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

/**
 *
 * @author Sakemi
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GerenciadorConexao {

    public static String STATUS = "Não conectado";
    public static Connection CONEXAO;

    public GerenciadorConexao() {
    }

    public static Connection abrirConexao() throws ClassNotFoundException, SQLException {
        String DRIVER = "com.mysql.cj.jdbc.Driver";
        String USER = "utrqwovgmcfjnxjq";
        String PASSWORD = "QEkfcMqfA95LwnTD02NM";
        String URL = "jdbc:mysql://utrqwovgmcfjnxjq:QEkfcMqfA95LwnTD02NM@bhtdf3tusbz6r8ua6rnp-mysql.services.clever-cloud.com:3306/bhtdf3tusbz6r8ua6rnp?useSSL=false";

        if (CONEXAO == null) {
            try {
                //carrega o driver
                Class.forName(DRIVER);
                CONEXAO = DriverManager.getConnection(URL, USER, PASSWORD);

                System.out.println("get connection");

                if (CONEXAO != null) {
                    STATUS = "Conexão realizada com sucesso!";
                } else {
                    STATUS = "Não foi possivel realizar a conexão!";
                }
            } catch (ClassNotFoundException e) {
                throw new ClassNotFoundException("O driver expecificado não foi encontrado");
            } catch (SQLException e) {
                System.out.println(e);
                throw new SQLException("Erro ao estabelecer conexão com o banco de dados.");
            }
        } else {
            try {
                if (CONEXAO.isClosed()) {
                    CONEXAO = DriverManager.getConnection(URL, USER, PASSWORD);
                }
            } catch (SQLException ex) {
                throw new SQLException("falha ao fechar a conexão.");
            }
        }

        return CONEXAO;
    }

    public static String getStatusConexao() {
        return STATUS;
    }

    public static boolean fecharConexao() throws SQLException {

        try {
            if (CONEXAO != null) {
                if (!CONEXAO.isClosed()) {
                    CONEXAO.close();
                }
            }

            STATUS = "Não conectado";
            return true;

        } catch (SQLException e) {
            return false;
        }
    }

}
