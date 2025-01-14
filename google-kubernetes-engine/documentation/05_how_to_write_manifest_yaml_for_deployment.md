# How to Write Manifest YAML for Deployment on GKE

In Kubernetes, a manifest file is a configuration file written in YAML (YAML Ain't Markup Language) that defines the desired state of various resources in the cluster. This document will walk you through the steps of creating a manifest YAML file for deploying an application to GKE, explaining each part in detail.

## Table of Contents
1. [What is a Kubernetes Manifest?](#what-is-a-kubernetes-manifest)
2. [Kubernetes Deployment Manifest](#kubernetes-deployment-manifest)
   - 2.1 [Metadata](#metadata)
   - 2.2 [Spec](#spec)
   - 2.3 [Pod Template](#pod-template)
3. [Example Deployment Manifest YAML](#example-deployment-manifest-yaml)
4. [How to Apply the Manifest File](#how-to-apply-the-manifest-file)
5. [Best Practices](#best-practices)
6. [Troubleshooting](#troubleshooting)

---

## What is a Kubernetes Manifest?

A Kubernetes manifest is a YAML or JSON file used to declare the configuration of Kubernetes objects (like Pods, Services, Deployments, etc.) that you want to manage in the Kubernetes cluster. Kubernetes uses this file to understand what resources to create, update, or delete in the cluster. 

The manifest specifies the desired state of a resource, and Kubernetes ensures that the actual state matches the desired state.

---

## Kubernetes Deployment Manifest

A **Deployment** in Kubernetes is used to manage the lifecycle of a set of replicas of a containerized application. A deployment ensures that a specified number of pod replicas are running at any given time.

### 2.1 Metadata

Metadata includes information about the deployment, such as its name, labels, and annotations. Labels are key-value pairs that help Kubernetes identify and organize resources.

**Example:**
```yaml
metadata:
  name: myapp-deployment
  labels:
    app: myapp
```

- `name`: The name of the deployment. In this case, it’s `myapp-deployment`.
- `labels`: A set of key-value pairs to organize and select resources.

### 2.2 Spec

The `spec` field defines the desired state for the deployment. It includes important details like the number of replicas (instances of the application), the selector (how to identify pods), and the pod template.

**Example:**
```yaml
spec:
  replicas: 3
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
        - name: myapp-container
          image: myapp:latest
          ports:
            - containerPort: 8080
```

- `replicas`: The number of pod replicas you want running. Here, we want 3 replicas.
- `selector`: Defines how Kubernetes will select the pods managed by this deployment. It matches the `app: myapp` label.
- `template`: The pod template that defines the configuration of the pod.
    - `metadata`: Contains labels for the pod.
    - `spec`: Defines the containers to run within the pod.

### 2.3 Pod Template

The pod template defines the container image to use and the configuration for the container, including the ports, environment variables, and resources (CPU and memory) to allocate.

**Example:**
```yaml
containers:
  - name: myapp-container
    image: myapp:latest
    ports:
      - containerPort: 8080
```

- `name`: The name of the container.
- `image`: The Docker image to run.
- `ports`: The ports the container exposes. In this example, the container exposes port 8080.

---

## Example Deployment Manifest YAML

Here’s an example of a complete deployment YAML manifest for deploying a simple web application in GKE.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-deployment
  labels:
    app: myapp
spec:
  replicas: 3
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
        - name: myapp-container
          image: gcr.io/my-project/myapp:latest
          ports:
            - containerPort: 8080
          resources:
            requests:
              memory: "64Mi"
              cpu: "250m"
            limits:
              memory: "128Mi"
              cpu: "500m"
```

### Explanation:

- `apiVersion`: Specifies the API version of the resource.
- `kind`: Indicates the type of resource being defined. In this case, it's a `Deployment`.
- `metadata`: Contains metadata about the deployment, including the name and labels.
- `spec`: Specifies the desired state for the deployment, including the number of replicas and the pod template.
- `containers`: Defines the containers in the pod, including their images, ports, and resource requests/limits.

---

## How to Apply the Manifest File

Once your manifest file is ready, you can deploy it to your GKE cluster using `kubectl`. 

Use the following command to apply the deployment:

```bash
kubectl apply -f deployment.yaml
```

To check the status of your deployment:

```bash
kubectl get deployments
```

To get details about your pods:

```bash
kubectl get pods
```

To view the logs of a pod:

```bash
kubectl logs <pod-name>
```

---

## Best Practices

- **Resource Requests and Limits**: Always specify resource requests and limits for CPU and memory to ensure efficient use of resources.
- **Versioning**: Always specify the version of the image (e.g., `myapp:v1.0.0`) to avoid using the latest image, which can lead to unexpected behavior.
- **Labels and Selectors**: Use meaningful labels to organize and select resources effectively.
- **Rolling Updates**: Kubernetes deployments support rolling updates by default, so your application will be updated without downtime.
- **Health Checks**: Use `livenessProbe` and `readinessProbe` to check the health of your application containers.

---

## Troubleshooting

If the deployment fails, you can troubleshoot using the following steps:

1. **Check the deployment status**: 
   ```bash
   kubectl describe deployment myapp-deployment
   ```
   
2. **Check pod status**: 
   ```bash
   kubectl describe pod <pod-name>
   ```

3. **View pod logs**:
   ```bash
   kubectl logs <pod-name>
   ```

4. **Check events in the cluster**:
   ```bash
   kubectl get events
   ```

---