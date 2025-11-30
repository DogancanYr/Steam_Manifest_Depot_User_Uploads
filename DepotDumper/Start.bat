@echo off

:: Made by DogancanYr

set /P username=Username (Type "qr" for QR Code login): 

:: Ask for password only if not using QR login
if /I not "%username%"=="qr" (
    set /P password=Password: 
)

set /P appid=AppID (Leave empty to dump all): 

:: Add -qr if username is "qr"
set qr=
if /I "%username%"=="qr" (
    set qr=-qr
)

:: Add -appid only if a value is provided
if not "%appid%"=="" (
    set appid=-appid %appid%
) else (
    set appid=
)

:: Add -password only if provided
if not "%password%"=="" (
    set password=-password %password%
) else (
    set password=
)

DepotDumper.exe -username %username% %qr% %appid% %password% -generate-reports -log-level warning -logs-dir "%~dp0\dumps" -reports-dir "%~dp0\dumps"

@set /p=--Press any key to exit--<nul
pause >nul