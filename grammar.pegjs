{
  const typeHandler = (() => {
    const booleanGuard = {
      type: "FunctionDeclaration",
      id: {
        type: "Identifier",
        name: "isBoolean",
      },
      params: [
        {
          type: "Identifier",
          name: "x",
        }
      ],
      body: {
        type: "BlockStatement",
        body: [
          {
            type: "ReturnStatement",
            argument: {
              type: "BinaryExpression",
              operator: "===",
              left: {
                type: "UnaryExpression",
                operator: "typeof",
                argument: {
                  type: "Identifier",
                  name: "x",
                },
                prefix: true,
              },
              right: {
                type: "Literal",
                value: "boolean",
              }
            }
          }
        ],
      },
      generator: false,
      expression: false,
      async: false
    };
    const numberGuard = {
      type: "FunctionDeclaration",
      id: {
        type: "Identifier",
        name: "isNumber",
      },
      params: [
        {
          type: "Identifier",
          name: "x",
        }
      ],
      body: {
        type: "BlockStatement",
        body: [
          {
            type: "ReturnStatement",
            argument: {
              type: "BinaryExpression",
              operator: "===",
              left: {
                type: "UnaryExpression",
                operator: "typeof",
                argument: {
                  type: "Identifier",
                  name: "x",
                },
                prefix: true,
              },
              right: {
                type: "Literal",
                value: "number",
              }
            }
          }
        ],
      },
      generator: false,
      expression: false,
      async: false
    };
    const numberExactGuard = {
      type: "FunctionDeclaration",
      id: {
        type: "Identifier",
        name: "isExactNumber",
      },
      params: [
        {
          type: "Identifier",
          name: "x",
        },
        {
          type: "Identifier",
          name: "value",
        },
      ],
      body: {
        type: "BlockStatement",
        body: [
          {
            type: "ReturnStatement",
            argument: {
              type: "LogicalExpression",
              operator: "&&",
              left: {
                type: "BinaryExpression",
                operator: "===",
                left: {
                  type: "UnaryExpression",
                  operator: "typeof",
                  argument: {
                    type: "Identifier",
                    name: "x",
                  },
                  prefix: true,
                },
                right: {
                  type: "Literal",
                  value: "number",
                }
              },
              right: {
                type: "BinaryExpression",
                operator: "===",
                left: {
                  type: "Identifier",
                  name: "x",
                },
                right: {
                  type: "Identifier",
                  name: "value",
                }
              }
            }
          } 
        ],
      },
      generator: false,
      expression: false,
      async: false
    };
    const numberOpenIntervalGuard = {
      type: "FunctionDeclaration",
      id: {
        type: "Identifier",
        name: "isNumberOpenInterval",
      },
      params: [
        {
          type: "Identifier",
          name: "x",
        },
        {
          type: "Identifier",
          name: "start",
        },
        {
          type: "Identifier",
          name: "stop",
        }
      ],
      body: {
        type: "BlockStatement",
        body: [
          {
            type: "ReturnStatement",
            argument: {
              type: "LogicalExpression",
              operator: "&&",
              left: {
                type: "BinaryExpression",
                operator: "===",
                left: {
                  type: "UnaryExpression",
                  operator: "typeof",
                  argument: {
                    type: "Identifier",
                    name: "x",
                  },
                  prefix: true,
                },
                right: {
                  type: "Literal",
                  value: "number",
                }
              },
              right: {
                type: "LogicalExpression",
                operator: "&&",
                left: {
                  type: "BinaryExpression",
                  operator: ">",
                  left: {
                    type: "Identifier",
                    name: "x",
                  },
                  right: {
                    type: "Identifier",
                    name: "start",
                  }
                },
                right: {
                  type: "BinaryExpression",
                  operator: "<",
                  left: {
                    type: "Identifier",
                    name: "x",
                  },
                  right: {
                    type: "Identifier",
                    name: "stop",
                  }
                },
              }
            }
          }
        ],
      },
      generator: false,
      expression: false,
      async: false
    };
    const numberClosedIntervalGuard = {
      type: "FunctionDeclaration",
      id: {
        type: "Identifier",
        name: "isNumberClosedInterval",
      },
      params: [
        {
          type: "Identifier",
          name: "x",
        },
        {
          type: "Identifier",
          name: "start",
        },
        {
          type: "Identifier",
          name: "stop",
        }
      ],
      body: {
        type: "BlockStatement",
        body: [
          {
            type: "ReturnStatement",
            argument: {
              type: "LogicalExpression",
              operator: "&&",
              left: {
                type: "BinaryExpression",
                operator: "===",
                left: {
                  type: "UnaryExpression",
                  operator: "typeof",
                  argument: {
                    type: "Identifier",
                    name: "x",
                  },
                  prefix: true,
                },
                right: {
                  type: "Literal",
                  value: "number",
                }
              },
              right: {
                type: "LogicalExpression",
                operator: "&&",
                left: {
                  type: "BinaryExpression",
                  operator: ">=",
                  left: {
                    type: "Identifier",
                    name: "x",
                  },
                  right: {
                    type: "Identifier",
                    name: "start",
                  }
                },
                right: {
                  type: "BinaryExpression",
                  operator: "<=",
                  left: {
                    type: "Identifier",
                    name: "x",
                  },
                  right: {
                    type: "Identifier",
                    name: "stop",
                  }
                },
              }
            }
          }
        ],
      },
      generator: false,
      expression: false,
      async: false
    };
    const stringGuard = {
      type: "FunctionDeclaration",
      id: {
        type: "Identifier",
        name: "isString",
      },
      params: [
        {
          type: "Identifier",
          name: "x",
        }
      ],
      body: {
        type: "BlockStatement",
        body: [
          {
            type: "ReturnStatement",
            argument: {
              type: "BinaryExpression",
              operator: "===",
              left: {
                type: "UnaryExpression",
                operator: "typeof",
                argument: {
                  type: "Identifier",
                  name: "x",
                },
                prefix: true,
              },
              right: {
                type: "Literal",
                value: "string",
              }
            }
          }
        ],
      },
      generator: false,
      expression: false,
      async: false
    };
    const functionGuard = {
      type: "FunctionDeclaration",
      id: {
        type: "Identifier",
        name: "isFunction",
      },
      params: [
        {
          type: "Identifier",
          name: "x",
        }
      ],
      body: {
        type: "BlockStatement",
        body: [
          {
            type: "ReturnStatement",
            argument: {
              type: "BinaryExpression",
              operator: "===",
              left: {
                type: "UnaryExpression",
                operator: "typeof",
                argument: {
                  type: "Identifier",
                  name: "x",
                },
                prefix: true,
              },
              right: {
                type: "Literal",
                value: "function",
              }
            }
          }
        ],
      },
      generator: false,
      expression: false,
      async: false
    };
    const anyGuard = {
      type: "FunctionDeclaration",
      id: {
        type: "Identifier",
        name: "isAny",
      },
      params: [],
      body: {
        type: "BlockStatement",
        body: [
          {
            type: "ReturnStatement",
            argument: {
              type: "Literal",
              value: true,
            }
          }
        ],
      },
      generator: false,
      expression: false,
      async: false
    };

    const booleanGuardFactory = () => (tested) => (expStatement({
      type: "Identifier",
      name: "isBoolean",
    }, tested));
    const numberGuardFactory = () => (tested) => (expStatement({
      type: "Identifier",
      name: "isNumber",
    }, tested));
    const numberExactGuardFactory = (value) => (tested) => (expStatement({
      type: "Identifier",
      name: "isExactNumber",
    }, tested, value));
    const numberOpenIntervalGuardFactory = (from, to) => (tested) => (expStatement({
      type: "Identifier",
      name: "isNumberOpenInterval",
    }, tested, from, to));
    const numberClosedIntervalGuardFactory = (from, to) => (tested) => (expStatement({
      type: "Identifier",
      name: "isNumberClosedInterval",
    }, tested, from, to));
    const stringGuardFactory = () => (tested) => (expStatement({
      type: "Identifier",
      name: "isString",
    }, tested));
    const functionGuardFactory = () => (tested) => (expStatement({
      type: "Identifier",
      name: "isFunction",
    }, tested));
    const anyGuardFactory = () => (tested) => (expStatement({
      type: "Identifier",
      name: "isAny",
    }, tested));

    const types = ['Boolean', 'Number', 'ExactNumber', 'NumberOpenInterval', 'NumberClosedInterval', 'String', 'Function', 'Any'];
    const guards = [booleanGuard, numberGuard, numberExactGuard, numberOpenIntervalGuard, numberClosedIntervalGuard, stringGuard, functionGuard, anyGuardFactory];
    const factories = [booleanGuardFactory, numberGuardFactory, numberExactGuardFactory, numberOpenIntervalGuardFactory, numberClosedIntervalGuardFactory, stringGuardFactory, functionGuardFactory, anyGuardFactory];
    const typeToIsUsed = new Map(types.map(type => [type, false]));
    const typeToGuard = new Map(types.map((type, index) => [type, guards[index]]));
    const typeToFactory = new Map(types.map((type, index) => [type, factories[index]]));

    return {
      registerTypeUsage: (type) => {
        if (!types.includes(type)) return null;
        typeToIsUsed.set(type, true);
      },
      getGuardFactory: (type, ...args) => {
        if (!types.includes(type)) return null;
        return typeToFactory.get(type)(...args);
      },
      getGuards: () => {
        return types.filter(type => typeToIsUsed.get(type)).map(type => typeToGuard.get(type));
      }
    }
  })();

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

  function expStatement(funcName, ...args) {
    var obj = {
      "type": "ExpressionStatement",
      "expression": {
        "type": "CallExpression",
        "callee": funcName,
        "arguments": args,
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
  
ReturnedStatements 
  = ArithmeticsStatements
  / FunctionExpression

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
  / Number

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
  = FunctionKeyWord FunctionParameters _ type1:Type? _ type2:(Comma _ Type)* _ FunctionResult _ Type _
  func:Identifier LeftBrace par:(Identifier Comma* _ )* RightBrace _ FunctionBodyStart
   _  res:FunctionBody {
    return funDeclaration(func, par, res);
  }

// todo(es): not working in return statement -> function expression should accept identifiers and any type of literal of any number
// we need to make clear division between statement (like return) and expression (like function call)
FunctionExpression
  = _ func:Identifier LeftBrace par1:SingleLiteral? _ pars:(Comma _ SingleLiteral)* RightBrace {
    return expStatement(func, par1, ...pars.map(x => x[2]));
  }

FunctionBody
  = _ ops:(InnerStatements)* _ ret:ReturnStatement {
    return [ops, ret]
  }
  / ret: ReturnStatement{
    return [[], ret]
  }

ReturnStatement
  = _ FunctionResult _ ops:ReturnedStatements _ {
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
Boolean = "BOOLEAN" { return (typeHandler.registerTypeUsage("Boolean"), typeHandler.getGuardFactory("Boolena")) }
String = "STRING" { return (typeHandler.registerTypeUsage("String"), typeHandler.getGuardFactory("String")) }
Function = "CALLABLE" { return (typeHandler.registerTypeUsage("Function"), typeHandler.getGuardFactory("Function")) }
Any = "🤷" { return (typeHandler.registerTypeUsage("Any"), typeHandler.getGuardFactory("Any")) }
Number = "NUMBER" { return (typeHandler.registerTypeUsage("Number"), typeHandler.getGuardFactory("Number")) }
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
NumberClosedInterval = Number + "[" + from:NumberLiteral + ".." + to:NumberLiteral + "]" 
  { return (typeHandler.registerTypeUsage("NumberClosedInterval"), typeHandler.getGuardFactory("NumberClosedInterval", from, to)); }
NumberOpenInterval = Number + "(" + from:NumberLiteral + ".." + to:NumberLiteral + ")"
  { return (typeHandler.registerTypeUsage("NumberOpenInterval"), typeHandler.getGuardFactory("NumberOpenInterval", from, to)); }
ExactNumber = Number + "<" + value:NumberLiteral + ">"
  { return (typeHandler.registerTypeUsage("ExactNumber"), typeHandler.getGuardFactory("ExactNumber", value)); }

Program
  = body:SourceElements? {
      return {
        type: "Program",
        body: [...typeHandler.getGuards(), ...optionalList(body)]
      };
    }


SourceElements
  = head:SourceElement tail:(_ SourceElement)* {
      return buildList(head, tail, 1);
    }

SourceElement
  = Statement

_ = [ \t\n\r]*