=========== Example 1 ==================

Function: Number, Number -> Number
Name(Param1, Param2) = Param1 + Param2

=========== Example 2 ==================

Function: Number<0> -> Number
Fib(P1) = 0

Function: Number<1> -> Number
Fib(P1) = 1

Function: Number -> Number
Fib(P1) = Fib(P1-1) + Fib(P1-2)

=========== Example 3 ==================

Function: Number<0..100> -> Boolean
Test(P) = P < 50

Function: Number<101..200> -> Boolean
Test(P) = P > 150

Function: String, String -> String
Test(P1, P2) = String + String
