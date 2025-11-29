\version "2.24.2"

\layout {
\context {
    \Staff
    \consists Merge_rests_engraver
  }
}

rightI = <<
  \clef treble
  \time 2/4
  \key g \minor
  <<
    \new Voice = "soprano" {
      \voiceOne
      \stemUp
      \relative c'' {
        bes4 c8 bes c4  d8 c bes4 c8 bes a2 bes4 fis'8 d g4 ees8 d d4 c8 a g2 \bar "|." 
      }
    }
    \new Voice = "alto" {
      \voiceTwo
      \stemDown
      \relative c'' {
        g2 a4 fis g ees8 g fis2 g4 a bes~bes8 g~g4 d8 c  bes2  
      }
    }
  >>
>> 
leftI = <<
  \clef bass
  \time 2/4
  \key g \minor
  <<
    \new Voice = "tenor" {
      \voiceOne
      \stemUp
      \relative c' {
        d4 ees~ ees d~ d c8 ees d4~ d8 ees d2~ d4 c8 bes~ bes4 fis g2     
      }
    }
    \new Voice = "bass" {
      \voiceTwo
      \stemDown
      \relative c' {
        g2~ g~ g4 c, d d'8 c bes4 a g c, d d g,2 
      }
    }
  >>
>> 

\markup \column {\null \null "Basse I (non chiffrée)" \null}
\score {

    %% PIANO PRINCIPAL
    \new PianoStaff = "Basse I (non chiffrée)" <<
      \new Staff = "righthand" { \rightI }
      \new Staff = "lefthand" { \leftI }
      \lyrics {"G min"}
      \lyrics { "i"4 "VI"8 "(i)" "ii°"4 "i" \markup { "—" } "iv" "V" ""8 "(vii°)" "i"4 "V" "i" "iv" "i" "V" "i"}
      \figures {<_>4 <6>8 <_> <2>4 \bassFigureExtendersOn <7\+5>8 <7\+4> <8 3>4 <_>8 <7> <_+>4 <_>8 <4\+ 3>8 <_>4 <6\+ 4> <_> <7 3>8 <7 2> <6 4>4 <7_\+>}
    >>

}

\markup \column {\null \null "Basse II (chiffrée)" \null}

rightII =  <<
  \clef trble
  \time 3/4
  \key c \minor
  <<
    \new Voice = "sopranoII" {
      \voiceOne
      \stemUp
      \relative c'' {
       r4 ees d r c g r ees f b,! d b c 
      }
    }
    \new Voice = "altoII" {
      \voiceTwo
      \stemDown
      \relative c'' {
        r4 g2 r4 g4 d r g f g2. 
      }
    }
  >>
>> 
leftII = <<
  \clef bass
  \time 3/4
  \key c \minor
  <<
    \new Voice = "tenor" {
      \voiceOne
      \stemUp
      \relative c' {
       r4 c b! r c b r c2 d4  b! d 
      }
    }
    \new Voice = "bass" {
      \voiceTwo
      \stemDown
      \relative c {
         c2 g'4  ees2 d4 c2 aes'4 g g, f' ees!2 f4 d2 ees4 c aes bes ees f g
      }
    }
  >>
>> 
\score {
    %% PIANO PRINCIPAL
    \new PianoStaff = "Basse II (chiffrée)" <<
      \new Staff = "righthand" { \rightII }
      \new Staff = "lefthand" { \leftII }
      \lyrics {"C min"}
      \lyrics {"i"4 \markup { "—" } "V" "i" \markup { "—" } "V" "i" \markup { "—" } "iv" "V"2 \markup { "——" }4 "i"}
      \figures {<0>4 <5> <_!> <0> <6> <6\+ 4> <0 > <5> <6> \bassFigureExtendersOn <_!> <_!> <0> \bassFigureExtendersOff <0> <6> <5> <0> <6> <5> <5> <6> <5>}
    >>

}

\markup \column { "Es ist genug; so nimm, Herr, meinen Geist" \null}

BachNineOneRight =  <<
  \clef trble
  \time 4/4
  \key a \major
  <<
    \new Voice = "soprano" {
      \voiceOne
      \stemUp
      \relative c'' {
       a2 b4 cis dis2 \fermata 
       r4 dis e b b d! cis2. \fermata 
       b4 cis8 dis e4 e dis e2 \fermata
       a, b4 cis dis2\fermata 
       r4 dis e b b d cis2 \fermata 
      }
    }
    \new Voice = "alto" {
      \voiceTwo
      \stemDown
      \relative c' {
        e2 e4 d8 cis gis'2 r4 gis gis4. a8 gis fis 
        \autoBeamOff 
        gis e a2.
        \autoBeamOn
        gis4 a8 b cis4 b a!16 gis! a8 gis2 e e4 e fis2 
        r4 fis8 gis16 a gis8 fis gis a b4 gis a2
      }
    }
  >>
>> 
BachNineOneLeft = <<
  \clef bass
  \time 4/4
  \key a \major
  <<
    \new Voice = "tenor" {
      \voiceOne
      \stemUp
      \relative c' {
       cis2 b4 fis' fis2 r4 bis,! cis8 dis e4 e e e2. e4 e8 fis g4 fis b, b2 cis d4 a a2 
       r4 b b e e e e2 
      }
    }
    \new Voice = "bass" {
      \voiceTwo
      \stemDown
      \relative c' {
         a2 gis4 ais bis2 \fermata 
         r4 gis cis8 b!16 a!16 gis8 fis e d! cis b a2. \fermata 
         e'4 a ais b b, e2 \fermata 
         a2 gis4 g fis2\fermata 
         r4 b, e4. fis8 gis4 fis8 e a2 \fermata 
      }
    }
  >>
>> 

\score {
    %% PIANO PRINCIPAL
    \new PianoStaff = "Es ist genug; so nimm, Herr, meinen Geist" <<
      \new Staff = "righthand" { \BachNineOneRight }
      \new Staff = "lefthand" { \BachNineOneLeft }
      \lyrics {"A maj"1*3 ""2 \markup \null 4 "E maj"4 ""1}
      \lyrics {"I"2 "V "4 \markup {\fontsize #0.3 "V"\hspace#-1 \sub{\fontsize #6 {"/"}\hspace #-0.5 \fontsize #2 "ii"}} \markup {\fontsize #0.3 "V"\hspace#-1 \sub{\fontsize #6 {"/"}\hspace #-0.5 \fontsize #2 "iii"}}1 "iii"8 "V"8 ""4 "____________________"2 "I"2. 
               "I"4 "IV"8 "V" \markup {\fontsize #0.3 "vii°"\hspace#-1 \sub{\fontsize #6 {"/"}\hspace #-0.5 \fontsize #2 "ii"}}4 "I" "V" "I"2 "IV" "I"4 "IV" "vii°"2 ""1 "V"4 "_______" "I"2
      }
      \figures {<_>2 <6>4 <6>4 <4\+>2. <6>4 <_>8 <3+ 4> <6>4 <_>8 <4\+>4 <6\+>8 <_>1 <_>8 <4\+>8 <5/>4 <6 4> <7_\+> <_>1 <6>4 <2> <6\+ 3>2 <_>1 <6>4 <7_\+> }
    >>

}
