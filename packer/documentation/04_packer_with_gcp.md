# 04: Packer with GCP

## Overview

Packer is a powerful tool for automating the creation of machine images for multiple platforms, including GCP. It allows you to define machine images using a configuration file (template), making it easy to build consistent, reproducible, and customizable images for GCP. In this chapter, we'll walk through the steps required to create a custom VM image for Google Cloud Platform using Packer.

## Prerequisites

Before using Packer with GCP, ensure that you have the following:

1. **Packer Installed**: Follow the [Packer installation guide](https://www.packer.io/docs/install) if you haven't installed it yet.
2. **GCP Project**: You need an active GCP project with billing enabled. You can create a project from the [Google Cloud Console](https://console.cloud.google.com/).
3. **Service Account**: A service account with the necessary permissions to create and manage VM images. You'll need the `roles/compute.admin` permission.
4. **Google Cloud SDK (gcloud)**: Install the Google Cloud SDK for authentication and management. You can install it [here](https://cloud.google.com/sdk/docs/install).
5. **Authentication Setup**: Ensure that Packer can authenticate to GCP using either service account credentials or the `gcloud` CLI.

## Step 1: Authenticate with GCP

Packer requires authentication to access GCP resources. You can authenticate in two ways:

### Option 1: Using `gcloud` CLI
If you have `gcloud` installed and authenticated, you can skip this step. Packer will use your current Google Cloud credentials by default.

Run the following command to authenticate:

```bash
gcloud auth login
```

### Option 2: Using Service Account Key
1. Create a service account in GCP with the required roles (e.g., `Compute Admin`).
2. Download the JSON key file for the service account.
3. Set the environment variable `GOOGLE_APPLICATION_CREDENTIALS` to the path of the JSON key file.

```bash
export GOOGLE_APPLICATION_CREDENTIALS="/path/to/your-service-account-key.json"
```

## Step 2: Create a Packer Template for GCP

A Packer template is a JSON or HCL file that defines the configuration for building an image. The template consists of several key components:

- **Builders**: Define the platform and configuration details for creating the image.
- **Provisioners**: Specify the software and configurations that will be applied to the image after it's created.
- **Post-processors**: Optional steps that run after the image is built.

### Example Template to Create a VM Image on GCP

```json
{
  "builders": [
    {
      "type": "googlecompute",
      "project_id": "your-gcp-project-id",
      "source_image": "debian-9-stretch-v20190709",
      "zone": "us-central1-a",
      "image_name": "packer-demo-image-{{timestamp}}",
      "ssh_username": "packer",
      "ssh_key_file": "~/.ssh/id_rsa",
      "network": "default",
      "tags": ["packer", "debian"],
      "disk_size": 10,
      "disk_type": "pd-standard",
      "image_family": "packer-debian",
      "metadata": {
        "startup-script": "#!/bin/bash\n apt-get update && apt-get install -y apache2"
      }
    }
  ],
  "provisioners": [
    {
      "type": "shell",
      "inline": [
        "sudo apt-get update",
        "sudo apt-get install -y nginx"
      ]
    }
  ]
}
```

### Key Components of the Template:

1. **builders**: 
   - `type`: Specifies the builder type. In this case, it is `googlecompute` for creating images in GCP.
   - `project_id`: Your GCP project ID.
   - `source_image`: The base image (in this example, a Debian image). You can use other images such as Ubuntu, CentOS, etc.
   - `zone`: The GCP zone where the VM will be created (e.g., `us-central1-a`).
   - `image_name`: The name of the image that Packer will create. The `{{timestamp}}` placeholder ensures a unique name.
   - `network`: The network to be used by the VM.
   - `tags`: Optional tags for the image (e.g., `packer`, `debian`).
   - `disk_size` and `disk_type`: Define the size and type of the disk for the VM.
   - `metadata`: Startup script that will be executed when the VM boots (e.g., installing Apache).

2. **provisioners**:
   - A shell provisioner is used to install Nginx on the created image by running `apt-get` commands.

## Step 3: Build the Image

After creating the Packer template, you can run the `packer build` command to start the image creation process.

```bash
packer build your-template-file.json
```

Packer will start the build process and output logs to the terminal. It will:
- Create a temporary VM instance based on the source image.
- Run the provisioning scripts to configure the image.
- Create a custom image once the provisioning is complete.
- Clean up any temporary resources.

## Step 4: Verify the Image in GCP

Once the image is created, you can check it in the GCP Console:

1. Go to the [Google Cloud Console](https://console.cloud.google.com/).
2. Navigate to **Compute Engine** > **Images**.
3. You should see the newly created image in the list, with the name `packer-demo-image-<timestamp>`.

## Step 5: Launch a VM from the Created Image

After the image is successfully created, you can use it to launch a VM:

1. Go to the **Compute Engine** > **VM Instances** page.
2. Click **Create Instance**.
3. Under the **Boot disk** section, click **Change** and select the newly created image.
4. Configure the VM as desired and click **Create**.

Your VM will now be launched using the custom image you built with Packer.

## Step 6: (Optional) Automate with CI/CD

You can integrate Packer with your CI/CD pipelines (e.g., Jenkins, GitLab CI) to automatically build images as part of your infrastructure automation workflow. This allows you to maintain consistent, up-to-date images across your environments.

For example, in Jenkins, you could set up a pipeline to run the following command after checking in changes to the Packer template:

```bash
packer build -var 'gcp_project_id=your-project-id' your-template-file.json
```

This will trigger the build and create the image whenever changes are made to the template.

## Troubleshooting

### Common Errors

1. **Authentication Errors**: Ensure that your `GOOGLE_APPLICATION_CREDENTIALS` is correctly set and points to the right service account key.
2. **Quota Issues**: If you encounter quota errors, ensure that your GCP project has sufficient quotas for creating resources (VMs, images, etc.).
3. **Permission Issues**: Ensure that the service account used by Packer has the required permissions (e.g., `roles/compute.admin`).

### Debugging the Build Process

If the build fails, you can enable debug mode in Packer to get more detailed logs:

```bash
PACKER_LOG=1 packer build your-template-file.json
```

This will provide detailed logs that can help identify where the process failed.

## Conclusion

In this chapter, you've learned how to use Packer to create custom VM images on Google Cloud Platform. With this knowledge, you can automate the creation of consistent images, install necessary software, and integrate the process into your CI/CD pipelines for a seamless DevOps workflow. By understanding how to customize the template and provision images, you can extend this knowledge to other cloud platforms like Azure and AWS.

---

