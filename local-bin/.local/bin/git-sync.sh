#!/usr/bin/env bash
set -euxo pipefail

REPO="${1:-$PWD}"
BRANCH="${2:-$(git -C "$REPO" branch --show-current)}"

cd "$REPO"

# Make sure we're on the expected branch
git checkout "$BRANCH" >/dev/null 2>&1

# Update remote information
git fetch origin

LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse "origin/$BRANCH")
BASE=$(git merge-base HEAD "origin/$BRANCH")

# Stash only if there are uncommitted changes
if ! git diff --quiet || ! git diff --cached --quiet; then
    git stash push -u -m "Auto stash before sync"
    STASHED=1
fi

# Pull only if we're behind
if [ "$LOCAL" = "$BASE" ] && [ "$LOCAL" != "$REMOTE" ]; then
    echo "Pulling remote updates..."
    git pull --ff-only
fi

# Restore stashed changes
if [ "$STASHED" -eq 1 ]; then
    git stash pop
fi

# Stage local changes
git add -A

# Commit and push if anything changed
if ! git diff --cached --quiet; then
    TIMESTAMP=$(date --iso-8601=seconds)

    git commit -m "Automatic update: $TIMESTAMP"
    git push origin "$BRANCH"
fi
