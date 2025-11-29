\version "2.24.0"

\layout {
\context {
    \Staff
    \consists Merge_rests_engraver
  }
}

\include "custom.ily"
\include "elements.ily"

% Harmony Upper-staff Mozart K397 (Fantasia) : Pedal Point n°"A" = m 1-3
hrmUpMozartFantasiePedA = <<
  \clef treble
  <<
    \new Voice = "soprano" {
      \voiceOne
      \stemUp
      \relative c'' {
        \override HorizontalBracketText.text = \markup {
          \center-column {
            \italic"(original in Dm)"
            %\bold "W. A. Mozart - K397" 
            \italic "1 - 3"
          }
        }
        c2\startGroup d d\stopGroup
      }
    }
    \new Voice = "alto" {
      \voiceTwo
      \stemDown
      \relative c'' {
        a2 a b
      }
    }
  >>
>>
% Harmony Lower-staff Mozart K397 (Fantasia) : Pedal Point n°"A" = m 1-3
hrmLowMozartFantasiePedA = <<
  \clef bass
  <<
    \new Voice = "tenor" {
      \voiceOne
      \stemUp
      \relative c' {e2 f f}
    }
    \new Voice = "bass" {
      \voiceTwo
      \stemDown
      \relative c' { \RedNote a2 a a\revertColorNote}
    }
  >>
>>
%Tonality Mozart K397 (Fantasia) : Pedal Point n°"A" = m 1-3
tnMozartFantasiePedA = \lyricmode { 
  \markup {"Am :" \tiny "(original : Dm)"}1.}
% Figured bass roman Mozart K397 (Fantasia) : Pedal Point n°"A" = m 1-3
fbrMozartFantasiePedA = \lyricmode { 
  "i"4 \markup \with-color "red" "⤻"4 "iv"4 8 \markup \with-color "red" "⤻"8 \markup {"ii" \super "⌀ "}2 }
% Figured bass arabic numerlas Mozart K397 (Fantasia) : Pedal Point n°"A" = m 1-3
fbaMozartFantasiePedA = \figuremode {
  <_>2 <6 4> <2>}
% Upper-staff Cadance Filler
hrmUpMozartFantasiePedA_CF = <<
  \clef treble
  <<
    \new Voice = "soprano" {
      \voiceOne
      \stemUp
      \relative c''{d2 c1}
    }
    \new Voice = "alto" {
      \voiceTwo
      \stemDown
      \relative c'' {b2 a1}
    }
  >>
>>
% Lower-staff Cadance Filler
hrmLowMozartFantasiePedA_CF = <<
  \clef bass
  <<
    \new Voice = "tenor" {
      \voiceOne
      \stemUp
      \relative c' {e2 e1}
    }
    \new Voice = "bass" {
      \voiceTwo
      \stemDown
      \relative c' {gis2 a1}
    }
  >>
>>
% Figured bass roman numerals Cadance Filler
fbrMozartFantasiePedA_CF = \lyricmode {
  "V"2 "i"1}
% Figured bass arabic numerals Cadance Filler
fbaMozartFantasiePedA_CF  = \figuremode {
  <6 5/>2 <_>1}
