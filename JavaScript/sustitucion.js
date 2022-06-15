function sustitucion (str) {
    var salidaEsperada = "";
    for( i=0;i<str.length;i++ ){

        if(str.indexOf(str[i]) === str.lastIndexOf(str[i]))
        salidaEsperada = salidaEsperada.concat("("); 
        else {
            salidaEsperada = salidaEsperada.concat(")");
        }
    } 

    return (salidaEsperada);


}