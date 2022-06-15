//ejercicio 3 js

const puntuacion = (array) => {
  let frase = "";
  let contador = 0;
  let verbo = "";
  array.forEach((item) => {
    const exclamaciones = item.indexOf("¡") === 0 && item.indexOf("!") === item.length - 1;
    const interrogaciones = item.indexOf("¿") === 0 && item.indexOf("?") === item.length - 1;

    if (exclamaciones || interrogaciones === true) {
      contador++;
      frase = "frase";
    }
  });

  if (contador === 1) {
    frase = "frase";
    verbo = "ha";
  } else {
    frase = "frases";
    verbo = "han";
  }

  let fraseResolucionPlural = `¡Se ${verbo} encontrado ${contador} ${frase} con buena puntuación!`;

  return fraseResolucionPlural;
};
const itemExample = ["¡Hola mundo!", "Qué tal estás?", "!Genial!"];
const itemExample2 = ["¿Hola Rosa¿", "Cuánto tiempo!", "Bien!"];
const itemExample3 = ["¿Adiós Juan?", "¡Hasta otra!", "¡Adiós!"];
const itemExample4 = [
  "¿Hola Rosa¿",
  "Cuánto tiempo!",
  "Bien!",
  "¡Hola mundo!",
  "Qué tal estás?",
  "!Genial!",
  "¿Adiós Juan?",
  "¡Hasta otra!",
  "¡Adiós!",
  "¿esta es mi prueba buena?",
];
console.log(puntuacion(itemExample4));
