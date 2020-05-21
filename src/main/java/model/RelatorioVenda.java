/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Sakemi
 */
public class RelatorioVenda {

    private int id;
    private String nomeUnidade;
    private String nomeVendedor;
    private String dataVenda;
    private String nomeCliente;
    private String cpfCliente;
    private String celCliente;
    private double total;

    private List<RelatorioProduto> produtos;

    public RelatorioVenda(int id, String nomeUnidade, String nomeVendedor, String dataVenda, String nomeCliente, String cpfCliente, String celCliente, double total, List<RelatorioProduto> produtos) {
        this.id = id;
        this.nomeUnidade = nomeUnidade;
        this.nomeVendedor = nomeVendedor;
        this.dataVenda = dataVenda;
        this.nomeCliente = nomeCliente;
        this.cpfCliente = cpfCliente;
        this.celCliente = celCliente;
        this.total = total;
        this.produtos = produtos;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNomeUnidade() {
        return nomeUnidade;
    }

    public void setNomeUnidade(String nomeUnidade) {
        this.nomeUnidade = nomeUnidade;
    }

    public String getNomeVendedor() {
        return nomeVendedor;
    }

    public void setNomeVendedor(String nomeVendedor) {
        this.nomeVendedor = nomeVendedor;
    }

    public String getDataVenda() {
        return dataVenda;
    }

    public void setDataVenda(String dataVenda) {
        this.dataVenda = dataVenda;
    }

    public String getNomeCliente() {
        return nomeCliente;
    }

    public void setNomeCliente(String nomeCliente) {
        this.nomeCliente = nomeCliente;
    }

    public String getCpfCliente() {
        return cpfCliente;
    }

    public void setCpfCliente(String cpfCliente) {
        this.cpfCliente = cpfCliente;
    }

    public String getCelCliente() {
        return celCliente;
    }

    public void setCelCliente(String celCliente) {
        this.celCliente = celCliente;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public List<RelatorioProduto> getProdutos() {
        return produtos;
    }

    public void setProdutos(List<RelatorioProduto> produtos) {
        this.produtos = produtos;
    }

}
