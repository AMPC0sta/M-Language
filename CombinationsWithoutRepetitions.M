(n as number, p as number) =>
// Combinational formula (Combinations without repetition)
// n => size of amostral set
// p => size of combinations
let
    N = Number.Factorial(n),
    D1 = Number.Factorial(p),
    D2 = Number.Factorial(n-p),
    Source = N/(D1*D2)
in
    Source