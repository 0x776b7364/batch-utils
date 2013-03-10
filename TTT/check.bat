@echo off

if %c1% EQU %1 (
	if %c2% EQU %1 (
		if %c3% EQU %1 goto end
			)
	if %c4% EQU %1 (
		if %c7% EQU %1 goto end
			)
	if %c5% EQU %1 (
		if %c9% EQU %1 goto end
			)
		)
if %c4% EQU %1 (
	if %c5% EQU %1 (
		if %c6% EQU %1 goto end
			)
		)
if %c7% EQU %1 (
	if %c8% EQU %1 (
		if %c9% EQU %1 goto end
			)
	if %c5% EQU %1 (
		if %c3% EQU %1 goto end
			)
		)
if %c2% EQU %1 (
	if %c5% EQU %1 (
		if %c8% EQU %1 goto end
			)
		)
if %c3% EQU %1 (
	if %c6% EQU %1 (
		if %c9% EQU %1 goto end
			)
		)
if %cnt% EQU 9 goto nowinner
goto eof

:end
cls
echo.
echo PLAYER %1 WINS!
echo WINNER was found!!
echo Final arrangement...
echo.
call disp.bat
goto setchoice

:setchoice
set /p choice=Do you wish to play again [y/n]? 
if %choice% EQU y call ttt.bat
if %choice% EQU n (
	echo Quitting app...
	pause
	exit)
goto setchoice

:nowinner
cls
echo.
echo NO WINNER was found!!
echo Better luck next time...
echo Final arrangement...
echo.
call disp.bat
goto setchoice

:eof
if %player% EQU o (
	set player=x) else (
	set player=o)