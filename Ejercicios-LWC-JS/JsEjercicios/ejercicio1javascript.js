HelloWorldArr = ["Hola", "Mundo"];
FraseArr = ["Esta", "es", "una", "frase", "mas", "larga"];
Vacio = null;
ArrVacio = [];
let Frase = ""

function juntar(Valor) {
    if (Valor == "" || Valor.lenght == 0 ) {
      return null
    }
    if (Valor != null )
     {
        if (Frase != null ) {
            Frase = ""
    
        Valor.forEach(element => {
       
          Frase = Frase + ' ' + element;
        }); 
        return Frase } } return null
    
}
console.log(juntar(HelloWorldArr));
