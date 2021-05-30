# FunJS

Wstępna wersja gramatyki języka FunJS

#### Kod wejściowy własnego języka funkcyjnego:

```
FUNCTION: NUMBER , NUMBER -> NUMBER
nazwa(x, y) =
    NUMBER n <- 23
    NUMBER m <- 23
    m <- n + 34 * 9 / 93
    -> x + n + y + m

FUNCTION: NUMBER , NUMBER -> NUMBER
nazwa(x, y, z) =
    -> x + y + z

FUNCTION: NUMBER , NUMBER -> NUMBER
nazwa(x, y, z, t) =
    -> x + y + z + t

FUNCTION: NUMBER , NUMBER -> NUMBER
nazwa2(x, y) =
    -> x + y

FUNCTION: NUMBER , NUMBER -> NUMBER
nazwa2(x) =
    NUMBER u <- 23
    -> x + u

nazwa(23, 21)
NUMBER n <- 23
STRING str <- 44 + n + 56
```

#### Wygenerowany kod JS:

```
function nazwa(p1, p2, p3, p4) {
    if (arguments.length == 2) {
        var x = p1;
        var y = p2;
        var n = 23;
        var m = 23;
        m = n + 34 * (9 / 93);
        return x + (n + (y + m));
    }
    if (arguments.length == 3) {
        var x = p1;
        var y = p2;
        var z = p3;
        return x + (y + z);
    }
    if (arguments.length == 4) {
        var x = p1;
        var y = p2;
        var z = p3;
        var t = p4;
        return x + (y + (z + t));
    }
}
function nazwa2(p1, p2) {
    if (arguments.length == 2) {
        var x = p1;
        var y = p2;
        return x + y;
    }
    if (arguments.length == 1) {
        var x = p1;
        var u = 23;
        return x + u;
    }
}
```
