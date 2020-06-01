/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
const clientes = Array.from(document.getElementsByClassName("client-row"));

const clearFilters = () => {
    document.getElementById("search-field").value = "";
    refreshClientTable(clientes);
}

const filterClientList = (filter) => {
    if (filter) {
        const filteredList = clientes.filter((cliente) => {
            const nameFilter = cliente.getAttribute("nome").toLowerCase().includes(filter.toLowerCase());
            const cpfFilter = cliente.getAttribute("cpf").toLowerCase().includes(filter.toLowerCase());

            return nameFilter || cpfFilter;
        });

        refreshClientTable(filteredList);

    } else {
        refreshClientTable(clientes);
    }
};

const refreshClientTable = (clientList) => {
    const clientTable = document.getElementById("clients-table-body");

    clientTable.innerHTML = "";

    clientList.forEach((client) => {
        clientTable.appendChild(client);
    });
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
document.getElementById("edit-cancel-button").addEventListener("click", closeModal);
document.getElementById("clear-button").addEventListener("click", clearFilters);