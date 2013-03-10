@echo off

call initset.bat
setlocal EnableDelayedExpansion

echo.

call getcard %yourname% 2

:redraw
if '!%yourname%bj!' EQU '1' (
	goto cont)
if '!%yourname%nomore!' EQU '1' (
	goto cont)
set /p anothercard=Draw another card? [y/n] 
if '%anothercard%' EQU 'y' (
call getcard %yourname% 1
goto redraw)

:cont

set playercnt=1
:player
call getcard Player%playercnt% 2
:redrawpl
if '!%user%bj!' EQU '1' (
	goto contpl)
if '!%user%nomore!' EQU '1' (
	goto contpl)
set /p anothercard=Draw another card? [y/n] 
if '%anothercard%' EQU 'y' (
call getcard Player%playercnt% 1
goto redrawpl)

:contpl
if %playercnt% NEQ %noplayers% (
	set /a playercnt=%playercnt%+1
	echo.
	goto player)


:report
rem START REPORT





