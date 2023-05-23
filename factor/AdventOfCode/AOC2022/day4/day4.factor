! Copyright (C) 2023 Barry Walsh.
! 
USING:  kernel sets arrays sequences sorting splitting
        math.parser math.ranges 

;
IN: AdventOfCode.AOC2022.day4

! !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Day4 challenge

! why does interval-subset? & interval-intersect give an error?
! !!! Because it was math.ranges AND NOT math.intervals
! !!! for the..  n n [a,b]

! Did think about going with bit-array and ANDed

: either-subset? ( range1 range2 -- ? )
    ! Take two ranges and compare if either is a subset of the
    ! other
    2dup swap subset?   ! copy ranges and then test
    rot rot subset?     ! rot round thus swap for last test
    or ;                ! if either is true then its a subset!

: alt-either-subset? ( range1 range2 -- ? )
    ! is this clearer than above?
    2array [ length ] sort-with first2 subset? ;

! like above but works on array { range0 range1 }
: either2-subset? ( array-pair -- ? )
    [ length ] sort-with 
    first2 subset? ;

: day4-parse ( string -- array )
    ! input -> { { range0 range1 } { range2 range3 } ... }
    string-lines [
        "," split [
            ! "n0-n1"
            "-" split [ string>number ] map 
            ! { n0 n1 }
            first2 [a,b]
        ] map
        ! { range0 range1 }
    ] map ;

: day4 ( array-of-2ranges -- count )
    day4-parse [ either2-subset? ] map [ t = ] count ;

: day4#2 ( array-of-2ranges -- count )
    day4-parse [ first2 intersects? ] map [ t = ] count ;

