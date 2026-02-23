@echo off
setlocal enabledelayedexpansion

rem Configuración
set "url=https://raw.githubusercontent.com/Shelaxh/switcher/refs/heads/main/state"
set "state="

:loop
for /f "tokens=*" %%i in ('curl -s -L --fail %url%') do set "state=%%i"

rem Validación: ¿Obtuvimos una respuesta?
if not defined state (
    echo Error: No se pudo obtener el estado desde el servidor.
    exit /b
)

rem Procesamiento de estados
if "%state%"=="1" (
    echo Estado 1 detectado: Cerrando sesion...
    shutdown -l
) else if "%state%"=="0" (
    echo Estado 0 detectado...
) else (
    echo Estado desconocido recibido: %state%
)

timeout /t 5 /nobreak >nul
goto loop