/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


const createUnityCard = (unity) => {
    const unityCard = document.createElement("card");
    unityCard.setAttribute("class", "unity-card");

    const unityImg = document.createElement("div");
    unityImg.setAttribute("class", "unity-img");

    const unityName = document.createElement("h1");
    unityName.setAttribute("class", "unity-name");
    unityName.innerHTML = `Unidade - ${unity.name}`;

    const cardText = document.createElement("div");
    cardText.setAttribute("class", "card-text");

    const location = document.createElement("span");
    location.setAttribute("class", "unity-location");
    location.innerHTML = `Localização - ${unity.location}`;

    unityCard.appendChild(unityImg);
    unityCard.appendChild(unityName);
    unityCard.appendChild(location);

    return unityCard;
};

const addUnityCard = (unity) => {
    const card = document.getElementById("card-galery");
    card.appendChild(createUnityCard(unity));
};

const showCreateModal = () => {
    document.getElementById("overlay").style = "display:flex";
    document.getElementById("unity-modal").style = "display:flex";
    document.getElementById("edit-modal").style = "display: none";
};

const closeModal = () => {
    document.getElementById("overlay").style = "display: none";
};

const showEditModal = (id, nome, cidade, estado) => {
    document.getElementById("overlay").style = "display:flex";
    document.getElementById("unity-modal").style = "display:none";
    document.getElementById("edit-modal").style = "display: flex";

    document.getElementById("edit-unity-id").value = id;
    document.getElementById("edit-unity-name").value = nome;
    document.getElementById("edit-unity-city").value = cidade;
    document.getElementById("edit-unity-estate").value = estado;
    
    document.getElementById("delete-unity-id").value = id;
}

document.getElementById("new-unity").addEventListener("click", showCreateModal);
document.getElementById("cancel-button").addEventListener("click", closeModal);
document.getElementById("edit-cancel-button").addEventListener("click", closeModal);

