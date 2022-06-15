let EntHolaMundo = ["Hola","Mundo"];
let EntFraselarga = ["Esta","es","una","frase","mas","larga"]


function juntar(arrayDeString){
    let unString = '';
    if(arrayDeString == null || arrayDeString.length == 0){
        console.log('Es nulo')
        return null
    }else if(arrayDeString.length>0){
        unString = arrayDeString.join(' ')
    }
    console.log(unString);
    return unString;
    

}

juntar(EntFraselarga);