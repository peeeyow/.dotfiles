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

STASHED=0
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

CHANGED=0
if ! git diff --cached --quiet; then
    TIMESTAMP=$(date --iso-8601=seconds)

    git commit -m "Automatic update: $TIMESTAMP"
    CHANGED=1
fi

# Keep the original root and four newest snapshots.
trim_history() {
    local root parent commit

    [ "$(git rev-list --count "$BRANCH")" -gt 5 ] || return 1
    root=$(git rev-list --max-parents=0 "$BRANCH")
    parent=$root

    while read -r commit; do
        parent=$(git commit-tree "$commit^{tree}" -p "$parent" -F <(git log -1 --format=%B "$commit"))
    done < <(git rev-list --reverse "$BRANCH~4..$BRANCH")

    git update-ref "refs/heads/$BRANCH" "$parent"
}

if trim_history; then
    git push --force-with-lease origin "$BRANCH"
elif [ "$CHANGED" -eq 1 ]; then
    git push origin "$BRANCH"
fi
