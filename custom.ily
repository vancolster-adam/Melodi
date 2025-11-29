\version "2.24.4"

% Définir un raccourci pour colorier notehead + stem + accidental
GreenNote =
#(define-music-function () ()
  #{
    \override NoteHead.color = #(rgb-color 0.1294 0.5137 0.1922)
    \override Stem.color = #(rgb-color 0.1294 0.5137 0.1922)
    \override Accidental.color = #(rgb-color 0.1294 0.5137 0.1922)
  #})

RedNote =
#(define-music-function () ()
  #{
    \override NoteHead.color = #red
    \override Stem.color = #red
    \override Accidental.color = #red
    \override Dots.color = #red
  #})

BlueNote =
#(define-music-function () ()
  #{
    \override NoteHead.color = "SteelBlue"
    \override Stem.color = "SteelBlue"
    \override Accidental.color = "SteelBlue"
    \override Dots.color = "SteelBlue"
  #})

revertColorNote =
#(define-music-function () ()
  #{
    \revert NoteHead.color
    \revert Stem.color
    \revert Accidental.color
    \revert Dots.color
  #})



 
 
 