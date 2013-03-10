@echo off

echo *************************
echo *                       *
echo * Makelog               *
echo * 0x776b7364 22/09/2008 *
echo *                       *
echo *************************
echo.

rem I have no idea what name to give this file, so I will 
rem just name it in the context in which it was created for.
rem This file will iterate through all local HDD partitions
rem and create a hidden "log" folder.

net share | find "Default" >> drives.txt
FOR /F "eol=$ tokens=1* delims=$ " %%i in (drives.txt) do (
	if not exist %%i:\log (
		mkdir %%i:\log
		attrib %%i:\log +H
		echo Hidden folder "log" created in %%i:\ partition.)
)
pause
echo Done! Deleting drives.txt and terminating program...
del drives.txt
