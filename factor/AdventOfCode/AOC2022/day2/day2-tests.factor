! Copyright (C) 2023 Barry Walsh.

USING: tools.test AdventOfCode.AOC2022
    AdventOfCode.AOC2022.day2
    ;
IN: AdventOfCode.AOC2022.day2.tests

CONSTANT: example-data
"A Y
B X
C Z"

[ 15 ] [ example-data day2 ] unit-test
[ 12 ] [ example-data day2-part2 ] unit-test
