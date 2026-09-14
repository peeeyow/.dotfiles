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

# Keep only the five newest snapshots. Rebuild their commit chain from the
# existing trees, so SQLite and other binary changes do not need to rebase.
trim_history() {
    local oldest parent commit

    [ "$(git rev-list --count "$BRANCH")" -gt 5 ] || return 1
    oldest=$(git rev-parse "$BRANCH~4")
    parent=$(git commit-tree "$oldest^{tree}" -F <(git log -1 --format=%B "$oldest"))

    while read -r commit; do
        parent=$(git commit-tree "$commit^{tree}" -p "$parent" -F <(git log -1 --format=%B "$commit"))
    done < <(git rev-list --reverse "$oldest..$BRANCH")

    git update-ref "refs/heads/$BRANCH" "$parent"
}

if trim_history; then
    git push --force-with-lease origin "$BRANCH"
elif [ "$CHANGED" -eq 1 ]; then
    git push origin "$BRANCH"
fi
