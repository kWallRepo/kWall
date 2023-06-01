:: kWall

@ECHO OFF
title kWall Console
cd %homedrive%%homepath%\kWall
chcp 65001 > nul

:menu
echo [91m╔═══════════════════════════════════════════╗
echo [91m║ [97mkWall Management                          [91m║
echo [91m║ ════════════════                          [91m║
echo [91m║ [97m[1] Update blocklist                      [91m║
echo [91m║                                           [91m║
echo [91m║ [97mkWall version: [1.2.1]                    [91m║
echo [91m║                                           [91m║
echo [91m║ [97mChangelog                                 [91m║
echo [91m║ ═════════                                 [91m║
echo [91m║ [97mGet changelog at [34mhttps://kwall.rf.gd      [91m║
echo [91m║                                           [91m║
echo [91m╚═══════════════════════════════════════════╝
echo.
set /p input=^>^> [97m
if %input%==1 goto :update

:update
start updateFirewall.lnk > nul
cls
goto :menu
