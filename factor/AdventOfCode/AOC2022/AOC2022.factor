! Copyright (C) 2022-2023 Barry Walsh.
! 

USING:  sequences splitting kernel arrays
        io.files io.encodings.ascii vocabs.loader io.backend 
        AdventOfCode.AOC2022.day1
        AdventOfCode.AOC2022.day2
        AdventOfCode.AOC2022.day3
        AdventOfCode.AOC2022.day4
        AdventOfCode.AOC2022.day5 ;

IN: AdventOfCode.AOC2022


! AOC2022 helper words go here!

! TODO: Perhaps create even higher level AdventOfCode.factor
!       for input-data management or anything else that would
!       span AOC years?
!

! AOC2022-tests used with AOC input-data (live data)
!
! Each day test file used with example data
! - eg. /day1/day1-tests.factor
! - may contain other word unit-tests (if needed)

! for code location see .factor-roots

CONSTANT: INPUT-DIR "vocab:AdventOfCode/AOC2022/input-data/"

! Candidate for AdventOfCode.factor module !?
: slurp-file ( file -- string )
    ! file-contents always adds \n ??
    ascii file-contents but-last ;

: input-file ( input-filename -- input-filepath )
    INPUT-DIR prepend normalize-path ;

: load-input-file ( dayN.txt -- input-data-string )
    input-file slurp-file ;


