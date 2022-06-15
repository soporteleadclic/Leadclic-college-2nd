const ejemplo1= ["¡Hola mundo!", "Qué tal estás?","Genial!"]
const ejemplo2= ["¡Hola Rosa,", "Cuánto tiempo!","Bien!"]
const ejemplo3= ["¿Adiós Juan?", "¡Hasta otra!","¡Adiós!"]


let counter = 0
let a = ""
let b = ""
function FrasesCorrectas(lista) {
    counter = 0;
    for (const string of lista) {
     
    if (string.startsWith('¡') & string.endsWith('!') ) {
        counter = counter + 1 }
    else if (string.startsWith('¿') & string.endsWith('?') ) {
        counter = counter + 1 
    }

}
if (counter >= 2) {
     a = "n"
      b = "s"
}

return Frase = `¡Se ha${a} encontrado ${counter} frase${b} con buena puntuación!`

}
console.log(FrasesCorrectas(ejemplo3))