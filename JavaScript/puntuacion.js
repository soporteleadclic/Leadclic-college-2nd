function puntuacion (frase) {

    //var frase = ["¡hola!","¡blue!","green?"];
    count=0;


    for (var i = 0; i < frase.length; i++) {
        if ((frase[i][0] === "¡" && frase[i][(frase[i].length)-1] === "!") ||
             (frase[i][0] === "¿" && frase[i][(frase[i].length)-1] === "?")){
            count=count+1;
        }
    }

if (count>1 || count===0)  {
    console.log("¡Se han encontrado " + count + " frases con buena puntuacion!");
} else if (count=1) {
    console.log("¡Se ha encontrado " + count + " frase con buena puntuacion!");
}
}

//puntuacion(["hola!","¡blue!","mundo?"]);