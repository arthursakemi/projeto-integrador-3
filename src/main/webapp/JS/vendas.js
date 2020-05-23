/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
let cart = [];

let estoque = Array.from(document.getElementsByClassName("stock-card"));

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

const getTotal = (items) => {
    let total = 0;

    items.forEach((item) => total += item.price * item.quantity);

    return total;
}

const createCartItem = ({id, name, quantity, price}) => {
    const cartItem = document.createElement("div");
    cartItem.className = "cart-item";
    cartItem.onclick = removeItemFromCart;

    const cartImg = document.createElement("div");
    cartImg.className = "cart-img";

    const itemName = document.createElement("h2");
    itemName.className = "item-name";
    itemName.innerHTML = name;

    const itemQuantity = document.createElement("span");
    itemQuantity.className = "item-quantity";
    itemQuantity.innerHTML = quantity;

    const itemPrice = document.createElement("h3");
    itemPrice.className = "item-price";
    itemPrice.innerHTML = "R$ " + (price * quantity).toFixed(2);

    cartItem.appendChild(cartImg);
    cartItem.appendChild(itemName);
    cartItem.appendChild(itemQuantity);
    cartItem.appendChild(itemPrice);

    return cartItem;
};

const addItemToCart = (id, name, price) => {
    if (itemExists(id)) {
        cart.forEach((item) => {
            if (item.id == id) {
                item.quantity++;
            }
        });
    } else {
        cart.push(createItem(id, name, 1, price));
    }

    updateCartHTML();
};

const updateCartHTML = () => {
    const cartDiv = document.getElementById("shop-cart");
    const cartTotal = document.getElementById("total-value");

    cartTotal.innerHTML = `R$ ${getTotal(cart).toFixed(2)}`;

    cartDiv.innerHTML = "";

    cart.forEach((item) => {
        cartDiv.appendChild(createCartItem(item));
    });
};

const removeItemFromCart = (e) => {
    const itemId = e.currentTarget.getAttribute("key");

    cart = cart.filter((item) => !(item.id == itemId));

    updateCartHTML();
    console.log(cart);
};

const clearCart = () => {
    cart = [];

    updateCartHTML();
};

const createSaleParams = (employeeId, clientId, unityId) => {
    const total = getTotal(cart).toFixed(2);
    let params = `?size=${cart.length}&employeeId=${employeeId}&clientId=${clientId}&unityId=${unityId}&total=${total}`;
    let i = 1;
    cart.forEach((item) => {
        params += `&id${i}=${item.id}&amount${i}=${item.quantity}`;
        i++;
    });
    console.log(params);
    return params;
};

const sucessoVenda = () => {
    window.location = "./sucessoVenda.jsp";
}

const executeSale = (employeeId, clientId, unityId) => {
    const params = createSaleParams(employeeId, clientId, unityId);

    axios.post(`./CadastroProdutoVendaServlet${params}`)
        .then((response) => console.log(response))
        .catch((error) => console.log(error))
        .then(() => {
            clearCart();
            sucessoVenda();
        });
};

const unityFilter = (unityId) => {
    const cardGalery = document.getElementById("card-galery");
    cardGalery.innerHTML = "";

    if (unityId) {
        const filteredList = estoque.filter((element) => element.getAttribute("uid") == unityId);
        filteredList.forEach((element) => cardGalery.appendChild(element));

    } else {
        estoque.forEach((element) => cardGalery.appendChild(element));
    }
};