\version "2.24.2"

\paper { 
  tagline = ##f 
  paper-width = 297\mm
  paper-height = 210\mm
}

\include "custom.ily"
\include "elements.ily"
\include "mozart.ly"
\include "bachjs.ly"
\include "hrmKoreanBook.ly"

\layout {
  % Contexte de la voix (ajout des crochets horizontaux)
  \context {
    \Voice
    \consists "Horizontal_bracket_engraver"
    \override HorizontalBracket.direction = #UP
  }
  \context {
    \Score
    \override SpacingSpanner.spacing-increment = #2
  }
}
  % Contexte de la partition (espacement global)



\header {
  title = \markup {\center-column {"Analysis" "2025"}}}

\markup {
  \column {
    \vspace #2
      \override #'(line-width . 155)
      \override #'(baseline-skip . 4)
        \line {\with-color #red "Red Note" : Pedal point}
        \line {\with-color "SteelBlue" "Blue Note" : Descending Line }
        \line {\with-color #(rgb-color 0.1294 0.5137 0.1922) "Green Note" : Chromatic Descending Line }
        \line {\with-color "dodgerblue" "Blue Roman Numeral" : Borrowed from relative key}
        \line {\with-color "darkorange" "Orange Noman Numeral" : Secondary Dominants}
        \draw-line #'(50 . 0)
        \line {\italic "Next time"... J. S. Bach - BWV 999 : i - iv64 - ♮vii°/\override #'(baseline-skip . 0.8) \column { \small { ^ 1 } }   - i - i2 - vi7 - i64 -}
        \line {"same3i theqyl (genre de Iqa3), time = ""10/8" "\ Iqa3 : motif rytmique"}
  }
}
\markup \null\markup \null \markup \null \markup \null \markup \null\markup \null \markup \null\markup \null


\markup \center-column {
  \bold \fontsize #4 "Harmony"
}

\score {
  <<
    %% OSSIA GROUP (au-dessus)
    \new StaffGroup = "ossiaGroup" <<
      \new Staff = "ossiaRH" \with {
        alignAboveContext = "mainRH"
        \remove Time_signature_engraver
        \magnifyStaff #2/3
        \override VerticalAxisGroup.staff-staff-spacing = #'(
          (basic-distance . 3)
          (minimum-distance . 2)
          (padding . 0.5)
        )
      } { \once \override Staff.Clef.transparent = ##t \stopStaff s1 s s \startStaff \ossiaUpMozartFantasieDclA }
    
      \new Staff = "ossiaLH" \with {
        alignAboveContext = "mainRH"
        \remove Time_signature_engraver
        \magnifyStaff #2/3
        \override VerticalAxisGroup.staff-staff-spacing = #'(
          (basic-distance . 3)
          (minimum-distance . 2)
          (padding . 0.5)
        )
      } { \once \override Staff.Clef.transparent = ##t \stopStaff s1 s s \startStaff \ossiaLowMozartFantasieDclA }
    >>

    %% PIANO PRINCIPAL
    \new PianoStaff = "main" <<
      \override PianoStaff.TimeSignature.stencil = ##f
      \override PianoStaff.HorizontalBracket.Y-offset = #6
      \set PianoStaff.connectArpeggios = ##t
      \override PianoStaff.Arpeggio.stencil = #ly:arpeggio::brew-chord-bracket
      \override PianoStaff.Arpeggio.extra-spacing-width = #'(-1.5 . 0.5)
      \override PianoStaff.Arpeggio.thickness = 2
      \new Staff = "mainRH" 
        { \hrmUpMozartFantasiePedA \hrmUpMozartFantasiePedA_CF \bar "||"
          \hrmUpMozartFantasieDclA \bar "||"
          \hrmUpMozartFantasieDcblA \bar "|." \exoneoothreeUp \bar "||"  \exoneoosixUp \bar "|." }
      \new Staff = "mainLH" 
        { \hrmLowMozartFantasiePedA \hrmLowMozartFantasiePedA_CF
          \hrmLowMozartFantasieDclA
          \hrmLowMozartFantasieDcblA \exoneoothreeLow \exoneoosixLow
        }
        \lyrics {\tnMozartFantasiePedA ""2 ""1 \tnMozartFantasieDclA \tnMozartFantasieDcblA \tnexoneoothree "" \tnexoneoosix}
        \lyrics {\fbrMozartFantasiePedA \fbrMozartFantasiePedA_CF \fbrMozartFantasieDclA  \fbrMozartFantasieDcblA \fbrexoneoothree \fbrexoneoosix}
        \figures {\fbaMozartFantasiePedA \fbaMozartFantasiePedA_CF \fbaMozartFantasieDclA r2 r r\fbaMozartFantasieDcblA r1 \fbaexoneoothree \fbaexoneoosix }
    >>
  >>
}
 
\markup {\column {\null \null \null \null \null \null \null \null }} 

\markup \center-column {
  \bold \fontsize #4 "Arpeggio Models"
}

\markup {\column {\null \null \null \null \null }} 

\score {

    %% PIANO PRINCIPAL
    \new PianoStaff = "arp" <<
      \new Staff = "arpRH" { \ovUpMozartFantasieArpmodA \ovUpJSBachBWVnineninenineArpmod }
      \new Staff = "arpLH" { \ovLowMozartFantasieArpmodA \ovLowJSBachBWVnineninenineArpmod}
    >>

}





