@echo off

if "%1" EQU "" goto noparam

set /a noofsecs=%1
:main
set /a truesecs=%noofsecs%+1
rem echo pause for %noofsecs% secs...
set initsec=%time:~7,1%

:loop
if %truesecs% EQU 0 goto end
set currtime=%time:~7,1%
if %currtime% EQU %prev% goto loop
set prev=%currtime%
set /a truesecs=%truesecs%-1
echo secs left: %truesecs%
goto loop

:noparam
set /p hr=Enter hours: 
set /p mn=Enter mins:  
set /p sc=Enter secs:  
set /a noofsecs=%hr%*3600+%mn%*60+%sc%
goto main

:end