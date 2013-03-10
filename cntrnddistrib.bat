@echo off

echo Count RANDOM Distribution
echo.

set no1=0
set no2=0
set no3=0
set no4=0
set no5=0
set no6=0
set no7=0
set no8=0
set no9=0
set no0=0
set cnt=0

:here
if /I %cnt% EQU 1000 goto end
set /a number=%RANDOM:~-1%
echo %number%
rem if /I %number% EQU 7 goto here
rem if /I %number% EQU 8 goto here
rem if /I %number% EQU 9 goto here
rem if /I %number% EQU 0 goto here
set /a no%number%=no%number%+1
set /a cnt=%cnt%+1
goto here

:end
echo.
echo.
echo 1: %no1%
echo 2: %no2%
echo 3: %no3%
echo 4: %no4%
echo 5: %no5%
echo 6: %no6%
echo 7: %no7%
echo 8: %no8%
echo 9: %no9%
echo 0: %no0%

pause