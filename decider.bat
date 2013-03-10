@echo off

echo ************************************
echo *                                  *
echo *  DECIDER PROGRAM                 *
echo *  LET THE CPU DECIDE FOR YOU!!    *
echo *  CODED BY 0x776b7364 16/10/2006  *
echo *                                  *
echo ************************************
echo.

set /p num=Enter number of choice(s): 
echo.
setlocal ENABLEDELAYEDEXPANSION
for /L %%i in (1,1,%num%) do (
	set /p choice%%i=Enter Choice %%i: )
echo.
set /p rndnum=Enter number of random numbers you wish to generate: 

echo.
set cnt=0
echo Generating... Please wait...

:here
if /I %cnt% EQU %rndnum% goto end
set /a number=%RANDOM:~-1%
rem echo %number%
if /I %number% GTR %num% goto here
if /I %number% EQU 0 goto here
set /a choice%number%cnt=choice%number%cnt+1
set /a cnt=%cnt%+1
goto here

:end
echo Done.
echo.
echo ==========================
echo RESULTS
echo Choice Desc - Choice Count
echo ==========================
echo.
for /L %%i in (1,1,%num%) do (
	echo !choice%%i! - !choice%%icnt!)
echo.
pause
