# Project Development Workflow

## Overview

This document outlines our development workflow, designed to ensure consistency and quality from development to production. The process now includes automated steps for npm installation, testing, and creating merge requests directly within our CI/CD pipeline, ensuring a smooth transition from development to deployment.

## Development Workflow Map

```
[Start]
  |
  v
[1. Feature Branch Creation]
  | -> Create a new branch with the pattern feature/*
  |
  v
[2. Merge Request to Staging]
  | -> Initiate a merge request from feature/* to staging
  | -> Review and approve the MR
  |
  v
[3. Update Staging Server]
  | -> Merge the MR to update the staging server
  |
  v
[4. Merge Request from Staging to Main]
  | -> Automated creation of a merge request from staging to main
  | -> Pending MR until staging verification
  |
  v
[5. Verify Changes on Staging]
  | -> Check and confirm that data and functionality on staging are correct
  |
  v
[6. Merge to Main]
  | -> Merge the verified MR from staging to main
  |
  v
[End]
```

## CI/CD Pipeline Configuration

### NPM Installation

- **Image:** `node:20`
- **Scripts:** Automates npm configuration and installation to prepare the environment for testing.
- **Cache & Artifacts:** Utilizes caching for `node_modules/` and sets artifacts to expire in 1 day.

### Testing

- **Dependencies:** Requires completion of npm installation.
- **Scripts:** Executes `npm test` to validate all new changes.

### Merge Request Creation

- **Image:** `curlimages/curl:latest`
- **Scripts:** Automatically executes `scripts/create_main_mr.sh` to create merge requests from staging to main post-verification.