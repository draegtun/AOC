! Copyright (C) 2022 Barry Walsh.
! See http://factorcode.org/license.txt for BSD license.
USING: tools.test AdventOfCode.AOC2022
    AdventOfCode.AOC2022.day1
    AdventOfCode.AOC2022.day2
    AdventOfCode.AOC2022.day3
    AdventOfCode.AOC2022.day4
    AdventOfCode.AOC2022.day5
     ;
IN: AdventOfCode.AOC2022.tests

[ 69281 ] [ "day1.txt" load-input-file day1-part1 ] unit-test
[ 201524 ] [ "day1.txt" load-input-file day1-part2 ] unit-test

[ 15632 ] [ "day2.txt" load-input-file day2 ] unit-test
[ 14416 ] [ "day2.txt" load-input-file day2-part2 ] unit-test

[ 7848 ] [ "day3.txt" load-input-file day3 ] unit-test
[ 2616 ] [ "day3.txt" load-input-file day3-part2 ] unit-test

[ 576 ] [ "day4.txt" load-input-file day4 ] unit-test
[ 905 ] [ "day4.txt" load-input-file day4-part2 ] unit-test

[ "CFFHVVHNC" ] [ "day5.txt" load-input-file day5 ] unit-test
[ "FSZWBPTBG" ] [ "day5.txt" load-input-file day5#2 ] unit-test

