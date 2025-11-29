\version "2.24.2"

\paper { 
  tagline = ##f 
  paper-width = 180\mm
  paper-height = 100\mm
}

\include "custom.ily"
\include "elements.ily"
\include "Chopin.ly"

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


\score {

    %% PIANO PRINCIPAL
    \new PianoStaff = "arp" <<            % espace ajouté autour
      \new Staff = "arpRH" { \hrmUpChopinPreludeE \bar"|." }
      \new Staff = "arpLH" { \hrmLowChopinPreludeE } 
      \lyrics { \tnChopinPreludeE }
      \lyrics { \fbrChopinPreludeE }
      \figures { \fbaChopinPreludeE }
    
    >>

}

\txtChopinPreludeE




