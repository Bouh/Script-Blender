@echo off
setlocal enableDelayedExpansion

set "Frames=-f "
set "vaarr="

for %%F in (*.png*) do (

	set vaarr=!vaarr! %Frames%%%~nF
	echo %Frames%%%~nF
)
	echo %vaarr% >> Frames_error.txt

REM pause>nul