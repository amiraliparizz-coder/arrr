# GitHub setup — one time

This repository is designed for GitHub Pages with a public repository and GitHub Actions deployment.

1. Sign in to GitHub and create a **public** repository, for example `student-score-portal`. Create it empty if you are uploading this prepared project as-is.
2. Ensure the default branch is named `main`.
3. Add every project file, including the `.github/workflows/deploy.yml` workflow and both files in `data/`.
4. In the repository, open **Settings → Pages**.
5. Under **Build and deployment**, select **GitHub Actions** as the source.
6. Push the first commit to `main`, or use **Actions → Validate scores and publish website → Run workflow**.
7. Open **Actions** and wait for both jobs, `Validate score data` and `Publish GitHub Pages`, to complete successfully.
8. GitHub will show the published site URL in the deployment job. For a project repository it is normally `https://YOUR-USERNAME.github.io/YOUR-REPOSITORY/`.
9. Run the QR generator with that exact base URL, including the final slash.

The workflow uses GitHub's official Pages Actions: `configure-pages`, `upload-pages-artifact`, and `deploy-pages`. The source data stays in the repository's root `data/` folder and is copied into the deployed site's `/data/` folder during publishing. The website itself is served from the `site/` folder.

## What gets published

Only the contents of `site/` and the two CSV files `data/students.csv` and `data/scores.csv` are included in the Pages artifact. The `tools/`, `windows/`, `docs/`, and `examples/` folders are not copied into the website artifact. The repository itself is public, so those project files remain visible on GitHub.
