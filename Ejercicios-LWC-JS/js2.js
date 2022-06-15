
let frase1 = ["¡Hola mundo!", "Qué tal estás?","!Genial!"]
let frase2 = ["¿Hola Rosa", "Cuánto tiempo!", "Bien!"]
let frase3 = ["¿Adiós Juan?", "¡Hasta otra!","¡Adiós!"]
let contador= 0 

function Frases (array) {
    if ( array==null || array.length===0){
        return null
    } else { // Hallamos cuantas frases correctas hay y agregamos 1 al contador por cada frase correcta.
        array.map(function(palabra){
            if( (palabra.charAt(0) == "¡" && palabra.charAt(palabra.length-1) == "!") || (palabra.charAt(0) == "¿" && palabra.charAt(palabra.length-1) == "?")){
                contador++
            }     
        })   
    }
    // Variables de salida 
    if (contador == 1 ){
        return ("Se ha encontrado " + contador + " frase con buena puntuación!") 
    } else {
        return ("Se han encontrado " + contador + " frases con buena puntuación!") 
    }
}

console.log(Frases(frase1))