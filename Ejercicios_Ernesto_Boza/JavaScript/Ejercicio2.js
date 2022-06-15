let numberX = 0;
let StringF = ["¡Hola mundo!","Qué tal estas?","¡Genial!"]


let puntuacion =()=>{

    for(let i = 0; i<StringF.length; i++){
        const element = StringF[i];

        if((element[0]== '¡' && '¿' && element[element.length-1] == '!' && '?')){
            numberX++;
        }
    }

    if(numberX == 1){
        console.log("¡Se ha encontrado 1 frase con buena puntuación!");
    }else{
        console.log(`¡Se han encontrado ${numberX} frases con buena puntuación!`)
    }
}



puntuacion(StringF);