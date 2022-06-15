
let Nombre = "¡LlueVe A cantAroS!";
let Minuscula = Nombre.toLowerCase();
let UnCaracter = [];
let CaracteresRepetidos = [];
let CHarParentesis = '';

let EjercicioJS =()=>{


    for (let i=0; i<Minuscula.length; i++) {
        let CHar = Minuscula[i];

        if(!UnCaracter.includes(CHar)){
            UnCaracter.push(CHar)
        }else{
            CaracteresRepetidos.push(CHar)
        }
    
    }
        
    for(let i = 0; i <Minuscula.length;i++){
        const element = Minuscula[i];

        if(CaracteresRepetidos.includes(element)){
            CHarParentesis = CHarParentesis + ')'
        }else{
            CHarParentesis = CHarParentesis + '('
        }
    }
    console.log(CHarParentesis)

}
         

EjercicioJS(Nombre)