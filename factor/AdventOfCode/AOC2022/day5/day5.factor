! Copyright (C) 2023 Barry Walsh.
! 
USING:  kernel math accessors sequences locals grouping
        ascii sbufs regexp arrays math.parser splitting
        strings
;
IN: AdventOfCode.AOC2022.day5


! !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Day5 challenge


! create useful data object
TUPLE: crates stacks temp-stack commands ;
C: <crates> crates

! low-level stack commands 

: get-stack ( n #crates -- stack )
    swap 1 - swap      ! change N from 1-based to 0-based index
    stacks>> ?nth ;    ! get N stack column 

: pop-from-stack ( n #crates -- elt )
    get-stack pop ;

: push-to-stack ( elt n #crates -- )
    get-stack push ;

! high-level stack commands

:: move-from ( n #crates -- ) 
    ! take from crate N and store in temp stack
    n #crates pop-from-stack 
    #crates temp-stack>> push ;

:: move-to ( n #crates  -- )
    ! move from temp stack into N stack
    #crates temp-stack>> pop
    n #crates push-to-stack ;

:: move-crates ( command-array #crates -- )
    [let
        ! using lexical vars for documentation purposes!
        command-array first  :> numb-crates
        command-array second :> from-stack
        command-array third  :> to-stack

        numb-crates [
            from-stack #crates move-from
            to-stack #crates move-to
        ] times
    ] ;

! part 2 solution - move crates in one go
:: move-crates-9001 ( command-array #crates -- )
    [let
        ! using lexical vars for documentation purposes!
        command-array first  :> numb-crates
        command-array second :> from-stack
        command-array third  :> to-stack

        ! move all crates to temp stack first
        numb-crates [
            from-stack #crates move-from
        ] times

        ! now move them to designated stack 
        numb-crates [
            to-stack #crates move-to
        ] times
    ] ;

: parse-day5-top ( array-of-strings -- array )
    ! Stack input includes the column numbering (at bottom)
    ! thus allowing padding to work should there be any
    ! blank stacks (though none in AOC examples)

    ! fixed ascii of 4 chars.  Take 2nd char in each group
    ! then flip into columns -> array-of-stacks
    [ 4 group [ second ] map ] map flip

    ! remove blanks and convert each "stack" to string buffer
    ! NB. SBUF is a growable char array
    [ [ blank? ] trim >sbuf ] map

    ! Reverse into correct stack order
    ! and remove column number (now 1st item) on each stack
    [ reverse 0 swap remove-nth! ] map ;

: parse-day5-bottom ( array-of-strings -- array )
    ! Commands:
    !   move 1 from 2 to 1
    ! 
    ! convert into: {
    !                  { 1 2 1 }
    !                  ...
    !               }

    [
        ! when move command matched
        ! NB. Unfortunatley regexp doesn't have group captures
        !     so have to perform in two matches
        dup R/ ^move \d+ from \d+ to \d+$/ matches? [
            ! capture all numbers into array
            R/ \d+/ all-matching-slices
            >array [ string>number ] map
        ] when
    ] map harvest ;

: parse1-day5 ( string -- init-stack-array commands-array )
    ! split input into STACK (top) and COMMANDS (bottom)
    ! with split on column line:  1 2 3
    ! Column line is part of top

    ! find stack column number line (middle) -> Index Line
    string-lines dup [ R/ ^\s1\s.*$/ matches? ] find

    drop 1 + cut-slice ;   ! slice top and bottom out

: parse2-day5 ( init-stack-array commands-array -- #crate )
    ! parse input string creating crate object
    parse-day5-bottom swap 
    parse-day5-top
    0 <sbuf>
    rot
    <crates> ;

: answer-day5 ( #crates -- string )
    ! return top crate in each stack 
    ! and concat into string

    stacks>> [ ?last ] map sift >string ;

:: run-commands-day5 ( #crates -- #updated-crates )
    #crates commands>> [| command |
        command #crates move-crates
    ] each 
    #crates ;

! Cratemover 9001 (part 2) 
! Learning: Use stack this time and not lexical vars
: run-commands-day5#2 ( #crates -- #crates' )
    dup commands>> [
        over move-crates-9001
    ] each ;

: day5 ( input-string -- answer-string )
    parse1-day5 parse2-day5
    run-commands-day5 answer-day5 ;

: day5#2 ( input-string -- answer-string )
    parse1-day5 parse2-day5
    run-commands-day5#2 answer-day5 ;

