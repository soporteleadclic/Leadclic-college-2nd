function juntar(input) {
  let output = null;
  if (input !== null && input.length > 0) {  
      output = input.join(" ");
    }
  return output;
}

// TESTS
function assert(condition, testNb) {
  if (!condition) {
      throw new Error(testNb + " failed.");
  }
  console.log(testNb + " passed.")
}

let input1 = ["Hola", "Mundo"];
let input2 = ["Esta", "es", "una", "frase", "más", "larga."];
let input3 = null;
let input4 = [];

console.log(juntar(input1));
assert(juntar(input1) == "Hola Mundo", "Test 1")
console.log(juntar(input2));
assert(juntar(input2) == "Esta es una frase más larga.", "Test 2")
console.log(juntar(input3));
assert(juntar(input3) == null, "Test 3")
console.log(juntar(input4));
assert(juntar(input4) == null, "Test 4")