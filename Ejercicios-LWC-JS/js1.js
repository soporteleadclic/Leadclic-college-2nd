
let mundo = ["Hola","Mundo"]
let FraseLarga = ["Esta", "es","una","frase","más","larga"]
let vacio = null
let arrayvacio=[]

function array_to_string (array) {
    if ( array==null || array.length===0){
        return null
    } else {
        salida = array.join(" ")
        return salida
    }
}

console.log(array_to_string(vacio))