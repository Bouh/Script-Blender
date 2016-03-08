@echo off
setlocal enableDelayedExpansion

@echo #####################
set /p Episode= Episode :

@echo #####################
set /p Plan= Plan :

REM Ep5_Pl37_0048

set "NameFile=Ep%Episode%_Pl%Plan%_"
echo %NameFile%


for /f %%f in (*.jpg) do echo %%f

for %%F in (*%Vavant%*) do (

	if [[ $string == *"My long"* ]]
	then
		echo "It's there!";
	fi
	
	set "name=%%F"
	REM ren "!name!" "!name:%Vavant%=%Vapres%!"
	echo %%F 
)










@echo #####################
set /p Uavant= Avant :
rem set /p Uavant=Partie de la chaine a remplacer: 
REM set "Vavant=%Uavant%"
set "Vavant=0000"

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
  REM ren "!name!" "!name:%Vavant%=%Vapres%!"
  echo %%F 
)
echo:
@echo #####################
echo Press any key for exit
@echo #####################
pause >nul