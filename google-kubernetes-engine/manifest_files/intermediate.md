# List of intermediate Kubernetes manifest files for different tasks.

### Table of Contents

1. **01_deployment.yaml** - Deployment of a simple application
2. **02_service.yaml** - Exposing a deployment using a service
3. **03_ingress.yaml** - Creating an Ingress to route external traffic
4. **04_pod.yaml** - Running a single pod with specific configurations
5. **05_configmap.yaml** - ConfigMap for storing non-sensitive configuration data
6. **06_secret.yaml** - Secret for storing sensitive data
7. **07_persistent_volume_claim.yaml** - Persistent Volume Claim for stateful workloads
8. **08_statefulset.yaml** - StatefulSet to manage stateful applications
9. **09_horizontal_pod_autoscaler.yaml** - Auto-scaling pods based on resource usage
10. **10_job.yaml** - Running a one-time job in Kubernetes

### 1. **01_deployment.yaml** - Deployment of a simple application

This manifest deploys a basic application using the Deployment controller.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-app-deployment
  labels:
    app: my-app
spec:
  replicas: 3  # Number of pod replicas
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
      - name: my-app-container
        image: nginx:latest  # Using the latest nginx image
        ports:
        - containerPort: 80  # Expose port 80
```

**Explanation:**
- `replicas: 3`: Creates 3 identical pods.
- `containers`: Defines the container to be used (here, Nginx).

---

### 2. **02_service.yaml** - Exposing a deployment using a service

This manifest exposes the previously created deployment through a service.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-app-service
spec:
  selector:
    app: my-app  # Matches the deployment selector
  ports:
  - protocol: TCP
    port: 80  # Port exposed by the service
    targetPort: 80  # Port on the container
  type: LoadBalancer  # Exposes the service externally
```

**Explanation:**
- `type: LoadBalancer`: Exposes the service externally, typically for cloud providers.
- `selector`: Ensures the service matches the deployment by label.

---

### 3. **03_ingress.yaml** - Creating an Ingress to route external traffic

Ingress manages external access to services.

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: my-app-ingress
spec:
  rules:
  - host: my-app.example.com  # Host URL
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: my-app-service
            port:
              number: 80
```

**Explanation:**
- Routes traffic from `my-app.example.com` to the `my-app-service`.
- `pathType: Prefix`: Matches requests to the root path.

---

### 4. **04_pod.yaml** - Running a single pod with specific configurations

This manifest runs a single pod without a deployment.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-single-pod
spec:
  containers:
  - name: my-container
    image: nginx
    resources:
      limits:
        memory: "500Mi"
        cpu: "500m"
```

**Explanation:**
- `resources`: Defines resource limits for the container.
- This manifest is useful for debugging or running non-replicated workloads.

---

### 5. **05_configmap.yaml** - ConfigMap for storing non-sensitive configuration data

ConfigMaps store non-sensitive data like configuration files.

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-app-config
data:
  config.json: |
    {
      "setting": "value"
    }
```

**Explanation:**
- The `data` field stores the configuration file.
- ConfigMaps can be mounted as files or environment variables in pods.

---

### 6. **06_secret.yaml** - Secret for storing sensitive data

This manifest defines a Kubernetes Secret to store sensitive data.

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: my-secret
type: Opaque
data:
  username: bXl1c2Vy  # Base64 encoded 'myuser'
  password: bXlwYXNzd29yZA==  # Base64 encoded 'mypassword'
```

**Explanation:**
- Secrets store sensitive data like passwords.
- Data is stored in base64-encoded format for safe handling.

---

### 7. **07_persistent_volume_claim.yaml** - Persistent Volume Claim for stateful workloads

This manifest creates a PVC that binds to a Persistent Volume (PV).

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
```

**Explanation:**
- `accessModes`: Defines how the volume can be accessed (e.g., `ReadWriteOnce` means one node can write).
- `resources.requests.storage`: Defines the storage size.

---

### 8. **08_statefulset.yaml** - StatefulSet to manage stateful applications

This manifest defines a StatefulSet, ideal for applications with state, like databases.

```yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: my-statefulset
spec:
  serviceName: "my-statefulset"
  replicas: 3
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
      - name: my-container
        image: redis:alpine
        volumeMounts:
        - name: my-persistent-storage
          mountPath: /data
  volumeClaimTemplates:
  - metadata:
      name: my-persistent-storage
    spec:
      accessModes: [ "ReadWriteOnce" ]
      resources:
        requests:
          storage: 1Gi
```

**Explanation:**
- StatefulSets manage stateful applications, ensuring ordered deployment and scaling.
- Uses a `volumeClaimTemplates` for persistent storage.

---

### 9. **09_horizontal_pod_autoscaler.yaml** - Auto-scaling pods based on resource usage

This manifest defines a Horizontal Pod Autoscaler to automatically scale pods.

```yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: my-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: my-app-deployment
  minReplicas: 1
  maxReplicas: 10
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 50
```

**Explanation:**
- Scales the `my-app-deployment` based on CPU utilization.
- `averageUtilization: 50`: Target 50% CPU utilization for scaling.

---

### 10. **10_job.yaml** - Running a one-time job in Kubernetes

This manifest defines a Job, which runs a task once and ensures it completes.

```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: my-job
spec:
  template:
    spec:
      containers:
      - name: my-container
        image: busybox
        command: ["echo", "Hello, Kubernetes!"]
      restartPolicy: Never
```

**Explanation:**
- `restartPolicy: Never`: Ensures the job doesn't restart.
- This is useful for tasks like batch processing.

---