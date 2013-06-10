@echo off

setlocal enabledelayedexpansion
set directives_filename=directives.ddf

echo.

if "%~1" EQU "" (
	echo [^^!] Path not specified!
	goto :usage
)
if not exist "%~1" (
	echo [^^!] Path not valid!
	goto :usage
)
if "%2" EQU "" (
	echo [^^!] Output file not specified!
	goto :usage
)

goto stage0

:stage0
echo [*] Stage 0: Clearing previously-created files ...
if exist dirlist.txt del dirlist.txt
if exist fulllist.txt del fulllist.txt
if exist %directives_filename% del %directives_filename%
echo.
goto stage1

:stage1
echo [*] Stage 1: Enumerating files and directories ...
echo [*]          Ignore "File Not Found" error below ;)
dir %1 /ad /b /s >> dirlist.txt
for /f "delims=" %%i in (dirlist.txt) do (
	echo %%i>> fulllist.txt
	for /f %%j in ('dir "%%i" /a-d /b') do (
		echo %%j>> fulllist.txt
	)
)
echo.
goto stage2

:stage2
echo [*] Stage 2: Preparing ddf file ...

set tmppath1=%~1
set tmppath2=%~n1
set pathprefix=!tmppath1:%tmppath2%=!

echo .Option Explicit >> %directives_filename%
echo .Set SourceDir="%~1" >> %directives_filename%
echo .Set DiskDirectoryTemplate="." >> %directives_filename%
echo .Set CabinetNameTemplate="%2" >> %directives_filename%
echo .Set MaxDiskSize=0 >> %directives_filename%
echo .Set CabinetFileCountThreshold=0 >> %directives_filename%
echo .Set UniqueFiles=OFF >> %directives_filename%
echo .Set Cabinet=ON >> %directives_filename%
echo .Set Compress=ON >> %directives_filename%
echo .Set CompressionType=MSZIP >> %directives_filename%
echo .Set DestinationDir="%~n1" >> %directives_filename%

echo [*]          Writing file/folder-specific list ... 
for /f "delims=" %%m in ('dir "%~1" /a-d /b') do (
	echo "%%m" >> %directives_filename%
)
for /f "delims=" %%k in (fulllist.txt) do (
	rem echo %%k
	if exist "%%k\" (
		rem echo %%k is a directory
		set currdir=%%k
		echo .Set SourceDir="%%k" >> %directives_filename%
		echo .Set DestinationDir="!currdir:%pathprefix%=!" >> %directives_filename%
	) else (
		rem echo %%k is a file
		echo "%%~nk%%~xk" >> %directives_filename%
	)
)
echo [*]          %directives_filename% file successfully written.
echo.
goto stage3

:stage3
echo [*] Stage 3: Launching makecab ...
makecab /f %directives_filename%
echo [*]          makecab complete.
echo.
goto stage4

:stage4
echo [*] Stage 4: Deleting temporary files ...
if exist setup.inf del setup.inf
if exist setup.rpt del setup.rpt
if exist dirlist.txt del dirlist.txt
if exist fulllist.txt del fulllist.txt
echo [*]          Exiting program ...
goto eof

:usage
echo.
echo Usage: %0 ^<full directory path^> ^<output filename^> 
echo.
echo Example: %0 "C:\Program Files\OpenSSH" OpenSSH.cab 
echo.
echo Output file will be created in the current working directory.
pause
goto eof

:eof
echo.


