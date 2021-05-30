function ifStatement(number, body) {
  return {
    type: "IfStatement",
    test: {
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
        value: number,
      },
    },
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
  const map = new Map();
  var newTree = {
    type: "Program",
    body: [],
  };
  var funNames = [];

  parsedAST.body.forEach((statement) => {
    if (statement.type == "FunctionDeclaration") {
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
    var myFunc = {
      type: "FunctionDeclaration",
      id: {
        type: "Identifier",
        name: name,
      },
      params: [],
      body: {
        type: "BlockStatement",
        body: [],
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
      var funcBody = [];
      for (var j = 0; j < currentFunc.functions[i].params.length; j++) {
        funcBody.push(
          varDecl(currentFunc.functions[i].params[j].name, "p" + (j + 1))
        );
      }

      var ifSt = ifStatement(
        currentFunc.functions[i].params.length,
        funcBody.concat(currentFunc.functions[i].body.body)
      );

      myFunc.body.body.push(ifSt);
    }

    newTree.body.push(myFunc);
  });

  return newTree;
};

module.exports = { override };
