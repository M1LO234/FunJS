
{
  function errorGuardBody(type) {
    return {
        "type": "BlockStatement",
        "body": [
          {
            "type": "IfStatement",
            "test": {
              "type": "BinaryExpression",
              "operator": "===",
              "left": {
                "type": "UnaryExpression",
                "operator": "typeof",
                "argument": {
                  "type": "Identifier",
                  "name": "x"
                },
                "prefix": true
              },
              "right": {
                "type": "Literal",
                "value": type
              }
            },
            "consequent": {
              "type": "BlockStatement",
              "body": [
                {
                  "type": "ReturnStatement",
                  "argument": {
                    "type": "Literal",
                    "value": true,
                    "raw": "true"
                  }
                }
              ]
            },
            "alternate": {
              "type": "BlockStatement",
              "body": [
                {
                  "type": "ExpressionStatement",
                  "expression": {
                    "type": "CallExpression",
                    "callee": {
                      "type": "MemberExpression",
                      "computed": false,
                      "object": {
                        "type": "Identifier",
                        "name": "console"
                      },
                      "property": {
                        "type": "Identifier",
                        "name": "log"
                      }
                    },
                    "arguments": [
                      {
                        "type": "TemplateLiteral",
                        "quasis": [
                          {
                            "type": "TemplateElement",
                            "value": {
                              "raw": `Expected parameter type: ${type}, but `,
                            },
                            "tail": false
                          },
                          {
                            "type": "TemplateElement",
                            "value": {
                              "raw": " was given.",
                              "cooked": " was given."
                            },
                            "tail": true
                          }
                        ],
                        "expressions": [
                          {
                            "type": "UnaryExpression",
                            "operator": "typeof",
                            "argument": {
                              "type": "Identifier",
                              "name": "x"
                            },
                            "prefix": true
                          }
                        ]
                      }
                    ]
                  }
                }
              ]
            }
          }
        ]
      }
  }

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
       body: errorGuardBody("boolean"),
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
       body: errorGuardBody("number"),
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
       body: errorGuardBody("string"),
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
       body: errorGuardBody("function"),
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

     const booleanGuardFactory = () => (tested) => (funcCall({
       type: "Identifier",
       name: "isBoolean",
     }, tested));
     const numberGuardFactory = () => (tested) => (funcCall({
       type: "Identifier",
       name: "isNumber",
     }, tested));
     const numberExactGuardFactory = (value) => (tested) => (funcCall({
       type: "Identifier",
       name: "isExactNumber",
     }, tested, value));
     const numberOpenIntervalGuardFactory = (from, to) => (tested) => (funcCall({
       type: "Identifier",
       name: "isNumberOpenInterval",
     }, tested, from, to));
     const numberClosedIntervalGuardFactory = (from, to) => (tested) => (funcCall({
       type: "Identifier",
       name: "isNumberClosedInterval",
     }, tested, from, to));
     const stringGuardFactory = () => (tested) => (funcCall({
       type: "Identifier",
       name: "isString",
     }, tested));
     const functionGuardFactory = () => (tested) => (funcCall({
       type: "Identifier",
       name: "isFunction",
     }, tested));
     const anyGuardFactory = () => (tested) => (funcCall({
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

  function argNumber(n) {
    return {
      type: "BinaryExpression",
      operator: "==",
      left: {
        type: "MemberExpression",
        computed: false,
        object: {
          type: "Identifier",
          name: "arguments",
        },
        property: {
          type: "Identifier",
          name: "length",
        },
      },
      right: {
        type: "Literal",
        value: n,
      },
    };
  }

  function ifStatement(conditions, body) {
  return {
    type: "IfStatement",
    test: conditions.length === 1 ? conditions[0] : conditions.reduce((acc, val) => {
      return {
        type: "LogicalExpression",
        operator: "&&",
        left: acc,
        right: val,
      }
    }),
    consequent: {
      type: "BlockStatement",
      body: body,
    },
    alternate: null,
  };
}

function varDecl(par, newPar) {
  return {
    type: "VariableDeclaration",
    declarations: [
      {
        type: "VariableDeclarator",
        id: {
          type: "Identifier",
          name: par,
        },
        init: {
          type: "Identifier",
          name: newPar,
        },
      },
    ],
    kind: "var",
  };
}

const overload = function (parsedAST) {
  let entry;
  const map = new Map();
  var newTree = {
    type: "Program",
    body: [],
  };
  var funNames = [];

  parsedAST.body.forEach((statement) => {
    if (statement.type === "Start") {
      entry = statement.exp;
    }
    if (statement.type === "FunctionDeclaration") {
      if (map.has(statement.id.name)) {
        var functions = map.get(statement.id.name).functions;
        var maxParams = map.get(statement.id.name).maxParams;
        functions.push(statement);
        map.set(statement.id.name, {
          functions: functions,
          maxParams: Math.max(maxParams, statement.params.length),
        });
      } else {
        map.set(statement.id.name, {
          functions: [statement],
          maxParams: statement.params.length,
        });
        funNames.push(statement.id.name);
      }
    }
  });

  funNames.forEach((name) => {
    var currentFunc = map.get(name);
    const body = []
    var myFunc = {
      type: "FunctionDeclaration",
      id: {
        type: "Identifier",
        name: name,
      },
      params: [],
      body: {
        type: "BlockStatement",
        body,
      },
      generator: false,
      expression: false,
      async: false,
    };

    for (var i = 0; i < currentFunc.maxParams; i++) {
      myFunc.params.push({
        type: "Identifier",
        name: "p" + (i + 1),
      });
    }

    for (var i = 0; i < currentFunc.functions.length; i++) {
      for (var j = 0; j < currentFunc.functions[i].params.length; j++) {
        body.push(
          varDecl(currentFunc.functions[i].params[j].name, "p" + (j + 1))
        );
      }

      var ifSt = ifStatement(
        [argNumber(currentFunc.functions[i].params.length),
        ...currentFunc.functions[i].types.map((typeFactory, index) => {
          return typeFactory({
            type: "Identifier",
            name: `p${index + 1}`
          })
        })],
        currentFunc.functions[i].body.body
      );

      body.push(ifSt);
    }

    newTree.body.push(myFunc);
  });

  if (entry != undefined) {
    newTree.body.push(entry);
  }

  return newTree;
};

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

  function funDeclaration(funcName, par, res, types) {
    
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
      "async": false,
    }

    obj = types ? {...obj, types} : obj;

    return obj;
  }

  function expStatement(funcName, ...args) {
    var obj = {
      "type": "ExpressionStatement",
      "expression": {
        "type": "CallExpression",
        "callee": funcName,
        "arguments": args
      }
    }

    return obj;
  }

  function funcCall(funcName, ...args) {
    return {
        "type": "CallExpression",
        "callee": funcName,
        "arguments": args
      }
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

  function negativeLiteral(val) {
    return {
      "type": "UnaryExpression",
      "operator": "-",
      "argument": {
        "type": "Literal",
        "value": val
      },
      "prefix": true
    }
  }

  function print(exp) {
    var obj = {
      "type": "ExpressionStatement",
      "expression": {
        "type": "CallExpression",
        "callee": {
          "type": "MemberExpression",
          "computed": false,
          "object": {
            "type": "Identifier",
            "name": "console"
          },
          "property": {
            "type": "Identifier",
            "name": "log"
          }
        },
        arguments: [
          exp
        ]
      }
    }
    return obj;
  }
    
}

Start = _ program:Program _ { return program; }

ArithmeticsStatements
  = AddStatement
  / SubStatement
  / MulStatement
  / DivStatement
  / PowStatement
  / SingleLiteral

InnerStatements
  = VariableAssignment
  / VariableDeclaration
  / PrintStatement

Expression
 = FunctionExpression
 / ArithmeticsStatements

SingleLiteral
  = StringLiteral
  / NumberLiteral 
  / Identifier

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
    return binaryExp("**", val1, val2);
  }

VariableDeclaration
  = _ Variable _ ident:Identifier _ Assignment _ statement:Expression _ {
    return varDeclaration(ident, statement);
  }

VariableAssignment
  = _ ident:Identifier _ Assignment _ statement:Expression {
    return varAssignment(ident, statement)
  }

FunctionStatement
  = FunctionKeyWord FunctionParameters _ type1:Type? type2:(_ Comma _ Type )* _ FunctionResult _ Type _ 
  func:Identifier LeftBrace par:(Identifier Comma* _ )* RightBrace _ FunctionBodyStart
   _  res:FunctionBody {
    const types = [type1, ...type2.map(array => array[3])];
    return funDeclaration(func, par, res, types);
  }

FunctionExpression
  = _ func:Identifier LeftBrace par1:SingleLiteral? par2:(_ Comma _ SingleLiteral)* RightBrace {
    const pars = [par1, ...par2.map(array => array[3])]
    return funcCall(func, ...pars);
  }

FunctionBody
  = _ ops:(InnerStatements)* _ ret:ReturnStatement {
    return [ops, ret]
  }
  / ret: ReturnStatement{
    return [[], ret]
  }

ReturnStatement
  = _ FunctionResult _ ops:Expression _ {
    return retStatement(ops);
  }

PrintStatement
  = _ PrintToken _ exp:Expression {
    return print(exp);
  }

StartStatement
  = _ KeywordStart _ exp:FunctionExpression _ {
    return {type: "Start",
    exp};
  }

Identifier = _ chars:([a-z0-9_]+) _ { return {type:"Identifier", name: chars.join("")}}

NumberLiteral 
  = _ digits:([0-9]+ "." [0-9]+) _ { 
      return literal(Number(digits.flat().join("")))
    }
  / _ sign:"-"? digits:([0-9]+) _ { 
      return sign ? negativeLiteral(Number(digits.join(""))) : literal(Number(digits.join("")));
    }

StringLiteral 
  =  _ '"' chars:([a-z0-9_]+) '"' _ { 
    return literal(chars.join(""));
   }

KeywordStart = "START"
PrintToken = "PRINT"
LeftBrace = "("
RightBrace = ")"
Comma = ","
Assignment = "<-"
FunctionKeyWord = "FUNCTION"
FunctionResult = "->" 
FunctionParameters = ":"
FunctionBodyStart = "="
Boolean = "BOOLEAN" { return (typeHandler.registerTypeUsage("Boolean"), typeHandler.getGuardFactory("Boolean")) }
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
Variable = "VARIABLE"
NumberClosedInterval = Number + "[" + from:NumberLiteral + ".." + to:NumberLiteral + "]" 
   { return (typeHandler.registerTypeUsage("NumberClosedInterval"), typeHandler.getGuardFactory("NumberClosedInterval", from, to)); }
NumberOpenInterval = Number + "(" + from:NumberLiteral + ".." + to:NumberLiteral + ")"
   { return (typeHandler.registerTypeUsage("NumberOpenInterval"), typeHandler.getGuardFactory("NumberOpenInterval", from, to)); }
ExactNumber = Number + "<" + value:NumberLiteral + ">"
   { return (typeHandler.registerTypeUsage("ExactNumber"), typeHandler.getGuardFactory("ExactNumber", value)); }

Program
  = body:SourceElements? {
      const over = overload({
        type: "Program",
        body: optionalList(body)
      })
      return {type: "Program",
        body: [...typeHandler.getGuards(), ...over.body]
      }
    }

SourceElements
  = head:SourceElement tail:(_ SourceElement)* {
      return buildList(head, tail, 1);
    }

SourceElement
  = StartStatement
  / FunctionStatement

_ = [ \t\n\r]*