function puntuacion(punt){ 


  const exclamacion  =["¡","!"];
  const interrogacion=["¿","?"];
  let counter=0;
  punt.forEach(element =>{ 
      
  if(element.startsWith(exclamacion[0]) && element.endsWith(exclamacion[1])){
         counter++;
  }
  if(element.startsWith(interrogacion[0]) && element.endsWith(interrogacion[1])){
         counter++;
  }
               
  });

  if(counter==1){
      result="¡se ha encontrado 1 frase con buena puntuación!"
  }
  else 
  {result="¡se han encontrado "+ counter+" frases con buena puntuacón"
  }
  return result;
  }
   const s1=["¡hola mundo!","Que tal  estas?","!Genial!"]
  
  const s2=["¿hola Rosa¿","cuanto tiempo!","Bie!"]
  const s3=["¿adios juan?","¡hast otra!","¡Adios!"]
  console.log(puntuacion(s1));
  console.log(puntuacion(s2));
  console.log(puntuacion(s3));