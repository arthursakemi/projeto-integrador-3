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
public class Funcionario extends Pessoa {

    private String unidade;
    private String area;
    private String cargo;
    private double salario;

    public Funcionario(String unidade, String area, String cargo, double salario, int id, String nome, String email, String cpf, String uf, String cidade, String telefone, String celular, String cep, String endereco, String complemento, boolean ativo) {
        super(id, nome, email, cpf, uf, cidade, telefone, celular, cep, endereco, complemento, ativo);
        this.unidade = unidade;
        this.area = area;
        this.cargo = cargo;
        this.salario = salario;
    }

    public String getUnidade() {
        return unidade;
    }

    public void setUnidade(String unidade) {
        this.unidade = unidade;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

}
