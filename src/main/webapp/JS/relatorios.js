/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
const salesList = Array.from(document.getElementsByClassName("sale-row"));

const updateSalesTotal = () => {

};

const unityFilter = (unity) => {
    const salesTable = document.getElementById("table-body");
    salesTable.innerHTML = "";

    if (unity) {
        const filteredList = salesList.filter((element) => element.getAttribute("unity") == unity);
        filteredList.forEach((element) => salesTable.appendChild(element));
    } else {
        salesList.forEach((element) => salesTable.appendChild(element));
    }
};