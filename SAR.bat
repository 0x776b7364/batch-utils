@echo off

rem ************************
rem *                      *
rem * SAR.BAT              *
rem * CODED BY 0x776b7364  *
rem * 19/01/2008           *
rem *                      *
rem ************************
rem
rem Program to search and replace a string for an input file and outputs to another file
rem
rem Limitations:
rem - Only read in ASCII text files
rem - Ignores blank lines (function of 'for' as defined in documentation)
rem - Truncates space if first character is space
rem - May ignore certain symbols (non-printable characters,quotation marks)
rem - Ignores all text in line after
rem     -colon (:)
rem     -inequality operators like ^> and ^<
rem     -question mark (?)

if "%1" EQU "" (
	echo Usage with arguments: SAR input_file output_file search_string replaced_string
	echo.
	set /p infile=Enter input file: 
	set /p outfile=Enter output file: 
	set /p search=Enter string to search for: 
	set /p replace=Enter replaced string: 
	goto s2
)

set infile=%1
set outfile=%2
set search=%3
set replace=%4

:s2

if not exist %infile% (
	echo Error. File not found.
	pause
	exit
)

FOR /F "usebackq tokens=*" %%a in (%infile%) DO call :1 %%a

goto :eof

:1
SetLocal EnableDelayedExpansion
set str=%*
set newstr=!str:%search%=%replace%!
echo %newstr% >> %outfile%
EndLocal
