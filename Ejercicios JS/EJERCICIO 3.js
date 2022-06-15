//TODO EJERCICIO 3.JS
//TODO 1.- Realiza una función llamada 'puntuación que ante una entrada de una lista de Strings, devuelva la frase '¡Se han encontrado X frase/s con buena puntuación!' donde X sea el número de frases que compienzan y acaban con la combinacion correcta de interroagaciones/exclamaciones. Recuerda utilizar correctamente el singolar/plural de la palabra en función de los resultados.

     
//let myString = ['¡Hola mundo!', 'Qué tal estás?' , '!Genial!'];
let myString =[];
let counter = 0;

let puntuacion =()=>{
for (let i = 0; i < myString.length; i++) {
    const element = myString[i];

    if ((element[0]== '¡'&&'¿' && element[element.length-1] == '!'&&'?')) {
        counter++; 
    }
}

if (counter == 1 ) {
    console.log('¡Se ha encontrado 1 frase con buena puntuación!');
} else{
    console.log(`'¡Se han encontrado ${counter} frases con buena puntuación!'`);
}
}

puntuacion()