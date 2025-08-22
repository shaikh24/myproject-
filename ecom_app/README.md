# Ecom App (Flutter Web-ready)

A minimal e-commerce starter you can edit on a phone and deploy to the web via GitHub Pages (no PC needed).

## Features
- Categories → Subcategories → Products
- Product details, variants (size/color), cart & wishlist (local)
- Search & sort (basic)
- Address, checkout (mock), orders (local placeholder)
- Optional Firebase auth (Google/Apple/Email) — disabled by default until you add config
- GitHub Actions: auto-build Flutter Web and deploy to `gh-pages`

## One-time Setup (GitHub Pages Deploy)
1. Create a **new public repo** on GitHub (e.g., `ecom_app`).
2. Upload the project files (unzipped). If using Termux, follow the commands in the guide below.
3. In your repo, go to **Settings → Pages** and select **Source: GitHub Actions** (or "Deploy from a branch" set to `gh-pages` if it appears after first build).
4. Push to `main`. The workflow builds and publishes your site to `https://<your-username>.github.io/<repo>/`.

## Build Workflow Notes
- The action runs `flutter create . --platforms=web` to generate missing platform folders.
- It builds `web` and pushes the output to `gh-pages` branch.
- Update `--base-href` with your repo name in `.github/workflows/deploy-web.yml`.

## Enable Firebase Auth (Optional)
1. Create a Firebase project → add a **Web App**, copy config.
2. In `lib/services/auth_service.dart`, set `kEnableFirebaseAuth = true` and paste your web config in `firebase_options_web` map (or use FlutterFire CLI locally later).
3. Enable providers in Firebase console (Google, Apple, Email/Password).
4. Redeploy (commit & push).

