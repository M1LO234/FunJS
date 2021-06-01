var ast = require("escodegen");
var peg = require("./grammar.js");
// var over = require("./overloading.js");
var fs = require("fs");

var toParse = `FUNCTION: NUMBER , NUMBER -> NUMBER
nazwa(x) = NUMBER n <- 23 -> x + n

FUNCTION: NUMBER , NUMBER -> NUMBER
nazwa2(x, y) = -> x + y
nazwa(23, 21)

NUMBER n <- 23
STRING str <- 44 + n
`;

var toParse2 = `FUNCTION: NUMBER , NUMBER -> NUMBER
nazwa(x, y) = 
    VARIABLE n <- 23 
    VARIABLE m <- 23
    m <- n + 34 * 9 / 93
    -> x + n + y + m

FUNCTION: STRING , NUMBER, NUMBER -> NUMBER
nazwa(x, y, z) =
    -> x + y + z

FUNCTION: NUMBER , NUMBER, NUMBER, NUMBER -> NUMBER
nazwa(x, y, z, t) =
    -> x + y + z + t

FUNCTION: NUMBER , NUMBER -> NUMBER
nazwa2(x, y) = 
    -> x + y

FUNCTION: NUMBER -> NUMBER
nazwa2(x) = 
VARIABLE u <- 23
VARIABLE z <- x(u)
    -> x(u)

START nazwa2(1, 2)
`;

var result = peg.parse(toParse2);
// console.log(result);
// fs.writeFile("test.json", JSON.stringify(result, null, 4), function (err) {
//   if (err) {
//     console.log(err);
//   } else {
//     console.log("JSON saved to test.json");
//   }
// });

// var overrideResult = over.overload(result);
var code = ast.generate(result);

console.log(code);
