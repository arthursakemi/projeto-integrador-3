/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


const consultaCep = (cep) => {
    axios.get(`https://viacep.com.br/ws/${cep}/json`)
            .then((response) => {
                const {localidade, uf, logradouro} = response.data;
                console.log(response);

                document.getElementById("city").value = localidade;
                document.getElementById("estate").value = uf;
                document.getElementById("address").value = logradouro;
            });
};