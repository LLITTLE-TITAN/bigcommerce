#!/bin/bash

# Assume GITLAB_API_TOKEN is already exported or set in the environment
echo $CI_COMMIT_REF_NAME;
curl --location 'https://gitlab.com/api/v4/projects/57109022/merge_requests' \
--header "PRIVATE-TOKEN: $GITLAB_API_TOKEN" \
--header 'Content-Type: application/json' \
--data '{
    "id": "'$CI_PROJECT_ID'",
    "source_branch": "'$CI_COMMIT_BRANCH'",
    "target_branch": "staging",
    "title": "Merge Request for: '$CI_COMMIT_REF_NAME' into staging",
    "assignee_id": "'$GITLAB_USER_ID'",
    "description": "This merge request was automatically generated to merge changes from the feature branch '$CI_COMMIT_REF_NAME' into the staging branch. Please review the proposed changes and approve or request further modifications.\n\n**Branch Details:**\n  - **Feature Branch:** '$CI_COMMIT_REF_NAME' \n  - **Target Branch:** staging\n  - **Created By:** Automated CI Pipeline"
}'
