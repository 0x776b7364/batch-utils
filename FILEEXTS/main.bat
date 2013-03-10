@echo off

SetLocal EnableDelayedExpansion

:start
echo.
echo 1) Generate number filetypes (.000-.999)
echo 2) Generate letter filetypes (.aaa-.zzz)
set /p choice=Enter number: 
if %choice% EQU 1 goto gen_no
if %choice% EQU 2 goto gen_letter
goto start

:gen_no

if not exist setnums.bat (
	echo @echo off >> setnums.bat
	for /L %%a in (0,1,9) do (
		echo set %%a=%%a>> setnums.bat)
		)

call setnums.bat
echo @echo off >> gen_no_files.bat
for /L %%a in (0,1,9) do (
	for /L %%b in (0,1,9) do (
		for /L %%c in (0,1,9) do (
				echo Writing echo nul ^> try.!%%a!!%%b!!%%c! to file
				echo echo nul ^> try.!%%a!!%%b!!%%c! >> gen_no_files.bat
					)
				)
			)

cls
echo.
echo Calling gen_no_files... 
echo WARNING! Continuing will cause the creation of 1000 files.
set /p choice2=Continue [y/n]? 
if %choice2% EQU y goto create_no_files
goto quitmsg

:create_no_files
call gen_no_files.bat

rem cleanup
del gen_no_files.bat
goto quitmsg

:quitmsg
EndLocal
echo Quitting...
pause
exit

:gen_letter

if not exist setletters.bat (
	echo @echo off >> setletters.bat
	for /L %%a in (0,1,25) do (
		echo set %%a=>> setletters.bat)
		)

echo Edit setletters.bat before continuing
notepad setletters.bat
pause

call setletters.bat
echo @echo off >> gen_letter_files.bat
for /L %%a in (0,1,25) do (
	for /L %%b in (0,1,25) do (
		for /L %%c in (0,1,25) do (
				echo Writing echo nul ^> try.!%%a!!%%b!!%%c! to file
				echo echo nul ^> try.!%%a!!%%b!!%%c! >> gen_letter_files.bat
					)
				)
			)

cls
echo.
echo Calling gen_letter_files... 
echo WARNING! Continuing will cause the creation of 17576 files.
set /p choice2=Continue [y/n]? 
if %choice2% EQU y goto create_letter_files
goto quitmsg

:create_letter_ files
call gen_letter_files.bat

rem cleanup
del gen_letter_files.bat
goto quitmsg