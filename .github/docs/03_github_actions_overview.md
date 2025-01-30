# GitHub Actions Overview

## What is GitHub Actions?

GitHub Actions is a feature within GitHub that allows you to automate workflows directly from your GitHub repository. Workflows are automated processes that are triggered by specific events, such as pushing code to the repository, opening a pull request, or even on a schedule.

GitHub Actions is typically used for:
- Continuous Integration (CI)
- Continuous Deployment (CD)
- Running tests and linting
- Automating workflows for tasks like VM creation, code quality checks, or deployments

With GitHub Actions, you define workflows in YAML files, and these workflows run on GitHub's servers or on self-hosted runners.

## Key Concepts of GitHub Actions

### 1. Workflow
A **workflow** is an automated process that you define in your repository. It is triggered by a specific event (like a commit or a pull request), and it defines a series of jobs and steps to execute. Each workflow is defined by a YAML file located in the `.github/workflows/` directory of your repository.

Example:
```yaml
name: CI/CD Pipeline
on:
  push:
    branches:
      - main
```

In this example, the workflow is named **CI/CD Pipeline** and will be triggered every time code is pushed to the `main` branch.

### 2. Jobs
A **job** is a set of steps that run in an isolated environment (called a runner). Jobs run sequentially by default, but you can configure them to run in parallel.

Example:
```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2
```

In this example, a job named **build** runs on the latest Ubuntu image and contains a step that checks out the code.

### 3. Steps
Each **step** in a job defines a task that should be executed. A step can run shell commands or call GitHub Actions from the marketplace.

Example:
```yaml
steps:
  - name: Set up Python
    uses: actions/setup-python@v2
    with:
      python-version: '3.8'
```

In this example, the step sets up Python version 3.8.

### 4. Actions
An **Action** is a reusable unit of code that can be used as a step in a workflow. Actions can be created by anyone and published in the GitHub Marketplace. There are actions for a wide variety of tasks, like setting up environments, checking out code, running tests, or deploying applications.

Example:
```yaml
- name: Checkout code
  uses: actions/checkout@v2
```

In this example, the `actions/checkout` action checks out the repository code so that it can be used in subsequent steps.

### 5. Runners
A **runner** is a server that has the GitHub Actions software installed and can run jobs. There are two types of runners:
- **GitHub-hosted runners:** These are managed by GitHub and come with popular programming environments pre-installed (e.g., Ubuntu, macOS, Windows).
- **Self-hosted runners:** These are custom machines you configure to run your GitHub Actions workflows.

## Workflow Syntax

GitHub Actions workflows are written in YAML. The basic structure includes the following key elements:

- **name:** A human-readable name for your workflow.
- **on:** Defines the event(s) that will trigger the workflow.
- **jobs:** A collection of jobs that the workflow will execute.
- **steps:** Individual actions within a job.

Example:
```yaml
name: CI/CD Pipeline

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Set up Python
        uses: actions/setup-python@v2
        with:
          python-version: '3.8'

      - name: Install dependencies
        run: |
          pip install -r requirements.txt

      - name: Run tests
        run: |
          python -m unittest discover tests
```

### Key Syntax Components:

- **`name:`** Defines the name of your workflow.
- **`on:`** Specifies the trigger event(s) for the workflow (e.g., `push`, `pull_request`).
- **`jobs:`** Contains all jobs to run in the workflow.
- **`runs-on:`** Specifies the type of runner (e.g., `ubuntu-latest`).
- **`steps:`** Each job contains steps to perform tasks (e.g., setting up Python, installing dependencies, running tests).

## Events that Trigger a Workflow

Workflows in GitHub Actions are triggered by various events. Common events include:

- **`push`**: Triggered when code is pushed to a branch.
- **`pull_request`**: Triggered when a pull request is created, updated, or merged.
- **`schedule`**: Triggered at specific times (using cron syntax).
- **`workflow_dispatch`**: Triggered manually via the GitHub UI.
- **`release`**: Triggered when a new release is created or updated.

Example:
```yaml
on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - feature/*
```

In this example, the workflow is triggered both on pushes to the `main` branch and when a pull request is created to a branch that starts with `feature/`.

## Using Secrets and Environment Variables

You may need to use sensitive data (like API keys, passwords, etc.) in your workflows. GitHub provides a way to store and access these secrets securely.

1. **Secrets**: These are encrypted environment variables stored in the GitHub repository settings (Settings > Secrets). Secrets can be referenced in workflows using `${{ secrets.SECRET_NAME }}`.

Example:
```yaml
steps:
  - name: Deploy to GCP
    run: ./deploy.sh
    env:
      GCP_API_KEY: ${{ secrets.GCP_API_KEY }}
```

2. **Environment Variables**: You can also define environment variables directly in your workflow.

Example:
```yaml
env:
  NODE_ENV: production
```

## Example Use Cases for GitHub Actions

1. **Continuous Integration (CI) for Testing**:
   - Every time code is pushed, the workflow automatically installs dependencies, runs tests, and reports the results.

2. **Continuous Deployment (CD) for Deployment**:
   - On every successful push to `main`, the workflow can deploy the application to your cloud provider (e.g., AWS, GCP, Azure).

3. **Automating Infrastructure with Terraform**:
   - Trigger Terraform scripts to create, update, or destroy resources on cloud platforms (e.g., deploying a VM or creating an S3 bucket).

4. **Code Linting and Formatting**:
   - Automatically run linters and formatters like `black` for Python or `eslint` for JavaScript whenever changes are pushed.

## Conclusion

GitHub Actions offers powerful automation capabilities to streamline your development workflow. From CI/CD to infrastructure automation, you can automate almost any task directly from your GitHub repository using simple YAML configurations.

By understanding these key components—workflows, jobs, steps, actions, and runners—you can start building your own automation pipelines. Whether you’re deploying to the cloud, running tests, or applying infrastructure changes, GitHub Actions helps you automate and optimize your software development process.

---
