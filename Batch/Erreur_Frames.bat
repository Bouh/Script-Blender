@echo off
setlocal enableDelayedExpansion

REM -----------Principe----------------
REM Pourchaque fichiers .png on sort un fichier Pictures_Frames_error.txt
REM qui contient chaque numéro d'images pour relancé un rendu par la suite.
REM Nécessite que les fichier .png n'aient que un format du type 0001.png / 1.png


@echo ---------------------------------------------------------------
@echo Generateur de batch pour rendu (Frames erreur)
@echo ---------------------------------------------------------------

set FileToDelete="Pictures_Frames_error.txt"
REM Si le fichier de la variable FileToDelete existe
IF EXIST %FileToDelete% (

    REM Suppression du fichier
    del /F %FileToDelete% 
    
    echo File deleted : %FileToDelete%
    
    @echo ---------------------------------------------------------------
)

set "Frames=-f "

REM Pour chaque fichiers .png
for %%F in (*.png*) do (

    REM Ajoute a la variable le texte "-f "
	set vaarr=!vaarr! %Frames%%%~nF
	
)

echo !vaarr!
echo %vaarr% >> Pictures_Frames_error.txt

pause>nul