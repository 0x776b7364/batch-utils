@echo off
for /r %%i in (*.*) do echo %%~nxi >> unsorted.txt
sort unsorted.txt /o direc_output.txt
del unsorted.txt
pause