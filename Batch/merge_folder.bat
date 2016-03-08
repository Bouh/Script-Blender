@echo off

REM Créer un dossier "merged"
md merged

REM Chaque dossier est ouvert tout est copier et coller dans le dossier "merged"

for /f "delims=" %%f in ('dir /b /ad') do (
    if not %%f==merged xcopy "%%f" merged /s /y
)