@REM idee 
@REM demande un nom de fichier a rendre
@REM	demander un numero d image a rendre
@REM	demander si il faut ajouter une autre image
@REM		demander un numero d image a rendre
@REM		boucle
@REM	Si non autre fichier a rendre ?
@REM		boucle
@REM	Envoie de message sur un autre pc du reseau ?
@REM		Oui : Demander le nom du pc "MM-00008-DIG"
@REM		le message dit quel fichier on été rendu et quel images.
@REM	Si non
@REM	Lancement du rendu

@echo off
setlocal enableDelayedExpansion

@echo #####################
set /p Blend= Choisir le fichier .blend :
echo %Blend%
echo:

@echo #####################
echo Plusieurs frame en ajoutant un espace entre chaque frame
set /p Frames= Frames :
echo %Frame%
echo:
pause>nul



REM C:\Program Files\Blender Foundation\Blender\blender.exe" -b %Blend%