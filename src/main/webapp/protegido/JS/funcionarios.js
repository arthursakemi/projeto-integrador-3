/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

const funcionarios = Array.from(document.getElementsByClassName("employee-row"));

const clearFilters = () => {
    document.getElementById("search-field").value = "";
    refreshEmployeeTable(funcionarios);
}

const filterEmployeeList = (filter) => {
    if (filter) {
        const filteredList = funcionarios.filter((funcionario) => {
            const nameFilter = funcionario.getAttribute("nome").toLowerCase().includes(filter.toLowerCase());
            const cpfFilter = funcionario.getAttribute("cpf").toLowerCase().includes(filter.toLowerCase());

            return nameFilter || cpfFilter;
        });

        refreshEmployeeTable(filteredList);

    } else {
        refreshEmployeeTable(funcionarios);
    }
};

const refreshEmployeeTable = (employeeList) => {
    const employeeTable = document.getElementById("employee-table-body");

    employeeTable.innerHTML = "";

    employeeList.forEach((employee) => {
        employeeTable.appendChild(employee);
    });
};

const showCreateModal = () => {
    document.getElementById("overlay").style = "display:flex";
    document.getElementById("employee-modal").style = "display:flex";
    document.getElementById("edit-modal").style = "display: none";
};

const showEditModal = (id, nome, email, cpf, cep, cidade, uf, tel, cel, endereco, complemento, unidade, area, cargo, salario) => {
    document.getElementById("overlay").style = "display:flex";
    document.getElementById("employee-modal").style = "display:none";
    document.getElementById("edit-modal").style = "display: flex";

    //fill inputs on edit form
    document.getElementById("edit-id").value = id;
    document.getElementById("edit-name").value = nome;
    document.getElementById("edit-email").value = email;
    document.getElementById("edit-cpf").value = cpf;
    document.getElementById("edit-cep").value = cep;
    document.getElementById("edit-city").value = cidade;
    document.getElementById("edit-estate").value = uf;
    document.getElementById("edit-tel").value = tel;
    document.getElementById("edit-cel").value = cel;
    document.getElementById("edit-address").value = endereco;
    document.getElementById("edit-complement").value = complemento;
    document.getElementById("edit-unity").value = unidade;
    document.getElementById("edit-area").value = area;
    document.getElementById("edit-position").value = cargo;
    document.getElementById("edit-salary").value = salario;

    //fill inputs on delete form
    document.getElementById("delete-id").value = id;
};

const closeModal = () => {
    document.getElementById("overlay").style = "display: none";
};



document.getElementById("new-employee").addEventListener("click", showCreateModal);
document.getElementById("cancel-button").addEventListener("click", closeModal);
document.getElementById("edit-cancel-button").addEventListener("click", closeModal);
document.getElementById("clear-button").addEventListener("click", clearFilters);
