/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

const estoque = Array.from(document.getElementsByClassName("stock-card"));

const showStockModal = () => {
    document.getElementById("overlay").style = "display: flex";
};

const closeStockModal = () => {
    document.getElementById("overlay").style = "display: none";
};

const addProductToStock = (idProduto, idUnidade, quantidade) => {
    if (idUnidade && idProduto) {
        const uri = generateURI(idProduto, idUnidade, quantidade);

        axios.get(`./CadastroEstoqueServlet${uri}`)
                .then((response) => console.log(response))
                .catch((error) => console.log(error))
                .then(closeStockModal());
    } else {
        closeStockModal();
    }

};

const updateProductStock = (id, idProduto, idUnidade, quantidade) => {
    const uri = generateURI(idProduto, idUnidade, quantidade, id);

    axios.get(`./EditarEstoqueServlet${uri}`)
            .then((response) => console.log(response))
            .catch((error) => console.log(error))
            .then(closeStockModal());

};

const generateURI = (idProduto, idUnidade, quantidade, id = null) => {
    let uri;

    if (id) {
        uri = `?id=${id}&idProduto=${idProduto}&idUnidade=${idUnidade}&quantidade=${quantidade}`;
    } else {
        uri = `?idProduto=${idProduto}&idUnidade=${idUnidade}&quantidade=${quantidade}`;
    }
    return uri;
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

const submitStockUpdate = (idProduto, idUnidade, quantidade) => {
    const filter = estoque.filter((element) => element.getAttribute("pid") == idProduto && element.getAttribute("uid") == idUnidade);

    if (filter.length) {
        const id = filter[0].getAttribute("key");
        updateProductStock(id, idProduto, idUnidade, quantidade);
    } else {
        addProductToStock(idProduto, idUnidade, quantidade);
    }

    window.location.reload();
    return false;
};