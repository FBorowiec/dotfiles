#!/bin/env bash

# Check if an argument is provided
if [ $# -ne 1 ]; then
	echo "Usage: $0 <repository_url>"
	exit 1
fi

URL=$1
NAME=$(basename "$URL" .git) # Remove .git suffix from repository name

# Create a trap to catch errors and exit gracefully
cleanup_and_exit() {
	local exit_code=$?
	echo "An error occurred. Cleaning up..."
	if [ -d "$NAME" ]; then
		rm -rf "$NAME"
	fi
	exit "$exit_code"
}

# Set the trap to catch errors
trap cleanup_and_exit ERR

# Initialize the git repository
git init --bare "$NAME"
cd "$NAME" || cleanup_and_exit
git config remote.origin.url "$URL"
git config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'
git fetch

# Get the first commit
first_commit=$(git rev-list --all --max-parents=0 --date-order --reverse | head -n1)
git branch bare "$first_commit"
git symbolic-ref HEAD refs/heads/bare

echo "Repository setup completed successfully!"
echo "You can now add a worktree with the following command:"
echo "      git worktree add <path> <branch>"
