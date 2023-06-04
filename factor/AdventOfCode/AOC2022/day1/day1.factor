! Copyright (C) 2022-2023 Barry Walsh.
! 
USING: sequences sorting splitting strings math.parser ;
IN: AdventOfCode.AOC2022.day1

! !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Day1 challenge

CONSTANT: ELF-SEPARATOR "\n\n"
CONSTANT: CALORIE-SEPRATOR "\n"

! NOTE: 
!   Originally used R/ n\n/ because "split" allows multiple
!   separators (for eg.  "\n\r" would split on either \n or \r
!   whereas split-subseq splits on full sep definition

: parse-day1 ( string -- array-of-total-calories-per-elf ) 
    ELF-SEPARATOR split-subseq
    [ 
        CALORIE-SEPRATOR split  
        [ dec> ] map-sum
    ] map ;

: top3-sum ( array -- N )
    natural-sort reverse
    3 head sum ;

: day1-part1 ( string -- top-elf-calorie )
    parse-day1 supremum ;

: day1-part2 ( string -- top3-elves-calories )
    parse-day1 top3-sum ;

