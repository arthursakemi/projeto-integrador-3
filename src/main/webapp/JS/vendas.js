/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
const cart = [];

const createItem = (id, name, quantity, price) => {
    return {
        id,
        name,
        quantity,
        price
    };
};

const itemExists = (id) => {
    return cart.filter((item) => item.id == id).length;
};



const createCartItem = ({id, name, quantity, price}) => {
    const cartItem = document.createElement("div");
    cartItem.className = "cart-item";
    cartItem.setAttribute("key", id);

    const cartImg = document.createElement("div");
    cartImg.className = "cart-img";

    const itemName = document.createElement("h2");
    itemName.className = "item-name";
    itemName.innerHTML = name;

    const itemQuantity = document.createElement("input");
    itemQuantity.type = "number";
    itemQuantity.className = "item-quantity";
    itemQuantity.name = "quantity";
    itemQuantity.min = "1";
    itemQuantity.value = quantity;

    const itemPrice = document.createElement("h3");
    itemPrice.className = "item-price";
    itemPrice.innerHTML = "R$ " + price.toFixed(2);

    cartItem.appendChild(cartImg);
    cartItem.appendChild(itemName);
    cartItem.appendChild(itemQuantity);
    cartItem.appendChild(itemPrice);

    return cartItem;
};

const addItemToCart = (id, name, price) => {
    const cartDiv = document.getElementById("shop-cart");
    if (itemExists(id)) {
        cart.forEach((item) => {
            if (item.id == id) {
                item.quantity++;
            }
        });
    } else {
        cart.push(createItem(id, name, 1, price));
    }

    cartDiv.innerHTML = "";

    cart.forEach((item) => {
        cartDiv.appendChild(createCartItem(item));
    });
};

