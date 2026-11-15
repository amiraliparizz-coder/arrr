# Troubleshooting

## The GitHub Actions workflow fails before deployment

Open the failed `Validate score data` step in the repository's Actions tab. It reports the CSV file, line and problem. Common causes:

- A header row was changed or deleted.
- Excel saved a file in a format other than UTF-8 CSV with commas as separators.
- A score is blank, non-numeric, negative or higher than the maximum.
- A date is not `YYYY-MM-DD`.
- The same assessment row appears twice for the same student and date.
- A student ID contains spaces or punctuation other than `_` and `-`.
- A score row uses an ID that is missing from `students.csv`.

Correct the local CSV files, save them, commit and push again.

## The QR link opens but says no results are published

- Confirm that the QR link's `student` value exactly matches a `student_id` in `data/students.csv`.
- Confirm that at least one matching row exists in `data/scores.csv`.
- Confirm that the workflow deployed successfully after the latest score update.
- Wait up to one refresh interval (30 seconds), then use the refresh icon.
- Confirm that the score row has valid `score` and `max_score` values.

## The page cannot load score data

- Check that the published site includes `/data/students.csv` and `/data/scores.csv` at the same site base path as `student.html`.
- Confirm that the repository's Pages source is **GitHub Actions**.
- Confirm that deployment succeeded.
- Open the browser's developer tools only if comfortable; the Network tab should show requests for both CSV files.

## QR generation says qrcode is not installed

Run `windows/SETUP-ADMIN-TOOLS.bat` once. It installs a small Python QR package. Then run `windows/GENERATE-QR-CODES.bat` again.

## The QR cards point to the wrong address

Run the QR generator again and enter the exact Pages base URL shown by GitHub. Include the repository name for project sites and include the trailing slash. Example:

`https://yourname.github.io/student-score-portal/`

## Results do not update immediately

The student page polls both CSV files every 30 seconds without reloading the page. A push must first pass validation and deploy to GitHub Pages. This is near-live polling, not instant push delivery. A CDN/browser cache or deployment delay can add extra time.
