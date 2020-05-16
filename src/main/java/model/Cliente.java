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
public class Cliente extends Pessoa {
    private ArrayList<String> compras;

    public Cliente(ArrayList<String> compras, int id, String nome, String email, String cpf, String cidade, String uf, String telefone, String celular, String cep, String endereco, String complemento, boolean ativo) {
        super(id, nome, email, cpf, cidade, uf, telefone, celular, cep, endereco, complemento, ativo);
        this.compras = compras;
    }

    public Cliente(int id, String nome, String email, String cpf, String cidade, String uf, String telefone, String celular, String cep, String endereco, String complemento, boolean ativo) {
        super(id, nome, email, cpf, cidade, uf, telefone, celular, cep, endereco, complemento, ativo);
    }

    public Cliente(String nome, String email, String cpf, String cidade, String uf, String telefone, String celular, String cep, String endereco, String complemento, boolean ativo) {
        super(nome, email, cpf, cidade, uf, telefone, celular, cep, endereco, complemento, ativo);
    }
}
