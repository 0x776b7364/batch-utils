@echo off

if exist listdirs.txt (
	echo WARNING
	echo listdirs.txt exist. Deleting file...
	del listdirs.txt
	pause
	cls)

:startup
echo.
echo  PROGRAM TO DELETE LAST EXTENSION FROM FILES
echo  CODED BY 0x776b7364 
echo.
echo  Choose option:
echo  ==============
echo.
echo   1) Include current working directory (CWD) ONLY
echo   2) Include subdirectories ONLY
echo   3) Include BOTH CWD and subdirectories
echo.
set /p opt=Enter option number: 

if %opt% EQU 1 (
	echo %cd% >> listdirs.txt
	goto next)
if %opt% EQU 2 (
	dir /ad/b/s >> listdirs.txt
	goto next)
if %opt% EQU 3 (
	dir /ad/b/s >> listdirs.txt
	echo %cd% >> listdirs.txt
	goto next)
goto startup

:next
pause

setlocal enabledelayedexpansion
FOR /F "usebackq tokens=*" %%a in (listdirs.txt) do (
	echo.
	echo Changing working directory to "%%a"...
	cd "%%a"
	echo Renaming files in "%%a.*" to "%%a"
	FOR /R %%i IN (*.*) DO (
		set ori=%%~nxi
		if "!ori:~-4!" NEQ ".bat" (
			set new=!ori:~0,-4!
			echo Renaming !ori! to !new!  ...
			ren "!ori!" "!new!")
			)
	ECHO.)

pause
