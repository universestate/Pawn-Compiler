::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDpwYS2sAE+1EbsQ5+n//NakrUANRucsa4rf5qePLfBDuWHISoU7xEVoyfQbBRULLC67bxg6plJSt3OLec6fvG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZksaHErTXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbCXrZg==
::ZQ05rAF9IAHYFVzEqQIDJx1AWwWQOQs=
::eg0/rx1wNQPfEVWB+kM9LVsJDCWXKGT6JboR+OH36vjn
::fBEirQZwNQPfEVWB+kM9LVsJDCWXKGT6JboR+OH36vjn
::cRolqwZ3JBvQF1fEqQIYLRdYQ0jCC2SoCrFdiA==
::dhA7uBVwLU+EWErL8CI=
::YQ03rBFzNR3SWATE5w00SA==
::dhAmsQZ3MwfNWATE2UszOhRHQwKWfEi1FKUT+unv5uWJwg==
::ZQ0/vhVqMQ3MEVWAtB9wO1RQLA==
::Zg8zqx1/OA3MEVWAtB9wO1RQLA==
::dhA7pRFwIByZRRmXu0ZQ
::Zh4grVQjdCuDJGqd+kFwCQ5AQ0ShM2aqD7kZ+tTe9++Et1kcVu46RKnol6zYdK4W8kCE
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
:: Copyright (C) Microsoft Corporation. All rights reserved.
:: 
:: This script is proprietary information of Microsoft Corporation.
:: Unauthorized use, duplication, or distribution is prohibited.
:: 
:: Description: This script was created by (S) Urnamed. and free to project.

@echo off

set PAWNO_PATH=pawno\pawncc.exe
set OUTPUT_PATH=filterscripts

:compile
if not exist "%PAWNO_PATH%" (
    echo -- pawncc.exe not found in the pawno folder!
    pause
    exit /b
)

if not exist "%OUTPUT_PATH%" (
    echo -- filterscripts folder not found, creating folder...
    mkdir "%OUTPUT_PATH%"
)

for %%f in (filterscripts\*.pwn filterscripts\*.p) do (
    echo -- Compiling %%f...
    "%PAWNO_PATH%" %%f -o"%OUTPUT_PATH%\%%~nf.amx"
    
    if exist "%OUTPUT_PATH%\%%~nf.amx" (
        echo -- %%~nf.amx compiled successfully.
    ) else (
        echo -- Error: Failed to compile %%f.
        pause
    )
)

echo -- Compilation completed.
echo -- Type 'return' to compile again or type 'exit' to end.

:input
set /p input=-- Enter choice: $

if /i "%input%" == "return" (
    goto compile
) else if /i "%input%" == "exit" (
    goto exit
) else (
    echo -- Invalid input, please type 'return' to compile again or 'exit' to end.
    goto input
)

:exit
pause
exit