
{
   function extractList(list, index) {
    return list.map(function(element) { return element[index]; });
  }

  function buildList(head, tail, index) {
    return [head].concat(extractList(tail, index));
  }
  function optionalList(value) {
    return value !== null ? value : [];
  }
  function binaryExp(sign, val1, val2) {
    var obj = {
        "type": "BinaryExpression",
        "operator": sign,
        "left": val1,
        "right": val2 
    }
    return obj;
  }

  function funDeclaration(funcName, par, res) {
    
    var ops = [];
    var params = [];

    for (var i = 0; i < par.length; i++) {
      params.push(par[i][0])
    }

    if (res[0].length > 0) {
      for (var i = 0; i < res[0].length; i++) {
        ops.push(res[0][i]);
      }
    }
    ops.push(res[1]);

    var obj = {
      type: "FunctionDeclaration",
      id: funcName,
      params: params,
      body: {
        type: "BlockStatement",
        "body": ops
      },
      "generator": false,
      "expression": false,
      "async": false
    }
    return obj;
  }

  function expStatement(funcName, par1, par2) {
    var obj = {
      "type": "ExpressionStatement",
      "expression": {
        "type": "CallExpression",
        "callee": funcName,
        "arguments": [par1, par2]
      }
    }

    return obj;
  }

  function varDeclaration(ident, binExp) {
    var obj = {
      "type": "VariableDeclaration",
      "declarations": [
        {
          "type": "VariableDeclarator",
          "id": ident,
          "init": binExp
        }
      ],
      "kind": "var",
    }
    return obj;
  }

  function varAssignment(ident, expression) {
    var obj = {
      "type": "ExpressionStatement",
      "expression": {
        "type": "AssignmentExpression",
        "operator": "=",
        "left": ident,
        "right": expression
      }
    }

    return obj;
  }

  function retStatement(ops) {
    var obj = {
      "type": "ReturnStatement",
      "argument": ops
    }
    return obj;
  }

  function literal(val) {
    var obj = { type: "Literal", value: val }
    return obj;
  }
  
}

Start = _ program:Program _ { return program; }

Statement
  =  VariableDeclaration
  / VariableAssignment
  / FunctionStatement
  / FunctionExpression

ArithmeticsStatements
  = AddStatement
  / SubStatement
  / MulStatement
  / DivStatement
  / PowStatement
  / SingleLiteral

InnerStatements
  = VariableAssignment
  / ArithmeticsStatements
  / VariableDeclaration

SingleLiteral
  = lit:StringLiteral
  / lit:NumberLiteral 
  / lit:Identifier

Type
  = Boolean
  / NumberClosedInterval
  / NumberOpenInterval
  / ExactNumber
  / String
  / Function
  / Any
  / NUMBER

AddStatement
  = val1:SingleLiteral _ Plus _ val2:ArithmeticsStatements _ {
    return binaryExp("+", val1, val2);
  }

SubStatement
  = val1:SingleLiteral _ Minus _ val2:ArithmeticsStatements _ {
    return binaryExp("-", val1, val2);
  }

MulStatement
  = val1:SingleLiteral _ Multiplication _ val2:ArithmeticsStatements _ {
    return binaryExp("*", val1, val2);
  }

DivStatement
  = val1:SingleLiteral _ Division _ val2:ArithmeticsStatements _ {
    return binaryExp("/", val1, val2);
  }

PowStatement
  = val1:SingleLiteral _ Power _ val2:ArithmeticsStatements _ {
    return binaryExp("^", val1, val2);
  }

VariableDeclaration
  = _ Type _ ident:Identifier _ Assignment _ statement:InnerStatements _ {
    return varDeclaration(ident, statement);
  }

VariableAssignment
  = _ ident:Identifier _ Assignment _ statement:InnerStatements {
    return varAssignment(ident, statement)
  }

FunctionStatement
  = FunctionKeyWord FunctionParameters _ Type (_ Comma _ Type )* _ FunctionResult _ Type _ 
  func:Identifier LeftBrace par:(Identifier Comma* _ )* RightBrace _ FunctionBodyStart
   _  res:FunctionBody {
    return funDeclaration(func, par, res);
  }

FunctionExpression
  = _ func:Identifier LeftBrace par1:NumberLiteral Comma _ par2:NumberLiteral RightBrace {
    return expStatement(func, par1, par2);
  }

FunctionBody
  = _ ops:(InnerStatements)* _ ret:ReturnStatement {
    return [ops, ret]
  }
  / ret: ReturnStatement{
    return [[], ret]
  }

ReturnStatement
  = _ FunctionResult _ ops:InnerStatements _ {
    return retStatement(ops);
  }

Identifier = _ chars:([a-z0-9_]+) _ { return {type:"Identifier", name: chars.join("")}}

NumberLiteral 
  = _ digits:([0-9]+ "." [0-9]+) _ { 
      return literal(Number(digits.flat().join("")))
    }
  / _ digits:[0-9]+ _ { 
      return literal(Number(digits.join("")));
    }

StringLiteral 
  =  _ '"' chars:([a-z0-9_]+) '"' _ { 
    return literal(chars.join(""));
   }

LeftBrace = "("
RightBrace = ")"
Comma = ","
Assignment = "<-"
FunctionKeyWord = "FUNCTION"
FunctionResult = "->" 
FunctionParameters = ":"
FunctionBodyStart = "="
Boolean = "BOOLEAN"
String = "STRING"
Function = "FUNCTION"
Any = "🤷"
NUMBER = "NUMBER"
False = "FALSE"
True = "TRUE"
And = "AND"
Or = "OR"
Not = "NOT"
Equal = "EQUALS"
Identical = "IDENTICAL"
Greater = ">"
GreaterEqual = ">="
Less = "<"
LessEqual = "<="
Plus = "+"
Minus = "-"
Multiplication = "*"
Power = "^"
Division = "/"
Concat = "CONCAT"
NumberClosedInterval 
  = NUMBER+"[" + NumberLiteral+".."+NumberLiteral+"]"
NumberOpenInterval
  = NUMBER+"("+NumberLiteral+".."+NumberLiteral+")"
ExactNumber
  = NUMBER+"<"+NumberLiteral+">"

Program
  = body:SourceElements? {
      return {
        type: "Program",
        body: optionalList(body)
      };
    }

SourceElements
  = head:SourceElement tail:(_ SourceElement)* {
      return buildList(head, tail, 1);
    }

SourceElement
  = Statement

_ = [ \t\n\r]*