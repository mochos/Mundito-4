@echo off
setlocal enabledelayedexpansion

:: Pedir nombre/ruta del archivo
set "file="
set /p "file=Ingrese la ruta completa del archivo: "

:: Verificar que el archivo existe
if not exist "%file%" (
    echo El archivo especificado no existe.
    pause
    exit /b 1
)

:: Calcular y mostrar el SHA1
echo Calculando SHA1...
for /f "skip=1 tokens=* delims=" %%a in ('certutil -hashfile "%file%" SHA1') do (
    if "%%a"=="" (
        rem Línea vacía -> ignorar
    ) else (
        echo %%a | findstr /i /v "certutil" >nul && echo %%a
    )
)

pause
endlocal

:: Código original:
:: Get-FileHash .\Mochos1.2.zip -Algorithm SHA1