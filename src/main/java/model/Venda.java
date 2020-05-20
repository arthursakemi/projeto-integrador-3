/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Marcelo
 */
public class Venda {
    private int id;
    private int idFuncionario;
    private int idCliente;
    private int idUnidade;
    private double valor;
    private Date dataVenda;
    private ArrayList<ProdutoVenda> produtos;
    
    public Venda(int idFuncionario, int idCliente, int idUnidade, double valor, Date dataVenda, ArrayList<ProdutoVenda> produtos) {
        this.idFuncionario = idFuncionario;
        this.idCliente = idCliente;
        this.idUnidade = idUnidade;
        this.valor = valor;
        this.dataVenda = dataVenda;
        this.produtos = produtos;
    }

    public Venda(int id, int idFuncionario, int idCliente, int idUnidade, double valor, Date dataVenda, ArrayList<ProdutoVenda> produtos) {
        this.id = id;
        this.idFuncionario = idFuncionario;
        this.idCliente = idCliente;
        this.idUnidade = idUnidade;
        this.valor = valor;
        this.dataVenda = dataVenda;
        this.produtos = produtos;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdFuncionario() {
        return idFuncionario;
    }

    public void setIdFuncionario(int idFuncionario) {
        this.idFuncionario = idFuncionario;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdUnidade() {
        return idUnidade;
    }

    public void setIdUnidade(int idUnidade) {
        this.idUnidade = idUnidade;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public Date getDataVenda() {
        return dataVenda;
    }

    public void setDataVenda(Date dataVenda) {
        this.dataVenda = dataVenda;
    }

    public ArrayList<ProdutoVenda> getProdutos() {
        return produtos;
    }

    public void setProdutos(ArrayList<ProdutoVenda> produtos) {
        this.produtos = produtos;
    }
}