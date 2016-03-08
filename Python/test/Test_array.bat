@echo off
set book[0]=Avatar
set book[1]=The Green Mile
set book[2]=The Count of Monte Cristo
call array.bat add book Babo
call array.bat len book length
echo I have %length% books you can borrow.
echo Pick one:
echo.
echo 0) Avatar
echo 1) The Green Mile
echo 2) The Count of Monte Cristo
echo 3) Babo
echo.
set /p pick=
call array.bat getitem book %pick% title
echo.
echo You picked %title%.
Pause>nul