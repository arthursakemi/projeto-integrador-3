/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


const unidades = Array.from(document.getElementsByClassName("unity-card"));

const clearFilters = () => {
    console.log("clear")
    document.getElementById("search-field").value = "";
    refreshUnityTable(unidades);
};

const filterUnitytList = (filter) => {
    if (filter) {
        const filteredList = unidades.filter((unidade) => {
            const nameFilter = unidade.getAttribute("nome").toLowerCase().includes(filter.toLowerCase());
            const cityFilter = unidade.getAttribute("cidade").toLowerCase().includes(filter.toLowerCase());
            const estateFilter = unidade.getAttribute("estado").toLowerCase().includes(filter.toLowerCase());

            return nameFilter || cityFilter || estateFilter;
        });

        refreshUnityTable(filteredList);

    } else {
        refreshUnityTable(unidades);
    }
};

const refreshUnityTable = (unityList) => {
    const unityGalery = document.getElementById("card-galery");

    unityGalery.innerHTML = "";

    unityList.forEach((unity) => {
        unityGalery.appendChild(unity);
    });
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
};

document.getElementById("new-unity").addEventListener("click", showCreateModal);
document.getElementById("cancel-button").addEventListener("click", closeModal);
document.getElementById("edit-cancel-button").addEventListener("click", closeModal);
document.getElementById("clear-button").addEventListener("click", clearFilters);
