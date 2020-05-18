/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
window.addEventListener('load', () => {
    document.getElementById("avatar").src = `https://robohash.org/${randomNumber(1, 100)}`
});

const randomNumber = (min, max) => {
    return min + Math.floor((max - min) * Math.random());
};
