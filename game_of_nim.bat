@echo off

for /L %%a IN (1,1,21) DO set n%%a=^|
set r1=1
for /L %%a IN (2,1,3) DO set r%%a=2
for /L %%a IN (4,1,6) DO set r%%a=3
for /L %%a IN (7,1,10) DO set r%%a=4
for /L %%a IN (11,1,15) DO set r%%a=5
for /L %%a IN (16,1,21) DO set r%%a=6

:disp
echo.
echo    STATUS                   COORDINATES
echo.
echo      ^%n1%                          01
echo     ^%n2% ^%n3%                       02  03
echo    ^%n4% ^%n5% ^%n6%                    04  05  06
echo   ^%n7% ^%n8% ^%n9% ^%n10%                 07  08  09  10
echo  ^%n11% ^%n12% ^%n13% ^%n14% ^%n15%              11  12  13  14  15
echo ^%n16% ^%n17% ^%n18% ^%n19% ^%n20% ^%n21%           16  17  18  19  20  21
echo.

:main
set /p from=Enter coordinate 'from': 
set /p to=Enter coordinate 'to': 
goto check

:check
if /i %from% GTR 21 (
	echo Error in value entered.
	pause
	cls
	goto :disp)

if /i %from% GTR 21 (
	echo Error in value entered.
	pause
	cls
	goto :disp)

if /i %from% GTR %to% (
	echo Error. 'to' value less than 'from'.
	pause
	cls
	goto :disp)

rem reject overwriting
SetLocal EnableDelayedExpansion
for /L %%a IN (%from%,1,%to%) DO (
	if !n%%a! EQU + (
		echo Error. Tried to overwrite a value at %%a.
		pause
		cls
		goto :disp)
		)
EndLocal

rem seperate by rows
SetLocal EnableDelayedExpansion
set row=!r%from%!
for /L %%a IN (%from%,1,%to%) DO (
	if !r%%a! NEQ %row% (
		echo Error. Numbers spread among different rows.
		pause
		cls
		goto :disp)
		)
EndLocal
for /L %%a IN (%from%,1,%to%) DO set n%%a=+
SetLocal EnableDelayedExpansion
for /L %%a IN (1,1,21) DO (
	if !n%%a! NEQ + goto cont)
goto winner
:cont
cls
EndLocal
goto disp

:winner
echo.
echo WINNER FOUND. Loser entered from=%from% and to=%to%.
echo.
pause
