@echo off

rem 1?? = spade
rem 2?? = heart
rem 3?? = club
rem 4?? = diamond

rem ?11 = A
rem ?12 = 2
rem ?13 = 3
rem ?14 = 4
rem ?15 = 5
rem ?16 = 6
rem ?17 = 7
rem ?18 = 8
rem ?19 = 9
rem ?20 = 10
rem ?21 = J
rem ?22 = Q
rem ?23 = K

set 111=Ace of Spades
set 112=2 Spades
set 113=3 Spades
set 114=4 Spades
set 115=5 Spades
set 116=6 Spades
set 117=7 Spades
set 118=8 Spades
set 119=9 Spades
set 120=10 Spades
set 121=Jack of Spades
set 122=Queen of Spades
set 123=King of Spades

set 211=Ace of Hearts
set 212=2 Hearts
set 213=3 Hearts
set 214=4 Hearts
set 215=5 Hearts
set 216=6 Hearts
set 217=7 Hearts
set 218=8 Hearts
set 219=9 Hearts
set 220=10 Hearts
set 221=Jack of Hearts
set 222=Queen of Hearts
set 223=King of Hearts

set 311=Ace of Clubs
set 312=2 Clubs
set 313=3 Clubs
set 314=4 Clubs
set 315=5 Clubs
set 316=6 Clubs
set 317=7 Clubs
set 318=8 Clubs
set 319=9 Clubs
set 320=10 Clubs
set 321=Jack of Clubs
set 322=Queen of Clubs
set 323=King of Clubs

set 411=Ace of Diamonds
set 412=2 Diamonds
set 413=3 Diamonds
set 414=4 Diamonds
set 415=5 Diamonds
set 416=6 Diamonds
set 417=7 Diamonds
set 418=8 Diamonds
set 419=9 Diamonds
set 420=10 Diamonds
set 421=Jack of Diamonds
set 422=Queen of Diamonds
set 423=King of Diamonds

rem associate value with last 2 digits
set 11=11
set 12=2
set 13=3
set 14=4
set 15=5
set 16=6
set 17=7
set 18=8
set 19=9
set 20=10
set 21=10
set 22=10
set 23=10

set /p noplayers=Enter number of players (excl yourself): 
set /p yourname=Enter your name: 
rem set /p startcash=Enter amount of cash to start with: 
rem set /p bet=Enter amount to bet each round (apply to all players): 

