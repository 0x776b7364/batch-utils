@echo off
set oridir=%cd%

if "%1" EQU "" goto noparam

set setworkingdir=%1
%setworkingdir:~0,2%
cd "%1%"

:noparam
dir /s/b /a-d > dir1.txt
set newcd=%cd%\
call "%oridir%"\strlen %newcd% >> dirlen.txt
FOR /F %%b in (dirlen.txt) do (
	set dirlen=%%b)
FOR /F "usebackq tokens=*" %%a in (dir1.txt) DO call :1 %%a
pause
del dir1.txt
del dirlen.txt

:1
setlocal ENABLEDELAYEDEXPANSION
set string=%*
set nstring=!string:~%dirlen%!
echo %nstring% >> "%oridir%"\dir.txt