@echo off

:init
set c1=1
set c2=2
set c3=3

set c4=4
set c5=5

set c6=6
set c7=7
set c8=8
set c9=9
set prev=-
set cnt=0
set change=0

:enter
cls
echo.
echo  ***********************
echo  *                     *
echo  * TIC TAC TOE         *
echo  * Coded by 0x776b7364 *
echo  *                     *
echo  ***********************
echo.

if not exist disp.bat (
	echo disp.bat missing! Qutting app...
	exit)
if not exist check.bat (
	echo check.bat missing! Qutting app...
	exit)

call disp.bat

if %cnt% GTR 0 goto next
set /p player=Enter first player (o,x):

:next
set /p coord=Enter Co-ordinate (1-9): 

if %coord% EQU 0 goto enter
if %coord% GEQ 10 goto enter

SetLocal EnableDelayedExpansion
if /I !c%coord%! GTR 9 (
	echo.
	echo Tried to overwrite a value.. Bad player...
	pause
	goto enter)
EndLocal

set c%coord%=%player%

set /a cnt=%cnt%+1
call check.bat %player%

goto enter

:end
pause




