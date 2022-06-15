function juntar(str){
  result="";
   if(str==null){
 result ="null";
  }
  else if(str.length==0)
  {result="null";}
  
  else{
str.forEach(element => result+=" "+element);
      //console.log("result="+result)
  }
return result;
} 
const txt=["Hola","Mundo"];
const txt1=["Esta","es","una","frase" ,"mas","larga"];
const txt2=[];
const txt3=null;

console.log(juntar(txt));
console.log(juntar(txt1));
console.log(juntar(txt2));
console.log(juntar(txt3));