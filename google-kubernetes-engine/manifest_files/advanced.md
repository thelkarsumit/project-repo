# List of advanced Kubernetes manifest files for different tasks.

### Table of Contents:
1. **01_deployment.yaml** - Create a Deployment
2. **02_service.yaml** - Expose a Deployment using a Service
3. **03_pod_affinity.yaml** - Pod Affinity and Anti-Affinity
4. **04_config_map.yaml** - Using ConfigMap in Pods
5. **05_secrets.yaml** - Using Secrets for Sensitive Data
6. **06_statefulset.yaml** - Create a StatefulSet
7. **07_horizontal_pod_autoscaler.yaml** - Set Up Horizontal Pod Autoscaler
8. **08_job.yaml** - Run a Job
9. **09_cronjob.yaml** - Run a CronJob
10. **10_pod_disruption_budget.yaml** - Set Pod Disruption Budget

---

### 1. **01_deployment.yaml** - Create a Deployment

```yaml
# This manifest defines a Deployment that creates and manages Pods.
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-deployment
  labels:
    app: myapp
spec:
  replicas: 3  # Number of Pods to run
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
        image: myapp:v1  # Docker image for the container
        ports:
        - containerPort: 8080  # Port exposed by the container
```
**Explanation:**
This deployment will manage three replicas of a container running the `myapp:v1` image and expose port `8080`. Kubernetes will ensure that the specified number of Pods (3) are always running.

---

### 2. **02_service.yaml** - Expose a Deployment using a Service

```yaml
# This manifest creates a Service to expose the Deployment.
apiVersion: v1
kind: Service
metadata:
  name: myapp-service
spec:
  selector:
    app: myapp  # Matches the Deployment's Pods
  ports:
  - protocol: TCP
    port: 80  # Port the service exposes
    targetPort: 8080  # The port on the Pod to forward to
  type: LoadBalancer  # Exposes the service externally
```
**Explanation:**
This service exposes the Deployment's Pods on port 80, forwarding the traffic to port 8080 inside the Pods. The `LoadBalancer` type allows external access.

---

### 3. **03_pod_affinity.yaml** - Pod Affinity and Anti-Affinity

```yaml
# This manifest demonstrates Pod Affinity (scheduling Pods on specific nodes).
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-affinity
spec:
  replicas: 3
  template:
    spec:
      affinity:
        podAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
          - labelSelector:
              matchLabels:
                app: myapp
            topologyKey: "kubernetes.io/hostname"  # Ensures Pods are scheduled on the same node
      containers:
      - name: myapp-container
        image: myapp:v1
```
**Explanation:**
This manifest specifies Pod Affinity, ensuring that Pods are scheduled on nodes where other Pods with the label `app: myapp` are running.

---

### 4. **04_config_map.yaml** - Using ConfigMap in Pods

```yaml
# This manifest demonstrates how to inject configuration data into Pods using a ConfigMap.
apiVersion: v1
kind: ConfigMap
metadata:
  name: myapp-config
data:
  DATABASE_URL: "postgres://db:5432"
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-with-config
spec:
  replicas: 1
  template:
    spec:
      containers:
      - name: myapp-container
        image: myapp:v1
        envFrom:
        - configMapRef:
            name: myapp-config  # Using the ConfigMap to inject environment variables
```
**Explanation:**
The ConfigMap stores the database URL, which is injected into the Pod as an environment variable.

---

### 5. **05_secrets.yaml** - Using Secrets for Sensitive Data

```yaml
# This manifest demonstrates how to inject sensitive data into Pods using Secrets.
apiVersion: v1
kind: Secret
metadata:
  name: myapp-secret
type: Opaque
data:
  DATABASE_PASSWORD: cGFzc3dvcmQ=  # Base64 encoded password
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-with-secret
spec:
  replicas: 1
  template:
    spec:
      containers:
      - name: myapp-container
        image: myapp:v1
        envFrom:
        - secretRef:
            name: myapp-secret  # Using the Secret to inject sensitive environment variables
```
**Explanation:**
This manifest demonstrates how to securely pass sensitive information (like a database password) into Pods via a Secret. The password is Base64 encoded.

---

### 6. **06_statefulset.yaml** - Create a StatefulSet

```yaml
# A StatefulSet ensures ordered, stable Pod names and persistent storage.
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: myapp-statefulset
spec:
  serviceName: "myapp"
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
        image: myapp:v1
        ports:
        - containerPort: 8080
---
apiVersion: v1
kind: Service
metadata:
  name: myapp
spec:
  clusterIP: None  # Headless service to manage StatefulSet Pods
```
**Explanation:**
This StatefulSet creates 3 Pods, each with a stable, unique identity (e.g., `myapp-statefulset-0`, `myapp-statefulset-1`). A headless service (`clusterIP: None`) is used to manage these Pods.

---

### 7. **07_horizontal_pod_autoscaler.yaml** - Set Up Horizontal Pod Autoscaler

```yaml
# This manifest creates a Horizontal Pod Autoscaler (HPA).
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: myapp-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: myapp-deployment
  minReplicas: 2
  maxReplicas: 5
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 50  # Scale based on CPU utilization
```
**Explanation:**
The Horizontal Pod Autoscaler automatically adjusts the number of Pods based on CPU utilization, scaling between 2 and 5 replicas.

---

### 8. **08_job.yaml** - Run a Job

```yaml
# A Job is used to run a batch task to completion.
apiVersion: batch/v1
kind: Job
metadata:
  name: myapp-job
spec:
  template:
    spec:
      containers:
      - name: myapp-container
        image: myapp:v1
      restartPolicy: Never  # Ensures the Job doesn't restart the Pod after completion
```
**Explanation:**
This Job runs a batch task to completion and ensures that the container completes its work without restarting.

---

### 9. **09_cronjob.yaml** - Run a CronJob

```yaml
# A CronJob runs on a scheduled basis.
apiVersion: batch/v1
kind: CronJob
metadata:
  name: myapp-cronjob
spec:
  schedule: "*/5 * * * *"  # Runs every 5 minutes
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: myapp-container
            image: myapp:v1
          restartPolicy: OnFailure  # Restart only if the job fails
```
**Explanation:**
This CronJob runs the job every 5 minutes to perform a specific task, retrying only in case of failure.

---

### 10. **10_pod_disruption_budget.yaml** - Set Pod Disruption Budget

```yaml
# A PodDisruptionBudget ensures that a minimum number of Pods are always available.
apiVersion: policy/v1
kind: PodDisruptionBudget
metadata:
  name: myapp-pdb
spec:
  minAvailable: 2  # Ensure at least 2 Pods are available during voluntary disruptions
  selector:
    matchLabels:
      app: myapp
```
**Explanation:**
This PodDisruptionBudget ensures that at least two Pods are available even during voluntary disruptions like node draining or cluster maintenance.

---
