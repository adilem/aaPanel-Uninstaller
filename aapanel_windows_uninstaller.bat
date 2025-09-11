@echo off
title Uninstall aaPanel Windows
echo ============================================
echo       Auto Uninstall aaPanel for Windows
echo ============================================
echo.

:: Ask user for folder path
set /p PANEL_DIR=Enter aaPanel folder path (default: J:\data\aapanel): 

:: Use default if nothing entered
if "%PANEL_DIR%"=="" (
    set PANEL_DIR=J:\data\aapanel
)

:: Verify folder exists
if not exist "%PANEL_DIR%" (
    echo [X] Folder %PANEL_DIR% not found.
    pause
    exit /b
)

:: Kill related processes
echo [*] Stopping aaPanel processes...
taskkill /f /im nginx.exe >nul 2>&1
taskkill /f /im nginx_server.exe >nul 2>&1
taskkill /f /im php-cgi.exe >nul 2>&1
taskkill /f /im mysqld.exe >nul 2>&1
taskkill /f /im memcached.exe >nul 2>&1
taskkill /f /im memcached_server.exe >nul 2>&1
taskkill /f /im aaPanel.exe >nul 2>&1

:: Give it a moment
timeout /t 2 >nul

:: Delete folder
echo [*] Removing aaPanel folder: %PANEL_DIR% ...
rd /s /q "%PANEL_DIR%"

:: Remove PATH entry (temporary for this session)
echo [*] Cleaning environment PATH...
setx PATH "%PATH:%PANEL_DIR%\BtSoft\panel\script;=%" >nul

echo.
echo [OK] aaPanel at %PANEL_DIR% has been removed.
echo [!] Please RESTART Windows to complete cleanup.
pause
