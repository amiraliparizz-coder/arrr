# Public data folder

This folder is the central dataset in the GitHub repository. Both CSV files are plain text and are copied into the public website at `/data/` when GitHub Actions deploys the site.

- `students.csv` stores one row per student: `student_id,display_name`. The QR generator reads this roster, so cards can be printed before the first score is added.
- `scores.csv` stores one row per assessment: `student_id,subject,assessment,date,score,max_score,feedback`.

Edit the files in Excel or another CSV editor. Save them as UTF-8 CSV and keep the exact header rows. Anyone can download these files from GitHub and the website. Do not enter confidential, identifying, or restricted student information. Use only approved public display labels and results.
