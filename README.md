# FunJS

Wstępna wersja gramatyki języka FunJS

#### Kod wejściowy własnego języka funkcyjnego:

```
FUNCTION: NUMBER , NUMBER -> NUMBER
nazwa(x, y) =
NUMBER n <- 23
NUMBER m <- 23
m <- n + 34 \* 9 / 93
-> x + n + y + m

FUNCTION: NUMBER , NUMBER -> NUMBER
nazwa2(x, y) =
-> x + y

nazwa(23, 21)
NUMBER n <- 23
STRING str <- 44 + n + 56
```

#### Wygenerowany kod JS:

```
function nazwa(x, y) {
var n = 23;
var m = 23;
m = n + 34 \* (9 / 93);
return x + (n + (y + m));
}
function nazwa2(x, y) {
return x + y;
}
nazwa(23, 21);
var n = 23;
var str = 44 + (n + 56);
```
