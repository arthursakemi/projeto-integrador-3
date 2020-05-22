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
public class EstoqueControle {

    private int id;
    private int idProduto;
    private String nomeProduto;
    private double valor;
    private int idUnidade;
    private String nomeUnidade;
    private int quantidade;

    public EstoqueControle(int id, int idProduto, String nomeProduto, double valor, int idUnidade, String nomeUnidade, int quantidade) {
        this.id = id;
        this.idProduto = idProduto;
        this.nomeProduto = nomeProduto;
        this.valor = valor;
        this.idUnidade = idUnidade;
        this.nomeUnidade = nomeUnidade;
        this.quantidade = quantidade;
    }

    public EstoqueControle(int idProduto, String nomeProduto, double valor, int idUnidade, String nomeUnidade, int quantidade) {
        this.idProduto = idProduto;
        this.nomeProduto = nomeProduto;
        this.valor = valor;
        this.idUnidade = idUnidade;
        this.nomeUnidade = nomeUnidade;
        this.quantidade = quantidade;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(int idProduto) {
        this.idProduto = idProduto;
    }

    public String getNomeProduto() {
        return nomeProduto;
    }

    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }

    public int getIdUnidade() {
        return idUnidade;
    }

    public void setIdUnidade(int idUnidade) {
        this.idUnidade = idUnidade;
    }

    public String getNomeUnidade() {
        return nomeUnidade;
    }

    public void setNomeUnidade(String nomeUnidade) {
        this.nomeUnidade = nomeUnidade;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

}
