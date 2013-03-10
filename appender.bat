@echo off
type nul > mynewfile.txt
set cnt=1
FOR /F "tokens=*" %%a in (try.txt) DO call :1 %%a

goto :eof

:1

echo %cnt% %* %date% >> mynewfile.txt
set /a cnt = %cnt% + 1