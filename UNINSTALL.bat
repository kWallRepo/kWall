:: kWall

@ECHO OFF
title kWall Console
cd %homedrive%%homepath%\kWall
chcp 65001 > nul

:menu
echo [91m╔═══════════════════════════════════════════╗
echo [91m║ [97mkWall Uninstaller                         [91m║
echo [91m║ ════════════════                          [91m║
echo [91m║ [97m[1] Confirm uninstall                     [91m║
echo [91m║                                           [91m║
echo [91m╚═══════════════════════════════════════════╝
echo.
set /p input=^>^> [97m
echo.
echo kWall will now be uninstalled.
if %input%==1 goto :uninstall

:uninstall
set "INSTALL_DIR=%homedrive%%homepath%\kWall"
set "DESKTOP_SHORTCUT=%homedrive%%homepath%\Desktop\kWall.lnk"

if exist "%INSTALL_DIR%" (
    del /q "%INSTALL_DIR%\firewall.py" > nul
    del /q "%INSTALL_DIR%\kWall.bat" > nul
    del /q "%INSTALL_DIR%\kwall.ico" > nul
    del /q "%INSTALL_DIR%\kWall.lnk" > nul
    del /q "%INSTALL_DIR%\kwall.png" > nul
    del /q "%INSTALL_DIR%\license.txt" > nul
    del /q "%INSTALL_DIR%\README.txt" > nul
    del /q "%INSTALL_DIR%\updateFirewall.lnk" > nul
    
    rd "%INSTALL_DIR%" > nul
) else (
    echo Installation directory not found. No action taken.
    pause
    exit /b
)

if exist "%DESKTOP_SHORTCUT%" (
    del /q "%DESKTOP_SHORTCUT%" > nul
) else (
    echo Desktop shortcut not found. No action taken.
    pause
    exit /b
)

echo Uninstall script completed successfully.
echo [91mkWall has been uninstalled.
pause > nul
exit