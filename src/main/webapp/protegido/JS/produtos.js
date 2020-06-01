/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
const produtos = Array.from(document.getElementsByClassName("product-card"));

const clearFilters = () => {
    document.getElementById("search-field").value = "";
    refreshProductTable(produtos);
}

const filterProductList = (filter) => {
    if (filter) {
        const filteredList = produtos.filter((produto) => {
            const nameFilter = produto.getAttribute("nome").toLowerCase().includes(filter.toLowerCase());
            const categoryFilter = produto.getAttribute("categoria").toLowerCase().includes(filter.toLowerCase());

            return nameFilter || categoryFilter;
        });

        refreshProductTable(filteredList);

    } else {
        refreshProductTable(produtos);
    }
};

const refreshProductTable = (productList) => {
    const productGalery = document.getElementById("card-galery");

    productGalery.innerHTML = "";

    productList.forEach((product) => {
        productGalery.appendChild(product);
    });
};

const showModal = () => {
    document.getElementById("overlay").style = "display:flex";
    document.getElementById("product-modal").style = "display:flex";
    document.getElementById("edit-product-modal").style = "display: none";
};

const showEditModal = (id, nome, categoria, fabricante, descricao, preco) => {
    document.getElementById("overlay").style = "display:flex";
    document.getElementById("product-modal").style = "display:none";
    document.getElementById("edit-product-modal").style = "display: flex";

    document.getElementById("edit-id").value = id;
    document.getElementById("edit-name").value = nome;
    document.getElementById("edit-category").value = categoria;
    document.getElementById("edit-manufacturer").value = fabricante;
    document.getElementById("edit-description").value = descricao;
    document.getElementById("edit-price").value = preco;

    document.getElementById("delete-id").value = id;
};

const closeModal = () => {
    document.getElementById("overlay").style = "display: none";
};


document.getElementById("new-product").addEventListener("click", showModal);
document.getElementById("cancel-button").addEventListener("click", closeModal);
document.getElementById("edit-cancel-button").addEventListener("click", closeModal);
document.getElementById("clear-button").addEventListener("click", clearFilters);