@echo off
setlocal
cd /d "%~dp0\.."

where py >nul 2>nul
if errorlevel 1 (
  echo Python 3 is required to validate locally. GitHub Actions will also validate on push.
  pause
  exit /b 1
)

py -3 tools\validate_scores.py data\scores.csv data\students.csv
if errorlevel 1 (
  echo.
  echo Please correct the errors before pushing your changes.
) else (
  echo.
  echo Your roster and score CSV files passed validation.
)
pause
