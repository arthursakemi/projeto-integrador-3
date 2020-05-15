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

for (let i = 0; i < 15; i++) {
    addClientRow(client);
}
