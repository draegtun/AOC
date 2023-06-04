! Copyright (C) 2023 Barry Walsh.
! 
USING:  kernel sequences math grouping splitting
        io.encodings.ascii.private unicode sets ;

IN: AdventOfCode.AOC2022.day3

! !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Day3 challenge

: split-in-half ( string -- array ) 
    dup length 2 / group ;

: letter>code ( letter -- score )
    ! score a-z -> 1-26  AND  A-Z -> 27-52
    dup first swap    ! stack -> 97 "a"
    lower? [ 96 ] [ 38 ] if - ;

: day3 ( string -- sum ) 
    string-lines [
        split-in-half intersection letter>code
    ] map-sum ;

: day3-part2 ( string -- array ) 
    string-lines 3 group [ 
        intersection letter>code 
    ] map-sum ;

