//TODO EJERCICIO 4. JS

//TODO 1.- Ante la entrada de un String, sustituye cada caracter por '(' si dicho caracter sólo aparece una vez y ')' si aparece varias veces. Ignora si son mayúsculas o minúsculas a la hora de determinar duplicados.

//let myString = 'sucedE'
let myString= '';
let lowerCaseString = myString.toLowerCase();
let singleLetter = [];
let repeatLetter =[];
let letterToParentheses ='';

let parentheses =()=>{
    for (let i = 0; i < lowerCaseString.length; i++) {
        let letter = lowerCaseString[i];
        
        if (!singleLetter.includes(letter)) {
            singleLetter.push(letter)
        } else {
            repeatLetter.push(letter)
        }
        
    }
    
    for (let i = 0; i < lowerCaseString.length; i++) {
        const element = lowerCaseString[i];
        if (repeatLetter.includes(element)) {
            letterToParentheses = letterToParentheses + ')'
        } else {
            letterToParentheses = letterToParentheses + '('
            
        }
        
    }
    console.log(letterToParentheses);
}
parentheses()