/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
const salesList = Array.from(document.getElementsByClassName("sale-row"));

const updateTotal = (sales) => {
    let total = 0;

    sales.forEach((item) => total += parseFloat(item.getAttribute("total")));
    console.log(total);

    document.getElementById("sales-total").innerHTML = `Total: R$ ${total.toFixed(2)}`;
};

const saleFilter = (parameter, value) => {
    const salesTable = document.getElementById("table-body");
    salesTable.innerHTML = "";

    if (value) {
        const filteredList = salesList.filter((element) => element.getAttribute(parameter) == value);
        filteredList.forEach((element) => salesTable.appendChild(element));

        updateTotal(filteredList);
    } else {
        salesList.forEach((element) => salesTable.appendChild(element));
        updateTotal(salesList);
    }
};

updateTotal(salesList);