Here’s the detailed content for **Chapter 05: Packer with Azure**:

---

## 05. Packer with Azure

### Introduction
Packer is a tool that automates the process of creating machine images for multiple platforms from a single source configuration. When working with Azure, Packer can be used to create custom virtual machine (VM) images that can be deployed across your Azure environment. This chapter will guide you through the process of setting up and using Packer to build VM images on Azure.

### Prerequisites
Before you can use Packer with Azure, you’ll need the following:

- **Azure Subscription**: You should have an active Azure account and subscription.
- **Azure CLI**: Install and configure the Azure CLI for authentication with your Azure subscription.
- **Packer**: Install Packer on your local machine (refer to the [Packer Installation Guide](https://www.packer.io/docs/install) if you haven’t installed it yet).
- **Service Principal for Azure**: This allows Packer to authenticate with Azure and create resources.

### Setting up Packer with Azure

1. **Install Azure CLI**
   If you haven’t already, install the Azure CLI:
   
   - **Linux**: `sudo apt-get install azure-cli`
   - **Mac**: `brew install azure-cli`
   - **Windows**: Download and install from [Azure CLI download page](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli).

   After installation, authenticate using your Azure credentials:
   
   ```bash
   az login
   ```

2. **Create an Azure Service Principal**
   To allow Packer to authenticate with your Azure account, you need to create a **Service Principal**. This will provide the necessary permissions to create resources in your Azure subscription.

   Run the following command to create a Service Principal:

   ```bash
   az ad sp create-for-rbac --name "packer-service-principal" --role Contributor --scopes /subscriptions/{your-subscription-id}
   ```

   You will receive output like this:

   ```json
   {
     "appId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
     "displayName": "packer-service-principal",
     "password": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
     "tenant": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
   }
   ```

   Save the `appId`, `password`, and `tenant` values for use in the Packer configuration.

3. **Configure Azure Authentication in Packer**
   You can authenticate Packer using environment variables or a Packer-specific configuration. The easiest way is to use the environment variables for Azure authentication.

   Set the following environment variables (replace the placeholders with the actual values from the Service Principal creation step):

   ```bash
   export ARM_CLIENT_ID="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"  # appId
   export ARM_CLIENT_SECRET="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"  # password
   export ARM_SUBSCRIPTION_ID="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
   export ARM_TENANT_ID="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"  # tenant
   ```

   This will allow Packer to authenticate with Azure without prompting you for credentials during the build.

---

### Creating a Packer Template for Azure

Now, let's write a simple Packer template for Azure. This template will build a custom VM image based on the **Ubuntu 20.04** base image.

#### Sample Template: `01_create_vm_image_azure.json`

```json
{
  "builders": [
    {
      "type": "azure-arm",
      "client_id": "{{env `ARM_CLIENT_ID`}}",
      "client_secret": "{{env `ARM_CLIENT_SECRET`}}",
      "tenant_id": "{{env `ARM_TENANT_ID`}}",
      "subscription_id": "{{env `ARM_SUBSCRIPTION_ID`}}",
      "managed_image_resource_group_name": "packer-images",
      "managed_image_name": "ubuntu-20.04-packer-{{timestamp}}",
      "os_type": "Linux",
      "image_publisher": "Canonical",
      "image_offer": "UbuntuServer",
      "image_sku": "20.04-LTS",
      "location": "East US",
      "vm_size": "Standard_B1s",
      "temporary_disk_size": "1024",
      "communicator": "ssh",
      "ssh_username": "packer",
      "ssh_password": "packer-password",
      "azure_tags": {
        "created_by": "packer"
      },
      "tags": {
        "environment": "dev"
      }
    }
  ],
  "provisioners": [
    {
      "type": "shell",
      "inline": [
        "sudo apt-get update",
        "sudo apt-get install -y nginx",
        "sudo systemctl start nginx",
        "sudo systemctl enable nginx"
      ]
    }
  ]
}
```

### Explanation of the Template

- **builders**:
  - The `azure-arm` builder is used to create an Azure virtual machine image.
  - You need to provide your Azure credentials (client_id, client_secret, tenant_id, subscription_id).
  - The `managed_image_resource_group_name` specifies the resource group where the image will be stored.
  - The `image_publisher`, `image_offer`, and `image_sku` specify the base image to use (in this case, Ubuntu 20.04 LTS).
  - The `ssh_username` and `ssh_password` will be used for SSH access to the VM during the provisioning step.

- **provisioners**:
  - The shell provisioner runs a set of commands on the virtual machine. In this case, it updates the package list and installs NGINX.
  - After the provisioning step, the VM will be ready with NGINX installed.

### Building the Azure Image

To build the image, run the following Packer command:

```bash
packer build 01_create_vm_image_azure.json
```

This command will start the process of creating the custom VM image. Packer will:
- Authenticate with Azure.
- Create a temporary VM.
- Run the provisioning steps (install NGINX).
- Capture the VM as a custom managed image in Azure.

### Customizing the Image

You can customize the template further by adding more provisioners (like Ansible, Chef, or Puppet) or by adding more configuration options. Some common changes might include:
- **Changing the OS**: Specify a different Ubuntu version or use a Windows image.
- **Additional Software**: Install other applications or services during the provisioning step.
- **Network Settings**: Configure networking settings or virtual networks.

---

### Advanced Topics

#### 1. **Multi-Region Image Builds**
   You can create custom images across multiple Azure regions by modifying the `location` field in your Packer template. This allows you to create identical images in different regions for high availability.

#### 2. **Using Custom Scripts for Provisioning**
   Instead of using inline shell scripts, you can use external script files. For example, create a `setup.sh` script and reference it in the `provisioners` section.

```json
{
  "type": "shell",
  "script": "./scripts/setup.sh"
}
```

#### 3. **Integrating Packer with Azure DevOps**
   You can automate your Packer builds by integrating them into your CI/CD pipelines, such as Azure DevOps or GitHub Actions, to trigger image builds on every commit.

---

### Troubleshooting

If you encounter issues with Packer builds on Azure, check the following:

- **Authentication Issues**: Make sure that your Service Principal credentials are correctly set up. Use `az ad sp show` to verify the Service Principal.
- **Resource Group Permissions**: Ensure the Service Principal has sufficient permissions to create resources in the resource group.
- **VM Size and Limits**: If your build fails due to VM size limitations, try reducing the VM size in the template or check the resource limits in your Azure subscription.

---

### Conclusion

In this chapter, we have covered the process of using Packer to create VM images on Azure. You’ve learned how to authenticate with Azure, write a basic Packer template, and build custom VM images for deployment. This approach streamlines image creation and ensures consistency across your Azure environment.

---

Let me know if you need further details or adjustments!