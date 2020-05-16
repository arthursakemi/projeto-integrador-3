/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author Sakemi
 */
public class Vendedor extends Funcionario {

    private double comissao;
    private ArrayList<String> vendas;

    public Vendedor(double comissao, ArrayList<String> vendas, int unidade, String area, String cargo, double salario, int id, String nome, String email, String cpf, String uf, String cidade, String telefone, String celular, String cep, String endereco, String complemento, boolean ativo) {
        super(unidade, area, cargo, salario, id, nome, email, cpf, uf, cidade, telefone, celular, cep, endereco, complemento, ativo);
        this.comissao = comissao;
        this.vendas = vendas;
    }

    public double getComissao() {
        return comissao;
    }

    public void setComissao(double comissao) {
        this.comissao = comissao;
    }

    public ArrayList<String> getVendas() {
        return vendas;
    }

    public void setVendas(ArrayList<String> vendas) {
        this.vendas = vendas;
    }

}
