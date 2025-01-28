Here's the content for `02_intro_to_github.md`:

---

# Introduction to GitHub

## What is GitHub?

GitHub is a platform for hosting and managing code repositories that uses Git, a distributed version control system. GitHub allows developers to collaborate on projects, manage code versions, and track changes to code in an efficient and structured way.

GitHub is widely used in the software development industry for:
- **Version control**: Tracking and managing changes to code over time.
- **Collaboration**: Multiple developers can work on the same project simultaneously.
- **Code reviews**: GitHub allows for peer reviews of code changes through pull requests.
- **Project management**: GitHub integrates with project management tools and supports issues, labels, milestones, and more.

---

## Key Features of GitHub

1. **Repositories (Repos)**  
   A repository is a storage space for your project. It includes all your project files, revision history, and configuration settings. A GitHub repo can be public or private.

2. **Commits**  
   Commits are snapshots of your project at a specific point in time. Each commit includes a message describing the changes made.

3. **Branches**  
   Branches allow you to develop features, fix bugs, or experiment in isolation from the main codebase (often called `main` or `master`). Once your work on a branch is complete, you can merge it back into the main branch.

4. **Pull Requests (PRs)**  
   A pull request is a way to propose changes to the codebase. After making changes on a branch, you can submit a pull request to ask other developers to review and merge those changes into the main codebase.

5. **Forking**  
   Forking is creating a personal copy of someone else’s repository. You can experiment with the code without affecting the original project. This is commonly used in open-source contributions.

6. **Issues and Project Management**  
   GitHub provides tools for managing issues, tracking bugs, and organizing tasks through labels, milestones, and project boards.

7. **Actions**  
   GitHub Actions is an automation tool for continuous integration and continuous delivery (CI/CD). It allows you to automate tasks such as testing, building, and deploying your code.

---

## Setting Up Your First GitHub Repository

To get started with GitHub, you'll need to create a repository.

### Steps to Create a Repository on GitHub:
1. **Create an Account**:  
   Visit [GitHub](https://github.com) and sign up for an account.

2. **Create a New Repository**:  
   - Click the `+` icon in the top-right corner of the GitHub page and select "New repository."
   - Provide a name, description, and choose whether it will be public or private.
   - Optionally, initialize the repository with a `README.md` and `.gitignore` file.
   
3. **Clone the Repository to Your Local Machine**:  
   After creating the repository, you can clone it to your local machine using the following Git command:
   ```bash
   git clone https://github.com/username/repository-name.git
   ```

4. **Make Changes and Commit**:  
   - After cloning, navigate to your project directory:
     ```bash
     cd repository-name
     ```
   - Create or modify files as needed. Then, commit your changes:
     ```bash
     git add .
     git commit -m "Initial commit or description of changes"
     ```

5. **Push Changes to GitHub**:  
   After committing, push your changes to GitHub:
   ```bash
   git push origin main
   ```

---

## Collaborating on GitHub

GitHub is designed for collaboration. Here's how you can work with others:

1. **Forking a Repository**:  
   - To contribute to an existing project, you can fork the repository, make changes in your forked copy, and submit a pull request to the original repository.

2. **Cloning a Repository**:  
   - To work on a project locally, you can clone a repository using the `git clone` command. This gives you a local copy where you can make changes.

3. **Making Changes**:  
   - You can create a new branch for your changes and then push that branch to GitHub. Once you’re ready, create a pull request to merge your changes into the main codebase.

4. **Pull Requests (PRs)**:  
   - PRs allow you to propose changes. Once a pull request is created, other collaborators can review the code, discuss changes, and merge it into the main branch.

---

## Common GitHub Commands

Here are some basic Git commands you will use frequently:

- **Clone a repository**:
  ```bash
  git clone https://github.com/username/repository-name.git
  ```

- **Check the status of your repository**:
  ```bash
  git status
  ```

- **Add changes to the staging area**:
  ```bash
  git add <file-name>  # Adds a specific file
  git add .            # Adds all modified files
  ```

- **Commit your changes**:
  ```bash
  git commit -m "Your commit message"
  ```

- **Push changes to GitHub**:
  ```bash
  git push origin main  # Pushes your changes to the main branch
  ```

- **Create a new branch**:
  ```bash
  git checkout -b new-feature
  ```

- **Switch between branches**:
  ```bash
  git checkout branch-name
  ```

---

## Conclusion

GitHub is an essential tool for developers, providing a powerful platform for collaboration, code management, and version control. By understanding how to create repositories, work with branches, and submit pull requests, you can take full advantage of its features. 

In the next steps, you will explore **GitHub Actions** to automate workflows and integrate with other tools like Terraform and Jenkins, making your development and deployment processes even more efficient.

---

Would you like me to help with any of these steps or provide further details on any particular section?