
let lista = ['Esto', 'es', 'una', 'prueba'];
let lista2 = ['lista'];
let lista3 = [];
let lista4 = null;

function juntar(x) {

    if(x === null || x.length == 0){
        return null;
    }else{
        return x.join(' ');
    }
}

console.log(juntar(lista));
console.log(juntar(lista2));
console.log(juntar(lista3));
console.log(juntar(lista4));