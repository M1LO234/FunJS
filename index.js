var ast = require("escodegen");
var peg = require("./grammar.js");

var toParse = `FUNCTION: NUMBER , NUMBER -> NUMBER
nazwa(x) = NUMBER n <- 23 -> x + n

FUNCTION: NUMBER , NUMBER -> NUMBER
nazwa2(x, y) = -> x + y
nazwa(23, 21)

NUMBER n <- 23
STRING str <- 44 + n
`;

var result = peg.parse(toParse);
var code = ast.generate(result);

console.log(code);
