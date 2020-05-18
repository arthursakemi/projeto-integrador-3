/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


const createProductCard = (product) => {
    const productCard = document.createElement("card");
    productCard.setAttribute("id", "product-card");

    const productImg = document.createElement("div");
    productImg.setAttribute("id", "product-img");

    const productName = document.createElement("h1");
    productName.setAttribute("id", "product-name");
    productName.innerHTML = product.name;

    const cardText = document.createElement("div");
    cardText.setAttribute("id", "card-text");

    const quantity = document.createElement("span");
    quantity.setAttribute("id", "quantity");
    quantity.innerHTML = `Qt: ${product.quantity}`;

    const price = document.createElement("span");
    price.setAttribute("id", "price");
    price.innerHTML = `R$ ${product.price}`;

    cardText.appendChild(quantity);
    cardText.appendChild(price);

    productCard.appendChild(productImg);
    productCard.appendChild(productName);
    productCard.appendChild(cardText);

    return productCard;
};

const addProductCard = (product) => {
    const card = document.getElementById("card-galery");
    card.appendChild(createProductCard(product));
};

const product = {
    name: "Produto X",
    quantity: "xxx",
    price: "xxx,xx",
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
};

const closeModal = () => {
    document.getElementById("overlay").style = "display: none";
};


document.getElementById("new-product").addEventListener("click", showModal);
document.getElementById("cancel-button").addEventListener("click", closeModal);
document.getElementById("edit-cancel-button").addEventListener("click", closeModal);