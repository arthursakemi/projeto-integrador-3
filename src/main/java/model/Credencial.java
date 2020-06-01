/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import at.favre.lib.crypto.bcrypt.BCrypt;

/**
 *
 * @author Marcelo
 */
public class Credencial {
    private int id;
    private int id_funcionario;
    private String usuario;
    private String senha;
    private boolean isAdmin;

    public Credencial(int id_funcionario, String usuario, String senha, boolean isAdmin) {
        this.id_funcionario = id_funcionario;
        this.usuario = usuario;
        this.senha = senha;
        this.isAdmin = isAdmin;
    }

    public Credencial(String usuario, String senha, boolean isAdmin) {
        this.usuario = usuario;
        this.senha = senha;
        this.isAdmin = isAdmin;
    }
    
    public Credencial(int id, int id_funcionario, String usuario, String senha, boolean isAdmin) {
        this.id = id;
        this.id_funcionario = id_funcionario;
        this.usuario = usuario;
        this.senha = senha;
        this.isAdmin = isAdmin;
    }
    
    public String encodeSenha(String senha) {
        return BCrypt.withDefaults().hashToString(12, senha.toCharArray());
    }
    
    public boolean validarSenha(String senha) {
        BCrypt.Result result = BCrypt.verifyer().verify(senha.toCharArray(), this.getSenha());
        return result.verified;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_funcionario() {
        return id_funcionario;
    }

    public void setId_funcionario(int id_funcionario) {
        this.id_funcionario = id_funcionario;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public boolean isIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }
}
