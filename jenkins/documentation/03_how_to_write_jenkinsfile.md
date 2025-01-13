# 03: How to Write a Jenkinsfile

A Jenkinsfile is a script that defines the steps and pipeline for continuous integration (CI) and continuous deployment (CD) within Jenkins. This file can be written in either **Declarative** or **Scripted** pipeline syntax, but the declarative syntax is more commonly used for its simplicity and clarity.

## 1. What is a Jenkinsfile?

A Jenkinsfile is a text file that contains the definition of a Jenkins pipeline. It is used to define the process by which Jenkins runs automation tasks like building, testing, and deploying applications. The Jenkinsfile is typically stored within the source code repository, making it easy to version and share.

### Key Benefits:
- **Version Control**: Since it's stored in the same repository, it's versioned alongside the source code.
- **Automation**: It automates tasks like testing, building, and deployment.
- **Reusability**: Jenkinsfiles can be reused across different projects.
- **Collaboration**: The file is visible to the entire development team, ensuring better collaboration.

## 2. Types of Pipelines

### a) Declarative Pipeline
The declarative pipeline syntax is structured and provides a predefined way to define pipelines. It simplifies the process of writing Jenkinsfiles, especially for users new to Jenkins.

**Basic Structure:**
```groovy
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building the application'
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying the application'
            }
        }
    }
}
```
- **pipeline**: The block that defines the entire Jenkins pipeline.
- **agent**: Specifies where the pipeline or specific stages will run (e.g., `any` runs on any available agent).
- **stages**: Contains multiple `stage` blocks, each defining a specific part of the CI/CD process.
- **stage**: A single unit in the pipeline where a task is performed.
- **steps**: The actions to be executed in a particular stage.

### b) Scripted Pipeline
Scripted pipelines are more flexible and are written in a Groovy-based DSL. This is useful when you need full control over the pipeline’s execution.

**Basic Structure:**
```groovy
node {
    stage('Build') {
        echo 'Building the application'
    }
    stage('Test') {
        echo 'Running tests'
    }
    stage('Deploy') {
        echo 'Deploying the application'
    }
}
```
- **node**: Defines the execution environment for the pipeline.
- **stage**: Each stage contains one or more steps.
- **steps**: The actions to be executed.

## 3. Key Elements of a Jenkinsfile

### a) Pipeline Block
The `pipeline` block is the root element of a declarative pipeline and houses the entire structure of your pipeline.

```groovy
pipeline {
    agent any
    stages {
        ...
    }
}
```

### b) Agent
The `agent` block specifies where the pipeline or specific stages will run. It can be set to:
- `any`: Run on any available agent.
- `label`: Run on a specific agent identified by its label.
- `docker`: Run in a Docker container.

Example:
```groovy
agent { label 'linux' }
```

### c) Stages
Stages are the key steps of the pipeline, each containing a series of actions.

```groovy
stages {
    stage('Build') {
        steps {
            // Build actions here
        }
    }
    stage('Test') {
        steps {
            // Test actions here
        }
    }
}
```

### d) Steps
Steps are the individual tasks that are run within a stage. They can include commands like shell scripts, build tools, or custom scripts.

Example:
```groovy
steps {
    sh 'echo Hello, World!'
}
```

### e) Post Actions
The `post` block allows you to define actions that will run after the pipeline has finished, based on the outcome (success, failure, always).

Example:
```groovy
post {
    success {
        echo 'Pipeline succeeded'
    }
    failure {
        echo 'Pipeline failed'
    }
    always {
        echo 'This will always run'
    }
}
```

### f) Environment Variables
Jenkins provides built-in environment variables that can be used within the pipeline, such as `env.BUILD_NUMBER` or `env.GIT_COMMIT`. You can also define custom environment variables.

Example:
```groovy
environment {
    MY_VARIABLE = 'value'
}
```

## 4. Example of a Complete Jenkinsfile (Declarative)

Here’s a more detailed example of a declarative pipeline with multiple stages and a post section:

```groovy
pipeline {
    agent any
    environment {
        APP_NAME = 'MyApp'
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                script {
                    echo "Building the $APP_NAME"
                    // Add build commands here
                }
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests...'
                // Add test commands here
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying the app...'
                // Add deploy commands here
            }
        }
    }
    post {
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
```

## 5. Common Pipeline Steps

### a) Checkout Code
The `checkout scm` step is often used in the `Checkout` stage to retrieve the latest code from the source control.

```groovy
checkout scm
```

### b) Run Shell Commands
You can run shell commands within the pipeline using `sh` or `bat` (for Windows).

```groovy
sh 'echo Hello, Jenkins!'
```

### c) Use of Input
The `input` step allows you to pause the pipeline and wait for manual approval.

```groovy
input 'Do you want to deploy to production?'
```

### d) Use of Matrix
The `matrix` block allows you to define parallel steps that can run across different environments or configurations.

```groovy
matrix {
    axes {
        axis {
            name 'OS'
            values 'linux', 'windows'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'echo Building on ${OS}'
            }
        }
    }
}
```

## 6. Best Practices for Writing Jenkinsfiles
- **Use Declarative Pipelines**: For better readability and maintainability.
- **Store Jenkinsfile in Version Control**: This ensures your pipeline is always in sync with your source code.
- **Keep Pipelines Simple**: Avoid too much complexity; break large pipelines into smaller reusable components if necessary.
- **Use Shared Libraries**: If you have common logic that needs to be reused across multiple pipelines, consider using shared libraries.
- **Use `when` Conditional**: Control the execution of specific stages based on certain conditions (e.g., branch name).

Example:
```groovy
when {
    branch 'master'
}
```

## 7. Conclusion

A Jenkinsfile provides a powerful, repeatable, and scalable way to define your CI/CD pipelines. By learning how to structure and write a Jenkinsfile, you can automate the building, testing, and deployment of your applications in a controlled, efficient, and consistent manner.

---