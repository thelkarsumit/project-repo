# Jenkins Pipeline Example

## Introduction to Jenkins Pipelines

Jenkins Pipelines are a suite of plugins that support integrating and implementing continuous delivery pipelines in Jenkins. Pipelines define the process for automating the software delivery process, allowing you to automate tasks like building, testing, and deploying your application.

In this document, we'll cover a simple Jenkins pipeline example, breaking it down into stages to illustrate how it works and the syntax involved.

---

## What is a Jenkins Pipeline?

A Jenkins pipeline is defined in a `Jenkinsfile`, which can be stored in your source control repository (e.g., Git). It consists of a sequence of stages that outline the steps Jenkins will execute as part of your CI/CD process. There are two types of Jenkins pipelines:

- **Declarative Pipeline**: A more structured and simpler pipeline syntax.
- **Scripted Pipeline**: A flexible and more complex pipeline written in Groovy.

---

## Components of a Jenkins Pipeline

1. **Pipeline**: This block defines the pipeline and its stages.
2. **Stages**: These are the distinct phases of the pipeline, such as build, test, and deploy.
3. **Steps**: Individual tasks that make up each stage, such as running commands or invoking other processes.
4. **Post**: This section runs actions after the pipeline finishes, regardless of the pipeline's success or failure.

---

## Simple Jenkins Pipeline Example (Declarative)

```groovy
pipeline {
    agent any  // Specifies where the pipeline should run (e.g., on any available node)

    environment {
        APP_NAME = 'myapp'
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building the application...'
                sh 'mvn clean install'  // Executes a shell command (Maven build)
            }
        }

        stage('Test') {
            steps {
                echo 'Running unit tests...'
                sh 'mvn test'  // Executes unit tests using Maven
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying application...'
                sh './deploy.sh'  // Runs a deployment script
            }
        }
    }

    post {
        always {
            echo 'Cleaning up after the build'
            // Clean up actions, such as removing temporary files
        }
        success {
            echo 'Pipeline finished successfully!'
        }
        failure {
            echo 'Pipeline failed. Investigate the error!'
        }
    }
}
```

### Explanation of the Pipeline

- **Agent**: Specifies that the pipeline can run on any available agent or node.
- **Environment**: Defines environment variables, like `APP_NAME`, which can be used across stages.
- **Stages**: Each stage represents a step in your process.
  - `Build`: Runs the command to build your project using Maven.
  - `Test`: Executes unit tests to ensure code quality.
  - `Deploy`: Deploys the application using a custom script.
- **Post**: Defines steps that run after the stages complete. You can set different actions based on the pipeline's success or failure.

---

## Additional Concepts

### Parallel Execution
In Jenkins, you can run stages or steps in parallel to speed up the pipeline process. Here’s an example:

```groovy
pipeline {
    agent any
    stages {
        stage('Build') {
            parallel {
                stage('Build Frontend') {
                    steps {
                        echo 'Building frontend...'
                        sh 'npm run build'
                    }
                }
                stage('Build Backend') {
                    steps {
                        echo 'Building backend...'
                        sh 'mvn clean install'
                    }
                }
            }
        }
    }
}
```

In this example, the frontend and backend are built in parallel, reducing the total pipeline execution time.

### Input Stage
Jenkins pipelines can also include input from users or other systems. Here's an example of a manual approval step before deploying:

```groovy
stage('Approval') {
    steps {
        input 'Approve Deployment?'
    }
}
```

The pipeline will pause here and wait for a user to approve the deployment.

---

## Example of a Scripted Pipeline

```groovy
node {
    try {
        stage('Build') {
            echo 'Building the application...'
            sh 'mvn clean install'
        }

        stage('Test') {
            echo 'Running unit tests...'
            sh 'mvn test'
        }

        stage('Deploy') {
            echo 'Deploying application...'
            sh './deploy.sh'
        }
    } catch (Exception e) {
        currentBuild.result = 'FAILURE'
        throw e
    } finally {
        echo 'Cleaning up...'
        cleanWs()  // Clean up workspace
    }
}
```

In this scripted pipeline, we explicitly define the stages and steps within a `node` block, which specifies the Jenkins agent to run the pipeline on.

---

## Conclusion

Jenkins pipelines are a powerful tool for automating continuous integration and delivery workflows. With simple declarative syntax or more flexible scripted pipelines, you can define clear, repeatable, and reliable automation processes. By defining stages like build, test, and deploy, and using advanced features like parallel execution, input stages, and post actions, you can create robust pipelines tailored to your needs.

Make sure to store your `Jenkinsfile` in your source control repository to keep it versioned and accessible to all developers.

---