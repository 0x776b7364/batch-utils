@echo off

echo ***********************
echo *                     *
echo * TXT_JOIN.BAT        *
echo * CODED BY 0x776b7364 *
echo *                     *
echo ***********************
echo,
echo TXT_JOIN should be used in conjunction with TXT_SPLIT
echo TXT_JOIN file should be placed in the same directory as target folder
echo.

set /p folder=Enter target folder: 
if not exist %folder% (
	echo Error, folder does not exist.
	pause
	goto eof)
set /p file=Enter target output file: 
if exist %file% (
	echo Error, file already exists.
	pause
	goto eof)

dir /b %folder% >> dir.txt

FOR /F "tokens=*" %%a in (dir.txt) DO call :1 %%a

goto :eof

:1

set string=%*
set nstring=%string:~4%
echo %nstring% >> output.txt
