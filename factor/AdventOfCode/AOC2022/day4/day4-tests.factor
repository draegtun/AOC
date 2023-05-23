! Copyright (C) 2023 Barry Walsh.

USING: tools.test AdventOfCode.AOC2022
    AdventOfCode.AOC2022.day4
    ;
IN: AdventOfCode.AOC2022.day4.tests

CONSTANT: example-data
"2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8" 


[ 2 ] [ example-data day4 ] unit-test
[ 4 ] [ example-data day4#2 ] unit-test
