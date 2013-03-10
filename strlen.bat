@echo off

if "%1" EQU "" goto noparam
set var=%*
goto main

:noparam
set flag2=1
set /p var=Enter string: 
goto main

:main
rem initial set
set sum=-1
setlocal ENABLEDELAYEDEXPANSION
set flag=0

rem for loop to output 1 character per line
FOR /L %%i IN (0,1,100) DO (
	echo !var:~%%i,1! >> strlen1.txt)

rem reading from file, putting ; in 'ECHO is off.' lines
FOR /F "usebackq tokens=*" %%a in (strlen1.txt) DO call :1 %%a

rem reading from file, ignore ;, count
FOR /F "usebackq tokens=* eol=;" %%b in (strlen2.txt) DO (
	set /a sum=!sum!+1)
goto end

:end
echo %sum%
	if '%flag2%' EQU '1' pause
del strlen*.txt
goto eof

:1
set string=%*
if "%string%" EQU "ECHO is off." (
	if %flag% EQU 1 (
		set string=;%string%
		) else (
		set flag=1)
	) else (
	set flag=0)
echo %string% >> strlen2.txt
goto eosf

:eof

:eosf
