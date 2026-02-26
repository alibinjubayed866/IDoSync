#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

APK_SOURCE="../idosync/build/app/outputs/flutter-apk/app-release.apk"
APK_DEST="IDOSync.apk"

echo "Copying new APK from build directory..."
cp "$APK_SOURCE" "$APK_DEST"

echo "Staging changes..."
git add "$APK_DEST" README.md

echo "Amending previous commit to avoid bloat (replacing old APK)..."
git commit --amend --no-edit

echo "Force pushing to GitHub..."
git push origin main --force

echo "Successfully published new APK!"
