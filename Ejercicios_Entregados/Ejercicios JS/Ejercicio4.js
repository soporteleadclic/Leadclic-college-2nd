//Ejercicio 4
entrada = new String ("pin");

//Funcion que ante un string de entrada sustituye cada caracter por "(" si no se repite en todo el string
//o ")" en caso de que sí se repita dicho caracter, no diferncia entre mayúsculas y minúsculas.
function sustituir (entrada){
    entrada = entrada.toLowerCase(); //Se convierte la entrada en minúsculas.
    var res = new String("");   // Se crea una variable donde se irá guardando el resultado 
    //iteramos todos los caracteres del string
    for (var i=0; i<entrada.length;i++) { 
        //iteramos de nuevo todos los caracteres del string para compararlos con el actual
        for (var j=0; j<entrada.length;j++) { 
                //comparamos el caracter actual con todos los demas del string
                //si el caracter se repite se añade un ")" a la variable de resultado
                //hay que añadir una condicion para que no se tome en cuenta la comparacion consigo mismo
                if (entrada.slice(i,i+1) == entrada.slice(j,j+1) && i!=j) {
                    res += ")";
                    break;
                } //si el caracter no se repite se añade un "("
                else if (j == entrada.length-1) {
                    res += "(";
                }
            }
        }
    return res;  //Devolver el resultado obtenido en funcion de la entrada correspondiente
}

entrada = sustituir(entrada);
console.log(entrada);