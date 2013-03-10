@echo off

set corr=0
set wrong=0
set total=0

:start
cls
echo *******************************
echo *                             *
echo *  PETALS AROUND THE ROSE V1  *
echo *  BAT FILE IMPLEMENTATION    *
echo *  CODED BY DOMINIC           *
echo *                             *
echo *******************************
echo.

if not exist dice.bat (
	echo DICE.BAT missing! Program will now terminate...
	pause
	exit)

:loop1
set /a no1=%RANDOM:~-1%
if /I %no1% EQU 7 goto loop1
if /I %no1% EQU 8 goto loop1
if /I %no1% EQU 9 goto loop1
if /I %no1% EQU 0 goto loop1

:loop2
set /a no2=%RANDOM:~-1%
if /I %no2% EQU 7 goto loop2
if /I %no2% EQU 8 goto loop2
if /I %no2% EQU 9 goto loop2
if /I %no2% EQU 0 goto loop2

:loop3
set /a no3=%RANDOM:~-1%
if /I %no3% EQU 7 goto loop3
if /I %no3% EQU 8 goto loop3
if /I %no3% EQU 9 goto loop3
if /I %no3% EQU 0 goto loop3

:loop4
set /a no4=%RANDOM:~-1%
if /I %no4% EQU 7 goto loop4
if /I %no4% EQU 8 goto loop4
if /I %no4% EQU 9 goto loop4
if /I %no4% EQU 0 goto loop4

:loop5
set /a no5=%RANDOM:~-1%
if /I %no5% EQU 7 goto loop5
if /I %no5% EQU 8 goto loop5
if /I %no5% EQU 9 goto loop5
if /I %no5% EQU 0 goto loop5

call dice.bat d%no1%
call dice.bat d%no2%
call dice.bat d%no3%
call dice.bat d%no4%
call dice.bat d%no5%

set patr=0
if /I %no1% EQU 3 set /a patr=%patr%+2
if /I %no2% EQU 3 set /a patr=%patr%+2
if /I %no3% EQU 3 set /a patr=%patr%+2
if /I %no4% EQU 3 set /a patr=%patr%+2
if /I %no5% EQU 3 set /a patr=%patr%+2
if /I %no1% EQU 5 set /a patr=%patr%+4
if /I %no2% EQU 5 set /a patr=%patr%+4
if /I %no3% EQU 5 set /a patr=%patr%+4
if /I %no4% EQU 5 set /a patr=%patr%+4
if /I %no5% EQU 5 set /a patr=%patr%+4

echo.
set /p ans=Guess a number: 
echo.
if /I %patr% EQU %ans% (
set /a corr=%corr%+1
echo Your guess is CORRECT!)
if /I %patr% NEQ %ans% (
set /a wrong=%wrong%+1
echo Your guess is WRONG!
echo The correct answer should be: %patr%)
set /a total=%total%+1

:playagain
echo.
set /p choice=Play again [y/n]? 
if /I %choice% EQU y goto start
if /I %choice% EQU n goto end
goto playagain


:end
cls
set /a pccorr=%corr%*100/%total%
set /a pcwrong=%wrong%*100/%total%
echo.
echo RESULTS
echo =======
echo.
echo Number of Correct guesses: %corr%
echo Number of Wrong guesses:   %wrong%
echo Total Number of guesses:   %total%
echo.
echo Percentage Correct guesses: %pccorr%
echo Percentage Wrong guesses:   %pcwrong%
if /I %pccorr% EQU 100 (
	if /I %total% GEQ 5 (
echo.
echo YOU KNOW THE SECRET OF PETALS AROUND THE ROSES!
echo YOU ARE NOT TO DIVULGE THIS SECRET TO ANYONE!))
if /I %pccorr% EQU 0 (
echo.
echo PERSIST, AND YOU SHALL DISCOVER THE SECRET OF PETALS AROUND THE ROSES!)
echo.
echo Thanks to:
echo Junming for commenting on the dice images
echo Bernard for pointing out a bug
echo.
echo Thank you for playing! Terminating program...
pause
exit