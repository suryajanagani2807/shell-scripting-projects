#!/bin/bash

# GitHub API URL
API_URL="https://api.github.com"

# GitHub username and personal access token
USERNAME=$username
TOKEN=$token

# User and Repository information
REPO_OWNER=$1
REPO_NAME=$2

# Function to make a GET request to the GitHub API
function github_api_get {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"

    # Send a GET request to the GitHub API with authentication
    curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

# Function to list users with read access to the repository
function list_number_of_pull_requests_in_repo {
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/pulls"

    # Fetch the list of collaborators on the repository
    pulls="$(github_api_get "$endpoint")"

    # Display the list of collaborators with read access
    if [[ -z "$pulls" ]]; then
        echo "No pull requests found for ${REPO_OWNER}/${REPO_NAME}."
    else
        echo "pulls requests for ${REPO_OWNER}/${REPO_NAME}:"
        echo "$pulls"
    fi
}

# Main script

echo "Number of pulls happened for ${REPO_OWNER}/${REPO_NAME}..."
list_number_of pull_requests_in_repo
