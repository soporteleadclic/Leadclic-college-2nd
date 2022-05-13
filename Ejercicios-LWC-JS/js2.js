const SIGNOS={'¿':'?', '¡':'!'};

function puntuacion(arr) {
  let n = arr.reduce((a,s)=> (SIGNOS[s[0]]&&s.endsWith(SIGNOS[s[0]])||0)+a, 0);
  return `¡Se ha${ n-1?'n':'' } encontrado ${ n } frase${ n-1?'s':'' } con buena puntuación!`;
}