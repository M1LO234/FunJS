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

var toParse2 = `FUNCTION: NUMBER , NUMBER -> NUMBER
nazwa(x, y) = 
    NUMBER n <- 23 
    NUMBER m <- 23
    m <- n + 34 * 9 / 93
    -> x + n + y + m

FUNCTION: NUMBER , NUMBER -> NUMBER
nazwa2(x, y) = 
    -> x + y

nazwa(23, 21)
NUMBER n <- 23
STRING str <- 44 + n + 56
`;

var result = peg.parse(toParse2);
var code = ast.generate(result);

console.log(code);
