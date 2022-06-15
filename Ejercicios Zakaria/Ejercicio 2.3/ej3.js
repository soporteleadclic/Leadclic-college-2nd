let lista1 = ["¿Buenas?","¡Buenas!", "adios?", "¿hola"];
let lista2 = ["¿atrás¿", "?desde luego?"];
let lista3 = ["?dedo", "peñiscola¿"];

let lista4 = ["¡Buenas!", "adios!", "¡hola"];
let lista5 = ["¡atrás¡", "!desde luego!"];
let lista6 = ["!dedo", "peñiscola¡"];

function puntuacion(list){
    let puntos = 0;
    for (const frase of list){
        //console.log(frase);
        let x = frase.length-1;
        if(frase.charAt(0)=="¿" && frase.charAt(x) =="?"){
            puntos++;
        }
        if(frase.charAt(0)=="¡" && frase.charAt(x) =="!"){
            puntos++;
        }    

    }

    if(puntos == 1){
        console.log("¡Se ha encontrado 1 frase con buena puntuación!");
    }else{
        console.log("¡Se han encontrado " + puntos + " frases con buena puntuación!");
    }
}

puntuacion(lista1);
puntuacion(lista2);
puntuacion(lista3);
puntuacion(lista4);
puntuacion(lista5);
puntuacion(lista6);