@echo off

echo *********************************
echo * A game of Chance and Decision *
echo * to test your propensity to    *
echo * take risks for higher returns *
echo *                               *
echo * 0x776b7364           7 Oct 08 *
echo *********************************

rem starting amount
set /a amt=600

rem total rounds
set /a totalrounds=7

set /a iter=0
set /a currround=1

:loop
set proceed=
set /a iter=%iter%+1
echo.
echo ROUND %currround% -- ITERATION %iter%
echo You currently have this amount: %amt%c
set /a rnd1=%RANDOM:~-1%
set /a rnd2=%RANDOM:~-1%
set /a rnd=rnd1*10+rnd2
echo You have found: %rnd%c
set /a itercharge=%iter%*10
echo You will be charged: %itercharge%c
set /a amtleft=%amt%+%rnd%-%itercharge%
:loop2
echo Hence, you will have this amount left: %amtleft%c
set /p acceptamt=Do you want to accept this amount [Y/N]? 
if "%acceptamt%" EQU "y" (
	set /a amt=%amtleft%
	goto endround)
if "%acceptamt%" EQU "n" (
	echo You will incur a search fee of 10c.
	set /p proceed=Proceed [Y/N]? 
	goto testproceed
)

:endround
if "%currround%" EQU "%totalrounds%" (
 echo.
 echo ============================================
 echo Game has ended! Amount you have left is: %amt%
 echo ============================================
 echo.
 pause
 exit) else (
	set /a iter=0
	set /a currround=%currround%+1
	goto loop)

:testproceed
if "%proceed%" EQU "y" (
	goto loop)
goto loop2
