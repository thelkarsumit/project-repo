### Chapter 07: **Advanced Custom Images with Packer**

In this chapter, we'll cover the creation of advanced custom images using Packer, which go beyond the basic VM image creation. This includes building images with multiple cloud providers, custom provisioning with various tools, managing post-processing, and optimizing images for production workloads.

#### **Topics Covered in This Chapter:**
1. **Building Multi-Cloud Images with Conditional Logic**
2. **Using Advanced Provisioners (e.g., Shell, Ansible, Chef, etc.)**
3. **Customizing Images with Post-Processors**
4. **Optimizing Images for Production Workloads**
5. **Building a Custom Image for a Specific Application**

---

### **1. Building Multi-Cloud Images with Conditional Logic**

Creating custom images for multiple cloud providers in a single Packer template is possible by defining separate builders for each provider and using conditional logic.

**Example: Multi-Cloud Builder Template**

```json
{
  "variables": {
    "aws_region": "us-west-1",
    "gcp_zone": "us-central1-a",
    "azure_location": "East US"
  },
  
  "builders": [
    {
      "type": "amazon-ebs",
      "region": "{{user `aws_region`}}",
      "source_ami": "ami-abc123",
      "instance_type": "t2.micro",
      "ami_name": "packer-demo-{{timestamp}}",
      "ssh_username": "ubuntu",
      "tags": {
        "Name": "Packer AWS Image"
      }
    },
    {
      "type": "googlecompute",
      "project_id": "your-project-id",
      "source_image": "debian-9-stretch-v20190709",
      "zone": "{{user `gcp_zone`}}",
      "image_name": "packer-demo-{{timestamp}}",
      "ssh_username": "packer",
      "tags": ["packer", "gcp"]
    },
    {
      "type": "azure-arm",
      "client_id": "{{env `ARM_CLIENT_ID`}}",
      "client_secret": "{{env `ARM_CLIENT_SECRET`}}",
      "subscription_id": "{{env `ARM_SUBSCRIPTION_ID`}}",
      "tenant_id": "{{env `ARM_TENANT_ID`}}",
      "location": "{{user `azure_location`}}",
      "image_name": "packer-demo-{{timestamp}}",
      "vm_size": "Standard_B1s",
      "managed_image_resource_group_name": "packer-images",
      "managed_image_name": "packer-image-{{timestamp}}"
    }
  ]
}
```

**Explanation:**
- We define three separate builders, one for each cloud provider: AWS, GCP, and Azure.
- Conditional logic via `variables` is used to ensure region/zone names are defined dynamically.
- Each builder will create the same image, but it will be tailored for the respective cloud platform.

---

### **2. Using Advanced Provisioners (e.g., Shell, Ansible, Chef, etc.)**

Provisioners in Packer are used to configure the machine once it is provisioned, installing software, and setting up configurations. Advanced provisioning can involve tools like Ansible, Chef, or even shell scripts.

**Example: Using Ansible with Packer**

```json
{
  "builders": [
    {
      "type": "amazon-ebs",
      "region": "us-west-2",
      "source_ami": "ami-abc123",
      "instance_type": "t2.micro",
      "ami_name": "packer-demo-{{timestamp}}"
    }
  ],
  
  "provisioners": [
    {
      "type": "ansible",
      "playbook_file": "setup-playbook.yml"
    }
  ]
}
```

**Explanation:**
- We use an Ansible playbook `setup-playbook.yml` to install and configure software on the instance.
- The `ansible` provisioner allows for complex provisioning with a higher level of abstraction, enabling you to reuse existing playbooks.

---

### **3. Customizing Images with Post-Processors**

Post-processors allow you to run additional steps after the image is created, such as compressing it, uploading it to an external location, or even sending it to a marketplace.

**Example: Compressing an Image and Uploading to S3**

```json
{
  "builders": [
    {
      "type": "amazon-ebs",
      "region": "us-west-2",
      "source_ami": "ami-abc123",
      "instance_type": "t2.micro",
      "ami_name": "packer-demo-{{timestamp}}"
    }
  ],
  
  "post-processors": [
    {
      "type": "amazon-s3",
      "bucket": "your-bucket-name",
      "access_key_id": "{{env `AWS_ACCESS_KEY_ID`}}",
      "secret_access_key": "{{env `AWS_SECRET_ACCESS_KEY`}}",
      "region": "us-west-2",
      "path": "packer-images/{{timestamp}}.tar.gz",
      "compression_level": 9
    }
  ]
}
```

**Explanation:**
- After the AMI is created, we use the `amazon-s3` post-processor to upload it to an S3 bucket.
- The image is also compressed to save storage space.

---

### **4. Optimizing Images for Production Workloads**

When creating images for production workloads, it's essential to optimize the image for efficiency, security, and size. This includes cleaning up temporary files, removing unnecessary packages, and minimizing the base image size.

**Example: Cleaning Up the Image**

```json
{
  "builders": [
    {
      "type": "googlecompute",
      "project_id": "your-project-id",
      "source_image": "debian-9-stretch-v20190709",
      "zone": "us-central1-a",
      "image_name": "packer-demo-{{timestamp}}"
    }
  ],

  "provisioners": [
    {
      "type": "shell",
      "inline": [
        "sudo apt-get clean",
        "sudo rm -rf /tmp/*",
        "sudo rm -rf /var/tmp/*",
        "sudo apt-get autoremove -y"
      ]
    }
  ]
}
```

**Explanation:**
- We add a shell provisioner to clean up temporary files, remove unnecessary packages, and reduce the image size, making it more efficient for production.

---

### **5. Building a Custom Image for a Specific Application**

In many cases, you need to create images with custom software installed. For example, you may need to build an image that includes a web application or database.

**Example: Custom Web Application Image**

```json
{
  "builders": [
    {
      "type": "amazon-ebs",
      "region": "us-east-1",
      "source_ami": "ami-abc123",
      "instance_type": "t2.micro",
      "ami_name": "web-app-image-{{timestamp}}"
    }
  ],
  
  "provisioners": [
    {
      "type": "shell",
      "inline": [
        "sudo apt-get update",
        "sudo apt-get install -y nginx",
        "sudo systemctl start nginx",
        "sudo systemctl enable nginx",
        "echo 'Welcome to my web app!' > /var/www/html/index.html"
      ]
    }
  ]
}
```

**Explanation:**
- This template installs Nginx and configures a simple "Welcome" page for a web app.
- You can modify it to install other software like a custom web application, database, etc.

---

### **Conclusion**

By leveraging these advanced techniques, you can create highly customized and optimized images with Packer for any use case across multiple cloud providers. The flexibility of Packer allows you to manage your images as code and automate the creation of consistent environments across the cloud. Keep exploring additional provisioners and post-processors to tailor your image creation workflow to your needs.

