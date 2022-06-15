let veces;
function ejercicio(string) { 
    var solucion = ""; //construccion ()()()
    for (let index = 0; index < string.length; index++) {
        var Caracter = string.charAt(index);//primer valor
        Caracter.toLowerCase();//minusculas entero
        veces =0;
        for (let num = 0; num < string.length; num++) {
            if (Caracter ==string.charAt(num)) {//cuantas veces sale la misma letra
                veces++;
            }
        }
        //console.log(Caracter);console.log(veces); pruebas
        if (veces==1) {//si es unico
            solucion=solucion+"(";
        }else {//si sale mas veces
            solucion=solucion+")";
        }
    }//ver solucion
    console.log(solucion);
}
//pruebas
var frase1 ="pin";
ejercicio(frase1);
var frase2 ="SucEde";
ejercicio(frase2);
var frase3 ="¡Llueve a cantaros!";
ejercicio(frase3);