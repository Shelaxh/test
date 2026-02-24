@echo off
setlocal enabledelayedexpansion

rem Configuracion
set "url=https://raw.githubusercontent.com/Shelaxh/switcher/refs/heads/main/state"
set "state="

:loop
set "state="
for /f "usebackq delims=" %%i in (`curl -s -L --fail --max-time 5 --connect-timeout 3 "%url%"`) do set "state=%%i"

rem Validacion: obtuvimos una respuesta?
if not defined state (
    timeout /t 30 /nobreak >nul
    goto loop
)

rem Procesamiento de estados
if /i "%state%"=="1" (
    shutdown -l
) else if /i "%state%"=="0" (
    rem No hacer nada
) else (
    rem Estado desconocido, ignorar
)

timeout /t 10 /nobreak >nul
goto loop
