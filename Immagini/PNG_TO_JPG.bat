@echo off
setlocal

if "%~1"=="" (
    echo Trascina qui i file PNG da convertire in JPG.
    pause
    exit /b
)

:loop
if "%~1"=="" goto end

set "input=%~1"
set "folder=%~dp1"
set "filename=%~n1"
set "output=%folder%%filename%.jpg"

powershell -NoProfile -Command "[Reflection.Assembly]::LoadWithPartialName('System.Drawing') > $null; $img = [System.Drawing.Image]::FromFile('%input%'); $img.Save('%output%', [System.Drawing.Imaging.ImageFormat]::Jpeg); $img.Dispose()"

shift
goto loop

:end
echo Conversione PNG → JPG completata!
pause
