@echo off

rem getcard <user> <no of cards>

set user=%1
set noofcards=%2
set cnt=0
rem set %user%total=0

:startgen
:1part
set part1=%RANDOM:~-1%
if %part1% EQU 0 goto 1part
if %part1% GEQ 5 goto 1part
:2part
set part2=%RANDOM:~-2%
if %part2% LEQ 10 goto 2part
if %part2% GEQ 24 goto 2part
set part3=%part1%%part2%
echo %user% has received !%part3%!
set /a %user%total=!%user%total!+!%part3:~-2%!
set /a cnt=%cnt%+1
if %cnt% EQU %noofcards% (
	goto cont) else (
	goto startgen)

:cont
echo %user% has a total score of !%user%total!
if !%user%total! EQU 21 (
	echo -=BLACKJACK=-
	set %user%bj=1)
if !%user%total! GEQ 22 (
	echo -=BUST=-
	set %user%nomore=1)
