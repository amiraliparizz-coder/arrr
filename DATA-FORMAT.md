# CSV data format

The central dataset is maintained in two files under `data/`.

## 1. `data/students.csv`

Exact header:

```csv
student_id,display_name
```

One row per student. This roster is used to identify the student display label and generate QR cards. It can be completed before any scores are entered.

| Column | Required? | Meaning | Example |
|---|---|---|---|
| `student_id` | Yes | Public lookup code used by the QR URL | `A103-X7Q` |
| `display_name` | Yes | Approved display label shown on the page and QR card | `Jamie` |

## 2. `data/scores.csv`

Exact header:

```csv
student_id,subject,assessment,date,score,max_score,feedback
```

Each row is one published assessment result.

| Column | Required? | Meaning | Example |
|---|---|---|---|
| `student_id` | Yes | Must match an ID in `students.csv` | `A103-X7Q` |
| `subject` | Yes | Subject or course label | `Mathematics` |
| `assessment` | Yes | Name of the assessment | `Unit 2 test` |
| `date` | No | Date in `YYYY-MM-DD` format | `2026-10-12` |
| `score` | Yes | Awarded points | `18` |
| `max_score` | Yes | Maximum points; must be greater than zero | `20` |
| `feedback` | No | Optional short feedback, up to 500 characters | `Good work on fractions.` |

## Rules

- Keep the columns and order shown in each header.
- Use UTF-8 CSV with commas as separators. In Excel, choose **CSV UTF-8 (Comma delimited)**. Check the first line still uses commas after saving.
- Each student may have many score rows, one for each assessment.
- Add each student only once in `students.csv`.
- Reuse the same `student_id` in the roster and score rows.
- IDs must be 4–40 letters, numbers, underscores or hyphens.
- Do not use student numbers, dates of birth, email addresses or other personal identifiers as IDs.
- `display_name` must be the same for each roster ID and is limited to 80 characters.
- `subject` is limited to 80 characters; `assessment` to 120 characters.
- `feedback` is limited to 500 characters.
- `score` cannot be negative or higher than `max_score`. Use a period for decimal values (for example `17.5`).
- The same student/subject/assessment/date combination cannot appear twice.
- Leave optional fields blank instead of removing columns.

For a demonstration, copy `examples/demo-students.csv` to `data/students.csv` and `examples/demo-scores.csv` to `data/scores.csv`. Those records are fictional. Replace or remove them before any real publication.
