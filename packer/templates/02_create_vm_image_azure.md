# 02_create_vm_image_azure.json

#### Overview
This template will demonstrate how to use Packer to create a custom Azure VM image by defining a builder and provisioners. In this example, we will use a basic Ubuntu image and customize it with some software installation (for instance, Apache web server).

#### Steps
1. **Install Packer**: Before running the template, ensure Packer is installed on your machine. You can follow the official installation guide for your platform: [Packer Installation](https://www.packer.io/docs/install).
   
2. **Azure Authentication**: Make sure that you have the required Azure credentials configured. You can authenticate using the Azure CLI by running:

```bash
az login
```

Alternatively, you can create a service principal in Azure and configure the environment variables for authentication:

```bash
export ARM_CLIENT_ID="your-client-id"
export ARM_CLIENT_SECRET="your-client-secret"
export ARM_SUBSCRIPTION_ID="your-subscription-id"
export ARM_TENANT_ID="your-tenant-id"
```

3. **Creating the Template**: Create a `create_vm_image_azure.json` file to define the VM image creation process.

#### Packer Template Example

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
      "managed_image_name": "packer-ubuntu-image-{{timestamp}}",
      "os_type": "Linux",
      "image_publisher": "Canonical",
      "image_offer": "UbuntuServer",
      "image_sku": "18.04-LTS",
      "location": "East US",
      "vm_size": "Standard_DS2_v2",
      "ssh_username": "packer",
      "ssh_password": "packer-password123",
      "vnet_name": "packer-vnet",
      "subnet_name": "default",
      "security_group_name": "packer-nsg",
      "private_key_file": "path_to_private_key.pem",
      "public_key_file": "path_to_public_key.pub",
      "temp_compute_name": "packer-temp-vm",
      "temp_compute_resource_group_name": "packer-rg",
      "use_managed_disks": true
    }
  ],
  "provisioners": [
    {
      "type": "shell",
      "inline": [
        "sudo apt-get update",
        "sudo apt-get install -y apache2"
      ]
    }
  ]
}
```

### Key Components of the Template

- **`builders`**:
  - This section defines the cloud provider (Azure in this case) and the details for creating the image.
  - **`type`**: Specifies that we're using the Azure ARM builder (`azure-arm`).
  - **`client_id`, `client_secret`, `tenant_id`, `subscription_id`**: These are the Azure credentials that Packer uses to authenticate with your Azure subscription. Use environment variables for security.
  - **`managed_image_resource_group_name`**: The name of the Azure resource group where the image will be created.
  - **`managed_image_name`**: The name of the custom image that will be created.
  - **`os_type`**: Defines the OS type (`Linux` for Ubuntu in this case).
  - **`image_publisher`, `image_offer`, `image_sku`**: Specifies the base image that will be used (Ubuntu 18.04 LTS in this case).
  - **`location`**: Specifies the Azure region where the image will be created (e.g., `East US`).
  - **`vm_size`**: The size of the temporary VM to use for building the image (e.g., `Standard_DS2_v2`).
  - **`ssh_username` and `ssh_password`**: These are used to access the VM instance during provisioning. Alternatively, you can use SSH keys.
  - **`vnet_name`, `subnet_name`, `security_group_name`**: These define the networking settings for the temporary VM used to build the image.

- **`provisioners`**:
  - This section specifies actions to perform on the created VM before capturing it as an image.
  - **`type`**: Here we use the `shell` provisioner to run shell commands.
  - **`inline`**: A list of commands to execute on the VM. In this case, we update the system and install Apache web server.

### Running the Template
1. **Validate the Template**: Ensure the Packer template is correct by running the following command:

```bash
packer validate create_vm_image_azure.json
```

2. **Build the Image**: Once validated, execute the following command to start building the image:

```bash
packer build create_vm_image_azure.json
```

Packer will:
- Launch a temporary VM on Azure.
- Run the provisioner commands to install Apache.
- Create a custom image from the VM.
- Store the image in the specified resource group.

### Troubleshooting
- **Authentication Errors**: Ensure that your service principal has sufficient permissions in Azure to create images.
- **Networking Issues**: Ensure that the VNet and Subnet specified exist and are properly configured.
- **Provisioning Failures**: Check the logs to ensure the shell commands are executed correctly.

### Conclusion
This template demonstrates how to create a custom VM image in Azure using Packer. You can expand it by adding additional software installation steps, configuring different VM sizes, or even automating deployment to other services once the image is created. 

Let me know if you'd like further assistance or more complex examples!