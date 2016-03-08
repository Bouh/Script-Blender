@echo off
md merged
for /f "delims=" %%f in ('dir /b /ad') do (
    if not %%f==merged xcopy "%%f" merged /s /y
)