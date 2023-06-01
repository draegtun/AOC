! Copyright (C) 2022-2023 Barry Walsh.
! 
USING: sequences sorting splitting regexp strings math.parser ;
IN: AdventOfCode.AOC2022.day1

! !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Day1 challenge


: day1-parse ( string -- array ) 
    ! split data into arrays of numbers (calories)
    R/ \n\n/ re-split       ! split by \n\n
    [ 
        >string             ! above produces a slice
        "\n" split  
        [ string>number ] map 
    ] map ;

: sum-group ( array-array-numbers -- array-sum )
    ! add up array of numbers
    [ sum ] map ;

: sortN ( array -- sorted-array )
    natural-sort reverse ;

: day1-part1 ( string -- top-elf-calorie )
    ! find elf with highest calories
    day1-parse sum-group sortN first ;

: day1-part2 ( string -- top3-elves-calories )
    ! find top 3 elves calories and sum-up
    day1-parse sum-group sortN 3 head sum ;

