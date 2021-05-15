// Example 1

function isNumber(x) {
  typeof x === 'number';
}

function Name(P1, P2) {
  if (isNumber(P1), isNumber(P2)) {
    const result = P1 + P2;
    if (!isNumber(result)) throw new Error("Type error");
    return result;
  }
  throw new Error("Type error")
}

// Example 2

function isExactNumber(x, number) {
  typeof x === 'number' && x === number;
}

function Fib(P1) {
  if (isExactNumber(P1, 0)) {
    const result = 0;
    if (!isNumber(result)) throw new Error("Type error");
    return result;
  } else if (isExactNumber(P1, 1)) {
    const result = 1;
    if (!isNumber(result)) throw new Error("Type error");
    return result;
  } else if (isNumber(P1)) {
    const result = Fib(P1-1) + Fib(P1-2);
    if (!isNumber(result)) throw new Error("Type error");
    return result;
  }
  throw new Error("Type error")
}

// Example 3

// isBoolean, isString, isNotSet

function Test(P1, P2) {
  if (isNumberInRange(P1, 0, 100) && isNotSet(P2)) {
    const result = P1 < 50;
    if (!isBoolean(result)) throw new Error("Type error");
    return result;
  } else if (isNumberInRange(P1, 101, 200) && isNotSet(P2)) {
    const result = P1 > 150;
    if (!isBoolean(result)) throw new Error("Type error");
    return result;
  } else if (isString(P1) && isString(P2)) {
    const result = P1 + P2
    if (!isString(result)) throw new Error("Type error");
    return result;
  }
  throw new Error("Type error")
}
