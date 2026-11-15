@echo off
setlocal
cd /d "%~dp0\.."

echo =====================================================
echo  Student Score Portal - Windows admin tools setup
echo =====================================================
echo.

where py >nul 2>nul
if errorlevel 1 (
  echo Python was not found.
  echo Install Python 3.10 or newer from https://www.python.org/downloads/windows/
  echo During setup, enable the Python launcher if the installer offers it.
  echo Then run this file again.
  pause
  exit /b 1
)

if not exist ".venv\Scripts\python.exe" (
  echo Creating a local Python environment...
  py -3 -m venv .venv
  if errorlevel 1 goto :error
)

echo Installing the QR-code package. Internet is needed for this one-time setup.
.venv\Scripts\python.exe -m pip install --upgrade pip
if errorlevel 1 goto :error
.venv\Scripts\python.exe -m pip install -r tools\requirements.txt
if errorlevel 1 goto :error

echo.
echo Setup complete. You can now run windows\GENERATE-QR-CODES.bat.
pause
exit /b 0

:error
echo.
echo Setup did not complete. Check the error above and try again.
pause
exit /b 1
