function sustituye(palabra){
    let result ="";
    palabra.toUpperCase().split('').forEach(function(c) {
      result+=((palabra.toUpperCase().split(c).length - 1)>1)?')':'(';
    });
    return result;
  }