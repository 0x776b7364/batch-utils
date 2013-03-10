@echo off

echo  **********************************
echo  *                                *
echo  * 'Activate-DeActivate' Program  *
echo  * Coded by 0x776b7364            *
echo  *                                *
echo  **********************************
echo.

echo Please make sure that this file is run in the directory where the files are 
echo directly included.
set /p true=Enter name of 'true' file: 
set /p false=Enter name of 'false' file: 
set /p name=Enter name of output batch file: 
if not exist %true% (
	echo 'True' file %true% does not exist.
	goto endbat)
if not exist %false% (
	echo 'False' file %false% does not exist.
	goto endbat)
if exist %name% (
	echo Output file %name% already exist. Please choose another filename.
	goto endbat)

rem ------------------START OUTPUT---------------------

echo @echo off > %name%
echo. >> %name%
echo echo. >> %name%
echo echo  1) ACTIVATE >> %name%
echo echo  2) DEACTIVATE >> %name%
echo set /p choice=Enter choice: >> %name%
echo goto %%choice%% >> %name%
echo goto end >> %name%
echo. >> %name%
echo :1 >> %name%
echo if exist %false% ( >> %name%
echo 	echo ALREADY ACTIVATED >> %name%
echo 	pause >> %name%
echo 	goto end ) else ( >> %name%
echo 	ren %true% %false% >> %name%
echo 	ren %true%.bak %true% ) >> %name%
echo goto end >> %name%
echo. >> %name%
echo :2 >> %name%
echo if exist %true%.bak ( >> %name%
echo 	echo ALREADY DEACTIVATED >> %name%
echo 	pause >> %name%
echo 	goto end ) else ( >> %name%
echo 	ren %true% %true%.bak >> %name%
echo 	ren %false% %true% ) >> %name%
echo goto end >> %name%
echo. >> %name%
echo :end >> %name%
echo exit >> %name%

:endbat
echo Ending program...
pause
exit
