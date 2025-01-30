# Packer Template Structure

Packer templates are written in JSON or HCL (HashiCorp Configuration Language). In this chapter, we’ll focus on the structure of a **JSON**-based template. A Packer template defines the steps and configurations required to build an image, such as the source image, provisioning scripts, and other settings.

## Key Components of a Packer Template

A typical Packer template consists of several key components:
1. **Builders**
2. **Provisioners**
3. **Post-Processors**
4. **Variables**

Each of these components is described below.

### 1. Builders

The **builders** section defines the source image and the environment in which the image will be created. A builder is a provider-specific component that provisions an image (VM or container) from a specified source image. Builders support a variety of platforms like AWS, GCP, Azure, VMware, etc.

#### Example Builder (GCP)
```json
{
  "builders": [
    {
      "type": "googlecompute",
      "project_id": "your-project-id",
      "source_image": "debian-9-stretch-v20190709",
      "zone": "us-central1-a",
      "image_name": "packer-demo-{{timestamp}}",
      "ssh_username": "packer"
    }
  ]
}
```
- **type**: Specifies the cloud provider (e.g., `googlecompute`, `amazon-ebs`).
- **project_id**: Your GCP project ID.
- **source_image**: The source image that will be used to create the custom image.
- **zone**: The zone in which the instance will be created (relevant for cloud providers like GCP).
- **image_name**: The name of the generated image. `{{timestamp}}` will automatically add a timestamp to the image name.
- **ssh_username**: The username used for SSH access to the instance.

Other builder options depend on the provider. For example, AWS might use `ami_name` and `region` instead of `zone` and `project_id`.

### 2. Provisioners

Provisioners define the steps to configure the image after it’s created, such as installing software, running scripts, or setting up configurations. Provisioners can be shell scripts, Ansible, Chef, Puppet, etc.

#### Example Provisioner (Shell)
```json
{
  "provisioners": [
    {
      "type": "shell",
      "script": "./scripts/install-software.sh"
    }
  ]
}
```
- **type**: The provisioner type (e.g., `shell`, `ansible`, `puppet`).
- **script**: The path to the shell script that will be executed to install or configure software.

You can also use **inline scripts** for small configurations directly within the template.

#### Inline Provisioner Example
```json
{
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
- **inline**: A list of commands to be executed directly on the instance.

### 3. Post-Processors

Post-processors are used to manipulate the image after it has been built. For example, you might use a post-processor to push the image to a container registry or upload it to cloud storage.

#### Example Post-Processor (Upload to GCP Storage)
```json
{
  "post-processors": [
    {
      "type": "googlecompute-export",
      "export_path": "gs://your-bucket-name/packer-images/{{.Provider}}/{{.BuildName}}.tar"
    }
  ]
}
```
- **type**: Specifies the type of post-processor (e.g., `googlecompute-export`).
- **export_path**: The location where the image will be uploaded after it's built.

Post-processors allow you to automate additional steps such as archiving images, copying them to storage, or integrating with other systems.

### 4. Variables

Variables allow you to make your templates reusable and dynamic. You can define variables in the `variables` section or in an external `.json` file and pass them in during runtime.

#### Example Variables Section
```json
{
  "variables": {
    "image_name": "ubuntu-18.04",
    "project_id": "your-gcp-project-id"
  }
}
```
- **variables**: Defines a set of variables that can be referenced later in the template using `{{ user `variable_name` }}`.

#### Example Using Variables in Builders
```json
{
  "builders": [
    {
      "type": "googlecompute",
      "project_id": "{{ user `project_id` }}",
      "source_image": "{{ user `image_name` }}",
      "zone": "us-central1-a",
      "image_name": "packer-demo-{{timestamp}}"
    }
  ]
}
```
In this example, `{{ user `variable_name` }}` references the variables defined in the `variables` section.

### Putting It All Together

Here’s an example of a complete Packer template that creates a custom VM image on GCP and installs software:

```json
{
  "variables": {
    "image_name": "ubuntu-18.04",
    "project_id": "your-gcp-project-id"
  },
  "builders": [
    {
      "type": "googlecompute",
      "project_id": "{{ user `project_id` }}",
      "source_image": "{{ user `image_name` }}",
      "zone": "us-central1-a",
      "image_name": "packer-demo-{{timestamp}}",
      "ssh_username": "packer"
    }
  ],
  "provisioners": [
    {
      "type": "shell",
      "script": "./scripts/install-software.sh"
    }
  ],
  "post-processors": [
    {
      "type": "googlecompute-export",
      "export_path": "gs://your-bucket-name/packer-images/{{.Provider}}/{{.BuildName}}.tar"
    }
  ]
}
```

### Summary of Key Components
- **Builders**: Define the cloud provider and the source image.
- **Provisioners**: Automate the configuration of the VM image (e.g., running scripts).
- **Post-Processors**: Perform actions after the image is created (e.g., exporting the image).
- **Variables**: Make your template more flexible by using dynamic values.

By understanding the structure of a Packer template and how each component works, you can create powerful and reusable templates for building custom images across different cloud providers.

---
