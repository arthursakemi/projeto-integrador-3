/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
const cart = [];

const createCartItem = (id, name, price) => {
    const cartItem = document.createElement("div");
    cartItem.className = "cart-item";
    cartItem.setAttribute("key", id);

    const cartImg = document.createElement("div");
    cartImg.className = "cart-img";

    const itemName = document.createElement("h2");
    itemName.className = "item-name";
    itemName.innerHTML = name;

    const quantity = document.createElement("input");
    quantity.type = "number";
    quantity.className = "item-quantity";
    quantity.name = "quantity";
    quantity.min = "1";
    quantity.value = "1";

    const itemPrice = document.createElement("h3");
    itemPrice.className = "item-price";
    itemPrice.innerHTML = "R$ " + price.toFixed(2);

    cartItem.appendChild(cartImg);
    cartItem.appendChild(itemName);
    cartItem.appendChild(quantity);
    cartItem.appendChild(itemPrice);

    return cartItem;
};

const addItemToCart = (id, name, price) => {
    const cartItem = createCartItem(id, name, price);
    document.getElementById("shop-cart").appendChild(cartItem);
};

