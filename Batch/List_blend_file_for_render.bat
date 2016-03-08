mode con: cols=100 lines=20
@echo off
setlocal enableDelayedExpansion
REM -----------Principe----------------
REM Listé les fichier .blend et en sortir un fichier texte qui est près pour lancer les rendus

REM -----------Variable Publique----------------
set "LocationBlender="C:\Program Files\Blender Foundation\Blender\blender.exe" -b "
set FORMAT=JPEG

REM Supprime le fichier de rendu déjà fait
set FileToDelete="List_render.txt"
@echo ---------------------------------------------------------------
@echo Generateur de batch pour rendu
@echo ---------------------------------------------------------------

REM Si le fichier de la variable FileToDelete existe
IF EXIST %FileToDelete% (


    REM Suppression du fichier
    del /F %FileToDelete% 
    
    echo File deleted : %FileToDelete%
    
    @echo ---------------------------------------------------------------
)

REM pour chaque fichier .blend
for %%F in (*.blend*) do (

    REM %%~nF nom du fichier
	set vaarr=!vaarr!%LocationBlender%%%~nF
	set vaarr=!vaarr!.blend -x 1 -F !FORMAT! -a XYZ
)

REM Création d'une variable dans laquelle on va chercher un texte par la suite.
set "research=!vaarr!"

REM Variable pour faire un saut de ligne
set LF=^


REM ** Deux lignes vides requises au dessus pour faire le retour à la ligne
FOR /F "delims=" %%a in ("%research:XYZ=!LF!%") do (
  echo %%a>>List_render.txt
  echo %%a
)
pause>nul