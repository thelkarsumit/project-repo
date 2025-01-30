Sure! Here's a detailed content draft for **Chapter 06: Packer with AWS**:

---

# 06 - Packer with AWS

In this chapter, we will learn how to use Packer to create custom Amazon Machine Images (AMIs) on AWS. Packer is an efficient tool for automating the creation of virtual machine images across various platforms, and AWS is one of the most popular cloud platforms for hosting these images. By the end of this chapter, you'll understand how to integrate Packer with AWS to automate AMI creation and configuration.

### Prerequisites
Before you begin, ensure the following prerequisites are met:
- **Packer installed** on your local machine. You can download it from the [Packer website](https://www.packer.io/downloads).
- **AWS account** and access to an AWS region where you can create resources.
- **AWS CLI installed** and configured with valid credentials. You can configure it using the `aws configure` command.
- **IAM Role/Policy**: Ensure you have an IAM user or role with the necessary permissions for Packer to interact with AWS resources. The minimum required permissions are:
  - `ec2:CreateImage`
  - `ec2:DescribeInstances`
  - `ec2:RunInstances`
  - `ec2:TerminateInstances`
  - `ec2:DescribeImages`
  - `ec2:DescribeSecurityGroups`
  - `ec2:DescribeKeyPairs`

### 1. **Setting Up AWS Credentials**

Before starting with Packer, ensure that your AWS credentials are configured. If you haven't already configured them, you can do so using the AWS CLI:

```bash
aws configure
```

You'll be prompted to provide:
- **AWS Access Key ID**
- **AWS Secret Access Key**
- **Default region name**
- **Default output format**

Alternatively, you can set your AWS credentials using environment variables:

```bash
export AWS_ACCESS_KEY_ID="your_access_key"
export AWS_SECRET_ACCESS_KEY="your_secret_key"
export AWS_DEFAULT_REGION="us-west-2"  # example region
```

### 2. **Creating the Packer Template for AWS**

Packer templates for AWS are written in JSON or HCL format. Below is an example of a basic template in JSON to create an AMI from a base image (e.g., Amazon Linux 2).

#### Example Template: `packer_aws_template.json`

```json
{
  "builders": [
    {
      "type": "amazon-ebs",
      "access_key": "{{env `AWS_ACCESS_KEY_ID`}}",
      "secret_key": "{{env `AWS_SECRET_ACCESS_KEY`}}",
      "region": "us-west-2",
      "source_ami": "ami-0c55b159cbfafe1f0",  // Amazon Linux 2 AMI ID
      "instance_type": "t2.micro",
      "ssh_username": "ec2-user",
      "ami_name": "packer-demo-ami-{{timestamp}}",
      "ami_description": "A custom AMI built with Packer"
    }
  ],
  "provisioners": [
    {
      "type": "shell",
      "script": "scripts/install_software.sh"
    }
  ]
}
```

#### Explanation of Key Fields:

- **builders**: Defines how the image will be created.
  - `type`: Specifies the builder, in this case, `amazon-ebs` (Amazon Elastic Block Store).
  - `access_key` and `secret_key`: These are your AWS credentials. It's recommended to use environment variables or an IAM role rather than hardcoding keys in the template.
  - `region`: Specifies the AWS region where the AMI will be created (e.g., `us-west-2`).
  - `source_ami`: The base AMI ID used to create the new AMI. You can find AMI IDs for various operating systems in the [AWS AMI catalog](https://aws.amazon.com/amazon-linux-2/).
  - `instance_type`: The type of EC2 instance to use while building the image (e.g., `t2.micro`).
  - `ami_name`: The name of the resulting AMI. The `{{timestamp}}` function will append a timestamp to the name to ensure it's unique.
  - `ami_description`: A description for the AMI.

- **provisioners**: Defines actions that will be performed after the instance is launched but before the image is created.
  - `type`: The type of provisioner, in this case, a `shell` provisioner that runs a shell script.
  - `script`: Specifies the script to be executed. In this example, we are running a script `install_software.sh` to install additional software.

### 3. **Creating the Shell Script**

Create a shell script to install additional software on the AMI. This script will be executed by Packer during the provisioning phase.

#### Example Shell Script: `install_software.sh`

```bash
#!/bin/bash
# Update the system
sudo yum update -y

# Install Apache Web Server
sudo yum install -y httpd

# Start the Apache Web Server
sudo systemctl start httpd

# Enable Apache to start on boot
sudo systemctl enable httpd
```

This script will update the system and install Apache Web Server, ensuring it starts automatically upon boot.

### 4. **Building the AMI with Packer**

Once you have the template and script ready, you can build the AMI using the following Packer command:

```bash
packer build packer_aws_template.json
```

Packer will:
1. Launch an EC2 instance using the base AMI.
2. Execute the provisioning steps defined in the `provisioners` section.
3. Create a new AMI from the instance after provisioning.
4. Terminate the instance after the image is created.

During the build process, you will see output indicating the progress of each step. If the build is successful, Packer will output the AMI ID of the newly created image.

### 5. **Using the Custom AMI**

Once the AMI is created, you can use it to launch EC2 instances. You can do this through the AWS Console or using the AWS CLI:

```bash
aws ec2 run-instances --image-id <your-ami-id> --count 1 --instance-type t2.micro --key-name your-key
```

This command will launch an EC2 instance using the newly created AMI.

### 6. **Automating AMI Builds with CI/CD**

Packer can be integrated into your CI/CD pipeline for continuous image creation. For example, you can trigger Packer builds using Jenkins, GitLab CI, or any other CI/CD tool.

A simple Jenkins pipeline to trigger a Packer build might look like this:

```groovy
pipeline {
    agent any
    stages {
        stage('Build AMI') {
            steps {
                script {
                    sh 'packer build packer_aws_template.json'
                }
            }
        }
    }
}
```

This pipeline will run the `packer build` command whenever changes are made to your repository, ensuring that your AMIs are always up to date.

### 7. **Advanced Configuration**

#### Using IAM Role Instead of Access Keys:
For better security, it's a best practice to use IAM roles instead of hardcoding AWS credentials in your Packer template. When using AWS services like EC2, IAM roles provide temporary credentials.

To configure IAM roles:
1. Create an IAM role with the necessary permissions for Packer.
2. Attach the role to the EC2 instance that Packer uses to create the AMI.

In the Packer template, you can omit `access_key` and `secret_key` to rely on the IAM role.

#### Parallel Builds:
Packer supports parallel builds, meaning you can create AMIs across different regions or with different configurations at the same time. To do this, you can use multiple builders in your Packer template.

Example with multiple builders:

```json
{
  "builders": [
    {
      "type": "amazon-ebs",
      "region": "us-west-2",
      "source_ami": "ami-0c55b159cbfafe1f0",
      "ami_name": "packer-demo-ami-west-{{timestamp}}"
    },
    {
      "type": "amazon-ebs",
      "region": "us-east-1",
      "source_ami": "ami-0c55b159cbfafe1f0",
      "ami_name": "packer-demo-ami-east-{{timestamp}}"
    }
  ]
}
```

This will build AMIs in both `us-west-2` and `us-east-1` regions simultaneously.

### Conclusion

Using Packer with AWS is a powerful way to automate the creation of custom AMIs. With Packer, you can ensure that your images are consistent, reproducible, and tailored to your specific needs. Whether you're creating simple base images or more complex, multi-cloud configurations, Packer's integration with AWS makes the process fast and reliable.

In this chapter, we covered:
- Setting up AWS credentials for Packer
- Writing a basic Packer template for creating an AMI
- Provisioning EC2 instances using Packer
- Automating the process with CI/CD
- Advanced configurations like IAM roles and parallel builds

By following these steps, you can easily manage your infrastructure images and integrate them into your DevOps pipeline.