function juntar(array) {
    if(array===null || array === ''){// es null
        return array=null;
    } else if (array===undefined) {
        return array===undefined;
    } else{//funcion junta
        return array.join('');
    }

}
const mundo = ["Hola ", "mundo"]
const larga = ["Esta ", "Frase ", "es ", "mas ", "larga"]
const nn = null
const vacio = []

console.log(juntar(larga));

