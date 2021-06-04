var ast = require("escodegen");
var peg = require("./grammar.js");
var fs = require("fs");

var toParse = `FUNCTION: NUMBER , NUMBER -> NUMBER
nazwa(x, y) = 
    VARIABLE n <- 23 
    VARIABLE m <- -23
    m <- n + 34 * 9 / -93
    -> x + n + y + m

FUNCTION: STRING, NUMBER, NUMBER -> NUMBER
nazwa(x, y, z) =
    -> x + y + z

FUNCTION: NUMBER , NUMBER -> NUMBER
nazwa2(x, y) = 
  VARIABLE z <- x ^ y
  PRINT z
    -> z

FUNCTION: NUMBER , NUMBER, NUMBER, NUMBER -> NUMBER
nazwa(x, y, z, t) =
    -> x + y + z + t

FUNCTION: NUMBER -> NUMBER
nazwa2(x) = 
VARIABLE u <- 23
VARIABLE z <- x(u)
    -> x(u)

 START nazwa2(-5, 3)
`;

try {
  var result = peg.parse(toParse);
  var code = ast.generate(result);
  console.log("JavaScript code generated successfully.");
} catch (err) {
  try {
    var errorMessage = `
${err.message}
Location: line ${err.location.start.line}, column ${err.location.start.column}.
`;
    console.log(errorMessage);
  } catch (e) {
    console.log(err);
  }
}

fs.writeFileSync("test.js", code);
