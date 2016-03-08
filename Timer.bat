@echo off
setlocal

rem The format of %TIME% is HH:MM:SS,CS for example 23:59:59,99
set STARTTIME=%DATE%--%TIME%

rem here begins the command you want to measure
dir /s
echo dd
rem here ends the command you want to measure

set ENDTIME=%DATE%--%TIME%

rem output as time
echo STARTTIME: %STARTTIME%
echo ENDTIME:   %ENDTIME%

rem convert STARTTIME and ENDTIME to centiseconds
set /A STARTTIME=(1%STARTTIME:~0,2%-100)*360000 + (1%STARTTIME:~3,2%-100)*6000 + (1%STARTTIME:~6,2%-100)*100 + (1%STARTTIME:~9,2%-100)
set /A ENDTIME=(1%ENDTIME:~0,2%-100)*360000 + (1%ENDTIME:~3,2%-100)*6000 + (1%ENDTIME:~6,2%-100)*100 + (1%ENDTIME:~9,2%-100)

rem calculating the duratyion is easy
set /A DURATION=%ENDTIME%-%STARTTIME%

rem we might have measured the time inbetween days
if %ENDTIME% LSS %STARTTIME% set set /A DURATION=%STARTTIME%-%ENDTIME%

rem now break the centiseconds down to hours, minutes, seconds and the remaining centiseconds
set /A DURATIONJ=%DURATION% / 8640000
set /A DURATIONH=%DURATION% / 360000
set /A DURATIONM=(%DURATION% - %DURATIONH%*360000) / 6000
set /A DURATIONS=(%DURATION% - %DURATIONH%*360000 - %DURATIONM%*6000) / 100
set /A DURATIONHS=(%DURATION% - %DURATIONH%*360000 - %DURATIONM%*6000 - %DURATIONS%*100)

rem some formatting
if %DURATIONJ% LSS 10 set DURATIONJ=0%DURATIONJ%
if %DURATIONH% LSS 10 set DURATIONH=0%DURATIONH%
if %DURATIONM% LSS 10 set DURATIONM=0%DURATIONM%
if %DURATIONS% LSS 10 set DURATIONS=0%DURATIONS%
if %DURATIONHS% LSS 10 set DURATIONHS=0%DURATIONHS%

rem outputing
REM echo STARTTIME: %STARTTIME% centiseconds
REM echo ENDTIME: %ENDTIME% centiseconds
REM echo DURATION: %DURATION% in centiseconds
echo DURATION:     %DURATIONJ%j-%DURATIONH%h-%DURATIONM%m-%DURATIONS%s-%DURATIONHS%ms

endlocal
pause>nul
goto :EOF