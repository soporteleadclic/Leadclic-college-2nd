
//ejercicio2 js
const juntar = (array) => {
    if(array===null || array=== '' || array.lenght == 0){
       return array=null
    }else if (
        array===undefined
    )
    {
        return array=undefined
    }
    else{
        return array.join(' ')
    }
}

const arrayFrase = ["Esta", "es","una","frase","mas","larga"]
const nula = null
const vacio = []
console.log(juntar(vacio));
