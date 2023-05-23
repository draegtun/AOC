! Copyright (C) 2023 Barry Walsh.

USING: tools.test AdventOfCode.AOC2022
    AdventOfCode.AOC2022.day1
    ;
IN: AdventOfCode.AOC2022.day1.tests

CONSTANT: example-data
"1000
2000
3000

4000

5000
6000

7000
8000
9000

10000" 

[ 24000 ] [ example-data day1-part1 ] unit-test
[ 45000 ] [ example-data day1-part2 ] unit-test
