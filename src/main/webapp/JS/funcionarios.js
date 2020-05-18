/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


const createEmployeeRow = ({ firstName, lastName, cpf, city, uf, cel }) => {
    const EmployeeRowDiv = document.createElement("div");
    EmployeeRowDiv.setAttribute("class", "client-row");

    const employeeNameSpan = document.createElement("span");
    employeeNameSpan.setAttribute("class", "employee-name");
    employeeNameSpan.innerHTML = `${firstName} ${lastName}`;

    const citySpan = document.createElement("span");
    citySpan.setAttribute("class", "city");
    citySpan.innerHTML = `${city} - ${uf}`;

    const cpfSpan = document.createElement("span");
    cpfSpan.setAttribute("class", "cpf");
    cpfSpan.innerHTML = cpf;

    const celSpan = document.createElement("span");
    celSpan.setAttribute("class", "cel");
    celSpan.innerHTML = cel;

    const optionsDiv = document.createElement("div");
    optionsDiv.setAttribute("class", "options");

    EmployeeRowDiv.appendChild(employeeNameSpan);
    EmployeeRowDiv.appendChild(citySpan);
    EmployeeRowDiv.appendChild(cpfSpan);
    EmployeeRowDiv.appendChild(celSpan);
    EmployeeRowDiv.appendChild(optionsDiv);

    return EmployeeRowDiv;
};

const addEmployeeRow = (employee) => {
    const employeeTable = document.getElementById("employee-table");
    employeeTable.appendChild(createEmployeeRow(employee));
};

const employee = {
    firstName: "Marcelo",
    lastName: "Braga",
    city: "São Paulo",
    uf: "SP",
    cpf: "222.222.222-22",
    cel: "(11)92222-2222",
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
    document.getElementById("delete-name").value = nome;
    document.getElementById("delete-email").value = email;
    document.getElementById("delete-cpf").value = cpf;
    document.getElementById("delete-cep").value = cep;
    document.getElementById("delete-city").value = cidade;
    document.getElementById("delete-estate").value = uf;
    document.getElementById("delete-tel").value = tel;
    document.getElementById("delete-cel").value = cel;
    document.getElementById("delete-address").value = endereco;
    document.getElementById("delete-complement").value = complemento;
    document.getElementById("edit-unity").value = unidade;
    document.getElementById("edit-area").value = area;
    document.getElementById("edit-position").value = cargo;
    document.getElementById("edit-salary").value = salario;
};

const closeModal = () => {
    document.getElementById("overlay").style = "display: none";
};



document.getElementById("new-employee").addEventListener("click", showCreateModal);
document.getElementById("cancel-button").addEventListener("click", closeModal);
document.getElementById("edit-cancel-button").addEventListener("click", closeModal);
