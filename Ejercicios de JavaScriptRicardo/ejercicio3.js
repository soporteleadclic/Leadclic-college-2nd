
const myFunction = (param) => {
  let newString = param.toLowerCase();
  let arrayTocomplete = [];
  let caracteresRepetidos = [];
 
  // Aqui hago un bucle y lo que hago es separar las letras del string, las que estan repetidas para caracteresRepetidos y las que no al ArrayToComplete
  for (let p of newString) {
    if (!arrayTocomplete.includes(p)) {
      arrayTocomplete.push(p);
    } else {
      caracteresRepetidos.push(p);
    }
  }
//Aqui defino una variable text, si no se hace da undefined;
  let text = "";
  console.log(arrayTocomplete);
  console.log(caracteresRepetidos);
// Este bucle lo que hago es comparar el NewString recibido con los caracteres repetidos, luego agrego suma a mi cadena anterior y ya estaria.
  for (let c of newString) {
    if (caracteresRepetidos.includes(c)) {
      text += ")";
    } else {
      text += "(";
    }
  }

  return text;
};
console.log(myFunction("¡Llueve a cántaros!"));