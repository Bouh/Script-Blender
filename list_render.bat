@echo off
setlocal enableDelayedExpansion

set "Frames="C:\Program Files\Blender Foundation\Blender\blender.exe" -b "
set "vaarr="
set LF=\.

REM Supprime le fichier de rendu déjà fait
set FileToDelete="List_render.txt"

IF EXIST %FileToDelete% (
    del /F %FileToDelete%
    
    echo File deleted : %FileToDelete%
)

REM pour chaque fichier .blend
for %%F in (*.blend*) do (

	set vaarr=!vaarr!%Frames%%%~nF
	echo %Frames%%%~nF
	set vaarr=!vaarr!.blend -x 1 -F JPEG -a XYZ
)

set "token=!vaarr!"
REM set newVal=!vaarr!:XYZ=echo.

REM Variable pour faire un saut de ligne
set LF=^


REM ** Two empty lines required between variable ^ and this line
FOR /F "delims=" %%a in ("%token:XYZ=!LF!%") do (
  echo %%a>>List_render.txt
)
pause>nul