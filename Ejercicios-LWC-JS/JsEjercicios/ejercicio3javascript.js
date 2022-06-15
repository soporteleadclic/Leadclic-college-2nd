let str1 = "¡Llueve a cántaros!"
let str2 = " "
let array = []
let counter = 0

function ejer3(palabra) {
  palabranew = palabra.toLowerCase()
  for (const letra of palabranew) {  array.push(letra) }

Duplicados();
   function Duplicados(){
      for(let i = 0; i < array.length;i++) {
         if(array.indexOf(array[i]) !== array.lastIndexOf(array[i])){
            str2 = str2.concat(")")
         } else (str2 = str2.concat("("))
      }  
   }
   console.log(str2)
}

ejer3 (str1)