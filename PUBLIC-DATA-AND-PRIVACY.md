# Public data warning — read before adding real results

This project intentionally uses a public GitHub repository and publishes the student roster and score CSV files as public website assets. It does not provide authentication, authorisation, encryption of the CSV files, per-student permissions, or private access.

**Anyone who can reach the website or repository can download the complete `data/students.csv` and `data/scores.csv` files.** The student page filters records in the browser only. That filtering is for display, not security. A QR code is a link, not a password. Anyone who has a QR code can open that page, and anyone can inspect the public CSV files to see all rows.

Git commits also keep a history of earlier file versions. Deleting a row from the latest CSV does not automatically remove the previous value from repository history.

## Safe intended use

Use this project only for results and display labels that the responsible school or organisation has explicitly approved for unrestricted public release. The repository and published website should contain no confidential or restricted student records.

Do not use real student names unless public disclosure has been authorised. Prefer an approved display label. Do not use school IDs, student numbers, dates of birth, email addresses, or similar identifiers as `student_id` values. A random-looking student code reduces accidental guessability but does not make public data private.

Before deploying real records, have the school or organisation's responsible data-protection contact confirm the legal basis, notices, consent/authority requirements, retention period, and any local rules that apply. Student grades linked to a student identifier can be personal data under the GDPR definition of personal data (Article 4(1)). See the [official GDPR text on EUR-Lex](https://eur-lex.europa.eu/eli/reg/2016/679/oj). This project is not legal advice.

## Platform transport note

The score and roster files remain plain, readable CSV; this project does not encrypt them. GitHub Pages normally serves websites over HTTPS as part of the hosting platform. That transport behavior does not restrict who can read the public data.

## If private individual grades are required

This exact public/no-account/no-access-control architecture is not suitable. A private design would need to change at least one of those requirements, for example by introducing an access-control service or a suitably protected data host.
