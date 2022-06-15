let frase1 = "iiii";
let frase2 = "sucEde";
let frase3 = "¡Llueve a cántaros!";
let frase4 = "";

function enParentesis (input){
        //Array que marca con "x" los indicdes de los caracteres repetidos en funcion de su código ascii
    var caracteres = []; 
    for(i=0 ; i<255 ; i++){
        caracteres[i]=0;
    }
        //Es el resultado que se devolverá
    let resultado = "";
        //Como se cuentan tanto mayusculas como minúsculas, se pasa todo a minuscula para simplificar la funcion
    let frase = input.toLowerCase();

        // se recorre la frase, y se comprueba si el hueco de cada caracter está marcado en el Array
        // charCodeAt devuelve el numero ascii del carcter del indice "i" de "frase"
        for(i=0 ; i<frase.length ; i++){
            let x = frase.charCodeAt(i);
            let w = caracteres[x]; 
            w++; 
            caracteres[x] = w;
            //console.log(caracteres[x]);
        }

        for(i=0 ; i<frase.length ; i++){
            let x = frase.charCodeAt(i);
            if(caracteres[x]>1){
                resultado = resultado + ")";
            }else{
                resultado = resultado + "(";
            }
        }
        console.log(resultado);
    }


enParentesis (frase3);