# Student Score Portal

A small, static QR-based student score website designed for one Windows administrator and students with no accounts.

> **Public-data warning:** This starter is intentionally public. Anyone can download the complete roster and score CSV files. QR codes are links, not passwords. Use only approved public results and display labels. Do not enter confidential student records. Read [the public-data warning](docs/PUBLIC-DATA-AND-PRIVACY.md) before publishing any real information.

## What this project does

- Hosts a clean, mobile-first student score page on GitHub Pages.
- Uses no student accounts, database, local server, or backend.
- Keeps the source dataset in the repository's `data/` folder.
- Uses `data/students.csv` as the roster and `data/scores.csv` as assessment records.
- Copies both files into the public website's `/data/` folder on deployment.
- Refreshes score data in the background every 30 seconds without reloading the student page.
- Generates printable QR cards locally on Windows from the student roster.
- Validates the CSV files automatically before publishing.
- Keeps normal score editing to Excel + GitHub Desktop.

## Project layout

```text
student-score-portal/
├── .github/workflows/deploy.yml  # Validate and publish on every push to main
├── data/
│   ├── students.csv              # One row per student / QR card
│   └── scores.csv                # One row per assessment result
├── docs/                         # Setup, admin and privacy instructions
├── examples/                     # Fictional demo CSV files (not deployed)
├── site/
│   ├── index.html                # Public landing page
│   ├── student.html              # Student score page
│   └── assets/                   # CSS and browser-side JavaScript
├── tools/
│   ├── validate_scores.py        # Standard-library CSV validation
│   ├── generate_qr_codes.py      # Printable QR-card generator
│   └── requirements.txt
└── windows/
    ├── SETUP-ADMIN-TOOLS.bat
    ├── GENERATE-QR-CODES.bat
    └── VALIDATE-SCORES.bat
```

## Quick start

1. Read [Public data and privacy](docs/PUBLIC-DATA-AND-PRIVACY.md). This architecture is only appropriate for information approved for public disclosure.
2. Create a **public** GitHub repository named `student-score-portal` (or another name of your choice).
3. Upload all files in this project, including the hidden `.github` folder. Use `main` as the default branch.
4. Open repository **Settings → Pages** and choose **GitHub Actions** as the publishing source.
5. Push to `main` or run the workflow manually from the **Actions** tab. The workflow validates the CSV files and deploys the website.
6. Follow [the one-time GitHub setup guide](docs/SETUP-GITHUB.md).
7. For Windows administration, follow [the admin workflow](docs/ADMIN-WORKFLOW.md).

The project URL will normally look like:

`https://YOUR-USERNAME.github.io/YOUR-REPOSITORY/`

The student URL format is:

`https://YOUR-USERNAME.github.io/YOUR-REPOSITORY/student.html?student=STUDENT-CODE`

## Administrator routine

1. Edit `data/students.csv` and `data/scores.csv` locally in Excel.
2. Save each as UTF-8 CSV, keeping the header rows unchanged.
3. Open GitHub Desktop, commit the changes, and click **Push origin**.
4. GitHub Actions validates the two CSV files and publishes the new site.

No manual site build is needed. See [the admin guide](docs/ADMIN-WORKFLOW.md).

## Live data behavior

The student page downloads `data/students.csv` and `data/scores.csv` as separate static files. It refreshes the data every 30 seconds and replaces only the score/profile components in the DOM. It does **not** reload the page. A new result becomes visible after the GitHub Actions deployment has completed and the next successful poll occurs. This is near-live polling, not an instant push notification.

## QR generation

The QR utility reads `data/students.csv`, so it can produce cards even before results exist. On Windows:

1. Install Python 3.10 or newer.
2. Run `windows/SETUP-ADMIN-TOOLS.bat` once. This downloads the QR package.
3. Run `windows/GENERATE-QR-CODES.bat` and enter the exact GitHub Pages base URL.
4. Print `qr-output/printable-sheet.html` from the browser.

QR generation is local after setup and does not require a local server. Generated files are ignored by Git and are not deployed.

## Technology

- Static HTML, CSS and vanilla JavaScript.
- GitHub Pages for hosting.
- GitHub Actions for validation and automatic deployment.
- Plain UTF-8 CSV files in the repository's `data/` folder.
- GitHub Desktop for the administrator's normal commit/push routine.
- Python standard library for validation; Python plus `qrcode[pil]` for offline QR generation after initial dependency installation.

No accounts are needed for students. There is no private admin website or server-side permission system. The repository must be public for the simple GitHub Free Pages setup described here.
