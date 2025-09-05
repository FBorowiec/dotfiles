#!/usr/bin/env bash
set -euo pipefail

TEAM="${1:-}"
if [[ -z "$TEAM" ]]; then
	echo "Usage: git add-coauthors <team> [stop-commit]" >&2
	echo "  team: team name (e.g., devtools)" >&2
	echo "  stop-commit: optional commit hash to stop at (default: main)" >&2
	exit 1
fi

STOP_AT="${2:-main}"
TEAM="${TEAM%.txt}"
AUTHORS_FILE="${HOME}/.config/git/scripts/authors/${TEAM}.txt"
if [[ ! -f "$AUTHORS_FILE" ]]; then
	echo "Missing $AUTHORS_FILE" >&2
	exit 1
fi

# Validate stop commit exists
if ! git rev-parse "$STOP_AT" >/dev/null 2>&1; then
	echo "Error: Invalid commit reference: $STOP_AT" >&2
	exit 1
fi

# Read authors and ask for confirmation once
echo "Available co-authors from $TEAM team:"
selected_authors=""
while IFS= read -r line; do
	# Skip empty lines and comments
	[[ -z "$line" || "$line" =~ ^\s*# ]] && continue

	echo -n "  Add co-author: $line? [y/n] "
	read -r response </dev/tty
	if [[ "$response" =~ ^[Yy]$ ]]; then
		selected_authors="${selected_authors}${line}"$'\n'
	fi
done <"$AUTHORS_FILE"

if [[ -z "$selected_authors" ]]; then
	echo "No co-authors selected. Exiting."
	exit 0
fi

# Remove trailing newline
selected_authors="${selected_authors%$'\n'}"

# Create a temporary file with selected authors
tmpfile=$(mktemp)
echo "$selected_authors" >"$tmpfile"

# Create a script that will be executed for each commit
script_file=$(mktemp)
cat >"$script_file" <<'SCRIPT'
#!/usr/bin/env bash
set -e

# Get current commit author email and message
current_author_email=$(git log -1 --pretty=format:'%ae')
commit_msg=$(git log -1 --pretty=%B)

# Extract existing co-authors from commit message
existing_coauthors=""
if [[ "$commit_msg" =~ Co-authored-by: ]]; then
    existing_coauthors=$(echo "$commit_msg" | grep "^Co-authored-by:" || true)
    # Remove co-authors from the main commit message
    commit_msg=$(echo "$commit_msg" | sed '/^Co-authored-by:/d' | sed '/^$/d' | sed -e :a -e '/^\n*$/{$d;N;ba}')
fi

# Filter out co-authors that match the commit author or already exist
filtered_coauthors=""
while IFS= read -r line; do
    # Skip empty lines
    [[ -z "$line" ]] && continue

    # Extract email from the author line
    if [[ "$line" =~ \<([^>]+)\> ]]; then
        coauthor_email="${BASH_REMATCH[1]}"

        # Check if already exists in commit
        if [[ -n "$existing_coauthors" ]] && echo "$existing_coauthors" | grep -qF "<${coauthor_email}>"; then
            echo "  Skipping co-author (already exists): ${coauthor_email}"
            continue
        fi

        # Only add if not the same as commit author
        if [[ "$coauthor_email" != "$current_author_email" ]]; then
            filtered_coauthors="${filtered_coauthors}Co-authored-by: ${line}"$'\n'
        else
            echo "  Skipping co-author (same as commit author): ${coauthor_email}"
        fi
    fi
done < "$1"

# Combine existing and new co-authors
all_coauthors=""
if [[ -n "$existing_coauthors" ]]; then
    all_coauthors="${existing_coauthors}"$'\n'
fi
if [[ -n "$filtered_coauthors" ]]; then
    all_coauthors="${all_coauthors}${filtered_coauthors}"
fi

# Only amend if we have co-authors to add or update
if [[ -n "$all_coauthors" ]]; then
    # Remove trailing newline
    all_coauthors="${all_coauthors%$'\n'}"
    git commit --amend --no-verify -m "$commit_msg" -m "" -m "$all_coauthors"
else
    echo "  No co-authors added for this commit"
fi
SCRIPT
chmod +x "$script_file"

echo -e "\nApplying co-authors to commits (stopping at $STOP_AT)..."
GIT_SEQUENCE_EDITOR=: git rebase -i "$STOP_AT" --exec "bash $script_file $tmpfile"
rm -f "$script_file" "$tmpfile"
