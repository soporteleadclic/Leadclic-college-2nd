// Ejercicio 2 .JS
const lista = ["Hola","mundo"];

//funcion que devuelve un solo string con todos los elementos de una lista 
function juntar (list) { 

    if(list == null ||list.length==0 ) { //si la lista esta vacía o nula devuelve null
    return null;  
    }
    else {  //si la lista contiene elementos se añaden en una variable en orden
        var frase = list[0];
        for (var i =1; i<list.length;i++) {
            frase += " "+ list[i];  //separar los diferentes elementos de la lista por espacio
        }
    return frase;  //devolver el resulado de juntar la lista en un stringo
    }
    
}

console.log (juntar(lista));
