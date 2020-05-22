/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Marcelo
 */
public class Estoque {
    private int id;
    private int idProduto;
    private int idUnidade;
    private int quantidade;

    public Estoque(int idProduto, int idUnidade, int quantidade) {
        this.idProduto = idProduto;
        this.idUnidade = idUnidade;
        this.quantidade = quantidade;
    }

    public Estoque(int id, int idProduto, int idUnidade, int quantidade) {
        this.id = id;
        this.idProduto = idProduto;
        this.idUnidade = idUnidade;
        this.quantidade = quantidade;
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

    public int getIdUnidade() {
        return idUnidade;
    }

    public void setIdUnidade(int idUnidade) {
        this.idUnidade = idUnidade;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
    
    
}
