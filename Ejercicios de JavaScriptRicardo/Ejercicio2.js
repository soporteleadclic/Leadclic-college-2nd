// // //Realiza una función llamada puntuación" que ante una entrada de una lista de Strings, 
// devuelva la frase "iSe han encontrado x frase/s
// // con buena puntuacion! donde x sea el numero de frases que comienzan y acaban con la combinacion correcta de
// // interrogaciones/exclamaciones. Recuerda utilzar correctamente el pluralsingular 
// de la palabra frase en función de los resultados

let saludoGeneral = ["¡Hola mundo!", "Qué tal estás?", "¡Genial!"];
let saludoRosa = ["¿Hola Rosa¿", "Cuánto Tiempo!", "Bien!"];
let saludoJuan = ["¿Adiós Juan?", "¡Hasta otra!", "¡Adiós!"];
let contador = 0;

let frase;
let fraseCompleta;

const puntuacion = (listaDeString) => {

    if(listaDeString.length > 0){
    for (const string of listaDeString) {
        if((string[0] == '¿' && string[string.length-1] == '?') || (string[0] == '¡' && string[string.length-1] == '!')){
            contador = contador + 1}}

        if(contador > 1 || contador === 0){
                frase = 'frases';
                fraseCompleta = "Se han encontrado " + contador + " " + frase + " con buena puntuación!"
                console.log(fraseCompleta);
                return fraseCompleta
            }
            else if(contador == 1){
                frase = 'frase';
                fraseCompleta = "Se han encontrado " + contador + " " + frase + " con buena puntuación!"
                console.log(fraseCompleta);
                return fraseCompleta;
            }

            

            
        }
       
    }
    
    


puntuacion(saludoGeneral);






