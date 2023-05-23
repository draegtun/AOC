! Copyright (C) 2023 Barry Walsh.
! 
USING:  sequences kernel combinators math splitting 
        match arrays
;
IN: AdventOfCode.AOC2022.day2


! !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Day2 challenge


! Not used Enum
! ENUM: day2-hand { Rock 1 } { Paper 2 } { Scissors 3 } ;
! A X Rock
! B Y Paper
! C Z Scissors

: day2-score-move ( players-move -- just-player2-score )
    dup last swap   ! player2 move score
    {
        { { 1 1 } [ 3 ] }  ! 3 draws
        { { 2 2 } [ 3 ] }
        { { 3 3 } [ 3 ] }
        { { 1 2 } [ 6 ] }  ! rock loses to paper
        { { 3 1 } [ 6 ] }  ! scissors loses to rock
        { { 2 3 } [ 6 ] }  ! paper loses to scissors
        [ drop 0 ]         ! 1st player wins all other games
    } case + ;

: day2-parse ( string -- players-moves )
    string-lines [ 
        " " split [
            {
                ! decrypt into common answer codes (score)
                ! Rock 1  Paper 2  Scissors 3
                { "A" [ 1 ] }
                { "B" [ 2 ] }
                { "C" [ 3 ] }
                { "X" [ 1 ] }
                { "Y" [ 2 ] }
                { "Z" [ 3 ] }
            } case            
        ] map
    ] map ;

: day2 ( input-string -- score )
    day2-parse [ day2-score-move ] map sum ;


MATCH-VARS: ?m ;

: day2-recode ( players-moves -- new-players-moves )
    ! need to convert players move for part2
    !
    ! 1 (X) - lose
    ! 2 (Y) - draw
    ! 3 (Z) - win
    [
        {
            { { ?m 1 } [ 
                ! lose 
                ?m 
                {
                    { 1 [ { 1 3 } ] }
                    { 2 [ { 2 1 } ] }
                    { 3 [ { 3 2 } ] }
                } case
            ] }

            { { ?m 2 } [ ?m ?m 2array ] }     ! draw

            { { ?m 3 } [ 
                ! win
                ?m
                {
                    { 1 [ { 1 2 } ] }
                    { 2 [ { 2 3 } ] }
                    { 3 [ { 3 1 } ] }
                } case
            ] }
        } match-cond
    ] map ;

: day2-part2 ( input-string -- score )
    day2-parse day2-recode [ day2-score-move ] map sum ;

