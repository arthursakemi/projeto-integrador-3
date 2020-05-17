/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
/**
 *
 * @author Sakemi
 */
public class Produto {

    private int id;
    private String nome;
    private String categoria;
    private String fabricante;
    private String descricao;
    private double valor;
    private boolean ativo;

    public Produto(int id, String nome, String categoria, String fabricante, String descricao, double valor, boolean ativo) {
        this.id = id;
        this.nome = nome;
        this.categoria = categoria;
        this.fabricante = fabricante;
        this.descricao = descricao;
        this.valor = valor;
        this.ativo = ativo;
    }

    public Produto(String nome, String categoria, String fabricante, double valor, String descricao, boolean ativo) {
        this.nome = nome;
        this.categoria = categoria;
        this.fabricante = fabricante;
        this.descricao = descricao;
        this.valor = valor;
        this.ativo = ativo;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }
    
    public String getFabricante() {
        return fabricante;
    }
    
    public void setFabricante(String fabricante) {
        this.fabricante = fabricante;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public boolean isAtivo() {
        return ativo;
    }

    public void setAtivo(boolean ativo) {
        this.ativo = ativo;
    }
}
