@echo off
@echo #####################
set /p Frame= Choisir la frame:
echo %Frame%
echo:

set myvar="the list: "
for /r %%i in (*.doc) DO call :concat %%i
echo %myvar%
goto :eof

:concat
set myvar=%myvar% %1;
goto :eof