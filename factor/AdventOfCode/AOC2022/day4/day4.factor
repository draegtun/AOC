! Copyright (C) 2023 Barry Walsh.
! 

USING:  kernel sets arrays sequences sorting splitting
        math.parser math.ranges ;

IN: AdventOfCode.AOC2022.day4

! !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Day4 challenge

: either2-subset? ( array-pair -- ? )
    [ length ] sort-with 
    first2 subset? ;

: parse-day4 ( string -- array )
    ! input -> { { range0 range1 } { range2 range3 } ... }
    string-lines [
        "," split [
            "-" split [ dec> ] map  ! "n0-n1" -> { n0 n1 }
            first2 [a,b]            ! { range0 range1 }
        ] map
    ] map ;

: count-trues ( seq -- count )
    sift length ;

: day4 ( array-of-2ranges -- count )
    parse-day4 [ either2-subset? ] map count-trues ;

: day4-part2 ( array-of-2ranges -- count )
    parse-day4 [ first2 intersects? ] map count-trues ;

