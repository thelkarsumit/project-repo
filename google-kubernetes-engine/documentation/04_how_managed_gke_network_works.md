# **How Managed GKE Network Works**

## **Introduction**
Managed Google Kubernetes Engine (GKE) Networks refer to the network setup, configuration, and integration aspects that allow GKE clusters to communicate securely and efficiently. A GKE cluster is typically deployed within a Virtual Private Cloud (VPC), and the networking of the GKE cluster is critical to ensure the communication between Pods, Services, and external resources.

In this document, we’ll go through how the managed GKE network works, its components, and how you can configure networking for GKE clusters using both the Google Cloud Console and the CLI.

## **GKE Networking Overview**

GKE clusters rely on Google Cloud’s VPC and other networking services to manage traffic between nodes, pods, and external clients. Managed GKE networking is divided into several key parts:

- **VPC (Virtual Private Cloud)**: The network on which the GKE clusters are hosted. The VPC is a regional, private network in Google Cloud.
- **Subnets**: Subnets within the VPC where different resources (including GKE nodes) can be placed.
- **Private Google Access**: Allows resources in a VPC subnet to communicate with Google APIs.
- **Network Policies**: Define rules for how pods communicate with each other.
- **Load Balancer**: To expose services running in GKE to the internet.
- **Service Accounts and IAM roles**: To secure the communication between Google Cloud services and GKE clusters.

## **Key Concepts**

1. **VPC Peering and Shared VPC**
   - VPC Peering allows you to connect two different VPC networks. You can use VPC Peering to connect your GKE cluster network to other networks in the same or different projects.
   - **Shared VPC** allows multiple projects to share a single VPC network, which is useful in large, multi-project environments.

2. **GKE Subnet Mode vs. VPC-native Mode**
   - **VPC-native clusters** use an IP address from the VPC's subnet to allocate Pod IPs.
   - **Non-VPC-native clusters** allocate Pod IPs from a custom CIDR block separate from the VPC.

3. **Private Clusters**
   - In private clusters, the nodes are not assigned public IP addresses. These clusters only allow internal communication, but you can enable Private Google Access to interact with Google Cloud services.

4. **Cloud DNS and Internal DNS**
   - For services within a private GKE network, internal DNS allows GKE clusters to resolve the DNS of resources hosted inside the VPC.
   - Google Cloud DNS provides public DNS for your GKE services exposed to the internet.

5. **Firewall Rules**
   - You’ll need to configure firewall rules to control traffic between nodes, pods, and external clients.

---

## **Steps to Set Up Managed GKE Network**

### 1. **Setting Up VPC Network**

Before you create a GKE cluster, you must ensure that your VPC network is properly set up to support Kubernetes workloads.

#### **Console Steps**:

1. Navigate to **VPC Network** in the Google Cloud Console.
2. Select **Create VPC Network**.
3. Choose **Custom** for Subnet creation, and ensure to define the appropriate subnet ranges.
4. Set up any firewall rules to control access to the network.

#### **CLI Command**:

```bash
gcloud compute networks create gke-vpc --subnet-mode=custom
```

This command creates a VPC in custom subnet mode, allowing you to manage your own IP allocation.

---

### 2. **Creating a GKE Cluster in a VPC Network**

Now that your VPC is ready, you can create a GKE cluster. When creating the cluster, ensure you specify the VPC network and subnet where you want your cluster to reside.

#### **Console Steps**:

1. Go to **Kubernetes Engine** in the Google Cloud Console.
2. Click on **Create Cluster**.
3. Under **Networking**, select the **VPC network** and **subnet** that you configured earlier.
4. Configure other options like node pool size and machine type.

#### **CLI Command**:

```bash
gcloud container clusters create gke-cluster \
  --network gke-vpc \
  --subnetwork gke-subnet \
  --num-nodes 3 \
  --zone us-central1-a
```

This command creates a GKE cluster named `gke-cluster` in the `gke-vpc` network and `gke-subnet` subnet with 3 nodes.

---

### 3. **Enabling Private Google Access**

Private Google Access allows your GKE nodes to access Google Cloud APIs, such as GCR (Google Container Registry), without needing external IPs.

#### **Console Steps**:

1. Navigate to **VPC Network** > **Subnets**.
2. Select your subnet and click **Edit**.
3. Enable **Private Google Access**.

#### **CLI Command**:

```bash
gcloud compute networks subnets update gke-subnet \
  --region us-central1 \
  --enable-private-ip-google-access
```

This command configures the `gke-subnet` to allow Private Google Access.

---

### 4. **Configuring Network Policies**

Network Policies in GKE allow you to control traffic flow between pods based on defined rules. This is crucial in multi-tier applications where you may want to restrict communication between different services.

#### **Console Steps**:

1. In the Google Cloud Console, navigate to **Kubernetes Engine**.
2. Under your GKE cluster, go to **Network Policies**.
3. Create a new policy defining rules for ingress (incoming) and egress (outgoing) traffic.

#### **CLI Command**:

```bash
kubectl create -f network-policy.yaml
```

Here, `network-policy.yaml` defines the ingress and egress policies for controlling pod communication.

Example of a Network Policy (`network-policy.yaml`):

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-app-traffic
spec:
  podSelector:
    matchLabels:
      app: my-app
  policyTypes:
  - Ingress
  - Egress
  ingress:
  - from:
    - podSelector:
        matchLabels:
          app: backend
  egress:
  - to:
    - podSelector:
        matchLabels:
          app: database
```

This policy allows traffic from the backend pods to the app pods and egress traffic from app pods to the database pods.

---

### 5. **Firewall Configuration**

To manage traffic between nodes, pods, and external services, you will need to define appropriate firewall rules.

#### **Console Steps**:

1. Go to **VPC Network** > **Firewall Rules**.
2. Click **Create Firewall Rule** to define the rule (e.g., allowing traffic on ports used by Kubernetes).

#### **CLI Command**:

```bash
gcloud compute firewall-rules create allow-k8s-ports \
  --network gke-vpc \
  --allow tcp:443,tcp:10250,tcp:10255
```

This command creates a firewall rule that allows Kubernetes-specific traffic on the required ports.

---

### 6. **GKE Load Balancer Configuration**

A load balancer is used to expose services running in GKE clusters to the internet.

#### **Console Steps**:

1. In **Kubernetes Engine**, select your cluster and go to the **Services & Ingress** tab.
2. Create a new service with **LoadBalancer** type to expose your application.

#### **CLI Command**:

```bash
kubectl expose deployment my-app --type=LoadBalancer --port=80 --target-port=8080
```

This command exposes the `my-app` deployment to the internet using a Google Cloud Load Balancer.

---

## **Summary**

In this document, we explored the essentials of how Managed GKE Networks work, including:

- The use of VPCs, subnets, and IP ranges.
- Configuring private clusters and enabling Private Google Access.
- Setting up network policies and firewall rules for traffic management.
- Configuring load balancers for exposing services.

Understanding and configuring GKE networking ensures secure, scalable communication for your Kubernetes workloads. With this knowledge, you can effectively manage your GKE clusters and their communication requirements.

---