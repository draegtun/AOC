! Copyright (C) 2023 Barry Walsh.

USING: tools.test AdventOfCode.AOC2022
    AdventOfCode.AOC2022.day5
    ;
IN: AdventOfCode.AOC2022.day5.tests

CONSTANT: example-data
"    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2"


[ "CMZ" ] [ example-data day5 ] unit-test
[ "MCD" ] [ example-data day5#2 ] unit-test

