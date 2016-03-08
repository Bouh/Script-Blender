@echo off
set "JPG=.jpg"

REM for /f %%f in (%JPG%) do echo %%f

for %%i in (*.*) do GOTO Func1

:Func1
echo %%~xi



echo.

@echo #####################
echo Press any key for exit
@echo #####################
pause >nul