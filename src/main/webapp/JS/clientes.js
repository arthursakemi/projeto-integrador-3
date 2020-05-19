/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


const createClientRow = ({ firstName, lastName, cpf, city, uf, cel }) => {
    const clientRowDiv = document.createElement("div");
    clientRowDiv.setAttribute("class", "client-row");

    const clientNameSpan = document.createElement("span");
    clientNameSpan.setAttribute("class", "client-name");
    clientNameSpan.innerHTML = `${firstName} ${lastName}`;

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

    clientRowDiv.appendChild(clientNameSpan);
    clientRowDiv.appendChild(citySpan);
    clientRowDiv.appendChild(cpfSpan);
    clientRowDiv.appendChild(celSpan);
    clientRowDiv.appendChild(optionsDiv);

    return clientRowDiv;
};

const addClientRow = (client) => {
    const clientTable = document.getElementById("client-table");
    clientTable.appendChild(createClientRow(client));
};

const client = {
    firstName: "Arthur",
    lastName: "Sakemi",
    city: "São Paulo",
    uf: "SP",
    cpf: "111.111.111-11",
    cel: "(11)91111-1111",
};

const showCreateModal = () => {
    document.getElementById("overlay").style = "display: flex";
    document.getElementById("customer-modal").style = "display: flex";
    document.getElementById("edit-modal").style = "display: none";
};

const showEditModal = (id, nome, email, cpf, cep, cidade, uf, tel, cel, endereco, complemento) => {
    document.getElementById("overlay").style = "display: flex";
    document.getElementById("customer-modal").style = "display: none";
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
    
    //fill inputs on delete form
    document.getElementById("delete-id").value = id;
};

const closeModal = () => {
    document.getElementById("overlay").style = "display: none";
};


document.getElementById("new-customer").addEventListener("click", showCreateModal);
document.getElementById("cancel-button").addEventListener("click", closeModal);
document.getElementById("edit-cancel-button").addEventListener("click", closeModal)
