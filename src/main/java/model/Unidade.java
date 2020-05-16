package model;

import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Marcelo
 */
public class Unidade {
    private String nome;
    private String cidade;
    private String estado;
    private ArrayList funcionarios;
    private ArrayList produtos;
    
    public Unidade(String nome, String cidade, String estado, ArrayList funcionarios, ArrayList produtos) {
        this.nome = nome;
        this.cidade = cidade;
        this.estado = estado;
        this.funcionarios = funcionarios;
        this.produtos = produtos;
    }
    
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public ArrayList getFuncionarios() {
        return funcionarios;
    }

    public void setFuncionarios(ArrayList funcionarios) {
        this.funcionarios = funcionarios;
    }

    public ArrayList getProdutos() {
        return produtos;
    }

    public void setProdutos(ArrayList produtos) {
        this.produtos = produtos;
    }
}
