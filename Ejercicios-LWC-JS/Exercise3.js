function puntuacion(input) {
    let exclamation = ["¡", "!"];
    let question = ["¿", "?"];

    let counter = 0;
    for (let i=0; i<input.length; i++) {
        if (input[i].startsWith(exclamation[0]) && input[i].endsWith(exclamation[1])){
            counter +=1;
        } 
        else if (input[i].startsWith(question[0]) && input[i].endsWith(question[1])){
            counter +=1;
        } 
    }
    if(counter == 1) {
        console.log("Se ha encontrado " + counter + " frase con buena puntuación.")
    } else {
        console.log("Se han encontrado " + counter + " frases con buena puntuación.")
    }
    return counter;
}

// TESTS
function assert(condition, testNb) {
    if (!condition) {
        throw new Error(testNb + " failed.");
    }
    console.log(testNb + " passed.");
}
let input1 = ["¡Hola mundo!", "Qué tal estás?", "!Genial!"];
let input2 = ["¿Hola Rosa¿", "Cuánto tiempo!", "Bien!"];
let input3 = ["¿Adiós Juan?", "¡Hasta otra!", "¡Adiós!"];
assert(puntuacion(input1) == 1, "Test 1");
assert(puntuacion(input2) == 0, "Test 2");
assert(puntuacion(input3) == 3, "Test 3");
