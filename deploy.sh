#!/usr/bin/env bash
# Usage: ./deploy.sh   (requires GitHub CLI: https://cli.github.com, and `gh auth login`)
set -e
git init -b main
git add .
git commit -m "Initial commit: Rock Universe"
gh repo create rock-universe --public --source=. --push
gh api -X POST repos/{owner}/rock-universe/pages -f build_type=workflow || true
echo "Site will be live shortly at: https://$(gh api user -q .login).github.io/rock-universe/"
