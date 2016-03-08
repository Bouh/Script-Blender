@echo off
setlocal enableDelayedExpansion

REM -----------Principe----------------
REM Renommage de tout les fichiers

@echo ---------------------
set /p Uavant= Avant : 
rem set /p Uavant=Partie de la chaine à remplacer: 
set "Vavant=%Uavant%" 

@echo ---------------------
REM set /p Uapres=Nouveau nom de la partie de la chaine a remplacer: 
set /p Uapres=Apres : 
set "Vapres=%Uapres%" 

@echo ---------------------

echo Ont ete renommer : 
echo:
for %%F in (*%Vavant%*) do (
  set "name=%%F"
  rem ren "!name!" "!name:%Vavant%=%Vapres%!"
  echo %%F  --  !name:%Vavant%=%Vapres%!
)
echo:
@echo ---------------------
echo Press any key for exit
@echo ---------------------
pause >nul