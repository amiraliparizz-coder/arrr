# Administrator workflow (Windows)

There is one administrator. Students do not create accounts and do not edit data.

## One-time setup

1. Install GitHub Desktop: https://desktop.github.com/ .
2. Install Python 3.10 or newer from https://www.python.org/downloads/windows/ . Python is only needed for the printable QR generator and optional local validation.
3. Open `windows/SETUP-ADMIN-TOOLS.bat` once to install the QR utility's small Python dependency. This step needs an internet connection. QR generation itself can then run locally.
4. Create a public GitHub repository and upload this project's files. Use `main` as the default branch.
5. In the repository, open **Settings → Pages** and select **GitHub Actions** as the build and deployment source.
6. Push the first commit to `main`. The included workflow validates both CSV files and deploys the site.

## Regular student/score update

1. Open `data/students.csv` and `data/scores.csv` in Excel.
2. Add new students to `students.csv` once, using an approved public display label and a matching `student_id`.
3. Add or edit assessment rows in `scores.csv`. Each score row must use an existing `student_id` from the roster.
4. Save both files as **CSV UTF-8 (Comma delimited)**. Keep the filenames and exact header rows.
5. Optionally double-click `windows/VALIDATE-SCORES.bat` to check the files before pushing. Python is required for this local check; GitHub Actions performs validation even if you skip it.
6. Open GitHub Desktop. Confirm that the changed files are `data/students.csv` and/or `data/scores.csv`.
7. Enter a short summary such as `Publish mathematics test results`.
8. Click **Commit to main**, then **Push origin**.
9. Open the repository's **Actions** tab to see whether validation and deployment succeeded.

The workflow will not publish a new version if validation fails. Fix the listed rows and push again.

## Make or reprint QR cards

1. Make sure `data/students.csv` contains all students who need a QR card. A student does not need a score row yet.
2. Double-click `windows/GENERATE-QR-CODES.bat`.
3. Enter the published GitHub Pages base URL, including the repository path and trailing slash. Example: `https://yourname.github.io/student-score-portal/`.
4. The utility creates one QR image per unique `student_id` and a `qr-output/printable-sheet.html` file.
5. Check the QR destinations, then print the sheet from your browser.

The QR generator reads the local roster file; it does not need the website or a local web server to run. The first-time Python package installation is the only step that needs internet access.

## What the administrator does not need to do

- No server installation or maintenance.
- No database setup.
- No browser-based admin panel.
- No Git commands or terminal workflow for normal score updates.
- No manual website rebuild. A push to `main` starts the deployment workflow.
