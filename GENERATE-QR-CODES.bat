@echo off
setlocal
cd /d "%~dp0\.."

echo =====================================================
echo  Student Score Portal - QR code generator
echo =====================================================
echo.

if not exist ".venv\Scripts\python.exe" (
  echo Admin tools are not set up yet.
  echo Run windows\SETUP-ADMIN-TOOLS.bat first.
  pause
  exit /b 1
)

echo Enter the published GitHub Pages base URL.
echo Example: https://yourname.github.io/student-score-portal/
echo.
set /p PAGES_URL=GitHub Pages URL: 
if "%PAGES_URL%"=="" (
  echo A website URL is required.
  pause
  exit /b 1
)

.venv\Scripts\python.exe tools\generate_qr_codes.py --students-csv data\students.csv --base-url "%PAGES_URL%" --out qr-output
if errorlevel 1 (
  echo.
  echo QR generation failed. Check the message above.
  pause
  exit /b 1
)

start "" "%CD%\qr-output\printable-sheet.html"
echo.
echo The printable QR sheet has opened in your browser.
echo Use the browser Print command to print or save it as a PDF.
pause
