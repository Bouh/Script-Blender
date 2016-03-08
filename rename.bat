@echo off
setlocal enableDelayedExpansion

REM Renommage des fichiers
REM Recalcul dans images d'un dossier (Le nom du fichier doit juste contenir le numéro de la frame)
REM Lancement d'un ou plusieurs rendu avec les formats disponible. 

@echo #####################
set /p Uavant= Avant :
rem set /p Uavant=Partie de la chaine a remplacer: 
set "Vavant=%Uavant%"

echo:

@echo #####################
REM set /p Uapres=Nouveau nom de la partie de la chaine a remplacer: 
set /p Uapres=Apres : 
set "Vapres=%Uapres%"
echo:
@echo #####################

echo Ont ete renommer : 
echo:
for %%F in (*%Vavant%*) do (
  set "name=%%F"
  ren "!name!" "!name:%Vavant%=%Vapres%!"
  echo %%F 
)
echo:
@echo #####################
echo Press any key for exit
@echo #####################
pause >nul