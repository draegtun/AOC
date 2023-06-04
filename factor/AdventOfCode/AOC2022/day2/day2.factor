! Copyright (C) 2023 Barry Walsh.
! 
USING:  sequences kernel combinators math splitting 
        arrays pair-rocket assocs ;

IN: AdventOfCode.AOC2022.day2


! !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Day2 challenge

CONSTANT: ANSWER-SCORE {
    "A" => 1 "B" => 2 "C" => 3
    "X" => 1 "Y" => 2 "Z" => 3
}

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
        " " split ANSWER-SCORE substitute
    ] map ;

: day2 ( input-string -- score )
    day2-parse [ day2-score-move ] map-sum ;


! need to convert players move for part2
CONSTANT: RECODE {
    { 1 1 } => { 1 3 }  { 3 1 } => { 3 2 }  ! 1 (X) - lose
    { 1 2 } => { 1 1 }  { 3 2 } => { 3 3 }  ! 2 (Y) - draw
    { 1 3 } => { 1 2 }  { 3 3 } => { 3 1 }  ! 3 (Z) - win
}

: day2-recode ( players-moves -- new-players-moves )
    RECODE substitute ;

: day2-part2 ( input-string -- score )
    day2-parse day2-recode [ day2-score-move ] map-sum ;

