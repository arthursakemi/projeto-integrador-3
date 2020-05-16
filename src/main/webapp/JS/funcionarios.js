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

const showModal = () => {
    document.getElementById("overlay").style = "display: flex";
};

const closeModal = () => {
    document.getElementById("overlay").style = "display: none";
};

for (let i = 0; i < 15; i++) {
    addEmployeeRow(employee);
}

document.getElementById("new-employee").addEventListener("click", showModal);
document.getElementById("cancel-button").addEventListener("click", closeModal);