% Original Upper-staff Mozart K397 (Fantasia) : Arpeggio Model n°"A" = m 1-7
ovUpMozartFantasieArpmodA = \relative c {
      \clef treble
      \key d \minor
      \time 4/4
      r4^\markup{W. A. Mozart - K397} \tuplet 3/2 {r8 f a} \tuplet 3/2 {d a f'} \tuplet 3/2 {d a f}^\markup{(x 2)}r4 \tuplet 3/2 {r8 g bes} \tuplet 3/2 {e bes g'} \tuplet 3/2 {e bes g}^\markup{(x 2)} r4 \tuplet 3/2 {r8 a d} \tuplet 3/2 {fis d a'} \tuplet 3/2 {fis d a }^\markup{(x 2)} s16 \stopStaff  s16 s16 s16 \once \override NoteHead.stencil =#ly:text-interface::print \once \override NoteHead.text =\markup \lower #0.5 "[ ... ]" \once \override NoteHead.extra-spacing-width = #2 \once \override Stem.stencil = ##f  \once \override Dots.stencil = ##f a'2 s8. \startStaff s16 \bar"|."
}
% Original version Lower-staff Mozart K397 (Fantasia) : Arpeggio Model n°"A" = m 1-7
ovLowMozartFantasieArpmodA = <<
      \clef bass
      \key d \minor
      \time 4/4
  \new Voice = "arpTen"
    \relative { \voiceOne 
    \tuplet 3/2 {d,8 f a} d2.\tuplet 3/2 {d,8 g bes} d2.\tuplet 3/2 {c,8 fis a} c2.\tuplet 3/2 {bes8 d g~} \stopStaff g4 \once \override NoteHead.stencil =#ly:text-interface::print \once \override NoteHead.text =\markup \lower #0.5 "[ ... ]" \once \override NoteHead.extra-spacing-width = #2 \once \override Stem.stencil = ##f  \once \override Dots.stencil = ##f c,4 s8 s16 \startStaff s16
    }
  \new Voice= "arpBas"
    \relative c, { \voiceTwo 
      d4~ d2. d4~ d2. c4~ c2. bes'2
    }
>>
% Harmony Upper-staff Mozart K397 (Fantasia) : Descending Chromatic Line n°"A" = m 17-19
hrmUpMozartFantasieDclA = <<
  \clef treble
  \override Staff.TimeSignature.stencil = ##f

  <<
    \new Voice = "soprano" {
      \voiceOne
      \stemUp
      \relative c'' {
        \override HorizontalBracketText.text = \markup {
          \center-column {
            \italic "(Original in three-part harmony)"
            %\bold "W. A. Mozart - K397"
            \italic "17 - 19"
          }
        }

         r2 \GreenNote e2\startGroup \bar "|" dis d cis  c b1\stopGroup
      }
    }
    \new Voice = "alto" {
      \voiceTwo
      \stemDown
      \relative c'' {r2 a2  a gis a a gis1}
    }
  >>
>>
% Harmony Lower-staff Mozart K397 (Fantasia) : Descending Chromatic Line n°"A" = m 17-19
hrmLowMozartFantasieDclA = <<
  \clef bass
  <<
    \new Voice = "tenor" {
      \voiceOne
      \stemUp
      \relative c' {r2 e2 f e e f e1}
    }
    \new Voice = "bass" {
      \voiceTwo
      \stemDown
      \relative c' {r2 c2 b e, a dis, e1}
    }
  >>
>>
% Tonality Mozart K397 (Fantasia) : Descending Chromatic Line n°"A" = m 17-19
tnMozartFantasieDclA = \lyricmode {
  _2 \markup {"Am :" \tiny "(original : Dm)"}2 _1 "|E :"1 ""1}
% Figured bass roman numerals Mozart K397 (Fantasia) : Descending Chromatic Line n°"A" = m 17-19
fbrMozartFantasieDclA  = \lyricmode {
  ""2 "i"2 \markup { \fontsize #0.3 {\with-color "darkorange" "V"} \hspace#-1 \sub { \fontsize #6.8  { \with-color "darkorange" "/"} \hspace#-0.5 \fontsize #2.9  { \with-color "darkorange" "V"}}} "V" \markup {"IV" \hspace #1 \null} \markup \with-color "dodgerblue" {\super {\musicglyph #"accidentals.sharp" } \hspace #-0.3 "vii°"} "I"1}
% Figured bass arabic numerals Mozart K397 (Fantasia) : Descending Chromatic Line n°"A" = m 17-19
fbaMozartFantasieDclA = \figuremode {
  <_>2 <6> <7_\+> <\markup { \fontsize #-5 \number 7 \tiny \super (no5) }_\+> r <7/>
}
% Ossia Original Harmony Simplified Upper-staff Mozart K397 (Fantasia) : Descending Chromatic Line n°"A" = m 17-19
ossiaUpMozartFantasieDclA = \relative c''' {
  \clef treble \key d \minor
  r2 a2^\markup \italic {sipmlified} gis2  g!  fis   <f! d>  <e cis>1
}
% Ossia Original Harmony Simplified Lower-staff Mozart K397 (Fantasia) : Descending Chromatic Line n°"A" = m 17-19
ossiaLowMozartFantasieDclA = \relative c' {
  
  \clef treble \key d \minor r2 <f d'>2 <e d'>2 <a cis> <d, d'> <gis b!> a1
}
% Harmony Upper-staff Mozart K397 (Fantasia) : Descending Chromatic Bass Line n°"A" = m 20-22 / 35/37
hrmUpMozartFantasieDcblA = <<
  \clef treble
  \override Staff.TimeSignature.stencil = ##f

  <<
    \new Voice = "soprano" {
      \voiceOne
      \stemUp
      \relative c' {
        \override HorizontalBracketText.text = \markup {
          \center-column {
            \italic "(Original : no tenor)"
            %\bold "W. A. Mozart - K397"
            \line {\italic"20 - 22" \typewriter"|" \italic "35 - 37"}
          }
        }
        r2 e2\startGroup e e dis a' gis1\stopGroup
      }
    }
    \new Voice = "alto" {
      \voiceTwo
      \stemDown
      \relative c' {
        \GreenNote
        r2 \once \override PianoStaff.Arpeggio.extra-spacing-width = #'(-6 . 0.5) c2 \arpeggio b\arpeggio bes\arpeggio a\arpeggio
        \revertColorNote dis e1
      }
    }
  >>
>>
% Harmony Lower-staff Mozart K397 (Fantasia) : Descending Chromatic Bass Line n°"A" = m 20-22 / 35/37
hrmLowMozartFantasieDcblA = <<
  \clef bass
  \override Staff.TimeSignature.stencil = ##f
  <<
    \new Voice = "tenor" {
      \voiceOne
      \stemUp
      \relative c' {
        r2^\psxths \parenthesize e,2 \parenthesize e \parenthesize e \parenthesize a \parenthesize a \parenthesize e1
      }
    }
    \new Voice = "bass" {
      \voiceTwo
      \stemDown
      \relative c' {
        \GreenNote
        r2 a,2\arpeggio gis\arpeggio g!\arpeggio  fis\arpeggio  f e1
      }
    }
    %\new Lyrics \lyricmode  {
    %\override Lyrics.LyricText.font-size = #-1.5
    %\override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #1
    %"| Gm :"2 }
    %\new Lyrics \lyricmode  {
    %\override Lyrics.LyricText.font-size = #-1
    %"i"2 "V" "" "" "It" "V" }
  >>
>>
% Tonality Mozart K397 (Fantasia) : Descending Chromatic Bass Line n°"A" = m 20-22 / 35/37
tnMozartFantasieDcblA = \lyricmode {
  _2 "Am :"2  _1*3}
% Figured bass roman numerals Mozart K397 (Fantasia) : Descending Chromatic Bass Line n°"A" = m 20-22 / 35/37
fbrMozartFantasieDcblA = \lyricmode { 
  ""2 "i" "V" \markup \with-color "red" "v°" \markup { \with-color "darkorange" { \fontsize #0.3 "vii°" \hspace#-1 \sub { \fontsize #6  {"/"} \hspace #-0.5 \fontsize #2  \with-color "darkorange" "V" }} \null} "It" "V"1 }
% Figured bass arabic numerals Mozart K397 (Fantasia) : Descending Chromatic Bass Line n°"A" = m 20-22 / 35/37
fbaMozartFantasieDcblA = \figuremode {
  <_->2 \bassFigureExtendersOn <6> <6_-> <6\+3> \bassFigureExtendersOff <6\+>}



