Here's a detailed example for **`04_create_ubuntu_image_gcp.json`** to create a custom Ubuntu image using Packer on Google Cloud Platform (GCP). This template will build a custom Ubuntu image, install necessary software, and can be used as a base image for creating VM instances on GCP.

### 04_create_ubuntu_image_gcp.json

```json
{
  "variables": {
    "project_id": "your-gcp-project-id",
    "zone": "us-central1-a",
    "image_name": "ubuntu-image-{{timestamp}}",
    "ssh_username": "packer",
    "source_image": "ubuntu-2004-focal-v20210729"
  },
  "builders": [
    {
      "type": "googlecompute",
      "project_id": "{{user `project_id`}}",
      "source_image": "{{user `source_image`}}",
      "zone": "{{user `zone`}}",
      "image_name": "{{user `image_name`}}",
      "ssh_username": "{{user `ssh_username`}}",
      "image_family": "ubuntu-2004-lts",
      "disk_size": "10",
      "machine_type": "n1-standard-1",
      "tags": ["packer"],
      "timeouts": {
        "create_image": "2h"
      }
    }
  ],
  "provisioners": [
    {
      "type": "shell",
      "inline": [
        "echo 'Updating and installing packages...'",
        "sudo apt-get update -y",
        "sudo apt-get upgrade -y",
        "sudo apt-get install -y curl vim git"
      ]
    }
  ],
  "post-processors": [
    {
      "type": "googlecompute-export",
      "project_id": "{{user `project_id`}}",
      "image_name": "{{user `image_name`}}",
      "bucket": "your-gcp-bucket-for-export",
      "export_format": "tar.gz"
    }
  ]
}
```

### Explanation of the Template:

1. **Variables**:
   - The `variables` section allows you to define reusable values like project ID, zone, and image name.
   - `source_image`: The base Ubuntu image to use for creating the custom image.
   - `image_name`: Custom image name generated dynamically using the timestamp.

2. **Builders**:
   - The `googlecompute` builder is used to create the image in GCP.
   - **project_id**: GCP project ID where the image will be created.
   - **source_image**: The source image you will base your custom image on (e.g., an Ubuntu 20.04 image).
   - **zone**: The GCP zone in which the image will be created.
   - **image_name**: The name for the resulting custom image.
   - **machine_type**: The machine type used to build the image (e.g., `n1-standard-1`).
   - **tags**: Tags for the created image, useful for firewall rules or networking.
   - **timeouts**: Time configuration for how long to wait for image creation before considering it failed.

3. **Provisioners**:
   - The `shell` provisioner runs commands to update and install software.
   - In this case, we update the system, upgrade packages, and install `curl`, `vim`, and `git` to the Ubuntu image.
   - This section can be expanded with additional software installations or configuration commands as needed.

4. **Post-processors**:
   - The `googlecompute-export` post-processor exports the built image to a GCP bucket in `tar.gz` format.
   - This allows you to have the image stored in Google Cloud Storage, making it easy to access or use for later purposes.

### How to Use This Template:
1. **Set Up GCP Authentication**:
   - Make sure you have authenticated Packer with your GCP account. You can do this by setting up the Google Cloud SDK and ensuring the environment variable `GOOGLE_APPLICATION_CREDENTIALS` points to your service account key file.

2. **Run the Template**:
   - You can use the following command to run the template and create the Ubuntu image:

   ```bash
   packer build 04_create_ubuntu_image_gcp.json
   ```

3. **Check the Image**:
   - Once the build is complete, you can go to the **Compute Engine** section in your GCP console and verify the created image.

4. **Export the Image**:
   - After creation, the image will be exported to the specified GCP bucket as a tarball file.

---

This template should give you a good start with creating a customized Ubuntu image for GCP using Packer, and you can expand it further by adding more software or making configurations based on your needs. Let me know if you need additional modifications or explanations!