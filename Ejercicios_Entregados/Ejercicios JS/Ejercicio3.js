//Ejercicio 3
var lista = ["hola mundo!", "¿Que tal estás","!Genial!"];

//Funcion puntuacion que puntua una lista de strings en funcion de 
//Interrogaciones/exclamaciones combinados bien
function puntuacion ( list){
    var res =0;  //Variable donde se almacena el numero de combinaciones correctas
    for (var i=0;i<list.length;i++) {  //iterar todos los elementos de la lista
    //Obtener el primer y ultimo caracter de cada string de la lista
    var caracteres =  list[i].slice(0,1) + list[i].slice(-1); 
    if (caracteres == "¡!" || caracteres == "¿?" ) { 
    res++;  //Si la combinacion es correcta incrementa en uno la variable res
    }
    }
    if (res==1) { //Si se ha encontrado una frase con combinacion correcta se devuelve la frase correspondiente
        return "¡Se ha encontrado 1 frase con buena puntuación!";
    }
    else { //En caso de encontrar mas frases o ninguna se devuelve la frase correspondiente
        return "¡Se han encontrado " + res + " frases con  buena puntuación!";
    }

}

console.log(puntuacion(lista));