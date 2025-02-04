### Chapter 06: **Integration with GCP, Azure, and AWS**

In this chapter, we will walk through how to integrate Packer with multiple cloud providers: **Google Cloud Platform (GCP)**, **Microsoft Azure**, and **Amazon Web Services (AWS)**. The goal is to use a single Packer configuration file to create images across these platforms, enabling cross-cloud image building.

---

### **Introduction to Multi-Cloud Integration**
Packer allows you to use a single template to build images for multiple platforms. This is particularly useful when your organization operates in a multi-cloud environment. By using conditional statements and variables, you can define cloud-specific settings for each provider.

In this chapter, we will:

1. Set up and configure the necessary credentials for each cloud provider.
2. Define builders for GCP, Azure, and AWS.
3. Use conditional logic and variables to manage multi-cloud image creation.
4. Build custom images for all three cloud providers from a single configuration.

---

### **Prerequisites**
Before proceeding, ensure that you have the following:

- **GCP**: Google Cloud project with the necessary permissions, a service account key, and the `gcloud` CLI set up.
- **Azure**: Azure subscription with the required permissions, and the Azure CLI (`az`) installed.
- **AWS**: AWS account with appropriate IAM credentials (access key and secret key) and AWS CLI configured.

For each cloud provider, you'll need to configure your credentials securely, either through environment variables, service account keys, or configuration files.

---

### **Packer Template for Multi-Cloud Integration**

In the `06_integration_with_gcp_azure_aws.json` template, we will define the `builders` for each cloud platform using a single JSON file. We’ll also make use of Packer’s **variables** to manage cloud-specific details.

#### 1. **Template Configuration Overview**
```json
{
  "variables": {
    "gcp_project_id": "your-gcp-project-id",
    "azure_client_id": "your-azure-client-id",
    "azure_client_secret": "your-azure-client-secret",
    "aws_access_key": "your-aws-access-key",
    "aws_secret_key": "your-aws-secret-key"
  },
  
  "builders": [
    {
      "type": "googlecompute",
      "project_id": "{{user `gcp_project_id`}}",
      "source_image": "debian-9-stretch-v20190709",
      "zone": "us-central1-a",
      "image_name": "packer-demo-{{timestamp}}",
      "ssh_username": "packer",
      "machine_type": "n1-standard-1"
    },
    {
      "type": "azure-arm",
      "client_id": "{{user `azure_client_id`}}",
      "client_secret": "{{user `azure_client_secret`}}",
      "tenant_id": "your-azure-tenant-id",
      "subscription_id": "your-azure-subscription-id",
      "managed_image_resource_group": "packer-images",
      "managed_image_name": "packer-demo-{{timestamp}}",
      "os_type": "Linux",
      "image_publisher": "Canonical",
      "image_offer": "UbuntuServer",
      "image_sku": "16.04-LTS",
      "location": "East US",
      "vm_size": "Standard_DS1_v2"
    },
    {
      "type": "amazon-ebs",
      "access_key": "{{user `aws_access_key`}}",
      "secret_key": "{{user `aws_secret_key`}}",
      "region": "us-west-2",
      "source_ami": "ami-0c55b159cbfafe1f0",
      "instance_type": "t2.micro",
      "ami_name": "packer-demo-{{timestamp}}",
      "ssh_username": "ubuntu",
      "tags": {
        "Name": "packer-demo"
      }
    }
  ],
  
  "provisioners": [
    {
      "type": "shell",
      "script": "./scripts/install-software.sh"
    }
  ]
}
```

---

### **Detailed Explanation of the Template**

#### **Variables**
- Variables are defined to hold sensitive data like credentials and cloud-specific configuration options. These variables are referenced throughout the template, allowing you to keep your configurations flexible and reusable.
  
#### **GCP Builder:**
- **type**: `googlecompute` - The builder type used to create images in Google Cloud.
- **project_id**: This references the GCP project in which the image will be created.
- **source_image**: This is the base image you are using to create your custom image.
- **zone**: The GCP region/zone where the VM will be created.
- **image_name**: The name of the image once the build is complete.
- **machine_type**: The type of VM to use for image creation (e.g., `n1-standard-1`).

#### **Azure Builder:**
- **type**: `azure-arm` - The builder type used to create images in Azure.
- **client_id**, **client_secret**, **tenant_id**, **subscription_id**: These credentials are used to authenticate with Azure.
- **managed_image_resource_group**: The Azure resource group where the custom image will be stored.
- **managed_image_name**: The name of the Azure custom image.
- **os_type**: The operating system type of the image (`Linux` or `Windows`).
- **image_publisher**, **image_offer**, **image_sku**: These values define the base image from which the custom image will be built.
- **location**: The Azure region where the VM and image will be created.
- **vm_size**: The size of the virtual machine used to build the image (e.g., `Standard_DS1_v2`).

#### **AWS Builder:**
- **type**: `amazon-ebs` - The builder type used to create AMIs in AWS.
- **access_key**, **secret_key**: These credentials are used to authenticate with AWS.
- **region**: The AWS region in which to create the AMI.
- **source_ami**: The base Amazon Machine Image (AMI) to use for creating the custom AMI.
- **instance_type**: The EC2 instance type to use for the image creation (e.g., `t2.micro`).
- **ami_name**: The name of the resulting AMI.
- **tags**: The tags to assign to the created AMI.

#### **Provisioners:**
In this example, we use a **shell provisioner** that runs a script (`install-software.sh`) to install software on the VM after the image is created. The provisioners can be customized based on the software and configuration you want to include in your custom image.

---

### **Running the Template**

To build the images for all three platforms (GCP, Azure, and AWS) using the same template, run the following command:

```bash
packer build -var "gcp_project_id=your-gcp-project-id" -var "azure_client_id=your-azure-client-id" -var "azure_client_secret=your-azure-client-secret" -var "aws_access_key=your-aws-access-key" -var "aws_secret_key=your-aws-secret-key" ./templates/06_integration_with_gcp_azure_aws.json
```

This command triggers Packer to build images for all three cloud platforms using the respective builders. Ensure that all the necessary credentials and configuration values are provided when running the command.

---

### **Conclusion**

By using the above template, you can create custom images across multiple cloud providers from a single Packer configuration. This approach simplifies multi-cloud workflows and ensures consistency in the images across GCP, Azure, and AWS. You can expand this template to include additional cloud providers or advanced configurations, such as custom software installations, networking configurations, and more.

Let me know if you'd like more examples or specific configurations!