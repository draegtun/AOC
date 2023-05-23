! Copyright (C) 2022-2023 Barry Walsh.
! 
USING:  
        sequences splitting kernel arrays
        io.files io.encodings.ascii vocabs.loader io.backend 
        AdventOfCode.AOC2022.day1
        AdventOfCode.AOC2022.day2
        AdventOfCode.AOC2022.day3
        AdventOfCode.AOC2022.day4
        AdventOfCode.AOC2022.day5
;

IN: AdventOfCode.AOC2022

! TODO
! Put general input-data management words in AdventOfCode.factor
! Instead this is just a library for AOC2022 words
! .. So need to sort out AOC2022-vocab word 
!
! AOC2022-tests will just check input-data give correct results
! .. So kinda of integration tests
! Put example-tests into each separate /day1/day1-tests.factor
! .. along with any other word unit-tests (if needed)

: baz1 ( -- string )
    "vocab:AdventOfCode" normalize-path ;

: baz2 ( -- string )
    "vocab:AdventOfCode/AOC2022" normalize-path ;

! Put into separate library?
: slurp-file ( file -- string )
    ! file-contents always add \n
    ascii file-contents but-last ;

: AOC2022-vocab ( -- string )
    "AdventOfCode.AOC2022" ; inline

: vocab>dir ( string -- pathname )
    "." "/" replace ;

: work-dir ( -- pathname )
     AOC2022-vocab find-vocab-root normalize-path ;

! get input file path (in work dir)
: input-file ( file -- pathname )
    "input-data/" prepend
    work-dir
    AOC2022-vocab vocab>dir
    rot 3array "/" join ;

: load-input-file ( dayN -- string )
    input-file slurp-file ;

! probably better way to do above using platform agnostic lib?

