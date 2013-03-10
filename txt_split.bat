@echo off

echo ***********************
echo *                     *
echo * TXT_SPLIT.BAT       *
echo * CODED BY 0x776b7364 *
echo *                     *
echo ***********************
echo.
echo Program to split a txt file contents into filenames
echo Files are then dumped to a specified folder
echo.
echo Limitations:
echo - Only read in ASCII text files
echo - Ignores blank lines (function of 'for' as defined in documentation)
echo - Truncates space if first character is space
echo - May ignore certain symbols (non-printable characters,quotation marks)
echo - Ignores all text in line after
echo     -colon (:)
echo     -inequality operators like ^> and ^<
echo     -question mark (?)
echo.

set /p file=Enter file to split: 
if not exist %file% (
	echo Error. File not found.
	pause
	exit)
set /p folder=Enter destination folder: 
mkdir %folder%

set cnt=100
FOR /F "usebackq tokens=*" %%a in (%file%) DO call :1 %%a

goto :eof

:1

echo nul >> "%folder%\%cnt% %*"
set /a cnt = %cnt% + 1






