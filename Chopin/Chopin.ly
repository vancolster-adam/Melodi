\version "2.24.0"

\layout {
\context {
    \Staff
    \consists Merge_rests_engraver
  }
}

\include "custom.ily"
\include "elements.ily"

% Harmony Upper-staff Chopin - Op. 28, No. 4 : Prelude in Em
hrmUpChopinPreludeE = <<
  \clef treble
  \key e \minor
  \time 2/2
  <<
    \new Voice = "soprano" {
      \voiceOne
      \stemUp
      \relative c'' {
        \override HorizontalBracketText.text = \markup {
          \center-column {
            %\bold "F. Chopin - Op. 28, No. 4 : Prelude in Em" 
            \italic "1 - 4"
          }
        }
         \RedNote b1~\startGroup b2. \revertColorNote \magnifyMusic 0.63  c4 \RedNote b2~ b4 \revertColorNote \magnifyMusic 0.63  c \RedNote b1\stopGroup \revertColorNote 
      }
    }
    \new Voice = "alto" {
      \voiceTwo
      \stemDown
      \relative c' {
        e1~ \magnifyMusic 0.63 e2 ees~ ees d2 d1
      }
    }
  >>
>>
% Harmony Lower-staff Chopin - Op. 28, No. 4 : Prelude in Em
hrmLowChopinPreludeE = <<
  \clef bass
  \key e \minor
  \time 2/2
  <<
    \new Voice = "tenor" {
      \voiceOne
      \stemUp
      \relative c' {b1 a1 a2~ a4 \magnifyMusic 0.63 gis gis1
      }
    }
    \new Voice = "bass" {
      \voiceTwo
      \stemDown
      \relative c' { \GreenNote g1 fis f e}
    }
  >>
>>
%Tonality Chopin - Op. 28, No. 4 : Prelude in Em
tnChopinPreludeE = \lyricmode { 
  "Em :"1*2 "|Am"}
% Figured bass roman Chopin - Op. 28, No. 4 : Prelude in Em
fbrChopinPreludeE = \lyricmode { 
  "i"1 \markup \tiny {"(" \with-color "purple" "v" \hspace #-0.45 \super \with-color "grey" "sus" ")"}2 "V "4 \markup \tiny {"(" \super {\musicglyph #"accidentals.sharp" } \hspace #-0.45 "vii°" ")"} "Fr"2 \markup {" ii" \super "⌀ "}4 \markup \tiny {"(" \super {\musicglyph #"accidentals.sharp" } \hspace #-0.45 "vii°" \hspace #-0.45 \super \with-color "grey" "sus" ")"} "V"1 }
% Figured bass arabic numerlas Chopin - Op. 28, No. 4 : Prelude in Em
fbaChopinPreludeE = \figuremode {
  <6>1 \bassFigureExtendersOn <\markup \tiny \with-color "grey"7 4 3>2 <7- 4 3>4 <7- 5 3> <6\+>2 <4 3>4 <\markup \tiny \with-color "grey"5 2>4 <7_\+>1}
% Text on Chopin - Op. 28, No. 4 : Prelude in Em
txtChopinPreludeE = \markup \column {\null \null \null \tiny \wordwrap {While it may be considered in the context of harmonic analysis, the C in the upper voice is best interpreted as an appoggiatura, a reading that accounts for the sustained B functioning as a pedal tone.}}


 
