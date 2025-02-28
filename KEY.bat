@echo off
cd /d "%~dp0"

:menu
cls
echo Select an option:
echo [1] Start - Pull latest changes
echo [2] End - Commit and push changes
echo [3] Update - Pull and commit local changes
echo [4] Force Push (Danger Zone)
echo [5] Exit
set /p choice="Enter your choice: "

if "%choice%"=="1" goto start
if "%choice%"=="2" goto end
if "%choice%"=="3" goto update
if "%choice%"=="4" goto force_push
if "%choice%"=="5" exit
goto menu

:start
git pull --rebase origin main -q
echo Updated to latest version.
pause
goto menu

:end
git add .
git commit -am "Auto-update" -q
git push https://github.com/AsserAljbour/godot-name.git main -q
echo Changes pushed successfully.
pause
goto menu

:update
git pull --rebase https://github.com/AsserAljbour/godot-name.git main -q
git add .
git commit -am "Auto-update" -q
git push https://github.com/AsserAljbour/godot-name.git main -q
echo Project updated and pushed.
pause
goto menu

:force_push
set /p confirm="WARNING: You are about to FORCE PUSH. Continue? (yes/no): "
if /i not "%confirm%"=="yes" goto menu
git push --force https://github.com/AsserAljbour/godot-name.git main
echo Force push completed.
pause
goto menu


