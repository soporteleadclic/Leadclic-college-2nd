let punto;
function puntacion(array) {
    punto= 0;
    for (let index = 0; index < array.length; index++) {//bucle de todo el array paso a paso
        let cadena = array[index];//string sacamos la primera letra y la ultima
        //console.log(cadena);        
        if (cadena.includes("¡") && cadena.includes("!")) {
           punto++; 
           //console.log(punto);
        } else if (cadena.includes("¿", ) && cadena.includes("?")) {
           punto++;
           //console.log(punto);                      
        }        
    }
} 
//ejemplos
const f1=["¡Hola mundo!","Que tal estas?","!Genial!"]
puntacion(f1);
console.log('Se ha encontrado '+punto+' frases Con buena puntuacion.')

const f2=["¿Hola Rosa¿","Cuanto Tiempo!","Bien!"]
puntacion(f2);
console.log('Se ha encontrado '+punto+' frases Con buena puntuacion.')

const f3=["¿Adios Juan?","¡Hasta otra!","¡Adios!"]
puntacion(f3);
console.log('Se ha encontrado '+punto+' frases Con buena puntuacion.')