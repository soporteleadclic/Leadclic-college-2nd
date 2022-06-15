function reemplazar (input) {
    let result = "";
    input = input.toLowerCase();
    let duplicateChars = new Set();
    for (let i = 0; i< input.length; i++) {
        let lastIndex = input.lastIndexOf(input[i]);
        if (i == lastIndex && !duplicateChars.has(input[i])){
            //no duplicate
            result += "("
        }else{
            //duplicate
            duplicateChars.add(input[i])
            result += ")"
        }
    }
    return result;
}

//TESTS
function assert(condition, testNb) {
    if (!condition) {
        throw new Error(testNb + " failed.");
    }
    console.log(testNb + " passed.")
}
let input1 = "pin";
let input2 = "sucEde";
let input3 = "¿Llueve a cántaros!";

console.log(reemplazar(input1));
assert(reemplazar(input1) == "(((", "Test 1")
console.log(reemplazar(input2));
assert(reemplazar(input2) == "((()()", "Test 2")
console.log(reemplazar(input3));
assert(reemplazar(input3) == "())()())))(((()((((", "Test 3")
