let palabra1 = "pin"
let palabra2 = "sucEde"
let palabra3 = "¡Llueve a cántaros!"
let salida = ""

// en caso de entrar un string vacio la salida sera un string vacio.
function Reescribir (palabra){
    minuscula = palabra.toLowerCase()   // Convertimos todo a minuscula ya que js es sensible a las mayusculas.
    tamaño = minuscula.length
    for ( i=0 ; i<tamaño; i++ ){        //Iteramos entre todos los varoes de la cadena 
        console.log(i)
        // Buscamos el primer y ultmo caracter en la cadena y si sus posiciones son distintas, nos confirmara que hay al menos se repite dos veces.
        if (minuscula.indexOf(minuscula[i])==minuscula.lastIndexOf(minuscula[i])) {  
            salida=salida.concat("(")
        } else {
            salida=salida.concat(")")
        }
    }
    return salida

} 

console.log(Reescribir(palabra3));