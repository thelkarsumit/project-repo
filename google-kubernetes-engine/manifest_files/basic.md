# list of basic Kubernetes manifest files for different tasks.

### Table of Contents
1. **01_deployment.yaml** - Basic Deployment
2. **02_service.yaml** - Exposing a Service
3. **03_pod.yaml** - Single Pod Definition
4. **04_configmap.yaml** - ConfigMap Example
5. **05_secret.yaml** - Secret Example
6. **06_persistent_volume.yaml** - Persistent Volume
7. **07_persistent_volume_claim.yaml** - Persistent Volume Claim
8. **08_namespace.yaml** - Namespace Creation
9. **09_ingress.yaml** - Ingress Resource for External Access
10. **10_daemonset.yaml** - DaemonSet Example

---

### 1. **01_deployment.yaml** - Basic Deployment

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx
          image: nginx:latest
          ports:
            - containerPort: 80
```

**Explanation**:  
This manifest defines a **Deployment** resource, which ensures that 2 replicas of the `nginx` container are running. The `nginx:latest` image is used, and it exposes port 80 within the container.

---

### 2. **02_service.yaml** - Exposing a Service

```yaml
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  selector:
    app: nginx
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: ClusterIP
```

**Explanation**:  
This manifest defines a **Service** resource that exposes the `nginx` pods. The service listens on port 80 and forwards traffic to port 80 in the pods. The `ClusterIP` type is used, making it accessible within the cluster.

---

### 3. **03_pod.yaml** - Single Pod Definition

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod
spec:
  containers:
    - name: nginx
      image: nginx:latest
      ports:
        - containerPort: 80
```

**Explanation**:  
This manifest defines a single **Pod** resource. It runs an `nginx` container, exposing port 80, and is a simple unit for testing purposes.

---

### 4. **04_configmap.yaml** - ConfigMap Example

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: app-config
data:
  appMode: "production"
  appVersion: "1.0"
```

**Explanation**:  
This manifest creates a **ConfigMap** named `app-config` which stores configuration data in the `data` section. These values can be used by other Kubernetes resources, such as pods, for environment-specific configurations.

---

### 5. **05_secret.yaml** - Secret Example

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: db-password
type: Opaque
data:
  password: c2VjcmV0cGFzc3dvcmQK
```

**Explanation**:  
This manifest defines a **Secret** resource named `db-password`, which stores sensitive data. The password field is base64-encoded to ensure security during transmission.

---

### 6. **06_persistent_volume.yaml** - Persistent Volume

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-example
spec:
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: /tmp/data
```

**Explanation**:  
This manifest defines a **PersistentVolume** (PV), which provides storage resources in the cluster. It specifies that the storage size is 1Gi and uses the `hostPath` volume type, which stores data on the node’s filesystem.

---

### 7. **07_persistent_volume_claim.yaml** - Persistent Volume Claim

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc-example
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
```

**Explanation**:  
This manifest defines a **PersistentVolumeClaim** (PVC), which requests storage from the available PVs. The request is for 1Gi of storage, and it can only be mounted by a single node (`ReadWriteOnce`).

---

### 8. **08_namespace.yaml** - Namespace Creation

```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: dev-environment
```

**Explanation**:  
This manifest creates a **Namespace** resource named `dev-environment`. Namespaces help divide cluster resources into different virtual clusters.

---

### 9. **09_ingress.yaml** - Ingress Resource for External Access

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: nginx-ingress
spec:
  rules:
  - host: example.com
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: nginx-service
            port:
              number: 80
```

**Explanation**:  
This manifest defines an **Ingress** resource that allows external traffic to access the `nginx-service` at `example.com`. It specifies the path `/` and forwards traffic to port 80 of the service.

---

### 10. **10_daemonset.yaml** - DaemonSet Example

```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: logging-agent
spec:
  selector:
    matchLabels:
      app: logging-agent
  template:
    metadata:
      labels:
        app: logging-agent
    spec:
      containers:
        - name: logging-agent
          image: logging-agent-image:latest
          ports:
            - containerPort: 5000
```

**Explanation**:  
This manifest defines a **DaemonSet** resource. It ensures that a `logging-agent` container is deployed on every node in the cluster, which is ideal for monitoring or logging agents that need to run on all nodes.

---
