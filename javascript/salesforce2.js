const sustituir = (string) => {
    const minusculas = string.toLowerCase()
    const result = []
    let contador = 0
    for (let index = 0; index < minusculas.length; index++) {
        const element = minusculas[index];
        for (let j = 0; j < minusculas.length; j++) {
            const item = minusculas[j];
            if (element === item) {
                contador++
            }
        }
        if (contador >= 2) {
            result.push(')')
            contador = 0
        } else {
            result.push('(')
            contador = 0
        }
    }
    const resultado = result.join('')
    return resultado
}
console.log(sustituir('¡llueve a cäntaros!'));

//    let posicion = array.indexOf(item)
// const noRepetidas = array.filter((item,index)=>{return array.indexOf(item)===index})
// const repetidas = array.filter((item,index)=>{return array.indexOf(item)!==index})
// const insertarA = noRepetidas.map(item=>'(')
// const insertarB = repetidas.map(item=>')')