### **Architecture**

1. **Jenkins Master**:
   - Runs the Jenkins server.
   - Manages the Jenkins agents and jobs.
   - Installed on a Compute Engine instance.

2. **Jenkins Slave (Agent)**:
   - Executes the build tasks.
   - Connects to the master using SSH or JNLP.

---

### **Steps to Set Up Jenkins Master-Slave Architecture in GCP**

#### 1. **Create GCP Compute Engine Instances**

- **Master Instance**:
  - Instance Name: `jenkins-master`
  - Machine Type: e2-medium (adjust based on your needs).
  - Operating System: Ubuntu 20.04 or any supported OS.
  - Allow HTTP and HTTPS traffic.
  
- **Slave Instances**:
  - Instance Name: `jenkins-slave-1`
  - Machine Type: e2-small or higher.
  - Operating System: Same as the master.
  - Enable SSH for remote access.

#### 2. **Set Up Jenkins Master**

- **Install Java**:
  ```bash
  sudo apt update
  sudo apt install -y openjdk-11-jdk
  ```

- **Install Jenkins**:
  ```bash
  curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null
  echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null
  sudo apt update
  sudo apt install -y jenkins
  ```

- **Start Jenkins**:
  ```bash
  sudo systemctl start jenkins
  sudo systemctl enable jenkins
  ```

- **Access Jenkins Web Interface**:
  - Open `http://<master_instance_external_IP>:8080` in your browser.
  - Retrieve the initial admin password:
    ```bash
    sudo cat /var/lib/jenkins/secrets/initialAdminPassword
    ```
  - Complete the setup wizard.

---

#### 3. **Set Up Jenkins Slave**

- **Install Java**:
  ```bash
  sudo apt update
  sudo apt install -y openjdk-11-jdk
  ```

- **Create a Jenkins User**:
  ```bash
  sudo useradd -m -s /bin/bash jenkins
  echo "jenkins:jenkins_password" | sudo chpasswd
  ```

- **Configure SSH Access**:
  - On the master, generate an SSH key pair:
    ```bash
    ssh-keygen -t rsa -b 2048
    ```
  - Copy the public key to the slave instance:
    ```bash
    ssh-copy-id jenkins@<slave_instance_external_IP>
    ```

---

#### 4. **Configure Jenkins Master to Use the Slave**

- **Add a Node**:
  1. In the Jenkins Web UI, go to **Manage Jenkins > Manage Nodes and Clouds > New Node**.
  2. Enter a name for the node (e.g., `slave-1`) and choose **Permanent Agent**.
  3. Configure the following:
     - **Remote Root Directory**: `/home/jenkins`
     - **Launch Method**: SSH
     - **Host**: Slave instance external IP
     - **Credentials**: Add the SSH private key created earlier.

- **Save and Test Connection**.

---

#### 5. **Run a Test Job**

- Create a Freestyle Job in Jenkins and configure it to run on the newly added slave node.
- Add a basic shell script step like:
  ```bash
  echo "Hello from Slave"
  ```

---

### **Final Architecture Diagram**
 
 ```
                                       +------------------------+
                                      |  Developer's Machine   |
                                      |  - Access Jenkins UI   |
                                      |  - Trigger Jobs        |
                                      +------------------------+
                                                |
                                                |
                                                ▼
                                      +------------------------+
                                      |  Jenkins Master Node   |
                                      |  - Hosted on GCP VM    |
                                      |  - Manages Jenkins     |
                                      |  - Configures Slaves   |
                                      |  - Web Interface       |
                                      +------------------------+
                                                |
                                                |
     +------------------------------------------+------------------------------------------+
     |                                                                                     |
     |                                                                                     |
     ▼                                                                                     ▼
+------------------------+                                                  +------------------------+
|   Jenkins Slave Node   |                                                  |   Jenkins Slave Node   |
|   - Hosted on GCP VM   |                                                  |   - Hosted on GCP VM   |
|   - Runs Build Tasks   |                                                  |   - Runs Build Tasks   |
|   - Connects via SSH   |                                                  |   - Connects via SSH   |
|   Public IP: <IP1>     |                                                  |   Public IP: <IP2>     |
+------------------------+                                                  +------------------------+

 ```