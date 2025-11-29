\version "2.24.4"

\include "custom.ily"

% Ex 110.3 Upper-staff
exoneoothreeUp =  <<
  \clef treble
  <<
    \new Voice = "soprano" {
      \voiceOne
      \stemUp
      \relative c'' {
        \override HorizontalBracketText.text = \markup {
          \center-column {
            \bold "백병동 - 화성학" \italic "Ex 100.3"
          }
        }
        \RedNote g1\startGroup g2 g2\stopGroup \revertColorNote
      }
    }
    \new Voice = "alto" {
      \voiceTwo
      \stemDown
      \relative c' {
        e1 e2 d
      }
    }
  >>
>>
% Ex 110.3 Lower-staff
exoneoothreeLow = <<
  \clef bass
  <<
    \new Voice = "tenor" {
      \voiceOne
      \stemUp
      \relative c' {b1 c2 d}
    }
    \new Voice = "bass" {
      \voiceTwo
      \stemDown
      \relative c { \BlueNote e2 d c b\revertColorNote}
    }
  >>
>>
% Ex 110.3 Tonality 
tnexoneoothree = \lyricmode { "|C :"1 }
% Ex 110.3 Figured bass roman numerals 
fbrexoneoothree = \lyricmode { 
  "iii"2 "_" "I" "V" }
% Ex 110.3 Figured bass arabic numerals
fbaexoneoothree = \figuremode {
  <_>2 <2> <_> <6>}
% Ex 110.6 Upper-staff
exoneoosixUp =  <<
  \clef treble
  <<
    \new Voice = "soprano" {
      \voiceOne
      \stemUp
      \relative c'' {
        \override HorizontalBracketText.text = \markup {
          \center-column {
            \bold "백병동 - 화성학" \italic "Ex 100.6"
          }
        }
         d2\startGroup c c b\stopGroup
      }
    }
    \new Voice = "alto" {
      \voiceTwo
      \stemDown
      \relative c' {d2 e e e}
    }
  >>
>>
% Ex 110.6 Lower-staff
exoneoosixLow = <<
  \clef bass
  <<
    \new Voice = "tenor" {
      \voiceOne
      \stemUp
      \relative c {fis2 gis a b}
    }
    \new Voice = "bass" {
      \voiceTwo
      \stemDown
      \relative c { b2 b a gis}
    }
  >>
>>
% Ex 110.6 Tonality 
tnexoneoosix = \lyricmode {
  "|Am :" }
% Ex 110.6 Figured bass roman numerals
fbrexoneoosix = \lyricmode { 
  \markup \with-color "dodgerblue" "ii"2 "III" "i" "V" }
% Ex 110.6 Figured bass arabic numerals
fbaexoneoosix = \figuremode {
  <5+>2 <6\+2> <_> <6>}
