# FunJS

Wstępna wersja gramatyki języka FunJS

#### Kod wejściowy własnego języka funkcyjnego:

```
FUNCTION: NUMBER , NUMBER -> NUMBER
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
```

#### Wygenerowany kod JS:

```
function isNumber(x) {
    if (typeof x === 'number') {
        return true;
    } else {
        console.log(`Expected parameter type: number, but ${ typeof x } was given.`);
    }
}
function isString(x) {
    if (typeof x === 'string') {
        return true;
    } else {
        console.log(`Expected parameter type: string, but ${ typeof x } was given.`);
    }
}
function nazwa(p1, p2, p3, p4) {
    var x = p1;
    var y = p2;
    if (arguments.length == 2 && isNumber(p1) && isNumber(p2)) {
        var n = 23;
        var m = -23;
        m = n + 34 * (9 / -93);
        return x + (n + (y + m));
    }
    var x = p1;
    var y = p2;
    var z = p3;
    if (arguments.length == 3 && isString(p1) && isNumber(p2) && isNumber(p3)) {
        return x + (y + z);
    }
    var x = p1;
    var y = p2;
    var z = p3;
    var t = p4;
    if (arguments.length == 4 && isNumber(p1) && isNumber(p2) && isNumber(p3) && isNumber(p4)) {
        return x + (y + (z + t));
    }
}
function nazwa2(p1, p2) {
    var x = p1;
    var y = p2;
    if (arguments.length == 2 && isNumber(p1) && isNumber(p2)) {
        var z = x ** y;
        console.log(z);
        return z;
    }
    var x = p1;
    if (arguments.length == 1 && isNumber(p1)) {
        var u = 23;
        var z = x(u);
        return x(u);
    }
}
(nazwa2(-5, 3))
```
