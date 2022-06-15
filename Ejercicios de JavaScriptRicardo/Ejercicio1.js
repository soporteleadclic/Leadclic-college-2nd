let saludo = ["Hola", "Mundo"];
let frase = ["Esta", "es", "una", "frase", "más", "larga"];
let nulo;
let array = [];
let salida;

let juntar = (parametro) =>{
    if(parametro == null || parametro.length == 0 ){
        salida = null;
        console.log(salida)
        return salida
        
    }
    else if(parametro.length > 0){
        salida = parametro.join(' ')
        console.log(salida);
        return salida
        
    }
    

    
}

juntar(array)
console.log("x")



