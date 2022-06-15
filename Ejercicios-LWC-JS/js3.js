
    
function numberofLetter(lettre,mot)
{
    mot = mot.split('');
    var counter = 0;
    for(var i = 0; i < mot.length; i++)
    {
        if(lettre == mot[i])
            counter++;
    }
    return counter;}
    

function change(str){
result =""

occ = 0;
for (var i = 0 ; i < str.length ; i++){
 
for (var j = 0 ; j < str.length ;j++)
    s = numberofLetter(str[i].toLowerCase(),str.toLowerCase());



    if (s == 1)
        result+= "(" ;
    else {
        result+= ")";
        }
}
return result ;
}
console.log( change("sucEde"));
console.log( change("pin"));
console.log( change("iLlueve a càntaros!"));

